-- CMP (Completions)
--   nvim-cmp     | https://github.com/hrsh7th/nvim-cmp
--   cmp-buffer   | https://github.com/hrsh7th/cmp-buffer
--   cmp-path     | https://github.com/hrsh7th/cmp-path
--   cmp-nvim-lsp | https://github.com/hrsh7th/cmp-nvim-lsp
--   LuaSnip      | https://github.com/L3MON4D3/LuaSnip
return {
  -- nvim-cmp
  { "hrsh7th/nvim-cmp" },
  -- cmp-buffer
  { "hrsh7th/cmp-buffer" },
  -- cmp-path
  { "hrsh7th/cmp-path" },
  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      -- Configure For VSCode Snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  -- cmp-nvim-lsp
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      -- Add capabilities from cmp_nvim_lsp to lspconfig
      local lspconfig_defaults = require("lspconfig").util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- Create autocommand to bind keys
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          -- Keymaps
          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set({ "n", "x" }, "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          vim.keymap.set("n", "<leader>qf", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
      })

      -- Prevent Interference with NeoCodeium
      vim.api.nvim_create_autocmd("User", {
        pattern = "NeoCodeiumCompletionDisplayed",
        callback = function() require("cmp").abort() end
      })

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Setup nvim-cmp
      cmp.setup({
        -- Completion Sources
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" }
        },

        -- Enable Snippets
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },

        -- Completion Keymaps
        mapping = cmp.mapping.preset.insert({
          -- Tab
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- If completions menu is visible, select next item
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              -- If it"s closed but currently expandable, expand it
              luasnip.expand_or_jump()
            else
              -- If all else fails, default to normal Tab behavior
              fallback()
            end
          end, { "i", "s" }),

          -- Enter
          ["<CR>"] = cmp.mapping.confirm({ select = true })
        }),

        -- Preselect First Completion
        preselect = "item",
        completion = {
          completeopt = "menu,menuone,noinsert",
        }
      })

      -- Setup Autopair Completions
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end
  }
}

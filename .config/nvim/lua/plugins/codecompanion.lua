return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    -- Setup CodeCompanion
    require("codecompanion").setup({
      -- Adapters
      adapters = {
        -- Gemini
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.0-flash-exp"
              },
              num_ctx = {
                default = 1048576
              },
              num_predict = {
                default = 8192
              }
            }
          })
        end
      },

      -- Strategies
      strategies = {
        chat = {
          adapter = "gemini"
        },
        inline = {
          adapter = "gemini"
        }
      }
    })

    -- Keymaps
    vim.keymap.set({ "n", "x" }, "<leader>cc", ":CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion", silent = true })
    vim.keymap.set({ "n", "x" }, "<leader>ci", ":CodeCompanion<CR>",
      { desc = "CodeCompanion Inline", silent = true })

    vim.keymap.set({ "n", "x" }, "<C-a>", ":CodeCompanionActions<CR>", { desc = "CodeCompanion Actions", silent = true })
    vim.keymap.set("x", "<leader>ca", ":CodeCompanionChat Add<CR>", { desc = "CodeCompanion Add", silent = true })
    vim.keymap.set("x", "<leader>ce", ":CodeCompanion /explain<CR>", { desc = "CodeCompanion Explain", silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end
}

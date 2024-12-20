-- LSP
--   mason           | https://github.com/williamboman/mason.nvim
--   nvim-lspconfig  | https://github.com/neovim/nvim-lspconfig
--   mason-lspconfig | https://github.com/williamboman/mason-lspconfig.nvim
return {
  -- mason
  {
    "williamboman/mason.nvim"
  },
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig"
  },
  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- Setup mason
      require("mason").setup()

      -- Setup mason-lspconfig
      require("mason-lspconfig").setup({
        -- Install Servers
        ensure_installed = {
          -- LSPs
          "bashls",        -- Bash
          "clangd",        -- C, C++, Objective C, Objective C++, CUDA
          "cmake",         -- CMake
          "cssls",         -- CSS
          "tailwindcss",   -- TailwindCSS
          "gopls",         -- Go
          "html",          -- HTML
          "htmx",          -- HTMX
          "glint",         -- JavaScript, TypeScript
          "jsonls",        -- JSON
          "lua_ls",        -- Lua
          "grammarly",     -- Markdown, Text
          "pyright",       -- Python
          "rust_analyzer", -- Rust

          -- Linters
          "ast_grep", -- C, C++, Rust, Go, Java, Python, JavScript, TypeScript, HTML, CSS, Kotlin, Dart, Lua
        },

        -- Setup Servers
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end
        }
      })
    end,
  }
}

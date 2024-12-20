-- Treesitter | https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Configure Languages
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "go",
          "html",
          "css",
          "javascript",
          "typescript",
          "c",
          "cpp",
          "rust"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
      })
  end
}

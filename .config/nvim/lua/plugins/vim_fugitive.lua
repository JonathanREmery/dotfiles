-- vim-fugitive | https://github.com/tpope/vim-fugitive
return {
  "tpope/vim-fugitive",
  config = function()
    -- Keymaps
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
  end
}

-- Telescope | https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- Require buitlin
    local builtin = require("telescope.builtin")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope Find Git Files" })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope Live Grep" })
    vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telscope Help" })
  end
}

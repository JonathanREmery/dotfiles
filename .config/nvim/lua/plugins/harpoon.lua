-- Harpoon | https://github.com/ThePrimeagen/harpoon/tree/harpoon2
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- Setup Harpoon
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Keymaps
    vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon Open Menu" })
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon Add Current File" })
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, { desc = "Harpoon Clear" })

    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon Select 1st File" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon Select 2nd File" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon Select 3rd File" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon Select 4th File" })
    vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { desc = "Harpoon Select 5th File" })
    vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, { desc = "Harpoon Select 6th File" })
    vim.keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end, { desc = "Harpoon Select 7th File" })
    vim.keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end, { desc = "Harpoon Select 8th File" })
    vim.keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end, { desc = "Harpoon Select 9th File" })

    vim.keymap.set("n", "<leader>h0", function() vim.cmd("e ~/.config/nvim/lua/plugins/harpoon.lua") end,
      { desc = "Harpoon Edit Config" })
  end
}

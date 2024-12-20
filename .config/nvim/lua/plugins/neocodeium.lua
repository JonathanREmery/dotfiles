-- neocodeium | https://github.com/monkoose/neocodeium
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    -- Setup neocodeium
    local neocodeium = require("neocodeium")
    neocodeium.setup()

    -- Keymaps
    vim.keymap.set("i", "<C-CR>", neocodeium.accept)
    vim.keymap.set("i", "<C-Space>", neocodeium.accept_word)
    vim.keymap.set("i", "<C-c>", neocodeium.cycle_or_complete)
  end,
}


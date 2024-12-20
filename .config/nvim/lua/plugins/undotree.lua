-- undotree | https://github.com/jiaoshijie/undotree
return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    -- Setup undotree
    local undotree = require("undotree")
    undotree.setup()

    -- Keymaps
    vim.keymap.set("n", "<leader>u", function() undotree.toggle() end, { desc = "undotree Toggle" })
  end
}

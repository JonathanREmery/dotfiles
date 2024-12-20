-- bufferline | https://github.com/akinsho/bufferline.nvim
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- Setup bufferline
    local bufferline = require("bufferline")
    bufferline.setup({
      -- Configure bufferline
      options = {
        numbers = "ordinal",
        separator_style = "slope",
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" }
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      }
    })

    -- goToBuffer Goes to to the buffer at absolute position `bufNum`
    local function goToBuffer(bufNum)
      bufferline.go_to(bufNum, true)
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>1", function() goToBuffer(1) end, { desc = "bufferline Go To 1", silent = true })
    vim.keymap.set("n", "<leader>2", function() goToBuffer(2) end, { desc = "bufferline Go To 2", silent = true })
    vim.keymap.set("n", "<leader>3", function() goToBuffer(3) end, { desc = "bufferline Go To 3", silent = true })
    vim.keymap.set("n", "<leader>4", function() goToBuffer(4) end, { desc = "bufferline Go To 4", silent = true })
    vim.keymap.set("n", "<leader>5", function() goToBuffer(5) end, { desc = "bufferline Go To 5", silent = true })
    vim.keymap.set("n", "<leader>6", function() goToBuffer(6) end, { desc = "bufferline Go To 6", silent = true })
    vim.keymap.set("n", "<leader>7", function() goToBuffer(7) end, { desc = "bufferline Go To 7", silent = true })
    vim.keymap.set("n", "<leader>8", function() goToBuffer(8) end, { desc = "bufferline Go To 8", silent = true })
    vim.keymap.set("n", "<leader>9", function() goToBuffer(9) end, { desc = "bufferline Go To 9", silent = true })
    vim.keymap.set("n", "<leader>0", function() goToBuffer(-1) end, { desc = "bufferline Go To Last", silent = true })

    vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "bufferline Cycle Buffers", silent = true })
    vim.keymap.set("n", "<leader>bc", ":bdelete!<CR>", { desc = "bufferline Close Buffer", silent = true })

    vim.keymap.set("n", "<leader>bf", ":BufferLineMoveNext<CR>", { desc = "bufferline Move Buffer Forward", silent = true })
    vim.keymap.set("n", "<leader>bb", ":BufferLineMovePrev<CR>", { desc = "bufferline Move Buffer Backward", silent = true })
  end
}

-- Comment | https://github.com/numToStr/Comment.nvim
return {
  "numToStr/Comment.nvim",
  config = function()
    -- Setup Comment
    require("Comment").setup({
      mappings = {
        basic = false,
        extra = false
      }
    })

    -- Keymaps
    vim.keymap.set({ "n", "x" }, "<leader>c", function()
      return vim.v.count == 0
          and "<Plug>(comment_toggle_linewise_visual)"
          or "<Plug>(comment_toggle_linewise_visual)"
    end, { expr = true })
  end
}

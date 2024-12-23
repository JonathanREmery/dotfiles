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
    vim.keymap.set("n", "<leader>/", function()
        return vim.v.count == 0
            and "<Plug>(comment_toggle_linewise_current)"
            or "<Plug>(comment_toggle_linewise_count)"
    end, { expr = true })
    vim.keymap.set("x", "<leader>/", function()
      return "<Plug>(comment_toggle_linewise_visual)"
    end, { expr = true })
  end
}

-- Nightfox | https://github.com/EdenEast/nightfox.nvim
return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Set Style
    require("nightfox").setup()

    -- Apply Color Scheme
    vim.cmd("colorscheme carbonfox")
  end
}

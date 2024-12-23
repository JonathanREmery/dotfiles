-- codecompanion | https://github.com/olimorris/codecompanion.nvim
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",           -- Util Functions
    "nvim-treesitter/nvim-treesitter", -- Nice Highlighting
    "hrsh7th/nvim-cmp",                -- Completions
    -- Diff Preview
    {'echasnovski/mini.diff',
      version = '*',
      config = function()
        require("mini.diff").setup()
      end
    },

    -- Pretty Rendering
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
    },
  },
  config = function()
    -- Setup CodeCompanion
    require("codecompanion").setup({
      -- Display Config
      display = {
        chat = {
          window = {
            layout = "float"
          }
        },

        diff = {
          provider = "mini_diff"
        },

        show_settings = true
      },

      -- Adapters Config
      adapters = {
        -- Gemini
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.0-flash-exp"
              },
              num_ctx = {
                default = 1048576
              },
              num_predict = {
                default = 8192
              }
            }
          })
        end
      },

      -- Strategies Config
      strategies = {
        chat = {
          -- Chat Adapter
          adapter = "gemini",
          -- Keymap Overrides
          keymaps = {
            close = {
              modes = {
                n = "<C-x>",
                i = "<C-x>"
              }
            }
          }
        },
        inline = {
          -- Inline Adapter
          adapter = "gemini",
          -- Keymap Overrides
          keymaps = {
            accept_change = {
              modes = {
                n = "<C-a>"
              }
            },
            reject_change = {
              modes = {
                n = "<C-r>"
              }
            }
          }
        }
      }
    })

    -- Keymaps
    vim.keymap.set("n", "<C-c>", ":CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion", silent = true })

    vim.keymap.set({ "n", "x" }, "<C-i>", ":CodeCompanion<CR>",
      { desc = "CodeCompanion Inline", silent = true })
    vim.keymap.set("x", "<C-c>", ":CodeCompanionChat Add<CR>", { desc = "CodeCompanion Add", silent = true })
    vim.keymap.set("x", "<C-e>", ":CodeCompanion /explain<CR>", { desc = "CodeCompanion Explain", silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end
}

-- Additional Plugins
lvim.plugins = {
  {
    "NvChad/nvim-colorizer.lua",
    require 'colorizer'.setup {
      filetypes = {
        'css',
        'javascript',
        'html',
      },
      user_default_options = { tailwind = true, mode = "background" }
    }
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "ray-x/web-tools.nvim",
    require 'web-tools'.setup({
      keymaps = {
        rename = nil, -- by default use same setup of lspconfig
        repeat_rename = '-', -- do not set '.' to repeat, will override nvim's binding for '.'
      },
    })
  },
  {
    "wakatime/vim-wakatime"
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  -- { "lukas-reineke/indent-blankline.nvim",
  --     config = function ()
  --     require("indent_blankline").setup({
  --        --config
  -- })
  -- end,
  -- },

  --better targetssssss
  { "wellle/targets.vim" },

  --fugitive for github
  { "tpope/vim-fugitive" },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  { "unblevable/quick-scope" },

  -- {
  --     --debug adapter ui
  --     "rcarriga/nvim-dap-ui",
  -- },

  --theme plugins
  -- { "navarasu/onedark.nvim",
  --     config = function()
  --         require("onedark").setup({
  --             style = 'deep',
  --         })
  --     end
  -- },

  { "catppuccin/nvim", as = "catppuccin" },

  { "sainnhe/edge", as = "edge" },

  --surround plugin
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  --session manager
  -- {
  --     'rmagatti/auto-session',
  --     config = function()
  --         require('auto-session').setup {
  --             log_level = 'info',
  --             auto_session_suppress_dirs = { '~/', '~/Projects' }
  --         }
  --     end
  -- },

  --code runner
  {
    "CRAG666/code_runner.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("user.code_runner").config()
    end,
  },
}

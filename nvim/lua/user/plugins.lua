local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Comment
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Comment string
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use 'EdenEast/nightfox.nvim'
  use 'haishanh/night-owl.vim'
  use "catppuccin/nvim"
  use 'yashguptaz/calvera-dark.nvim'
  use 'kvrohit/substrata.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "j-hui/fidget.nvim" -- display nvim-lsp progress
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
  --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- lsp status
  use 'nvim-lua/lsp-status.nvim'
  -- Kickstart
  use 'nvim-lua/kickstart.nvim'
  --Discord
  use 'andweeb/presence.nvim'
  --Harpoon
  use 'ThePrimeagen/harpoon'
  --Diagnostics

  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }
  --vim-rooter
  use 'airblade/vim-rooter'
  --rust
  use 'simrat39/rust-tools.nvim'
  --Debugger
  use 'mfussenegger/nvim-dap'
  -- Git
  use({ "lewis6991/gitsigns.nvim" })
  use "tpope/vim-fugitive"
  -- auto tag
  use 'windwp/nvim-ts-autotag'
  --vim be good
  use 'ThePrimeagen/vim-be-good'
  --refactoring
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  }
  -- zen-mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- prettier
  use('MunifTanjim/prettier.nvim')
  -- dark mode
  use "mrjones2014/lighthaus.nvim"
  --yaml
  use {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }
  --pomodoro
  use "dbinagi/nomodoro"
  --json format
  use "gennaro-tedesco/nvim-jqx"
  --typescript
  use "jose-elias-alvarez/typescript.nvim"
  --lsp linting
  -- neorge
  use {
    "nvim-neorg/neorg",
    -- tag = "*",
    ft = "norg",
    after = "nvim-treesitter", -- You may want to specify Telescope here as well
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              }
            }
          },
          ["core.norg.completion"] = {},
          ["core.norg.concealer"] = {},
          ["core.presenter"] = {}
        }
      }
    end
  }

-- autoclose
use 'm4xshen/autoclose.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

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
  --[[ use "kyazdani42/nvim-web-devicons" -- icons ]]
  --[[ use "kyazdani42/nvim-tree.lua" -- nvim tree ]]
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
  use 'ray-x/aurora'
  use 'JoosepAlviste/palenightfall.nvim'
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  use 'tiagovla/tokyodark.nvim'
  use {'uloco/bluloco.nvim',requires = { 'rktjmp/lush.nvim' }}
use {
  "jesseleite/nvim-noirbuddy",
  requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
}
  use 'ishan9299/modus-theme-vim'
use { 'embark-theme/vim', as = 'embark' }
-- Lazy
use{
  "olimorris/onedarkpro.nvim",
  priority = 1000 -- Ensure it loads first
  }

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
  "ray-x/lsp_signature.nvim",
}
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
use 'nvim-treesitter/nvim-treesitter-context'
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
  -- mason
-- autoclose
use 'm4xshen/autoclose.nvim'
-- navigation tmux
use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup({
 copy_sync = {
        -- enables copy sync. by default, all registers are synchronized.
        -- to control which registers are synced, see the `sync_*` options.
        enable = true,

        -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
        -- first buffer or named_buffer_name = true to ignore a named tmux
        -- buffer with name named_buffer_name :)
        ignore_buffers = { empty = false },

        -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
        -- clipboard by tmux
        redirect_to_clipboard = false,

        -- offset controls where register sync starts
        -- e.g. offset 2 lets registers 0 and 1 untouched
        register_offset = 0,

        -- overwrites vim.g.clipboard to redirect * and + to the system
        -- clipboard using tmux. If you sync your system clipboard without tmux,
        -- disable this option!
        sync_clipboard = false,

        -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
        sync_registers = true,

        -- syncs deletes with tmux clipboard as well, it is adviced to
        -- do so. Nvim does not allow syncing registers 0 and 1 without
        -- overwriting the unnamed register. Thus, ddp would not be possible.
        sync_deletes = true,

        -- syncs the unnamed register with the first buffer entry from tmux.
        sync_unnamed = true,
    },
    navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = true,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
    },
    resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = true,

        -- sets resize steps for x axis
        resize_step_x = 1,

        -- sets resize steps for y axis
        resize_step_y = 1,
    }
    }) end
})

-- browse
use({
  "lalitmee/browse.nvim",
  requires = { "nvim-telescope/telescope.nvim" },
})
-- git
    use({
        "aaronhallaert/advanced-git-search.nvim",
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
        requires = {
            "nvim-telescope/telescope.nvim",
            -- to show diff splits and open commits in browser
            "tpope/vim-fugitive",
        },
    })
use({
   "marilari88/twoslash-queries.nvim",config = function()
        require("twoslash-queries").setup({
            multi_line = true, -- to print types in multi line mode
            is_enabled = false, -- to keep disabled at startup and enable it on request with the EnableTwoslashQueries 
            highlight = "Type", -- to set up a highlight group for the virtual text
	   })
    end,
})
-- neodev
use "folke/neodev.nvim"
-- hover
  use {
	"Fildo7525/pretty_hover",
	config = function()
		require("pretty_hover").setup({
	line = {
		"@brief",
	},
	word = {
		"@param",
		"@tparam",
		"@see",
	},
	header = {
		"@class",
	},
	stylers = {
		line = "**",
		word = "`",
		header = "###",
	},
	border = "rounded",
      })
	end
}
-- mjml preview
use { "ec965/mjml-preview.nvim", ft = { "mjml" }, run = "cd app && npm install" }
-- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
-- monorepo
use {
  "imNel/monorepo.nvim",
  config = function()
    require("monorepo").setup({
      -- Your config here!
    })
  end,
  requires= { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

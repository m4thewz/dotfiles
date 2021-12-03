local fn, cmd = vim.fn, vim.cmd

-- Install packer if it's not yet ensure_installed

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local installed = fn.empty(fn.glob(install_path))

if installed > 0 then
  print('Packer is not installed, cloning it now...')
  cmd ('silent !git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Configure packer
cmd 'packadd packer.nvim'

local packer = require('packer')

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
  auto_clean = true,
  compile_on_sync = true,
}

packer.startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- Interface

  use {
    "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.icons' ]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.tree' ]]
  }

  use {
    'akinsho/bufferline.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.bufferline' ]]
  }
  use {
    "famiu/feline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[ require 'after.feline' ]]
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "javascript", "lua", "css", "scss", "html", "vue" },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
      }
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("indent_blankline").setup {
        indentLine_enabled = 1,
        char = "▏",
        filetype_exclude = {
           "help",
           "terminal",
           "packer",
           "lspinfo",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
    end,
  }

  -- LSP

  use {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = [[ require 'after.cmp' ]],
    requires = {
      'onsails/lspkind-nvim',
      { 'hrsh7th/cmp-buffer', event = "InsertEnter" },
      { 'hrsh7th/cmp-path', event = "InsertEnter" },
      {
        'L3MON4D3/LuaSnip',
        requires = 'rafamadriz/friendly-snippets',
        config = function ()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.env.HOME .. "/.vim/plugged/friendly-snippets" },
            include = nil,
            exclude = {},
          })
        end
      }
    }
  }

  use {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    config = [[ require 'after.lsp' ]],
    requires = {
      { 'tami5/lspsaga.nvim', branch = 'nvim51' },
      'folke/lsp-colors.nvim',
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  -- Utils

   use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    setup = [[ require 'utils'.lazy_load('lewis6991/gitsigns.nvim') ]],
    config = function()
      require('gitsigns').setup {
        sign_priority = 5,
        signs = {
          add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
          change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
          changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
          delete = { hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr" },
        },
      }
    end
  }

  use {
    'terrortylor/nvim-comment',
    config = [[ require('nvim_comment').setup() ]]
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = [[ require('colorizer').setup() ]]
  }
  use 'dstein64/vim-startuptime'
end)

-- Install plugins if packer was not installed

if installed > 0 then cmd 'PackerInstall' end

local fn, cmd = vim.fn, vim.cmd

-- Install packer if it's not yet installed

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local installed = fn.empty(fn.glob(install_path))

if installed > 0 then
  print('Packer is not installed, cloning it now...')
  cmd ('silent !git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Configure packer
cmd 'packadd packer.nvim'

require('packer').startup(function(use)
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
    "NvChad/nvim-base16.lua",
    config = function()
      local base16 = require 'base16'
      base16(base16.themes("chadracula"), true)

      require 'highligths'.apply()
    end,
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
           "dashboard",
           "packer",
           "lspinfo",
           "TelescopePrompt",
           "TelescopeResults",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
    end,
  }

  -- LSP

  use {
    'L3MON4D3/LuaSnip',
    requires = 'rafamadriz/friendly-snippets'
  }

  use {
    'neovim/nvim-lspconfig',
    config = [[ require 'after.lspconfig' ]],
    requires = {
      'folke/lsp-colors.nvim',
      'onsails/lspkind-nvim',
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    config = [[ require 'after.cmp' ]],
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
    }
  }

  -- Utils

   use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup {
        sign_priority = 5,
        signs = {
          add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
          change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
          changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
          delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
          topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
        },
      }
    end
  }
end)

-- Install plugins if packer was not installed

if installed > 0 then cmd 'PackerInstall' end

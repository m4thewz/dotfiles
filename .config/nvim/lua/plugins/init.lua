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
local use = require('packer').use

require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup {
        sign_priority = 1,
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

  -- Interface
  
  use {
    "kyazdani42/nvim-web-devicons",
    config = [[require ('plugins.configs.icons')]]
  }
  
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require ('plugins.configs.tree')]]
  }
  
  use {
    'glepnir/dashboard-nvim',
    config = [[require ('plugins.configs.dashboard')]]
  }

  use {
    'akinsho/bufferline.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require ('plugins.configs.bufferline')]]
  }
  
  use {
    "famiu/feline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require ('plugins.configs.feline')]]
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
    config = [[require ('plugins.configs.treesitter')]]
  } 
  
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = [[require ('plugins.configs.blankline')]]
  }
  
  -- Utils
  use {
    "nvim-telescope/telescope.nvim",
    requires = 'nvim-telescope/telescope-media-files.nvim',
    config = [[require ('plugins.configs.telescope')]],
  }
  
  use 'prettier/vim-prettier'
  use 'wakatime/vim-wakatime'
end)

-- Install plugins if packer was not installed

if installed > 0 then cmd 'PackerInstall' end

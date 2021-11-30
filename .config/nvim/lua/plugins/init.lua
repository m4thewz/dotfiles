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

  -- Interface
  
  use {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require 'plugins.configs.icons'
    end,
  }
  
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require 'plugins.configs.tree'
    end
  }
  
  use {
    'akinsho/bufferline.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require 'plugins.configs.bufferline'
    end
  }
  
  use {
    "famiu/feline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require 'plugins.configs.feline'
    end,
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
      require 'plugins.configs.treesitter'
    end
  }
  
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require 'plugins.configs.gitsigns'
    end
  }
  
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require 'plugins.configs.blankline'
    end
  }
  
  -- Utils

  use 'prettier/vim-prettier'
  use 'wakatime/vim-wakatime'
end)

-- Install plugins if packer was not installed

if installed > 0 then cmd 'PackerInstall' end

require("packer").startup(function(use)

use 'wbthomason/packer.nvim'

use 'Mofiqul/vscode.nvim'
use 'loctvl842/monokai-pro.nvim'
-- Language Support
use 'nvim-treesitter/nvim-treesitter'
require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = {"clang", "gcc"}

use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

use "SirVer/ultisnips"
use "quangnguyen30192/cmp-nvim-ultisnips"
-- *INSTALL PYNVIM*

-- use {'ms-jpq/coq_nvim', branch = 'coq'}
-- use 'ms-jpq/coq.artifacts'
-- use 'ms-jpq/coq.thirdparty'
use 'neovim/nvim-lspconfig'
use 'mfussenegger/nvim-jdtls'
-- use {'neoclide/coc.nvim', branch='release'}
use "lervag/vimtex"

-- Visual
use 'yggdroot/indentline'
use 'RRethy/vim-illuminate'
use({
  "utilyre/barbecue.nvim",
  tag = "*",
  requires = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  after = "nvim-web-devicons", -- keep this if you're using NvChad
  config = function()
	require('barbecue').setup()
  end
})
-- File Browsing
use 'nvim-lua/plenary.nvim'
use {'nvim-telescope/telescope.nvim', tag='0.1.4'}
-- use 'nvim-telescope/telescope-file-browser.nvim'
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
-- Typing
use 'windwp/nvim-autopairs'
use 'tpope/vim-surround'
use 'majutsushi/tagbar'
use 'tpope/vim-commentary'
use {'mg979/vim-visual-multi', branch='master'}
-- Airline
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
-- Social
use "andweeb/presence.nvim"

end)

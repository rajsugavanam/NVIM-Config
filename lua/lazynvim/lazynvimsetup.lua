require("lazy").setup({

'wbthomason/packer.nvim',

-- 'Mofiqul/vscode.nvim',
-- 'loctvl842/monokai-pro.nvim',
{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
},
-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
-- "wilmanbarrios/palenight.nvim",
-- "rose-pine/neovim",
"morhetz/gruvbox",
-- Language Support
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
-- require("nvim-treesitter.install").prefer_git == false,
-- require("nvim-treesitter.install").compilers == {"clang", "gcc"},

'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',
'hrsh7th/nvim-cmp',
'williamboman/mason.nvim',
'williamboman/mason-lspconfig.nvim',
'rshkarin/mason-nvim-lint',
"mfussenegger/nvim-lint",

"SirVer/ultisnips",
"quangnguyen30192/cmp-nvim-ultisnips",
-- *INSTALL PYNVIM*

'neovim/nvim-lspconfig',
'mfussenegger/nvim-jdtls',
"lervag/vimtex",

'mfussenegger/nvim-dap',

-- Visual
'yggdroot/indentline',
'RRethy/vim-illuminate',
{
  "utilyre/barbecue.nvim",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
	require('barbecue').setup()
  end
},
{
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } },
},
-- File Browsing
'nvim-lua/plenary.nvim',
{'nvim-telescope/telescope.nvim', version='0.1.4'},

{
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").load_extension "file_browser"
    end
},

-- {
--     "nvim-neo-tree/neo-tree.nvim",
--     branch = "v2.x",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--         "MunifTanjim/nui.nvim",
--     }
-- },

{'romgrk/barbar.nvim', dependencies = 'nvim-web-devicons'},
-- Typing
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
},
'tpope/vim-surround',
'majutsushi/tagbar',
'tpope/vim-commentary',
-- Airline
{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
},
-- Social
"andweeb/presence.nvim"
-- "leonardssh/coc-discord-rpc",
-- {"neoclide/coc.nvim", branch="release"}

})

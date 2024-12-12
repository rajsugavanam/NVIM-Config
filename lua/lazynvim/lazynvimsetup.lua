require("lazy").setup({

{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
    },
},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{ "EdenEast/nightfox.nvim" },
"sainnhe/gruvbox-material",
{
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
    end
},
{ "sainnhe/everforest" },
{ "rebelot/kanagawa.nvim" },
'marko-cerovac/material.nvim',
-- Language Support
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

'hrsh7th/cmp-nvim-lsp',
-- 'hrsh7th/cmp-nvim-lsp-signature-help',
{
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
    },
    config = function(_, opts) require'lsp_signature'.setup(opts) end
},
{ 'hrsh7th/cmp-buffer' },
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',
{ 'hrsh7th/nvim-cmp' },
{ "onsails/lspkind.nvim" },

'williamboman/mason.nvim',
'williamboman/mason-lspconfig.nvim',
'rshkarin/mason-nvim-lint',
"mfussenegger/nvim-lint",

"SirVer/ultisnips",
"quangnguyen30192/cmp-nvim-ultisnips",
"honza/vim-snippets",
-- *INSTALL PYNVIM*

{ 'neovim/nvim-lspconfig' },

'mfussenegger/nvim-jdtls',
"lervag/vimtex",

'mfussenegger/nvim-dap',

-- Visual
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        exclude = {
            filetypes = { "dashboard" }
        },
    },
},
'RRethy/vim-illuminate',
-- File Browsing
'nvim-lua/plenary.nvim',
{'nvim-telescope/telescope.nvim', version='0.1.4'},

-- FILE TREE - PICK ONE
{
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup()
    end
},
-- {
--     "nvim-telescope/telescope-file-browser.nvim",
--     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
--     config = function()
--         require("telescope").load_extension "file_browser"
--     end
-- },
-----------------------
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
{
    'IogaMaster/neocord',
},
{ "nvimdev/lspsaga.nvim" },

-- {
--   "folke/trouble.nvim",
--   cmd = "Trouble",
--   keys = {
--     {
--       "<leader>xx",
--       "<cmd>Trouble diagnostics toggle<cr>",
--       desc = "Diagnostics (Trouble)",
--     },
--     {
--       "<leader>xX",
--       "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
--       desc = "Buffer Diagnostics (Trouble)",
--     },
--     {
--       "<leader>cs",
--       "<cmd>Trouble symbols toggle focus=false<cr>",
--       desc = "Symbols (Trouble)",
--     },
--     {
--       "<leader>cl",
--       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--       desc = "LSP Definitions / references / ... (Trouble)",
--     },
--     {
--       "<leader>xL",
--       "<cmd>Trouble loclist toggle<cr>",
--       desc = "Location List (Trouble)",
--     },
--     {
--       "<leader>xQ",
--       "<cmd>Trouble qflist toggle<cr>",
--       desc = "Quickfix List (Trouble)",
--     },
--   },
--   opts = {
--       warn_no_results = false,
--       open_no_results = true
--   }
-- },

{
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
},
{
  "kkoomen/vim-doge",
},
{ 'rktjmp/lush.nvim' },

-- END PLUGINS LIST

},

-- Lazy setup options
{
    ui = {
        border = "rounded",
    },
}
)

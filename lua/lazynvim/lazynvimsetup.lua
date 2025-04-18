require("lazy").setup({

{
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
	},
},
{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        transparent_background = true,
    },
},
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
{ "nvimdev/lspsaga.nvim" },
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
-- {
-- 	'nvim-java/nvim-java',
-- 	config = function()
-- 		require('java').setup()
-- 	end
-- },
{
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_quickfix_enabled = 0
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_compiler_latexmk = {
            executable = 'latexmk',
            options = {
                '-pdf',
                '-pvc',
            },
        }
    end
},

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
{ "nvim-tree/nvim-tree.lua" },
-- {
--	   "nvim-telescope/telescope-file-browser.nvim",
--	   requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
--	   config = function()
--		   require("telescope").load_extension "file_browser"
--	   end
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
  -- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
},
-- Social
-- {
-- 	'IogaMaster/neocord',
-- },
{
    'vyfor/cord.nvim',
    run = ':Cord update',
},

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
-- {
--   "kkoomen/vim-doge",
-- },
{
    "danymat/neogen",
    config = true,
},
{ 'rktjmp/lush.nvim' },
{ 'rcarriga/nvim-notify' },
-- DEBUGGER
{ 'mfussenegger/nvim-dap' },
{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
{ 'stevearc/overseer.nvim' },
{ 'stevearc/dressing.nvim' },
{ 'MeanderingProgrammer/render-markdown.nvim' },
{ 'HiPhish/rainbow-delimiters.nvim' },
{
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
},
{
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
},

-- END PLUGINS LIST

},

-- Lazy setup options
{
	ui = {
		border = "rounded",
	},
}
)

vim.notify = require("notify")
vim.notify.setup({
    background_colour = "#000000"
})
require('dapui').setup()
require("nvim-tree").setup()
require('overseer').setup({
    dap=true
})
require('marks').setup {
    bookmark_0 = {
        sign = "⚑",
        virt_text = "[Bookmarked]",
    },
}
require('todo-comments').setup()

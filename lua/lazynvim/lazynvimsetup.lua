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
        transparent_background = false,
    },
},
"sainnhe/gruvbox-material",
{ "rebelot/kanagawa.nvim" },
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

'hrsh7th/cmp-nvim-lsp',
{ "nvimdev/lspsaga.nvim" },
{
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
        bind = true,
        handler_opts = {
            border = "rounded"
        },
		hint_prefix = "" -- probably for those error icon things
	},
	config = function(_, opts) require'lsp_signature'.setup(opts) end
},
"hrsh7th/cmp-buffer",
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',
"hrsh7th/nvim-cmp",
"onsails/lspkind.nvim",
"mason-org/mason.nvim",
"mason-org/mason-lspconfig.nvim",
'rshkarin/mason-nvim-lint',
"mfussenegger/nvim-lint",
"SirVer/ultisnips",
"quangnguyen30192/cmp-nvim-ultisnips",
"honza/vim-snippets",
"neovim/nvim-lspconfig",
"mfussenegger/nvim-jdtls",
{
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_quickfix_enabled = 0
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_compiler_latexmk = {
            executable = 'latexmk',
            options = {
                '-xelatex',
                '-pdf',
                '-pvc',
                '-synctex=1'
            },
        }
    end
},
{ 'mfussenegger/nvim-dap' },
'nvim-lua/plenary.nvim',
{'nvim-telescope/telescope.nvim', version='0.1.4'},
{ "nvim-tree/nvim-tree.lua" },
{
	'windwp/nvim-autopairs',
	event = "InsertEnter",
    opts = {
        fast_wrap = {
            map = '<M-e>',
            chars = { '{', '[', '(', '"', "'" },
            pattern = [=[[%'%"%>%]%)%}%,]]=],
            end_key = '$',
            before_key = 'h',
            after_key = 'l',
            cursor_pos_before = true,
            keys = 'qwertyuiopzxcvbnmasdfghjkl',
            manual_position = true,
            highlight = 'Search',
            highlight_grey='Comment'
        },
    },
},
{
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
'majutsushi/tagbar',
'tpope/vim-commentary',
-- Airline
{
  'nvim-lualine/lualine.nvim',
  -- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
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
-- { 'HiPhish/rainbow-delimiters.nvim' },
{
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
},
{
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
},
{ 'lewis6991/gitsigns.nvim' },
{ 'sindrets/diffview.nvim' },
{ 'ThePrimeagen/refactoring.nvim' },
},

-- LAZY SETUP OPTIONS
{
	ui = {
		border = "rounded",
	},
})

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
require('gitsigns').setup({
    sign_priority = 10000
})
require('refactoring').setup()

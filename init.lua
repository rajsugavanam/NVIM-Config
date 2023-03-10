local vim = vim

require("packer").startup(function(use)

use 'wbthomason/packer.nvim'

use 'Mofiqul/vscode.nvim'
use 'neovim/nvim-lspconfig'
use 'loctvl842/monokai-pro.nvim'
-- Language Support
use 'nvim-treesitter/nvim-treesitter'
use {'neoclide/coc.nvim', branch='release'}
-- use 'sheerun/vim-polyglot'
-- File Browsing
use 'nvim-lua/plenary.nvim'
use {'nvim-telescope/telescope.nvim', tag='0.1.0'}
use 'nvim-telescope/telescope-file-browser.nvim'
-- Typing
use 'jiangmiao/auto-pairs'
use {'mg979/vim-visual-multi', branch='master'}
-- Airline
use 'vim-airline/vim-airline'
use 'vim-airline/vim-airline-themes'

end)

require'nvim-treesitter.configs'.setup {
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	}
}

require("monokai-pro").setup {
	transparent_background = false,
	terminal_colors = true,
	devicons = true,
	italic_comments = true,
	filter = "spectrum",
	background_clear = {
	    "toggleterm",
	    "telescope",
	    "which-key",
	    "renamer"
	},
	plugins = {
	    bufferline = {
		    underline_selected = false,
		    underline_visible = false,
	    },
	    indent_blankline = {
		    context_highlight = "default",
	    },
	    override = function(c) end
	}
}

vim.cmd([[
	
	syntax on
	set hlsearch
	colorscheme monokai-pro

	set autoindent
	set tabstop=4
	set shiftwidth=4

	set number
	
	let g:airline_powerline_fonts = 1
	set noshowmode 
]])
--now i don't get disgusting --INSERT-- text at the bottom
-- ================================================================================
-- [GENERAL KEYBINDINGS]
-- ================================================================================
vim.keymap.set("n", "<Leader>bd", "<cmd>bd!<CR>", {noremap=true})
vim.keymap.set("n", "<Leader>bn", "<cmd>bn<CR>", {noremap=true})
vim.keymap.set("n", "<Leader><CR>", "<cmd>noh<CR>", {silent=true})

-- ================================================================================
-- [COC KEYBINDINGS]
-- ================================================================================
-- IntelliSense, etc
local options = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', options)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-d>"]], options)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], options)
vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.keymap.set("i", "<C-s>", "<cmd>call CocActionAsync(\"showSignatureHelp\")<CR>", {silent = true})
vim.keymap.set("n", "<Leader>rn", "<Plug>(coc-rename)", {silent = true})
vim.keymap.set("x", "<Leader>f", "<Plug>(coc-format-selected)", {silent = true})
vim.keymap.set("n", "<Leader>f", "<Plug>(coc-format-selected)", {silent = true})

vim.keymap.set("i", "<C-l>", "<Plug>(coc-snippets-expand)", {silent = true})
vim.keymap.set("x", "<Leader>x", "<Plug>(coc-convert-snippet)", {silent = true})

function _G.show_documentation()
	local cw = vim.fn.expand('<cword>')
	if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold"
})

options = {silent = true, nowait = true}

vim.keymap.set("x", "<Leader>a", "<Plug>(coc-codeaction-selected)", options)
vim.keymap.set("n", "<Leader>ac", "<Plug>(coc-codeaction)", options)
vim.keymap.set("n", "<Leader>qf", "<Plug>(coc-fix-current)", options)
vim.keymap.set("n", "<Leader>cl", "<Plug>(coc-codelens-action)", options)
vim.keymap.set("n", "K", '<CMD>lua _G.show_documentation()<CR>', {silent = true})

options = {silent = true, nowait = true, expr = true}

vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', options)
vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', options)
vim.keymap.set("i", "<C-f>",
	   'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', options)
vim.keymap.set("i", "<C-b>",
	   'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', options)
vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', options)
vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', options)
-- ================================================================================
-- [TELESCOPE KEYBINDINGS]
-- ================================================================================
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>h", builtin.keymaps, {})
-- Telescope Browser
vim.keymap.set("n", "<Space>fb", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", {noremap = true})
-- ================================================================================
-- [MULTILINE KEYBINDINGS]
-- ================================================================================
vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)")
vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)")

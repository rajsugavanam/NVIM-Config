"-----------------------------------------------------------
" PLUGINS GO HERE
call plug#begin()

" Fonts/Colors
Plug 'Mofiqul/vscode.nvim'
Plug 'neovim/nvim-lspconfig' 
Plug 'tanvirtin/monokai.nvim'
Plug 'Mofiqul/vscode.nvim'

" Language Support
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" File Browsing
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
"-----------------------------------------------------------
" lua stuff, for TS highlighting
lua <<EOF
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true
	}
}
EOF
" [VIM SETTINGS]
"-----------------------------------------------------------
syntax on
set hlsearch

" color scheme. set termguicolors only works on iTerm2.
set termguicolors
colorscheme monokai_pro 

set autoindent
set tabstop=4
set shiftwidth=4

set number

" [COC SCROLLING/INTELLISENSE]
"-----------------------------------------------------------
" keybind remappings
" if there are visible suggestions, tab (in insert
" and normal mode) will cycle through them
" <expr> means whatever i have typed so far
" backslash makes it so that <> isn't actually <>
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <C-space> coc#refresh()
" if there are visible suggestions, confirm or select and confirm them
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

map <silent> <Leader><CR> <cmd>noh<CR>
" [NORMAL BINDINGS]
"-----------------------------------------------------------
inoremap <S-Tab> <C-d>
nmap <C-J> <Plug>(VM-Add-Cursor-Down)
nmap <C-K> <Plug>(VM-Add-Cursor-Up)

" BUFFERS
nnoremap <Leader>bd <cmd>bd!<CR>
nnoremap <Leader>bn <cmd>bn<CR>

" [TELESCOPE BINDINGS]
"-----------------------------------------------------------
nnoremap <Leader>ff <cmd>Telescope find_files<CR>
nnoremap <Leader>fg <cmd>Telescope live_grep<CR>
nnoremap <Leader>fb <cmd>Telescope buffers<CR>
nnoremap <Leader>fh <cmd>Telescope help_tags<CR>
nnoremap <Leader>h <cmd>Telescope keymaps<CR>
" Telescope Browser
nnoremap <space>fb <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>

" [COC BINDINGS]
"-----------------------------------------------------------
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs <Plug>(coc-signature)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nmap <leader>qf <Plug>(coc-fix-current)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>cl <Plug>(coc-codelens-action)

nnoremap <silent> K :call ShowDocumentation()<CR>
"-----------------------------------------------------------
" [COC HELPERS]
function! ShowDocumentation() " if COC's doHover will have an effect, run it. else, emulate K being typed
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" [AIRLINE]
"-----------------------------------------------------------
let g:airline_powerline_fonts = 1
set noshowmode " now i don't get disgusting --INSERT-- text at the bottom

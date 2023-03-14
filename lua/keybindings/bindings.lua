require("keybindings.keybind_functions")

local keybindings = {}

-- ================================================================================
-- [GENERAL KEYBINDINGS]
-- ================================================================================
vim.keymap.set("n", "<Leader>bd", "<cmd>bd!<CR>", {noremap=true})
vim.keymap.set("n", "<Leader>bn", "<cmd>bn<CR>", {noremap=true})
vim.keymap.set("n", "<Leader><CR>", "<cmd>noh<CR>", {silent=true})
-- ================================================================================
-- [LSP KEYBINDINGS]
-- ================================================================================
-- IntelliSense, etc
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('i', '<Esc>', [[pumvisible() ? "<C-e><Esc>" : "<Esc>"]], { expr = true, noremap = true })
vim.keymap.set('i', '<C-c>', [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], { expr = true, noremap = true })
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "<C-n>" : "<Tab>"]], { expr = true, noremap = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "<C-p>" : "<BS>"]], { expr = true, noremap = true })
vim.keymap.set('i', '<cr>',  "v:lua.UtilsCR()", {expr = true, noremap = true})

function keybindings.attached_binds(bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
 	vim.keymap.set('i', '<C-space>',  "<C-x><C-o>", bufopts)
 	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
 	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
 	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
 	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
 	vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, bufopts)
 	vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
 	vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
 	vim.keymap.set('n', '<Leader>ac', vim.lsp.buf.code_action, bufopts)
 	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

 	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
 	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
 	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
 	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function keybindings.attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- completion triggered by <C-x><C-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  keybindings.attached_binds(bufnr)
end

-- local options = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', options)
-- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-d>"]], options)
-- vim.keymap.set("i", "<cr>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.Npairs.autopairs_cr()', options)
-- vim.keymap.set("i", "<Esc>", [[coc#pum#visible() ? coc#pum#stop() : "<ESC>"]], options)
-- vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
-- vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
-- vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
-- vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
-- vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
-- vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
-- vim.keymap.set("i", "<C-s>", "<cmd>call CocActionAsync(\"showSignatureHelp\")<CR>", {silent = true})
-- vim.keymap.set("n", "<Leader>rn", "<Plug>(coc-rename)", {silent = true})
-- vim.keymap.set("x", "<Leader>f", "<Plug>(coc-format-selected)", {silent = true})
-- vim.keymap.set("n", "<Leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- vim.keymap.set("i", "<C-l>", "<Plug>(coc-snippets-expand)", {silent = true})
-- vim.keymap.set("x", "<Leader>x", "<Plug>(coc-convert-snippet)", {silent = true})

-- vim.api.nvim_create_augroup("CocGroup", {})
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	group = "CocGroup",
-- 	command = "silent call CocActionAsync('highlight')",
-- 	desc = "Highlight symbol under cursor on CursorHold"
-- })

-- options = {silent = true, nowait = true}

-- vim.keymap.set("x", "<Leader>a", "<Plug>(coc-codeaction-selected)", options)
-- vim.keymap.set("n", "<Leader>ac", "<Plug>(coc-codeaction)", options)
-- vim.keymap.set("n", "<Leader>qf", "<Plug>(coc-fix-current)", options)
-- vim.keymap.set("n", "<Leader>cl", "<Plug>(coc-codelens-action)", options)
-- vim.keymap.set("n", "K", '<CMD>lua ShowDocumentation()<CR>', {silent = true})

-- options = {silent = true, nowait = true, expr = true}

-- vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', options)
-- vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', options)
-- vim.keymap.set("i", "<C-f>",
-- 	   'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', options)
-- vim.keymap.set("i", "<C-b>",
-- 	   'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', options)
-- vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', options)
-- vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', options)

-- ================================================================================
-- [TELESCOPE KEYBINDINGS]
-- ================================================================================
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
-- vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>h", builtin.keymaps, {})
-- File Browser
vim.keymap.set("n", "<Space>fb", "<cmd>Neotree toggle<CR>", {noremap = true})
vim.keymap.set("n", "<Leader>fb", "<cmd>Neotree buffers toggle<CR>", {})
-- ================================================================================
-- [MULTILINE KEYBINDINGS]
-- ================================================================================
vim.keymap.set("n", "<C-S-Down>", "<Plug>(VM-Add-Cursor-Down)")
vim.keymap.set("n", "<C-S-Up>", "<Plug>(VM-Add-Cursor-Up)")

return keybindings

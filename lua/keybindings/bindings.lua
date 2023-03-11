require("keybindings.keybind_functions")

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
vim.keymap.set("i", "<cr>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.Npairs.autopairs_cr()', options)
vim.keymap.set("i", "<Esc>", [[coc#pum#visible() ? coc#pum#stop() : "<ESC>"]], options)
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


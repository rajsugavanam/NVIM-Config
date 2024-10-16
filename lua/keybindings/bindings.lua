require("keybindings.keybind_functions")

local keybindings = {}

-- ================================================================================
-- [GENERAL KEYBINDINGS]
-- ================================================================================
vim.keymap.set("n", "<Leader><CR>", "<cmd>noh<CR>", {silent=true})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {silent=true})
-- ================================================================================
-- [LSP KEYBINDINGS]
-- ================================================================================
-- IntelliSense, etc
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<Leader>e', "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '[g', "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set('n', ']g', "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- vim.keymap.set('n', '<Leader>n', '<Cmd>Nav<CR>', opts)

function keybindings.attached_binds(bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('i', '<C-space>',  "<C-x><C-o>", bufopts)
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', bufopts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set({'n', 'i'}, '<C-s>', require("lsp_signature").toggle_float_win, bufopts)
    -- vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gy', '<cmd>Lspsaga goto_typedefinition<CR>', bufopts)
    -- vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>rn', '<cmd>Lspsaga rename<CR>', bufopts)
    -- vim.keymap.set('n', '<Leader>ac', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>ac', "<cmd>Lspsaga code_action<CR>", bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

function keybindings.attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- completion triggered by <C-x><C-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    keybindings.attached_binds(bufnr)
end


-- ================================================================================
-- [FILE KEYBINDINGS]
-- ================================================================================
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>gf", "<cmd>Lspsaga finder<CR>", {})
-- vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>h", builtin.keymaps, {})
-- File Browser
-- vim.keymap.set("n", "<Space>fb", "<cmd>Neotree toggle<CR>", {noremap = true})
-- vim.keymap.set("n", "<Leader>fb", "<cmd>Neotree buffers toggle<CR>", {})

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  ":Telescope buffers<CR>",
  { noremap = true }
)

-- ================================================================================
-- [BARBAR KEYBINDINGS]
-- ================================================================================
local map = vim.api.nvim_set_keymap
-- Move to previous/next
map('n', '≤', '<Cmd>BufferPrevious<CR>', opts) -- alt comma but for mac
map('n', '≥', '<Cmd>BufferNext<CR>', opts) -- alt period
-- Re-order to previous/next
map('n', '¯', '<Cmd>BufferMovePrevious<CR>', opts) -- alt < || alt shft ,
map('n', '˘', '<Cmd>BufferMoveNext<CR>', opts) -- alt >
-- Goto buffer in position...
map('n', '¡', '<Cmd>BufferGoto 1<CR>', opts) -- alt 1
map('n', '™', '<Cmd>BufferGoto 2<CR>', opts) -- alt 2
map('n', '£', '<Cmd>BufferGoto 3<CR>', opts) -- alt 3
map('n', '¢', '<Cmd>BufferGoto 4<CR>', opts) -- alt 4
map('n', '∞', '<Cmd>BufferGoto 5<CR>', opts) -- alt 5
map('n', '§', '<Cmd>BufferGoto 6<CR>', opts) -- alt 6
map('n', '¶', '<Cmd>BufferGoto 7<CR>', opts) -- alt 7
map('n', '•', '<Cmd>BufferGoto 8<CR>', opts) -- alt 8
map('n', 'ª', '<Cmd>BufferGoto 9<CR>', opts) -- alt 9
map('n', 'º', '<Cmd>BufferLast<CR>', opts) -- alt 0
-- Pin/unpin buffer
map('n', 'π', '<Cmd>BufferPin<CR>', opts) -- alt p
-- Close buffer
map('n', 'ç', '<Cmd>BufferClose<CR>', opts) -- alt c
map('n', '∑', '<Cmd>BufferWipeout<CR>', opts) -- alt w
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

return keybindings

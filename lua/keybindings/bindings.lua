require("keybindings.keybind_functions")

local keybindings = {}

-- No-highlight, exit terminal with esc.
vim.keymap.set("n", "<Leader><CR>", "<cmd>noh<CR>", {silent=true})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {silent=true})

-- Additional LSP-based keybindings.
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<Leader>e', "<cmd>silent Lspsaga show_line_diagnostics<CR>", opts)
-- vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '[g', "<cmd>silent Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set('n', ']g', "<cmd>silent Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set('n', '<Leader>xx', "<cmd>Telescope diagnostics<CR>", opts)
vim.keymap.set('n', '<Leader>cs', "<cmd>Lspsaga outline<CR>", opts)
vim.keymap.set('n', '<Leader>qf',  "<cmd>Telescope quickfix<CR>", opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- vim.keymap.set('n', '<Leader>n', '<Cmd>Nav<CR>', opts)

-- LSP-based keybindings.
function keybindings.attached_binds(bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('i', '<C-space>',  "<C-x><C-o>", bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'gd', '<cmd>silent Lspsaga goto_definition<CR>', bufopts)
    -- vim.keymap.set('n', 'K', '<cmd>silent Lspsaga hover_doc<CR>', bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set({'n', 'i'}, '<C-s>', require("lsp_signature").toggle_float_win, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', 'gy', '<cmd>silent Lspsaga goto_typedefinition<CR>', bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<Leader>rn', '<cmd>silent Lspsaga rename<CR>', bufopts)
    vim.keymap.set('n', '<Leader>ac', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', '<Leader>ac', "<cmd>silent Lspsaga code_action<CR>", bufopts)
    vim.keymap.set('n', '<Leader>s', "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts)
end

function keybindings.attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- completion triggered by <C-x><C-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    keybindings.attached_binds(bufnr)
end


-- File keybindings.
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>gf", "<cmd>Lspsaga finder<CR>", {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>h", builtin.keymaps, {})

-- File explorer
vim.api.nvim_set_keymap("n", "<space>fb", ":NvimTreeToggle<CR>", { noremap=true, silent=true })

-- Telescope misc
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("n", "<Leader>vm", ":Telescope marks<CR>", { noremap=true, silent=true })

-- DAP
vim.keymap.set("n", "<Leader>dt", require('dapui').toggle, { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>bt", require('dap').toggle_breakpoint, { noremap=true, silent=true })

vim.keymap.set(
    "n", "<Leader>bct",
    function ()
        vim.ui.input({prompt='Condition: '},
        function(cond)
            if (cond == nil) then
                return
            elseif (cond=='') then
                vim.notify("Toggled standard breakpoint.", "info")
            else
                vim.notify("Toggled breakpoint with condition "..cond..".", "info")
            end
            require('dap').toggle_breakpoint(cond, nil, nil)
        end)
    end,
    { noremap=true, silent=true }
)

-- DEBUGGING KEYBINDS
local debug_keybind_opts = { noremap=true, silent=true }
vim.keymap.set("n", "<Leader>dc", require('dap').continue, debug_keybind_opts)
vim.keymap.set("n", "<Leader>dq", require('dap').terminate, debug_keybind_opts)
vim.keymap.set("n", "<Leader>dsv", require('dap').step_over, debug_keybind_opts)
vim.keymap.set("n", "<Leader>dsi", require('dap').step_into, debug_keybind_opts)
vim.keymap.set("n", "<Leader>dso", require('dap').step_out, debug_keybind_opts)

vim.keymap.set({ "n", "v" }, "<Leader>dK", require('dap.ui.widgets').hover, debug_keybind_opts)
vim.keymap.set({ "n", "v" }, "<Leader>dp", require('dap.ui.widgets').preview, debug_keybind_opts)
vim.keymap.set("n", "<Leader>ds",
function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end,
debug_keybind_opts)

return keybindings

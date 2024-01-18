local cmp = require'cmp'

local repterm = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- ["<Tab>"] = cmp.mapping({
        --     c = function()
        --         if cmp.visible() then
        --             cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        --         else
        --             cmp.complete()
        --         end
        --     end,
        --     i = function(fallback)
        --         if cmp.visible() and vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --             vim.api.nvim_feedkeys(repterm("<Plug>(ultisnips_jump_forward)"), 'm', true)
        --         elseif cmp.visible() then
        --             cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
        --         elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --             vim.api.nvim_feedkeys(repterm("<Plug>(ultisnips_jump_forward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = function(fallback)
        --         if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --             vim.api.nvim_feedkeys(repterm("<Plug>(ultisnips_jump_forward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end
        -- }),
        -- ["<S-Tab>"] = cmp.mapping({
        --     c = function()
        --         if cmp.visible() then
        --             cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        --         else
        --             cmp.complete()
        --         end
        --     end,
        --     i = function(fallback)
        --         if cmp.visible() and vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --             vim.api.nvim_feedkeys(repterm("<Plug>(ultisnips_jump_backward)"), 'm', true)
        --         elseif cmp.visible() then
        --             cmp.select_prev_item({ behavior = cmp.SelectBehavior.Replace })
        --         elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --             vim.api.nvim_feedkeys(repterm("<Plug>(ultisnips_jump_backward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = function(fallback)
        --         if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --             vim.api.nvim_feedkeys(repterm("<Plug>(ultisnips_jump_backward)"), 'm', true)
        --         else
        --             fallback()
        --         end
        --     end
        -- }),

        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
    }, {
        { name = 'buffer' },
    })
})

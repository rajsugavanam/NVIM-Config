local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- vim.g.editorconfig = false
-- THANK YOU FOR DISABLING TYPESCRIPT TWO-SPACE!!!!


require("lazynvim.lazynvimsetup")

require("vimrc_config")

if vim.fn.exists('g:vscode') == 0 then
    require("lualineconfig")
    require("language.lsp")
    require("language.lspsagaconfig")
    require("cmp.cmpconfig")
    require("treesitterconfig")
else
    vim.cmd([[
        set relativenumber
    ]])
end


require("keybindings.bindings")

-- require("presence.presenceconfig")

-- require("nvim_dap")

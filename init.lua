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

vim.g.editorconfig = false
-- HOLY SHIT THANK YOU FOR DISABLING TYPESCRIPT TWO-SPACE!!!!

require("lazynvim.lazynvimsetup")
require("vimrc_config")

require("pairsconfig")
require("cmp.cmpconfig")

require("language.lsp")
require("language.lspsagaconfig")

require("lualineconfig")
require("treesitterconfig")

require("keybindings.bindings")

require("barbar.barbarconfig")
require("presence.presenceconfig")

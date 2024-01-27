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

require("lazynvim.lazynvimsetup")
require("monokaipro_colorscheme")
-- require("catppuccin_colorscheme")
require("vimrc_config")

require("pairsconfig")
require("cmp.cmpconfig")
require("language.lsp")
require("lualineconfig")
require("treesitterconfig")

require("keybindings.bindings")

require("barbar.barbarconfig")
require("presence.presenceconfig")

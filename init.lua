local vim = vim

require("packer.packersetup")
require("vimrc_config")

require("pairsconfig")
require("cmp.cmpconfig")
require("language.lsp")
require("lualineconfig")
require("monokaipro_colorscheme")
require("treesitterconfig")

require("keybindings.bindings")

require("barbar.barbarconfig")
require("presence.presenceconfig")

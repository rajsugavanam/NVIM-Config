require("monokai-pro").setup {
	transparent_background = false,
	terminal_colors = true,
	devicons = true,
	italic_comments = true,
	filter = "spectrum",
	background_clear = {
	    "toggleterm",
	    "telescope",
	    "which-key",
	    "renamer"
	},
	plugins = {
	    bufferline = {
		    underline_selected = false,
		    underline_visible = false,
	    },
	    indent_blankline = {
		    context_highlight = "default",
	    },
	    override = function(c) end
	}
}

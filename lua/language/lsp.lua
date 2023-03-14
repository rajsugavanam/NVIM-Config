local lspconfig = require("lspconfig")
require("language.settings.nativelsp")
local keybindings = require("keybindings.bindings")


vim.g.coq_settings = { auto_start = 'shut-up' }
vim.cmd([[
	let g:coq_settings = { "keymap.recommended.cr": v:false }
]])

local servers = {
	"pyright",
	"lua_ls",
	"clangd",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{
		require('coq').lsp_ensure_capabilities(),
		on_attach = keybindings.attach
	}
end

-- i hate omnisharp
lspconfig.omnisharp.setup {
	require('coq').lsp_ensure_capabilities(),
	on_attach = keybindings.attach,
	cmd = { "dotnet", "/usr/local/bin/omnisharp-roslyn/OmniSharp.dll"},
}
lspconfig.cmake.setup {
	require('coq').lsp_ensure_capabilities(),
	on_attach = keybindings.attach,
}

function SetupJava()
	require('jdtls').start_or_attach {
		require('coq').lsp_ensure_capabilities(),
		cmd = { '/usr/local/bin/jdt-language-server-1.20.0/bin/jdtls' },
		root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	}
end

-- lspconfig.pyright.setup{
-- 	on_attach = keybindings.attach
-- }
-- lspconfig.lua_ls.setup{
-- 	on_attach = keybindings.attach
-- }

-- lspconfig.java.setup{}

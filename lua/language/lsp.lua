local lspconfig = require("lspconfig")
require("language.settings.nativelsp")
local keybindings = require("keybindings.bindings")


vim.g.coq_settings = { auto_start = 'shut-up' }

local servers = {
	"pyright",
	"lua_ls",
	"clangd",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{
		require('coq').lsp_ensure_capabilities(),
		on_attach = attach
	}
end

-- i hate omnisharp
lspconfig.omnisharp.setup {
	require('coq').lsp_ensure_capabilities(),
	on_attach = attach,
	cmd = { "dotnet", "/usr/local/bin/omnisharp-roslyn/OmniSharp.dll"},
}
lspconfig.cmake.setup {
	require('coq').lsp_ensure_capabilities(),
	on_attach = attach,
}

-- lspconfig.pyright.setup{
-- 	on_attach = keybindings.attach
-- }
-- lspconfig.lua_ls.setup{
-- 	on_attach = keybindings.attach
-- }

-- lspconfig.java.setup{}

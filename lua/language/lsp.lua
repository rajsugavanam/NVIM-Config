local lspconfig = require("lspconfig")
require("language.settings.nativelsp")
local keybindings = require("keybindings.bindings")

local servers = {
	"pyright",
	"lua_ls",
	"clangd",
	"cmake",
    "texlab",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
		on_attach = keybindings.attach
	}
end

-- -- i hate omnisharp
-- lspconfig.omnisharp.setup {
-- 	require('coq').lsp_ensure_capabilities(),
-- 	on_attach = keybindings.attach,
-- 	cmd = { "dotnet", "/usr/local/bin/omnisharp-roslyn/OmniSharp.dll"},
-- }

function SetupJava()
	require('jdtls').start_or_attach {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
		cmd = { '/usr/local/bin/jdt-language-server-1.20.0/bin/jdtls' },
		root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	}
end

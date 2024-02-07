local lspconfig = require("lspconfig")
-- require("language.settings.nativelsp")
local keybindings = require("keybindings.bindings")

local servers = {
	"pyright",
	"lua_ls",
	"clangd",
	"cmake",
    "texlab",
}

function SetupLSP(lsp)
    lspconfig[lsp].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
		on_attach = keybindings.attach
    }
end

for _, lsp in ipairs(servers) do
    SetupLSP(lsp)
end


function SetupJava()
	require('jdtls').start_or_attach {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = keybindings.attach,
		cmd = { '/usr/local/bin/jdt-language-server-1.20.0/bin/jdtls' },
		root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	}
end

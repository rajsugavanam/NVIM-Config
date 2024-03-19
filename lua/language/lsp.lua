local lspconfig = require("lspconfig")
-- require("language.settings.nativelsp")
local keybindings = require("keybindings.bindings")

local servers = {
	"pyright",
	"lua_ls",
	"clangd",
	"cmake",
    "arduino_language_server",
    "asm_lsp",
    "texlab",
    "biome",
    "html",
    "cssls",
}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers,
}


-- capabilities: to work with nvim-cmp.
-- on_attach: function to run when the lsp attaches (I add the keybinds here.)
-- root_dir: the highest parent directory that the LSP will recognize.

local CAPABILITIES = require("cmp_nvim_lsp").default_capabilities()
local ON_ATTACH = keybindings.attach

function SetupLSP(lsp)
    lspconfig[lsp].setup {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH
    }
end

-- called by the java language server automagically
function SetupJava()
	require("jdtls").start_or_attach {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
		cmd = { "/usr/local/bin/jdt-language-server-1.20.0/bin/jdtls" },
		root_dir = vim.fs.dirname(vim.fs.find({"gradlew", ".git", "mvnw"}, { upward = true })[1]),
	}
end

function SetupSourcekit()
    lspconfig["sourcekit"].setup {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
        cmd = { "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp" },
    }
end

function SetupArduinoLS()
    local MY_FQBN = "arduino:avr:uno"
    lspconfig["arduino_language_server"].setup {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
        cmd = {
            "arduino-language-server",
            "-cli-config", "/opt/homebrew/bin/arduino-cli",
            "-fqbn",
            MY_FQBN
        },
    }
end

function SetupAllLSP()

    for _, lsp in ipairs(servers) do
        SetupLSP(lsp)
    end

    SetupSourcekit()
    SetupArduinoLS()

end

SetupAllLSP();

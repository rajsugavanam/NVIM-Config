local lspconfig = require("lspconfig")
-- require("language.settings.nativelsp")
local keybindings = require("keybindings.bindings")

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

local servers = {
	"pyright",
	"lua_ls",
	"clangd",
	"cmake",
    "arduino_language_server",
    "angularls",
    "texlab",
    "html",
    "cssls",
    "jdtls",
    "ts_ls",
    "intelephense",
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

local function extraneous(lsp)
    return
        (lsp == "jdtls")
end

function SetupLSP(lsp)
    if (extraneous(lsp)) then
        return
    end
    lspconfig[lsp].setup {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
        single_file_support = false,
    }
end

-- called by the java language server automagically
function SetupJava()
    require("jdtls").start_or_attach {
        cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
        root_dir = vim.fs.dirname(vim.fs.find({"gradlew", ".git", "mvnw"}, { upward = true })[1]),
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
    }
end

function SetupSourcekit()
    lspconfig["sourcekit"].setup {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
        single_file_support = true,
        filetypes = { "swift" },
        cmd = { "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp" },
    }
end

function SetupArduinoLS()
    local MY_FQBN = "arduino:avr:uno"
    lspconfig["arduino_language_server"].setup {
        capabilities = CAPABILITIES,
        on_attach = ON_ATTACH,
        single_file_support = true,
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

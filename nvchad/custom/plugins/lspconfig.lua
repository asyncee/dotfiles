local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

local on_attach_wrapper = function(client, bufnr)
	on_attach(client, bufnr)
end

local servers = {}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach_wrapper,
		capabilities = capabilities,
	})
end

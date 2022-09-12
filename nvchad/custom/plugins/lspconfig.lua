local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local on_attach_wrapper = function(client, bufnr)
  on_attach(client, bufnr)
end

local servers = { "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach_wrapper,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach_wrapper,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

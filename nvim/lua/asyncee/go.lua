require("go").setup({
	gofmt = "gopls", -- if set to gopls will use gopls format
	comment_placeholder = " ",
	icons = false, -- set to false to disable icons setup
	lsp_format_on_save = 0,
	lsp_document_formatting = false,
	null_ls_document_formatting_disable = false, -- true: disable null-ls formatting
	lsp_keymaps = false, -- true: use default keymaps defined in go/lsp.lua
	lsp_codelens = true,
	lsp_diag_hdlr = false, -- hook lsp diag handler
})

require("telescope").load_extension("goimpl")

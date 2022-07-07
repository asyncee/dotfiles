local wk = require("which-key")
wk.setup({})

-- Terminal
-- Exit by hitting control+f
vim.keymap.set("t", "<C-f>", [[<C-\><C-n>]], {})
wk.register({
	["<C-t>"] = { require("FTerm").toggle, "Terminal" },
}, { mode = "n" })
wk.register({
	["<C-t>"] = { require("FTerm").toggle, "Terminal" },
}, { mode = "t" })

--[[
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end ]]

-- Lsp
wk.register({
	["<leader>"] = {
		c = {
			name = "+lsp",
			d = { "<cmd> Telescope lsp_definitions<CR>", "Definition" },
			r = { "<cmd> Telescope lsp_references<CR>", "References" },
			i = { "<cmd> Telescope lsp_implementations<CR>", "Implementation" },
			a = { vim.lsp.buf.code_action, "Code action" },
			x = { vim.lsp.buf.range_code_action, "Range code action" },
			o = { "<cmd> Telescope lsp_dynamic_workspace_symbols<CR>", "All symbols" },
			s = { "<cmd> Telescope treesitter<CR>", "Doc symbols" },
			c = { "<cmd> Telescope lsp_incoming_calls<CR>", "In calls" },
			b = { "<cmd> Telescope lsp_outgoing_calls<CR>", "Out calls" },
			t = { "<cmd> Telescope lsp_type_definition<CR>", "Type definition" },
			f = { require("telescope").extensions.goimpl.goimpl, "Implement interface" },
		},
		r = {
			name = "+refactor",
			r = { vim.lsp.buf.rename, "Rename" },
		},
	},
})

-- LSP Saga
wk.register({
	["<leader>a"] = {
		name = "+lsp saga",
		h = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
		s = { "<cmd>Lspsaga signature_help<CR>", "Signature info" },
		d = { "<cmd>Lspsaga preview_definition<CR>", "Preview definition" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostics next" },
		p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostics prev" },
	},
})

-- Telescope
wk.register({
	["<leader>f"] = {
		name = "+telescope",
		f = { require("asyncee.telescope").project_files, "Find files" },
		a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
		w = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		b = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		h = { "<cmd> Telescope help_tags <CR>", "Help page" },
		e = { "<cmd> Telescope oldfiles <CR>", "Recents" },
		c = { "<cmd> Telescope colorscheme <CR>", "Theme" },
	},
})

-- Nvim-tree
wk.register({
	["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
	["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
	["<leader>f"] = { "<cmd> NvimTreeFindFile<CR>", "find current file" },
})

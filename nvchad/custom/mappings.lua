local M = {}

M.telescope = {
	n = {
		["<Leader>km"] = { "<cmd>Telescope keymaps<CR>", "Show keymaps" },
	},
}

M.nvim_tree = {
	n = {
		["<leader>f"] = { "<cmd> NvimTreeFindFile<CR>", "select current file in tree" },
	},
}

M.lsp = {
	n = {
		["<Leader>dn"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "lsp next diagnostics" },
		["<Leader>dp"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "lsp previous diagnostics" },
		["<Leader>di"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "lsp line diagnostics" },
		["gD"] = { "<cmd> Telescope lsp_type_definitions<CR>", "lsp type definition" },
		["gd"] = { "<cmd> Telescope lsp_definitions<CR>", "lsp definition" },
		["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "lsp peek definition" },
		["gi"] = { "<cmd> Telescope lsp_implementations<CR>", "lsp implementation" },
		["gr"] = { "<cmd> Telescope lsp_references<CR>", "lsp references" },
		["gc"] = { "<cmd> Telescope lsp_incoming_calls<CR>", "lsp in calls" },
		["go"] = { "<cmd> Telescope lsp_outgoing_calls<CR>", "lsp out calls" },
		["gf"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp out calls" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "lsp hover" },
		["<C-k>"] = { "<cmd>Lspsaga signature_help<CR>", "lsp signature info" },
		["<Leader>o"] = { "<cmd>LSoutlineToggle<CR>", "lsp outline" },
		["<Leader>ca"] = { vim.lsp.buf.code_action, "lsp code action" },
		["<Leader>rn"] = { vim.lsp.buf.rename, "lsp rename" },
		["<Leader>sw"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols<CR>", "lsp workspace symbols" },
		["<Leader>sd"] = { "<cmd> Telescope treesitter<CR>", "lsp document symbols" },

		-- Golang specific
		-- ["<C-i>"] = { require("telescope").extensions.goimpl.goimpl, "Implement Go interface" },
	},
}

M.disabled = {
	n = {
		["<leader>rn"] = "",
		["gD"] = "",
		["gd"] = "",
		["K"] = "",
		["gi"] = "",
		["<leader>ca"] = "",
		["gr"] = "",
		["<leader>fm"] = "",
	},
}

-- Avoid neovim bug when it refuses to close when there are terminal buffers
vim.cmd("command Z wa | qa")
vim.cmd("cabbrev wqa Z")

-- Bufdelete
-- Remap bd to Bdelete to close buffer and preserve it's window
vim.cmd("cnoreabbrev bd Bdelete")
vim.cmd("cnoreabbrev bdelete Bdelete")

return M

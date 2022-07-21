require("legendary").setup()

local wk = require("which-key")
wk.setup({})

-- Terminal
vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], {}) -- move terminal into normal mode
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], {}) -- Switch to window on right
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], {}) -- Switch to window on top
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], {}) -- Switch to window on bottom
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], {}) -- Switch to window on left
wk.register({ ["<C-t>"] = { "<cmd>FloatermToggle<CR>", "Toggle terminal" } }, { mode = "n" })
wk.register({ ["<C-t>"] = { "<cmd>FloatermToggle<CR>", "Toggle terminal" } }, { mode = "t" })
wk.register({ [",tn"] = { "<cmd>FloatermNext<CR>", "Next terminal" } }, { mode = "t" })
wk.register({ [",tp"] = { "<cmd>FloatermPrev<CR>", "Prev terminal" } }, { mode = "t" })
wk.register({ [",tc"] = { "<cmd>FloatermNew<CR>", "New terminal" } }, { mode = "n" })
wk.register({ [",tc"] = { "<cmd>FloatermNew<CR>", "New terminal" } }, { mode = "t" })

-- Show / search keymaps
wk.register({
	["<Leader>km"] = { "<cmd>Legendary keymaps<CR>", "Show keymaps" },
})

-- Marks / harpoon
wk.register({
	["<Leader>ms"] = { "<cmd>Telescope harpoon marks<CR>", "Show marks" },
	["<Leader>ma"] = { require("harpoon.mark").add_file, "Add mark" },
	["<Leader>mn"] = { require("harpoon.ui").nav_next, "Next mark" },
	["<Leader>mp"] = { require("harpoon.ui").nav_prev, "Prev mark" },
})

-- Barbar
wk.register({
	["<C-p>"] = { "<cmd>BufferPick<CR>", "Pick buffer" },
}, { mode = "n" })

-- Code / lsp mappings
wk.register({
	["<Leader>dn"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostics next" },
	["<Leader>dp"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Diagnostics prev" },
	["<Leader>di"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics" },
	["gD"] = { "<cmd> Telescope lsp_type_definitions<CR>", "Type definition" },
	["gd"] = { "<cmd> Telescope lsp_definitions<CR>", "Definition" },
	["gp"] = { "<cmd>Lspsaga preview_definition<CR>", "Preview definition" },
	["gi"] = { "<cmd> Telescope lsp_implementations<CR>", "Implementation" },
	["gr"] = { "<cmd> Telescope lsp_references<CR>", "References" },
	["gc"] = { "<cmd> Telescope lsp_incoming_calls<CR>", "In calls" },
	["go"] = { "<cmd> Telescope lsp_outgoing_calls<CR>", "Out calls" },
	["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
	["<C-k>"] = { "<cmd>Lspsaga signature_help<CR>", "Signature info" },
	["<Leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
	["<Leader>rca"] = { vim.lsp.buf.range_code_action, "Range code action" },
	["<Leader>rn"] = { vim.lsp.buf.rename, "Rename" },
	["<Leader>ss"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols<CR>", "Show symbols" },
	["<Leader>sd"] = { "<cmd> Telescope treesitter<CR>", "Show document symbols" },

	-- Golang specific
	["<C-i>"] = { require("telescope").extensions.goimpl.goimpl, "Implement Go interface" },
}, { mode = "n" })

-- Code / lsp mappings (visual mode)
wk.register({
	["<Leader>rca"] = { vim.lsp.buf.range_code_action, "Range code action" },
}, { mode = "v" })

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

-- Bufdelete
-- Remap bd to Bdelete to close buffer and preserve it's window
vim.cmd("cnoreabbrev bd Bdelete")
vim.cmd("cnoreabbrev bdelete Bdelete")

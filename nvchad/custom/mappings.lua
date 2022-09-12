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

M.disabled = {
	n = {
		["<leader>rn"] = "",
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

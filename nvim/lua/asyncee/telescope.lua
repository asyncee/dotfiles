local M = {}

-- Load git files, and if there are not .git folder, show all files.
M.project_files = function()
	local opts = {}
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

--- Delete the selected buffer or all the buffers selected using multi selection.
---@param prompt_bufnr number: The prompt bufnr
local delete_buffer = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local bufdelete = require("bufdelete")
	current_picker:delete_selection(function(selection)
		local force = vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal"
		local ok = pcall(bufdelete.bufdelete, selection.bufnr, force)
		return ok
	end)
end

require("telescope").setup({
	pickers = {
		buffers = {
			mappings = {
				-- Delete buffer with dd in normal mode
				n = {
					["dd"] = delete_buffer,
				},
				-- Delete buffer with control-d in insert mode
				i = {
					["<C-d>"] = delete_buffer,
				},
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("dap")

return M

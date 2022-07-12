local tabline = require("tabline")

tabline.setup({
	-- Defaults configuration options
	enable = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
		show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = true, -- shows base filename only instead of relative path in filename
		modified_icon = "+ ", -- change the default modified icon
		modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
		show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
	},
})
vim.cmd([[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session
]])

local augroup = vim.api.nvim_create_augroup("TablineBuffers", {})

function ShowCurrentBuffers()
	local data = vim.t.tabline_data
	if data == nil then
		tabline._new_tab_data(vim.fn.tabpagenr())
		data = vim.t.tabline_data
	end
	data.show_all_buffers = false
	vim.t.tabline_data = data
	vim.cmd([[redrawtabline]])
end

vim.api.nvim_create_autocmd({ "TabEnter" }, {
	group = augroup,
	callback = ShowCurrentBuffers,
})

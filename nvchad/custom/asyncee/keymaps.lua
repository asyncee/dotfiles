local wk = require("which-key")

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
	["<leader>fd"] = {
		name = "+telescope dap",
		c = { "<cmd> Telescope dap commands <CR>", "Dap commands" },
		g = { "<cmd> Telescope dap configurations <CR>", "Dap configurations" },
		b = { "<cmd> Telescope dap list_breakpoints <CR>", "Dap breakpoints" },
		v = { "<cmd> Telescope dap variables <CR>", "Dap variables" },
		f = { "<cmd> Telescope dap frames <CR>", "Dap frames" },
	},
})

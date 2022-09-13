local overrides = require("custom.plugins.overrides")

return {
	["goolord/alpha-nvim"] = {
		disable = false,
		override_options = overrides.alpha,
	},

	["folke/which-key.nvim"] = { disable = false },

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["kyazdani42/nvim-tree.lua"] = {
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
		override_options = overrides.nvimtree,
	},

	["nvim-telescope/telescope.nvim"] = {
		after = { "alpha-nvim", "project.nvim" },
		config = function()
			require("plugins.configs.telescope")
			require("telescope").load_extension("projects")
		end,
		override_options = overrides.telescope,
	},

	-- Custom plugins

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- LSP
	["RRethy/vim-illuminate"] = {
		config = function()
			require("illuminate").configure({})
		end,
	},
	["glepnir/lspsaga.nvim"] = {
		config = function()
			require("lspsaga").init_lsp_saga({})
		end,
	},
	["folke/lsp-colors.nvim"] = {},

	-- -- Golang
	-- ["ray-x/guihua.lua"] = {
	--   run = "cd lua/fzy && make",
	-- },
	-- ["ray-x/go.nvim"] = {},
	-- ["nvim-lua/popup.nvim"] = {},
	-- ["edolphin-ydf/goimpl.nvim"] = {
	--   after = "popup",
	-- },
	--
	-- -- UI
	["stevearc/dressing.nvim"] = {
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
					insert_only = false,
					start_in_insert = false,
					winblend = 0,
					relative = "win",
				},
			})
		end,
	},
	-- Marks
	["chentoast/marks.nvim"] = {
		config = function()
			require("marks").setup({})
		end,
	},

	-- Project, sessions
	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("project_nvim").setup({})
		end,
	},
	["Shatur/neovim-session-manager"] = {
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
			})
		end,
	},

	-- Helpers
	["folke/todo-comments.nvim"] = {
		after = "plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	["famiu/bufdelete.nvim"] = {},
	["p00f/nvim-ts-rainbow"] = {},
}

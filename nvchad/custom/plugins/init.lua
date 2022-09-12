local overrides = require("custom.plugins.overrides")

return {
	["goolord/alpha-nvim"] = {
		disable = false,
		override_options = overrides.alpha,
	},

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
		override_options = overrides.nvimtree,
	},

	["nvim-telescope/telescope.nvim"] = {
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
	-- ["glepnir/lspsaga.nvim"] = {},
	-- ["onsails/lspkind.nvim"] = {},

	--
	-- -- DAP
	-- ["mfussenegger/nvim-dap"] = {},
	-- ["rcarriga/nvim-dap-ui"] = {
	--   after = "nvim-dap",
	-- },
	-- ["theHamsta/nvim-dap-virtual-text"] = {
	--   after = "nvim-dap",
	-- },
	-- ["nvim-telescope/telescope-dap.nvim"] = {
	--   after = "nvim-dap",
	-- },
	-- ["leoluz/nvim-dap-go"] = {},
	--
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
	-- -- Marks
	-- ["chentoast/marks.nvim"] = {},
	-- ["ThePrimeagen/harpoon"] = {},
	--
	-- Helpers
	-- ["ahmedkhalf/project.nvim"] = {},
	-- ["Shatur/neovim-session-manager"] = {},
	["folke/lsp-colors.nvim"] = {},
	["folke/todo-comments.nvim"] = {
		after = "plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	["famiu/bufdelete.nvim"] = {},
	-- ["p00f/nvim-ts-rainbow"] = {},
}

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	-- Themes
	use({ "ray-x/starry.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- LSP
	use({ "williamboman/nvim-lsp-installer" })
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "RRethy/vim-illuminate" })
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({ "onsails/lspkind.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	-- Completion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "ray-x/lsp_signature.nvim" })

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "leoluz/nvim-dap-go" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- Golang
	use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
	use({ "ray-x/go.nvim" })
	use({
		"edolphin-ydf/goimpl.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "stevearc/dressing.nvim" }) -- Use telescope for pickers

	-- Keymaps
	use({ "mrjones2014/legendary.nvim" })
	use({ "folke/which-key.nvim" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- Marks
	use({ "chentoast/marks.nvim" })
	use({ "ThePrimeagen/harpoon" })

	-- Helpers
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "windwp/nvim-autopairs" })
	use({ "numToStr/Comment.nvim" })
	use({ "folke/lsp-colors.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "Shatur/neovim-session-manager" })
	use({ "rcarriga/nvim-notify" })
	use({ "voldikss/vim-floaterm" })
	use({ "folke/todo-comments.nvim" })
	use({ "kevinhwang91/nvim-bqf" })
	use({ "famiu/bufdelete.nvim" })
	use({ "p00f/nvim-ts-rainbow" })

	-- Navigation
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "goolord/alpha-nvim" })
	use({ "kdheepak/tabline.nvim" })

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

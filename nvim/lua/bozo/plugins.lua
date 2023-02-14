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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("goolord/alpha-nvim")
	use("kyazdani42/nvim-web-devicons") -- icons
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("numToStr/Comment.nvim") -- comment
	use("sitiom/nvim-numbertoggle") -- hybrid line numbers
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }) -- status line
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } }) -- telescope
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- syntax highlighting
	use("windwp/nvim-autopairs") -- Autopairs
	use("lewis6991/gitsigns.nvim") -- git
	use("akinsho/toggleterm.nvim") -- terminal
	use("lewis6991/impatient.nvim") -- faster startup
	use("lukas-reineke/indent-blankline.nvim") -- indentline
	-- use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } }) -- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use("ahmedkhalf/project.nvim") -- project
	use("nvim-orgmode/orgmode") -- emacs org-mode
	use("j-hui/fidget.nvim") -- Useful status updates for LSP
	use("tpope/vim-sleuth")

	-- color schemes
	use("projekt0n/github-nvim-theme")
	use("noahfrederick/vim-hemisu")
	use("NTBBloodbath/doom-one.nvim")
	use("rebelot/kanagawa.nvim")
	use("RRethy/nvim-base16")

	-- completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

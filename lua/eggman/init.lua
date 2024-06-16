require("eggman.remap")
require("eggman.set")

--package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
	{	
		"scottmckendry/cyberdream.nvim", 
        lazy = false,
		config = function() 
			local fm = require 'cyberdream'

			fm.setup {
				transparent = true,
                italic_comments = true,
                hide_fillshars = true,
                borderless_telescope = true,
                terminal_colors = true,
			}
			vim.cmd([[colorscheme cyberdream]])
		end
	},
	{
		'nvim-treesitter/nvim-treesitter', 
		config = function()
			vim.cmd([[TSUpdate]])
		end
	},
	{"theprimeagen/harpoon"},
	{"mbbill/undotree"},
	{"tpope/vim-fugitive"},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
})


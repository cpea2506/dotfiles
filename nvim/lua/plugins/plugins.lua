-- Auto Packercompile after save file
vim.api.nvim_exec(
	[[
	  augroup Packer
		autocmd!
		autocmd BufWritePost plugins.lua PackerCompile
	  augroup end
	]],
	false
)

-- plugins install
local use = require("packer").use
require("packer").startup({
	function()
		use("rafamadriz/friendly-snippets")
		use("wbthomason/packer.nvim")
		use("terrortylor/nvim-comment")
		use("fratajczak/one-monokai-vim")
		use("matze/vim-move")
		use("andweeb/presence.nvim")
		use("voldikss/vim-floaterm")
		use("mg979/vim-visual-multi")
		use("Pocco81/AutoSave.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("antoinemadec/FixCursorHold.nvim")
		use("nvim-lua/plenary.nvim")

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		})
		use("kyazdani42/nvim-web-devicons")
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({
			"romgrk/barbar.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use({
			"shadmansaleh/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		--|-- lsp stuffs--|--
		use("kabouzeid/nvim-lspinstall")
		use("neovim/nvim-lspconfig")
		use("onsails/lspkind-nvim")
		--|---------------|--

		--|-- tree-sitter stuffs--|--
		use("nvim-treesitter/nvim-treesitter")
		use("windwp/nvim-ts-autotag")
		use("p00f/nvim-ts-rainbow")
		use("windwp/nvim-autopairs")
		--|-----------------------|--

		--|-- cmp stuffs--|--
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("saadparwaiz1/cmp_luasnip")
		use("L3MON4D3/LuaSnip")
		--|---------------|--

		--|-- number stuffs--|--
		use("nacro90/numb.nvim")
		use("myusuf3/numbers.vim")
		--|------------------|--
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({
					style = "minimal",
					border = "rounded",
				})
			end,
		},
		profile = {
			enable = true,
			threshold = 1,
		},
	},
})

-- external plugins setup
local call_plug = function(tab)
	for _, v in pairs(tab) do
		require("plugins/" .. v)
	end
end

call_plug({
	"lualine/evil_lualine",
	"cmp",
	"null_ls",
	"lsp",
})

-- plugins setup
require("nvim_comment").setup()
require("numb").setup({})
require("nvim-autopairs").setup({})

require("presence"):setup({
	main_image = "file",
})

-- require("autosave").setup({
-- 	enabled = true,
-- 	execution_message = "",
-- 	events = { "InsertLeave" },
-- })

require("nvim-autopairs.completion.cmp").setup({
	map_cr = true,
	map_complete = true,
	auto_select = false,
})

require("nvim-tree").setup({
	view = {
		side = "right",
		auto_resize = true,
	},
})

require("colorizer").setup({
	"*",
}, {
	RGB = true,
	RRGGBB = true,
	names = false,
	RRGGBBAA = true,
	rgb_fn = true,
	css = true,
	css_fn = true,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"xml",
		},
	},
	rainbow = {
		enable = true,
		colors = {
			"#FED701",
			"#E492E1",
			"#87CEFA",
			"#FE938C",
			"#A3F7B5",
			"#5A81AC",
			"#D03770",
		},
	},
})

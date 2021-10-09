vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]],
	false
)

local use = require("packer").use
require("packer").startup(function()
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
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").config({})
			require("lspconfig")["null-ls"].setup({})
		end,
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use("nvim-lua/plenary.nvim")
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
	use({
		"simrat39/rust-tools.nvim",
		hover_with_actions = true,
		config = function()
			require("rust-tools").setup({
				tools = {
					autoSetHints = true,
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					cmd = { vim.fn.stdpath("data") .. "/lspinstall/rust/rust-analyzer" },
					no_attach = require("lsp").common_on_attach,
					on_init = require("lsp").common_on_init,
				},
			})
		end,
		ft = { "rust", "rs" },
	})

	--|-- lsp stuffs--|--
	use("williamboman/nvim-lsp-installer")
	use("neovim/nvim-lspconfig")
	--|---------------|--

	--|-- tree-sitter stuffs--|--
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-autopairs")
	--|-----------------------|--

	--|-- cmp stuffs--|--
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-buffer")
	use("L3MON4D3/LuaSnip")
	--|---------------|--

	--|-- number stuffs--|--
	use("nacro90/numb.nvim")
	use("myusuf3/numbers.vim")
	--|------------------|--
end)

-- plugin setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("nvim-tree").setup({
	view = {
		side = "right",
		auto_resize = true,
	},
})

require("numb").setup({})
require("lualine/evil_lualine")

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
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"xml",
		},
	},
	ensure_installed = "maintained",
	highlight = {
		enable = true,
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

require("cmp").setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

require("nvim-autopairs").setup({ fast_wrap = { map = "<C-m>" } })
require("nvim-autopairs.completion.cmp").setup({
	map_cr = true,
})

require("presence"):setup({
	main_image = "file",
})

require("autosave").setup({
	enabled = true,
	execution_message = "",
	events = { "InsertLeave" },
})

local null_ls = require("null-ls")
null_ls.config({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.stylelint,
	},
})

require("lspconfig")["null-ls"].setup({
	on_attach = my_custom_on_attach,
})

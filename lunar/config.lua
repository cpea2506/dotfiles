vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.updatetime = 300

-- general
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.view.auto_resize = true
lvim.builtin.dashboard.active = true
lvim.line_wrap_cursor_movement = true
lvim.debug = true
lvim.log.level = "warn"
lvim.colorscheme = "one-monokai"
lvim.format_on_save = true
lvim.transparent_window = true

lvim.leader = "space"
lvim.keys.normal_mode = {
	-- Navigate buffers
	["<Tab>"] = ":bnext<CR>",
	["<S-Tab>"] = ":bprevious<CR>",
	["<C-s>"] = ":w<CR>",
	["<C-q>"] = ":q<CR>",
	["<C-t>"] = ":FloatermToggle<CR>",

	--nvimtree
	["<C-b>"] = ":NvimTreeToggle<CR>",
	["<C-e>"] = ":BufferClose<CR>",
}
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   -- for input mode
lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous

lvim.builtin.treesitter.autotag = { enable = true }
lvim.builtin.treesitter.rainbow = { enable = true }

-- nvim-autopairs
require("nvim-autopairs.completion.cmp").setup({
	map_cr = true,
	map_complete = true,
	auto_select = false,
	insert = false,
	map_char = {
		all = "(",
		tex = "{",
	},
})

-- vim cmd
vim.cmd([[
    let g:move_key_modifier = 'C'
    let g:auto_save = 1
    let g:auto_save_no_updatetime = 1
    let g:auto_save_in_insert_mode = 0
    let g:auto_save_silent = 1
]])

-- treesitter config
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		disable = {},
	},
})

require("cmp").setup({
	sources = {
		{ name = "luasnip" },
	},
})

-- python setting lsp
lvim.lang.python.formatters = { { exe = "autopep8" } }
lvim.lang.python.linters = { { exe = "flake8" } }

-- rust setting lsp
lvim.lang.rust.formatters = { { exe = "rustfmt" } }
lvim.lsp.override = { "rust" }

-- stylua setting
lvim.lang.lua.formatters = { { exe = "stylua" } }

-- javascript setting lsp
lvim.lang.javascript.formatters = { { exe = "prettierd" } }
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.css.linters = { { exe = "stylelint" } }
lvim.lang.html.formatters = lvim.lang.javascript.formatters
lvim.lang.css.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

require("presence"):setup({
	-- General options
	main_image = "file",
	log_level = nil,
	client_id = "793271441293967371",
	debounce_timeout = 10,
	enable_line_number = true,
	buttons = true,

	-- Rich Presence text options
	editing_text = "Editing %s",
	file_explorer_text = "Browsing %s",
	git_commit_text = "Committing changes",
	plugin_manager_text = "Managing plugins",
	reading_text = "Reading %s",
	workspace_text = "Working on %s",
	line_number_text = "Line %s out of %s",
})
--Additional Plugins
lvim.plugins = {
	{ "myusuf3/numbers.vim" },
	{ "L3MON4D3/LuaSnip" },
	{ "matze/vim-move" },
	{ "mg979/vim-visual-multi" },
	{ "kyazdani42/treesitter-analyzer" },
	{ "fratajczak/one-monokai-vim" },
	{ "voldikss/vim-floaterm" },
	{ "vim-scripts/vim-auto-save" },
	{ "andweeb/presence.nvim" },
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({
				tools = {
					autoSetHints = true,
					hover_with_actions = true,
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					cmd = { vim.fn.stdpath("data") .. "/lspinstall/rust/rust-analyzer" },
					on_attach = require("lsp").common_on_attach,
					on_init = require("lsp").common_on_init,
				},
			})
		end,
		ft = { "rust", "rs" },
	},
	{ "tpope/vim-surround" },
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
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
			})
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = true,
					extended_mode = true,
					colors = {
						"#FED701",
						"#E492E1",
						"#87CEFA",
						"#FE938C",
						"#A3F7B5",
						"#5A81AC",
						"#D03770",
					}, -- table of hex strings
				},
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
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
		end,
	},
}

-- autocommands
lvim.autocommands.custom_groups = {
	-- set tabstop
	{ "BufWinEnter", "*", "setlocal ts=4 sw=4" },
	-- compile for autopair cr
	{ "VimEnter", "*", ":PackerCompile" },
	-- evil_lualine theme
	{
		"VimEnter",
		"*",
		":luafile /Users/CPea2506/Code/dotfile/lualine/evil_lualine.lua",
	},
}

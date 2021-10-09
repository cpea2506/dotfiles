-- vim setup
vim.cmd[[colorscheme one-monokai]]

local set = vim.opt
set.termguicolors=true
set.updatetime=250
set.tabstop = 4
set.shiftwidth=4
set.hlsearch=true
set.smartcase=true
set.smartindent=true
set.autoindent=true
set.clipboard = 'unnamedplus'
set.whichwrap:append('<,>,h,l,[,]')
vim.o.completeopt = 'menuone,noselect'

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end,
  ]],
  false
)

-- neovide setup
vim.g["neovide_cursor_vfx_mode"]="sonicboom"
vim.g["neovide_cursor_animation_length"]=0.1

-- lua nvim setup
require("key_mapping")
require("plugins/plugins")

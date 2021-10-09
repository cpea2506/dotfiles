local keymap = function(keys)
	local modes = {
		normal = 'n',
		insert = 'i',
		visual = 'v',
	}

	for mode, map in pairs(keys) do
		local key_mode = modes[mode]
		local opts = { noremap = true, silent = true }

		for key, value in pairs(map) do
			vim.api.nvim_set_keymap(key_mode, key, value, opts)
		end
	end
end

keymap({
	normal = {
		["<C-s>"] = ":w<CR>",
		["<C-b>"] = ":NvimTreeToggle<CR>",
		["<Tab>"] = ":BufferNext<CR>",
		["<S-Tab>"] = ":BufferPrevious<CR>",
		["<C-e>"] = ":BufferClose<CR>",
		["<C-t>"] = ":FloatermToggle<CR>",
		["<C-p>"] = ":Telescope find_files<CR>",
	},
})

-- vim move
vim.g["move_key_modifier"] = "C"

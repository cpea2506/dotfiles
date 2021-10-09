local map = function(key)
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end
end

map {'n', '<C-s>', ':w<CR>'}
map {'n', '<C-b>', ':NvimTreeToggle<CR>'}
map {'n', '<Tab>', ':BufferNext<CR>'}
map {'n', '<S-Tab>', ':BufferPrevious<CR>'}
map {'n', '<C-e>', ':BufferClose<CR>'}
map {'n', '<C-t>', ':FloatermToggle<CR>'}
map {'n', '<C-p>', ':Telescope find_files<CR>'}

-- vim move
vim.g['move_key_modifier'] = 'C'

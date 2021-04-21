local g = vim.g
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g['mapleader'] = ' '

map('n', '<space>', 'NOP')
map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly
map('n', '<leader><leader>', ':set hlsearch!<CR>')    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode
map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<C-h>', '<C-w>h') -- Better window movement
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('v', '<', '<gv') -- Better indenting
map('v', '>', '>gv')
map('i', 'kk', '<ESC>') -- escape remap
map('n', '<TAB>', ':bnext<CR>') -- TAB switch buffer
map('n', '<S-TAB>', ':bprevious<CR>')

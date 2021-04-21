require('plugins')
require('colorscheme')
require('keymappings')
require('settings')

-- Plugins
require('nv-compe')
require('nv-colorizer')
require('nv-galaxyline')
require('nv-tree')
require('nv-galaxyline')
require('nv-bufferline')
require('nv-treesitter')
require('nv-gitsigns')
require('nv-autopairs')
require('nv-neogit')
require('nv-presence')

-- LSP
require('lsp.lua-ls')
vim.lsp.set_log_level 'debug'

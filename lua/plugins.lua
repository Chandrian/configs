local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true} -- packer manages itself

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'mfussenegger/nvim-jdtls'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Status Line and Bufferline
  use 'glepnir/galaxyline.nvim'
  use 'akinsho/nvim-bufferline.lua'

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'},
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-media-files.nvim'}}}

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Color
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- General Plugins
  use 'kevinhwang91/nvim-bqf'
  use 'unblevable/quick-scope'
  use 'airblade/vim-rooter'
  use 'windwp/nvim-autopairs'
  use {'srishanbhattarai/neovim-spotify', run = 'bash install.sh'}
  use {'andweeb/presence.nvim'}
end)

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
        use {"neovim/nvim-lspconfig", opt = true}
        use {"glepnir/lspsaga.nvim", opt = true}
        use {"kabouzeid/nvim-lspinstall", opt = true}

        -- Telescope
        use {"nvim-lua/popup.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true}
        use {"nvim-telescope/telescope.nvim", opt = true}

        -- Debugging
        use {"mfussenegger/nvim-dap", opt = true}

        -- Autocomplete
        use {"hrsh7th/nvim-compe", config = 'require("plugin_settings.compe")'}
        use {"hrsh7th/vim-vsnip", opt = true}
        use {"rafamadriz/friendly-snippets", opt = true}

        -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = 'require("plugin_settings.treesitter")',
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
        use {"windwp/nvim-ts-autotag", opt = true}

        -- Explorer
    use { -- tree (view files)
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}, -- for file icons
        config = 'require("plugin_settings.tree")',
    }

        -- use {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
        use {"lewis6991/gitsigns.nvim", opt = true}
        use {"ChristianChiarulli/dashboard-nvim", opt = true}
        use {"windwp/nvim-autopairs", opt = true}

        use "terrortylor/nvim-comment"
        require('nvim_comment').setup()

        use {"kevinhwang91/nvim-bqf", opt = true}

        -- Color
        use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

        -- Status Line and Bufferline
        use {"glepnir/galaxyline.nvim", config = 'require("plugin_settings.galaxyline")'}
        use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = 'require("plugin_settings.bufferline")'}

 use {
    'AckslD/nvim-whichkey-setup.lua',
        requires = {{
            'liuchengxu/vim-which-key',
            config = 'require("plugin_settings.whichkey")',
        }}
    }
        require_plugin("nvim-lspconfig")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-lspinstall")
        require_plugin("popup.nvim")
        require_plugin("plenary.nvim")
        require_plugin("telescope.nvim")
        require_plugin("nvim-dap")
        require_plugin("vim-vsnip")
        require_plugin("nvim-ts-autotag")
        require_plugin("gitsigns.nvim")
        require_plugin("dashboard-nvim")
        require_plugin("nvim-autopairs")
        require_plugin("nvim-bqf")
        require_plugin("nvcode-color-schemes.vim")
    end
)

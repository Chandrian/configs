local wk = require('whichkey_setup')

local opts = {silent=true, noremap=true}
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', '<Cmd>Telescope live_grep<CR>', opts)

local keymap = {
    name = '+find',
    l = {'<Cmd>Telescope live_grep<CR>', 'live grep'},
    b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
    h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
    c = {
        name = '+commands',
        c = {'<Cmd>Telescope commands<CR>', 'commands'},
        h = {'<Cmd>Telescope command_history<CR>', 'history'},
    },
    q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
    g = {
        name = '+git',
        g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
        c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
        s = {'<Cmd>Telescope git_status<CR>', 'status'},
    },
}

wk.register_keymap('leader', {f = keymap})

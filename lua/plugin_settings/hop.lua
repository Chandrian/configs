local wk = require("whichkey_setup")
local keymap = {
    C = {"<Cmd>HopChar2<CR>", "hop char2"},
    [vim.g.mapleader] = {
        name = "hop",
        f = {"<Cmd>HopChar1<CR>", "hop char1"},
        c = {"<Cmd>HopChar2<CR>", "hop char2"},
        w = {"<Cmd>HopWord<CR>", "hop word"},
        l = {"<Cmd>HopLine<CR>", "hop line"},
        p = {"<Cmd>HopPattern<CR>", "hop pattern"},
    }
}
wk.register_keymap('leader', keymap, {silent = false})

vim.api.nvim_set_keymap('n', '<CR>', '<Cmd>HopWord<CR>', {noremap = true})

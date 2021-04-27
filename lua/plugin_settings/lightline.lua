vim.o.showmode = false
vim.g.lightline = {
    colorscheme = 'lunar',
    active = {
        left = {
            {'mode', 'paste'},
            {'readonly', 'relativepath', 'modified'},
        },
    },
    inactive = {
        left = {
            {'absolutepath'},
        },
    },
}

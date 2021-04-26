vim.o.showmode = false
vim.g.lightline = {
    colorscheme = 'gruvbox',
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

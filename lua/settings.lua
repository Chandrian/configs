vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.guifont = "FiraCode Nerd Font:h17"

local function enable_options(options)
    for _, option in ipairs(options) do
        -- TODO fix this
        -- vim.b[option] = true
        -- vim.o[option] = true
        vim.cmd('set '..option)
    end
end

local function set_options(options)
    for _, option in ipairs(options) do
        -- TODO fix this
        -- vim.b[option[1]] = option[2]
        -- vim.o[option[1]] = option[2]
        vim.cmd('set '..option[1]..'='..option[2])
    end
end

vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

enable_options({
    'spell',
    'expandtab',
    'termguicolors',
    'wildmenu', -- tabcomplete
    'list', -- show tabs and blankspace
    'nu', 'rnu', -- line numbers
    'splitright',
    'splitbelow',
    'autowrite', -- autowrite on :make
    'nowrapscan',
    'hidden',
    'nowrap',
    'title',
    'splitbelow',
    'splitright',
    'termguicolors',
    'smartindent',
    'cursorline',
    'noshowmode',
    'nobackup',
    'nowritebackup',
})

vim.bo.expandtab = true -- Converts tabs to spaces
set_options({
    {'scrolloff', 1}, {'sidescrolloff', 5}, -- min lines around cursor
    {'complete', '.,w,b,u,t,i,kspell'}, -- completion
    {'wildmode', 'longest:full,full'}, -- tabcomplete
    {'tabstop', 8}, {'shiftwidth', 4}, {'softtabstop', 4}, -- default indentation
    {'grepprg', [[rg\ --vimgrep\ --smart-case\ --follow]]}, -- use ripgrep as grep program
    {'switchbuf', 'useopen,usetab,newtab'}, -- Specify the behavior when switching between buffers
    {'stal', 2},
    {'timeoutlen', 500},
    {'updatetime', 300},
    {'pumheight', 10},
    {'fileencoding', 'utf-8'},
    {'cmdheight', 2},
    {'mouse', 'a'},
    {'conceallevel', 0},
    {'signcolumn', 'yes'},
})
-- vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.cmd('syntax on') -- syntax highlighting
vim.cmd('set formatoptions-=cro') -- Don't insert comments

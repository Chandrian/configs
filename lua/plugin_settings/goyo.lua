local wk = require('whichkey_setup')
local keymap = {
    F = {':Goyo<CR>', 'focus'},
}
wk.register_keymap('leader', keymap)

-- TODO handle this better
vim.api.nvim_exec([[
function! Goyo_enter()
  set noshowcmd
  Limelight
endfunction

function! Goyo_leave()
  set showcmd
  Limelight!
endfunction

autocmd! User GoyoEnter nested call Goyo_enter()
autocmd! User GoyoLeave nested call Goyo_leave()
]], false)

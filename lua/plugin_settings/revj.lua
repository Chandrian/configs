local wk = require('whichkey_setup')

require("revj").setup{
    brackets = {first = '([{<', last = ')]}>'}, -- brackets to consider surrounding arguments
    new_line_before_last_bracket = true, -- add new line between last argument and last bracket (only if no last seperator)
    add_seperator_for_last_parameter = true, -- if a seperator should be added if not present after last parameter
    enable_default_keymaps = false, -- enables default keymaps without having to set them below
    keymaps = {
        operator = '<Leader>J', -- for operator (+motion)
        line = '<Leader>j', -- for formatting current line
        visual = '<Leader>j', -- for formatting visual selection
    },
}

local leader_keymap = {
    j = 'split args op',
    J = 'split args line',
}
local visual_keymap = {
    j = 'split args',
}
wk.register_keymap('leader', leader_keymap)
wk.register_keymap('visual', visual_keymap)

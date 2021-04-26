local source = {}

source.config = function()
    vim.cmd("!make -C ~/Dev/config")
    vim.cmd("luafile ~/.config/nvim/init.lua")
end

return source

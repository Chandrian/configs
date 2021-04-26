return function()
    require('funcs.dedterm').setup{
        run_cmd = "arduino-upload expand('%:p:h')"
    }
end

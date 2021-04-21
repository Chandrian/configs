Presence = require("presence"):setup({
    -- This config table shows all available config options with their default values
    auto_update       = true,
    editing_text      = "Editing %s",
    neovim_image_text = "The One True Text Editor",
    main_image        = "neovim",

		workspace_text = function(git_project_name, buffer)
			local project_name = git_project_name
        -- Not in a git repository, so do some custom parsing
        if not git_project_name then
            -- Parse buffer for your project name
							project_name = get_project_name(buffer)
							if project_name == nil or project == "" then
								return ""
							end
        end
				return string.format("Working on %s", project_name)
    end,
})
-- Function to trim directory names (remove spaces)
function trim(str)
	return str:gsub("%s+", "")
end
-- custom function to parse the path and get the workspace name
function get_project_name(buffer)
	-- get file extension
	local file_extension = buffer:match("^.+%.(.+)$")
	-- Remove the file name from the end of the file
	local path = buffer:match( "^(.+/.+)/.*$")
	-- Remove the whole beginning of the path
	local dir_name = path:gsub("^/.*/", "")
	
	-- If its part of a cargo workspace, the file you are most likely editing is in src/main.rs
	-- That means you need to go up an extra directory to get the workspace name as in the if statement below
	if dir_name == "src" and file_extension == "rs" then
		local path = string.match(path, "^(.+/.+)/.*$")
		dir_name = string.gsub(path, "^/.*/","")
	end
	-- Define some custom workspace names
	if trim(dir_name) == "lua" or dir_name == "nvim" or dir_name == "plugin" then
		dir_name = "Neovim Config Files"
	end
	if trim(dir_name) == "alacritty" then
		dir_name = "Alacritty Config Files"
	end
	if trim(dir_name) == "fish" then
		dir_name = "Fish Shell Config Files"
	end
	if trim(dir_name) == "limelight" then
    dir_name = "Limelight Config Files"
  end
	if trim(dir_name) == "mutt" then
    dir_name = "Neomutt Config Files"
  end
	if trim(dir_name) == "zsh" then
    dir_name = "Zsh Config Files"
  end
	if trim(dir_name) == "ranger" then
    dir_name = "Ranger Config Files"
  end
	if trim(dir_name) == "skhd" then
    dir_name = "Skhd Config Files"
  end
	if trim(dir_name) == "yabai" then
    dir_name = "Yabai Config Files"
  end
	-- You can hide any directories you want by just adding them and making them return nil just like the one below
	if trim(dir_name) == "accounts" then
    dir_name = nil
  end
	if trim(dir_name) == "T" then
		dir_name = nil
	end
	if trim(dir_name) == ".gnupg" then
		dir_name = nil
	end
	return dir_name
end

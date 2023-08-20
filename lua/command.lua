local builtin = require("wp-utils.builtin")

local command = {}

command.create_command = function()
	-- create the wp command
	vim.api.nvim_create_user_command("WP", function(opts)
		if opts.fargs[1] == "is_wp" then
			print(builtin.is_wp())
		elseif opts.fargs[1] == "is_wp_root" then
			print(builtin.is_wp_root())
		elseif opts.fargs[1] == "is_wp_subdirectory" then
			print(builtin.is_wp_subdirectory())
		elseif opts.fargs[1] == "get_wp_path" then
			print(builtin.get_wp_path())
		end
	end, {
		-- expect one argument
		nargs = 1,
		-- autocomplete command arguments
		complete = function(arglead)
			local commands = {
				"is_wp",
				"get_wp_path",
				"is_wp_root",
				"is_wp_subdirectory",
			}

			local results = {}
			for _, v in pairs(commands) do
				if v:match(arglead) then
					table.insert(results, v)
				end
			end

			return results
		end,
	})
end

return command

local builtin = require("wp-utils.builtin")
local wp = {}

wp.setup = function()
	require("wp-utils.command").create_command()
end

wp.is_wp = function()
	return builtin.is_wp()
end

wp.is_wp_subdirectory = function()
	return builtin.is_wp_subdirectory()
end

wp.is_wp_root = function()
	return builtin.is_wp_root()
end

wp.get_wp_path = function()
	return builtin.get_wp_path()
end

return wp

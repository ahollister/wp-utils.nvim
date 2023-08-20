local utils = require("wp-utils.utils")
local builtin = {}

builtin.is_wp = function()
	return utils.is_wp()
end

builtin.is_wp_subdirectory = function()
	return utils.is_wp_subdirectory()
end

builtin.is_wp_root = function()
	return utils.is_wp_root()
end

builtin.get_wp_path = function()
	return utils.get_wp_path()
end

return builtin

local builtin = require("wp-utils.builtin")
local wp = {}

wp.setup = function()
	require("wp-utils.command").create_command()
end

-- Provide builtin functions to lua via require("wp-utils")
wp.is_wp = builtin.is_wp()
wp.is_wp_root = builtin.is_wp_root()
wp.is_wp_subdirectory = builtin.is_wp_subdirectory()
wp.get_wp_path = builtin.get_wp_path()

return wp

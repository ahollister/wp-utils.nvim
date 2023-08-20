local wp = {}

wp.setup = function()
	-- Create the WP command
	require("wp-utils.command").create_command()
end

return wp

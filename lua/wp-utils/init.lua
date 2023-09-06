local wp = {}

wp.setup = function()
	require("wp-utils.command").create_command()
end

return wp

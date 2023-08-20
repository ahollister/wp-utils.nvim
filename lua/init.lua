local config = require("wp-utils.config")
local wp = {}
local settings = {}

wp.setup = function(opts)
	opts = opts or {}
	config.set_user_opts(settings)

	-- Create the WP command
	require("wp-utils.command").create_command()
end

return wp

# WP-Utils.nvim

This neovim plugin provides some commands that allow you to determine whether the current working directory is part of a WordPress environment and get the path for the root of WP.

## Installation
---

### Packer

```
-- WP Utils
use("ahollister/wp-utils.nvim")
```

## Setup
---

You will need to call the setup function for the plugin to work, but there are no setup options required:

```
require("phpcbf").setup()
```

## Commands
---

`:WP is_wp()` - Returns true if the current working directory is part of a WP install.
`:WP get_wp_path()` - Returns the path to the root of the WP install.
`:WP is_wp_root()` - Returns true if the current working directory is the root of a WP install.
`:WP is_wp_subdirectory()` - Returns true if the current working directory is a subdirectory of a WP install.

## Use case
---

Here's an example of the use case I wrote this plugin for.

I have a plugin for running the PHPCBF command on save, which can take an absolute path for the executable as a setup option and an optional ruleset.

In WP installs I have a composer setup that handles the ruleset and provides the phpcbf script at: `WP_ROOT/vendor/bin/phpcbf`

Therefore I can use the commands provided by WP-Utils to determine the options passed to the PHPCBF plugin.

This is what that configuration for PHPCBF looks like, making use of WP-Utils:

```
local is_wp = require("wp-utils.utils").is_wp()
local wp_path = require("wp-utils.utils").get_wp_path()

-- Generic PHPCBF settings
local settings = {
	auto_format = true,
	phpcbf_path = "/Users/adam/.composer/vendor/bin/phpcbf",
	phpcbf_ruleset = "PSR2",
}

-- WP specific settings
if is_wp then
	settings.auto_format = true
	settings.phpcbf_path = wp_path .. "/vendor/bin/phpcbf"
	settings.phpcbf_ruleset = nil
end

require("phpcbf").setup(settings)
```

Now my PHPCBF plugin is configured to use the phpcbf script local to the WP install, or fall back to more generic settings (and a global phpcbf executable) if the current buffer is not part of a WP project.

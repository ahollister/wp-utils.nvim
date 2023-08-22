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

To install the user commands you'll need to run the setup function in your config:

```
require("wp-utils").setup()
```

To use a command elsewhere in your lua config you can call it as a lua function directly from wp-utils.utils:

```
local wp = require("wp-utils.utils")
local is_wp = wp.is_wp()
local is_wp_root = wp.is_wp_root()
local is_wp_subdirectory = wp.is_wp_subdirectory()
local get_wp_path = wp.get_wp_path()
```


## Commands
---

`:WP is_wp` - Returns true if the current working directory is part of a WP install.

`:WP is_wp_root` - Returns true if the current working directory is the root of a WP install.

`:WP is_wp_subdirectory` - Returns true if the current working directory is a subdirectory of a WP install.

`:WP get_wp_path` - Returns the path to the root of the WP install.

## Use case
---

Here's an example of the use case I wrote this plugin for.

I have a [plugin for running the phpcbf command](https://github.com/ahollister/phpcbf.nvim) on save, which can take an absolute path for the executable as a setup option and an optional ruleset.

In WP installs I have a composer setup that handles the ruleset and provides the phpcbf script at: `WP_ROOT/vendor/bin/phpcbf`

Therefore I can use the commands provided by WP-Utils to determine the options passed to the PHPCBF.nvim plugin.

This is what that configuration looks like, providing different options for WP vs other php environments:

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

Now the PHPCBF.nvim plugin is configured to use the phpcbf script local to the WP install, or fall back to more generic settings (and a global phpcbf executable) if the current buffer is not part of a WP project.

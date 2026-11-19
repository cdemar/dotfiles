-- Load order matters: options set the leader key before any plugin maps use it.

require("cdemar.core.options")
require("cdemar.core.keymaps")
require("cdemar.core.autocmds")
require("cdemar.lazy")

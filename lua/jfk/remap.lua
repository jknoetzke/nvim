--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Snip...

-- Toggle more plugins
map('n', 't', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files]], {})
map('n', 'fg', [[:Telescope live_grep]], {})
map('n', 'fb', [[:Telescope buffers]], {})

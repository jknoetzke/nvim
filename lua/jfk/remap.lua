local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
--local nnoremap = vim.api.nvim_set_keymap

local nnoremap = require('jfk.keymap').nnoremap

nnoremap("<leader>gs", "<cmd>:Git<CR>");
nnoremap("<leader>ga", "<cmd>Git fetch --all<CR>");


nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

map('n', 't', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files]], {})
map('n', 'fg', [[:Telescope live_grep]], {})
map('n', 'fb', [[:Telescope buffers]], {})

map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',
	{ silent = false, noremap = true })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
map('', '<leader>K', '<cmd>lua vim.diagnostic.open_float()<CR>',
	{ noremap = true })
map('', '<leader>qf',
	'<cmd>lua vim.diagnostic.setqflist({open = false})<cr><cmd>Telescope quickfix<cr>',
	{ silent = true })

-- Start interactive EasyAlign in visual mode (e.g. vipga)
map('n', 'ga', [[:EasyAlign]], {})


local map = vim.api.nvim_set_keymap


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


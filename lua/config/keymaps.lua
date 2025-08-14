-- Leader key for custom keybinds
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable Normal and Visual conflicts with <Space>
vim.keymap.set({'n','v'}, '<Space>', '<Nop>', {silent = true})

-- for use of remapping
local opts = {noremap = true, silent = true}

-- remove unwanted cutting feature
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('v', 'p', '"-dP', opts)

-- Splits
--- Creating
vim.keymap.set('n', '<leader>%', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>"', '<C-w>s', opts) -- split window horizontally
--- Resizing
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -5<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', ':close<CR>', opts) -- close current split window
--- Navigation
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Buffers
--- Navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>c', '<cmd> enew <CR>', opts) -- new buffer

-- Tabs
vim.keymap.set('n', '<leader>tc', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Centering
--- Vertical scroll
vim.keymap.set('n', '<C-d>','<C-d>zz', opts)
vim.keymap.set('n', '<C-u>','<C-u>zz', opts)
--- Search
vim.keymap.set('n', '<n>','nzzzv', opts)
vim.keymap.set('n', '<N>','Nzzzv', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

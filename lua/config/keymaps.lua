-- Leader key for custom keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable Normal and Visual conflicts with <Space>
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- for use of remapping
local opts = { noremap = true, silent = true }

-- remove unwanted cutting feature
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "p", '"-dP', opts)

-- Splits
--- Creating
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<C-x>", ":close<CR>", opts) -- close current split window
vim.keymap.set("n", "<leader>cs", ":only<CR>", opts)
--- Resizing
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-Left>", ":vertical resize -5<CR>", opts)
vim.keymap.set("n", "<S-Right>", ":vertical resize +5<CR>", opts)
vim.keymap.set("n", "<leader>==", "<C-w>=", opts) -- make split windows equal width & height
--- Navigation
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", opts)

-- Buffers
--- Navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bq", ":bdelete!<CR>", opts)    -- close buffer
vim.keymap.set("n", "<leader>bt", "<cmd> enew <CR>", opts)  -- new buffer
vim.keymap.set("n", "<leader>cb", ":%bd|e#|bd# <CR>", opts) -- close all other buffers

-- Tabs/Layouts
vim.keymap.set("n", "<leader>lc", ":tabnew<CR>", opts)   -- open new tab
vim.keymap.set("n", "<leader>lx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>ln", ":tabn<CR>", opts)     --  go to next tab
vim.keymap.set("n", "<leader>lp", ":tabp<CR>", opts)     --  go to previous tab

-- Toggle
--- Line wrapping
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", opts)
--- Spellchecking
vim.keymap.set("n", "<leader>ts", function()
   vim.opt.spell = not (vim.opt.spell:get())
end, { desc = "Toggle spellchecking" })
--- Diagnostic
vim.keymap.set("n", "<leader>fd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>td", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Centering
--- Vertical scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
--- Search
vim.keymap.set("n", "<n>", "nzzzv", opts)
vim.keymap.set("n", "<N>", "Nzzzv", opts)
--- Page Up/Down
vim.keymap.set("n", "<PageDown>", "<C-d>zz", opts)
vim.keymap.set("n", "<PageUp>", "<C-u>zz", opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
   vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
   vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })

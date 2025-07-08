require("config.lazy")


--- .vim settings ---
local o = vim.opt
-- Sidebar adjustment
o.cursorline = true
o.number = true
o.relativenumber = true

-- Color/Search
o.syntax = "on"
o.hlsearch = true
o.incsearch = true
o.ignorecase = true

-- File Formatting
o.compatible = false
o.filetype = "on"
o.swapfile = false
o.autoindent = true

-- Clipboard
o.clipboard="unnamedplus"

-- Spelling
o.spell = true

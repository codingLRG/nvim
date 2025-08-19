require 'config.options'
require 'config.keymaps'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
   require 'plugins.colorscheme',
   require 'plugins.treesitter',
   require 'plugins.neo-tree',
   require 'plugins.bufferline',
   require 'plugins.statusline',
   require 'plugins.tab-assist',
   require 'plugins.startup-page',
   require 'plugins.git-signs',
   require 'plugins.autopair',
   require 'plugins.fugitive',
   require 'plugins.telescope',
   require 'plugins.hardtime',
   require 'plugins.notify',
   require 'plugins.vim-flog',
   require 'plugins.undotree',
   require 'plugins.nvim-ufo',
   require 'plugins.nvim-lspconfig',
   require 'plugins.trouble',
   require 'plugins.mason',
   require 'plugins.mason-lspconfig',
})

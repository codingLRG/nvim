-- DAP configuration
local dap = require('dap')
dap.adapters.godot = {
   type = "server",
   host = '127.0.0.1',
   port = 6006,
}

dap.configurations.gdscript = {
   {
      type = "godot",
      request = "launch",
      name = "Launch scene",
      project = "${workspaceFolder}",
      launch_scene = true,
   }
}

-- LSP Config for Godot

local lsp_flags = {
   -- This is the default in Nvim 0.7+
   debounce_text_changes = 150,
}

require 'lspconfig'.gdscript.setup {
   on_attach = on_attach,
   flags = lsp_flags,
   filetypes = { "gd", "gdscript", "gdscript3" },
}

-- Server autolistening
if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
   if vim.loop.os_uname().sysname == 'Windows_NT' then
      vim.fn.serverstart("localhost:8000")
      --      echom "Loaded Windows Godot Server Listener"
   end
end

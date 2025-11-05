-- Server listening
local port = os.getenv('GDScript_Port') or 6005
local os_name = vim.loop.os_uname().sysname
local cmd
local pipe
local server_command
if os_name == "Linux" then
   cmd = vim.lsp.rpc.connect('127.0.0.1', port)
   pipe = '/tmp/godot.pipe'
   server_command = 'echo serverstart("' .. pipe .. '")'
elseif os_name == "Darwin" then -- macOS
   -- Do macOS-specific configuration
elseif os_name == "Windows" then
   cmd = { 'ncat', '127.0.0.1', port }
   pipe = [[\\.\tmp\godot.pipe]]
   server_command = [[echo serverstart(']] .. pipe .. [[')]]
end

vim.lsp.start({
   name = 'Godot',
   cmd = cmd,
   root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
   on_attach = function(client, bufnr)
      vim.api.nvim_command(server_command)
   end
})

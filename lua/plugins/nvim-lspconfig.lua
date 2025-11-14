return {
   "neovim/nvim-lspconfig",
   dependencies = {
      'saghen/blink.cmp',
   },
   opts = {
      servers = {
         lua_ls = {
            cmd = { 'lua-language-server' },
            filetype = { 'lua' },
         },

         gdtoolkit = {
            --            cmd = { 'ncat', 'localhost', os.getenv 'GDScript_Port' or '6005' },
            filetype = { 'gd', 'gdscript', '' },
            root_makers = { { 'project.godot' }, '.git' },
         },
      }
   },
   config = function(_, opts)
      vim.diagnostic.config({
         virtual_lines = {
            current_line = true,
            virtual_text = true,
            underline = false
         },
         signs = {
            numhl = {
               [vim.diagnostic.severity.ERROR] = 'MiniTrailspace'
            },
            linehl = {
               [vim.diagnostic.severity.ERROR] = "RedrawDebugRecompose",
               [vim.diagnostic.severity.WARN]  = "DiagnosticWarnLn",
               [vim.diagnostic.severity.INFO]  = "DiagnosticInfoLn",
               [vim.diagnostic.severity.HINT]  = "DiagnosticHintLn",
            },
            text = {
               [vim.diagnostic.severity.ERROR] = "󱓈",
               [vim.diagnostic.severity.WARN] = "",
               [vim.diagnostic.severity.INFO] = "",
               [vim.diagnostic.severity.HINT] = "󰅏"
            },
         },
      })
      -- DEPRICATED
      --
      -- local lspconfig = require('lspconfig')
      -- for server, config in pairs(opts.servers) do
      --    config.capabilities = require('blink.cmp').get_lsp_capabilities()
      --    lspconfig[server].setup(config)
      -- end
      local new_lspconfig = vim.lsp
      for server, config in pairs(opts.servers) do
         config.capabilities = require('blink.cmp').get_lsp_capabilities()
         new_lspconfig.config[server] = config
         new_lspconfig.enable(server)
      end
      -- Connecting servers for lsp
      if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
         local addr = './godot.pipe'
         if vim.fn.has 'win32' == 1 then
            addr = "localhost:6004"
         end
         vim.fn.serverstart(addr)
      end
   end,
}

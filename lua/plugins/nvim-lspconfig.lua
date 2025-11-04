return {
   "neovim/nvim-lspconfig",
   dependencies = {
      'saghen/blink.cmp',
   },
   opts = {
      servers = {
         lua_ls = {},
         --         gdtoolkit = {
         --            cmd = { "ncat", "localhost", "6005" },
         --         },
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
   end,
}

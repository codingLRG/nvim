return{
   "neovim/nvim-lspconfig",
   dependencies = {
      'saghen/blink.cmp',
   },
   opts = {
       servers = {
         lua_ls = {}
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
       local lspconfig = require('lspconfig')
       for server, config in pairs(opts.servers) do
          config.capabilities = require('blink.cmp').get_lsp_capabilities()
          lspconfig[server].setup(config)
       end

       local capabilities = require('blink.cmp').get_lsp_capabilities()
       require("lspconfig").lua_ls.setup { capabilities = capabilities }
    end,
 }

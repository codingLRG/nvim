return{
   "neovim/nvim-lspconfig",
   config = function()
      vim.diagnostic.config({
         virtual_lines = {
            current_line = true,
            virtual_text = true
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
   end,
}

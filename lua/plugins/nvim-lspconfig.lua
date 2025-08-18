return{
   "neovim/nvim-lspconfig",
   config = function()
      require('lspconfig').lua_ls.setup{}
      --      require('lspconfig').gdscript.setup(capabilities)
      vim.diagnostic.config({
          virtual_text = false,
          signs = true,
          float = { border = "single" },
       })
    end,
 }

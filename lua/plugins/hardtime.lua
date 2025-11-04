return {
   "m4xshen/hardtime.nvim",
   lazy = false,
   dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
   opts = {
      disabled_keys = {
         ["<Up>"] = false,
         ["<Down>"] = false,
         ["<Left>"] = false,
         ["<Right>"] = false,
      },
   },
}

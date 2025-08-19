return{
   "mfussenegger/nvim-lint",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
         lua = {"ast-grep"},
         gd = {"gdtoolkit"},
      }
   end
}

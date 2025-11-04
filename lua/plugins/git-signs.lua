return {
   "lewis6991/gitsigns.nvim",
   config = function()
      -- for use of remapping
      local opts = { noremap = true, silent = true }
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
      vim.keymap.set("n", "<leader>tg", ":Gitsigns setqflist all<CR>", opts)
      vim.keymap.set('n', ']c', ":Gitsigns next_hunk<CR> :Gitsigns preview_hunk<CR>", opts)
      vim.keymap.set('n', '[c', ":Gitsigns prev_hunk<CR> :Gitsigns preview_hunk<CR>", opts)
   end
}

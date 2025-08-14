return{
   "nvim-telescope/telescope.nvim",
   dependencies = { 'nvim-lua/plenary.nvim'},
   config = function()
      vim.keymap.set('n', '<leader>fd',require('telescope.builtin').find_files)
   end
}

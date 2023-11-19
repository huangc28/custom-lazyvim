return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    config = function()
      vim.opt.backup = false
      vim.opt.writebackup = false
      vim.opt.updatetime = 300
      vim.opt.signcolumn = "yes"
    end,
  },
}

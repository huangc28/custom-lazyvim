-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.fn.has("autocmd") == 1 then
  local styles_group = vim.api.nvim_create_augroup("indent", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = styles_group,
    pattern = "go",
    callback = function()
      vim.opt_local.expandtab = false
      vim.opt_local.tabstop = 8
      vim.opt_local.shiftwidth = 8
      vim.opt_local.softtabstop = 8
    end,
  })
end

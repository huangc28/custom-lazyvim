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

  -- Set commentstring for Solidity files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "solidity",
    command = "setlocal commentstring=//\\ %s",
  })

  -- Trimout trailing white space when buffer is saved to a file
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      local save_cursor = vim.api.nvim_win_get_cursor(0)
      vim.cmd([[ %s/\s\+$//e ]])
      vim.api.nvim_win_set_cursor(0, save_cursor)
    end,
  })
end

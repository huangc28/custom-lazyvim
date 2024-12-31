-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- kulala http filetype
vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})

-- disable blink and switch back to nvim-cmp
vim.g.lazyvim_cmp = "nvim-cmp"

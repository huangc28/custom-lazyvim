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

-- use pyright (default) or "basedpyright" / "ruff_lsp"
vim.g.lazyvim_python_lsp = "pyright"

-- Disable LazyVim's default LSP servers since we configure them manually
-- vim.g.lazyvim_eslint_auto_setup = false

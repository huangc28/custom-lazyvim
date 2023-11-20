-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "P", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", ":bnext<CR>", { noremap = true, silent = true })

-- lsp-zero bindings
--local lsp_zero = require("lsp-zero")
--
--lsp_zero.on_attach(function(client, bufnr)
--  -- see :help lsp-zero-keybindings
--  -- to learn the available actions
--  lsp_zero.default_keymaps({ buffer = bufnr })
--end)
--
--local cmp = require("cmp")
--cmp.setup({
--  mapping = cmp.mapping.preset.insert({
--    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--  }),
--})
--
--require("lspconfig").gopls.setup({})

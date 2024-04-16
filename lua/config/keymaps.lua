-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "P", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":bd<CR>", { noremap = true, silent = true })

-- nvim tmux navigator
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-\\>", ":NvimTmuxNavigateLastActive<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Space>", ":NvimTmuxNavigateNext<CR>", { noremap = true, silent = true })

-- telescope

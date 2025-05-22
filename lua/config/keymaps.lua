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

--- kulala
vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<CR>",
      "<cmd>lua require('kulala').run()<cr>",
      { noremap = true, silent = true, desc = "Execute the request" }
    )
  end,
})

-- Copilot
-- vim.keymap.set("i", "<Tab>", function()
--   return require("copilot.suggestion").accept_or_next()
-- end, { expr = true, silent = true })

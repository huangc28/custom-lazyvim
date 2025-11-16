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

-- Override LazyVim's default gd behavior to jump directly to definition
-- This runs after LazyVim's defaults are loaded
vim.schedule(function()
  vim.keymap.set("n", "gd", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype

    -- Prefer typescript-tools in TS/JS buffers to avoid Tailwind-only locations
    local client = nil
    if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
      for _, c in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
        if c.name == "typescript-tools" then
          client = c
          break
        end
      end
    end

    local function handle_result(err, result, ctx)
      if err then
        vim.notify("LSP definition error: " .. (err.message or tostring(err)), vim.log.levels.WARN)
        return
      end
      if not result or (type(result) == "table" and vim.tbl_isempty(result)) then
        vim.notify("No definition found", vim.log.levels.INFO)
        return
      end

      local locations = result
      if not vim.tbl_islist(locations) then
        locations = { locations }
      end

      -- Jump to first location using built-in helper (handles Location / LocationLink)
      vim.lsp.util.jump_to_location(locations[1], "utf-16")

      -- If multiple results, also populate quickfix list
      if #locations > 1 then
        local items = vim.lsp.util.locations_to_items(locations, ctx and ctx.client_id or nil)
        vim.fn.setqflist(items, "r")
        vim.cmd("copen")
      end
    end

    local params = vim.lsp.util.make_position_params()

    if client then
      client.request("textDocument/definition", params, handle_result, bufnr)
    else
      -- Fallback to default behavior for non-TS buffers
      vim.lsp.buf.definition({
        on_list = function(options)
          handle_result(nil, vim.tbl_map(function(item)
            return {
              uri = vim.uri_from_fname(item.filename),
              range = {
                start = { line = (item.lnum or 1) - 1, character = (item.col or 1) - 1 },
                ["end"] = { line = (item.lnum or 1) - 1, character = (item.col or 1) - 1 },
              },
            }
          end, options.items), { client_id = options.context and options.context.client_id or nil })
        end,
      })
    end
  end, { desc = "Go to definition (TS-aware)" })
end)

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

-- Avante mode toggle helpers
local avante_helpers = require("config.avante-helpers")
vim.keymap.set("n", "<leader>aa", avante_helpers.agent, { desc = "Avante → agentic mode" })
vim.keymap.set("n", "<leader>ap", avante_helpers.plan, { desc = "Avante → legacy/planning mode" })

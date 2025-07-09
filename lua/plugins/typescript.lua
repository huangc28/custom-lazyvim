return {
  -- Enhanced TypeScript support
  {
    "jose-elias-alvarez/typescript.nvim",
    ft = { "typescript", "typescriptreact" },
    config = function()
      require("typescript").setup({
        server = {
          on_attach = function(client, bufnr)
            -- Additional TypeScript-specific keybindings
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<cr>", opts)
            vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<cr>", opts)
            vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", opts)
            vim.keymap.set("n", "<leader>cu", "<cmd>TypescriptRemoveUnused<cr>", opts)
          end,
        },
      })
    end,
  },
}

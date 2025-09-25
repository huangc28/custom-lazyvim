return {
  -- Enhanced TypeScript support
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          -- Additional TypeScript-specific keybindings
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", opts)
          vim.keymap.set("n", "<leader>cR", "<cmd>TSToolsRenameFile<cr>", opts)
          vim.keymap.set("n", "<leader>ci", "<cmd>TSToolsAddMissingImports<cr>", opts)
          vim.keymap.set("n", "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<cr>", opts)
        end,
      })
    end,
  },
}

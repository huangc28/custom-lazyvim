return {
  {
    "fatih/vim-go",
    lazy = true,
    cmd = "GoUpdateBinaries",
    ft = { "go" },
    config = function()
      vim.g.go_gopls_enabled = 1
      vim.g.go_fmt_command = "goimports"
      vim.g.go_def_mapping_enabled = 1
      vim.g.syntastic_mode_map = { mode = "active", passive_filetypes = { "go" } }

      -- Auto-format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("GoAutoFmt", { clear = true }),
        pattern = "*.go",
        command = "silent! GoFmt",
      })
    end,
  },
}

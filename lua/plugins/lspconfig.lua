return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp = require("lsp-zero")
    lsp.extend_lspconfig()

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({})
    lspconfig.gopls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.helm_ls.setup({})

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }

        -- Jumps to the definition of the symbol under the cursor.
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      end,
    })
  end,
}

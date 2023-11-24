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
  end,
}

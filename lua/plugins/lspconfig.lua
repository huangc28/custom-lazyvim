-- please refer to this reddit thread: https://www.reddit.com/r/neovim/comments/16t480s/making_goto_definition_work/
-- to integrate proper keybinding for nvim-lspconfig e.g. 'gd', 'gD'

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
    lspconfig.tailwindcss.setup({})
    lspconfig.solidity.setup({
      cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
      filetypes = { "solidity" },
      root_dir = lspconfig.util.find_git_ancestor,
      single_file_support = true,
    })

    --Enable (broadcasting) snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }

        -- Jumps to the definition of the symbol under the cursor.
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      end,
    })
  end,
}

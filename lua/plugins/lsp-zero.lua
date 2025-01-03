-- reference https://www.reddit.com/r/neovim/comments/1039iti/minimal_config_with_lazy_treesitter_lspzero/
return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    { "lukas-reineke/lsp-format.nvim", config = true },
  },
  config = function()
    local lsp = require("lsp-zero")

    lsp.on_attach(function(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
    end)
    lsp.setup()
    vim.diagnostic.config({ virtual_text = true })
  end,
}

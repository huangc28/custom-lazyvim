return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  opts = function()
    local cmp = require("cmp")

    return {
      mappings = {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      },
    }
  end,

  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
}

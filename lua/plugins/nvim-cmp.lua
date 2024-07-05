-- https://www.reddit.com/r/neovim/comments/pob6wx/setting_up_nvimcmp/
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "luasnip", option = { show_autosnippets = true } },
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "codeium" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
    })
  end,
}

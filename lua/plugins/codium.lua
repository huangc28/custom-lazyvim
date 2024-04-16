return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-cmp",
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({})
  end,
}

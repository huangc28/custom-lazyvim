return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          open = "<D-l>",
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
        },
        layout = {},
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<TAB>",
        },
      },
      panel = { enabled = true },
    })
  end,
}

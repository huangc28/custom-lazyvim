return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = false,
        auto_trigger = true,
        keymap = {
          accept = "<TAB>",
        },
      },
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
      },
    })
  end,
}

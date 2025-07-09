return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-y>",
        },
      },
      panel = {
        enabled = false,
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

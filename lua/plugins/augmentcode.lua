return {
  {
    "augmentcode/augment.vim",
    init = function()
      vim.g.augment_workspace_folders = { "~/develop/webvitals/webvitals-api" }
    end,
    keys = {
      { "<leader>ac", ":Augment chat<CR>", desc = "Send a chat message to Augment" },
      { "<leader>at", ":Augment chat-toggle<CR>", desc = "Toggle the Augment chat panel" },
      { "<leader>an", ":Augment chat-new<CR>", desc = "Create a new Augment chat" },
    },
  },
}

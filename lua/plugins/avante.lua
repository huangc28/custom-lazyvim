return {
  "yetone/avante.nvim",
  -- build the bundled Rust binary (fastest) – Windows uses a PowerShell helper
  build = function()
    if vim.fn.has("win32") == 1 then
      return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    else
      return "make BUILD_FROM_SOURCE=true"
    end
  end,
  event = "VeryLazy", -- lazy-load after UI is up
  version = false, -- keep tracking HEAD; README warns never to set "*"
  opts = {
    ---------------------------------------------------------------------------
    --  🚀  Minimum viable config
    ---------------------------------------------------------------------------
    provider = "gemini",
    web_search_engine = { provider = nil },
    providers = {
      copilot = {
        model = "claude-sonnet-4",
        timeout = 20000,
      },
      gemini = {
        -- change these only if you have a strong reason
        model = "gemini-2.5-pro", -- or "gemini-2.5-flash" for lower latency
        timeout = 300000, -- ms; raise for heavy prompts
        -- request-body overrides go here:
        extra_request_body = {
          generationConfig = { -- maps 1-to-1 to Google’s REST JSON
            temperature = 0,
            maxOutputTokens = 2048,
            topP = 0.95,
          },
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- enable ghost-text
    },
  },

  dependencies = { -- hard requirements first
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- optional niceties
    "hrsh7th/nvim-cmp", -- cmp completion for @mentions
    "stevearc/dressing.nvim", -- prettier input boxes
    "nvim-tree/nvim-web-devicons", -- icons in side-bar
  },

  keys = {
    {
      "<leader>a",
      function()
        require("avante").toggle()
      end,
      desc = "Avante Sidebar",
    },
    {
      "<M-l>",
      function()
        require("avante").suggestion.accept()
      end,
      mode = "i",
      desc = "Accept Avante Suggestion",
    },
  },
}

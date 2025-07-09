-- Avante mode toggle helpers
-- Fast toggle between agentic and legacy modes

local A = require("avante")
local cfg = { mode = "agentic" }
local legacy = { mode = "legacy" }

return {
  agent = function()
    A.setup(cfg)
    print("Avante → agentic")
  end,
  plan = function()
    A.setup(legacy)
    print("Avante → legacy")
  end,
}

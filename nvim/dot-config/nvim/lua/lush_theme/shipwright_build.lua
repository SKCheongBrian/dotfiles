-- shipwright_build.lua

local lushwright = require("shipwright.transform.lush")

run(require("lush_theme.acme"),
  -- generate lua code
  lushwright.to_lua,
  {
    patchwrite, 
    "colors/acme.lua", 
    "-- PATCH_OPEN", 
    "-- PATCH_CLOSE"
  }
)

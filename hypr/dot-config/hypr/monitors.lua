------------------
---- MONITORS ----
------------------

local laptop_output = "eDP-1"

local laptop = {
    output   = laptop_output,
    mode     = "preferred",
    position = "auto",
    scale    = 1.5,
    disabled = false,
}

-- Default monitor configuration
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto-up",
    scale    = "auto",
})

-- Laptop monitor configuration
hl.monitor(laptop)

-- Disable laptop display when lid closes
hl.bind(
    "switch:on:Lid Switch",
    function()
        hl.monitor({
            output   = laptop_output,
            disabled = true,
        })
    end,
    { locked = true }
)

-- Restore laptop display when lid opens
hl.bind(
    "switch:off:Lid Switch",
    function()
        hl.monitor(laptop)
    end,
    { locked = true }
)

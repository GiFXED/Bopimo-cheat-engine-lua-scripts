local baseAddress = 0x1812D872940 -- change the base address

local offsets = {
    0x0,         -- Offset for Address 1 (Base address)
    0x1A40,      -- Offset for Address 2
    0x1FE0,      -- Offset for Address 3
    0x53CBA280   -- Offset for Address 4
}

local healthValue = 1000000

local godModeTimer = nil

local function enableGodMode()
    if godModeTimer == nil then
        godModeTimer = createTimer()
        godModeTimer.Interval = 10
        godModeTimer.OnTimer = function()
            for _, offset in ipairs(offsets) do
                local address = baseAddress + offset
                writeDouble(address, healthValue)
            end
        end
        print("God Mode Enabled")
    end
end

local function disableGodMode()
    if godModeTimer ~= nil then
        godModeTimer.destroy()
        godModeTimer = nil
        print("God Mode Disabled")
    end
end

enableGodMode()

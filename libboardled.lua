local pin = 4 -- gpio pin
gpio.mode( pin, gpio.OUTPUT )

local M={}
local state_on = false
local function off()
    gpio.write( pin, gpio.LOW )
    state_on = false
end

M.off = off

local function on()
    gpio.write( pin, gpio.HIGH )
    state_on = true
end

M.on = on

M.toggle=function()
    --print(state_on)
    if state_on then
        off()
    else
        on()
    end
end

return M

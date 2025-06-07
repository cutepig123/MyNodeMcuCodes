

local M={}

local l_pin = 4 -- gpio pin

M.open = function(pin)
	l_pin = pin
	gpio.mode( l_pin, gpio.OUTPUT )
end



local state_on = false
local function off()
    gpio.write( l_pin, gpio.LOW )
    state_on = false
end

M.off = off

local function on()
    gpio.write( l_pin, gpio.HIGH )
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

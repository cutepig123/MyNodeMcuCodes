-- it seems cannot  use a nested timer

local function setuptimer(callback)
    local time1 = tmr.create() 
    time1:alarm(1000, tmr.ALARM_AUTO, callback)
    return time1
end

local M = {}
M.init = setuptimer
return M
 --[[
local timer = require('libtimer')
timer.init(callback)
]]

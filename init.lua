local timer = require('libtimer')
local measureDht = require('libdht')
local led = require('libled')
local hcsr04 = require('libhcsr04')

timer.init(function () 
    local dhtResult = measureDht()
    print('temp', dhtResult.temp, 'humi', dhtResult.humi)
    local temp_str = 'temp' .. dhtResult.temp .. 'humi' .. dhtResult.humi
    
    local dist = hcsr04.measure()
    local dist_str = 'dist' .. dist
    print('dist', dist)

    led.draw({temp_str, dist_str})

end)

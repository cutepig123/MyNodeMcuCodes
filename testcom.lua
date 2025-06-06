
-- Configure serial port
uart.setup(0, 115200, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)

local DEFAULT_LED_PIN = 4

-- Function to handle received serial data
function handleSerialData(data)
    local pin = string.match(data, "^gpiotrigger%s*(%d*)%s*$")
 
    pin = (pin == "" or pin == nil) and DEFAULT_LED_PIN or tonumber(pin)
    

    if pin >= 0 and pin <= 16 then

        gpio.mode(pin, gpio.OUTPUT)

        gpio.write(pin, gpio.HIGH)
        tmr.create():alarm(1, tmr.ALARM_SINGLE, function()
            gpio.write(pin, gpio.LOW)
            print("trigger GPIO"..pin.." (1ms hi)")
        end)
    else
        print("invalid GPIO  "..pin)
    end
end

uart.on("data", "\n", handleSerialData, 0)

print("wait GPIO trigger...")
print("format: 'gpiotrigger x'")

--[[
// Clears the trigPin
digitalWrite(trigPin, LOW);
delayMicroseconds(2);

// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);

// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);

// Calculating the distance
distance= duration*0.034/2;
// Prints the distance on the Serial Monitor
Serial.print("Distance: ");
Serial.println(distance);
delay(2000);
]]

local trigPin = 7
local echoPin = 6
local LOW = gpio.LOW
local HIGH = gpio.HIGH

local function digitalWrite(pin, value)
    --gpio.mode( pin, gpio.OUTPUT )
    gpio.write( pin, value )
end

local function delayMicroseconds(ms)
    tmr.delay(ms)
end

local function pulseIn(pin)
    gpio.mode( pin, gpio.INPUT )
    while gpio.read( pin ) ~= HIGH do
        tmr.delay(1)
    end

    local t1 = tmr.now()
    while gpio.read( pin ) == HIGH do
        tmr.delay(1)
    end
    local t2 = tmr.now()

    return t2-t1
end

local function measure()
    --// Clears the trigPin
    gpio.mode( trigPin, gpio.OUTPUT )
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);

    --// Sets the trigPin on HIGH state for 10 micro seconds
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);

    --// Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin);
    --print('duration', duration)

    --// Calculating the distance
    --distance= duration * 0.034/2.0;
    --// Prints the distance on the Serial Monitor
    --print("Distance: ", distance);
    --print('duration', duration, 'distance is', duration / 58, 'cm')
    local dist = duration / 58
    return dist
end

local M = {}
M.measure = measure
return M

--[[
    local measure_dist_cm = require('libhcsr04')
    local dist = measure_dist_cm()
    print('dist', dist)
]]

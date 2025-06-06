pin = 4
-- set pin index 1 as pwm output, frequency is 50Hz, 
pwm.setup(pin, 50, 1024*3/40)
pwm.start(pin)

-- Position 0
-- 20ms cycle, High duration is 20ms * 7.5% = 1.5ms
for i=1,2,0.1 do
    pwm.setduty(pin, 1024*i/20)
    print(tmr.now())
    tmr.delay(1000000)
end

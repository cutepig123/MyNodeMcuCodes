print('test dht')
Temp_Humi_Pin = 5
time1 = tmr.create() 

function Acquire_Data()
   status,temp,humi,temp_dec,humi_dec = dht.read11(Temp_Humi_Pin)
   print("temp:"..temp,"  humi:"..humi) 
end


Acquire_Data()    
time1:alarm(1500, tmr.ALARM_AUTO, Acquire_Data)

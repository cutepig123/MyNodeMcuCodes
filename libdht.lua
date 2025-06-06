local Temp_Humi_Pin = 5   

local function Acquire_Data()
   status,temp,humi,temp_dec,humi_dec = dht.read11(Temp_Humi_Pin)
   return {temp = temp, humi=humi}
end

return Acquire_Data

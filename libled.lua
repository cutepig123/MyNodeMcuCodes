local function oled()
    -- �ܽŶ���
    local sda = 2 
    local scl = 1
    local sla = 0x3c  
    local disp
    -- ��ʼ��
    local function init_oled()
        -- iic���� �� oled��ʼ��
        i2c.setup(0, sda, scl, i2c.SLOW)
        disp = u8g2.ssd1306_i2c_128x64_noname(0, sla)
        -- ��������
        disp:setFont(u8g2.font_unifont_t_symbols)
        disp:setFontRefHeightExtendedText()
        --disp:setDrawColor(2)
        disp:setFontPosTop()
        --disp:setFontDirection(0)
        -- ���߿�
        disp:drawFrame(0, 0, 128, 64)
    end
    -- ��ʾ����
    local function oled_show_msg()
        -- ������ʾ����
        disp:drawStr(0, 0,  "1 Hello OLED")
        disp:drawStr(0, 16, "1234567890123456789")
        disp:drawStr(0, 32, "Li Jing Jing")
        disp:drawStr(0, 48, "He Jin Shou")
        -- �����ݷ��͵�oled
        disp:sendBuffer()
    end
    
    local function draw(msgs)
        disp:clearBuffer();
        for i=1,#msgs do
            disp:drawStr(0, (i-1)*16,  msgs[i])
        end
        disp:sendBuffer()
    end

    init_oled()
    for k, v in pairs(getmetatable(disp)) do
        print(k, v)
    end

    return {draw=draw}
end

local M = oled()
return M
--[[
local led = require('libled')
led.draw({array of string})
]]

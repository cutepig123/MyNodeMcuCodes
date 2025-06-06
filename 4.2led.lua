function oled()
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
    
local function create_display_main()
    local myoled = oled()
    local msgs = {"1 Hello OLED", "1234567890123456789", "Li Jing Jing", "He Jin Shou"}
    local i = 1
    local function display_main()
        print(i)
        
        myoled.draw({msgs[i], msgs[(i%4) + 1]})

        i = (i%4) + 1
    end
    return display_main
end

local function setuptimer(callback)
    local time1 = tmr.create() 
    time1:alarm(2000, tmr.ALARM_AUTO, callback)
    return time1
end

local callback = create_display_main()
setuptimer(callback)

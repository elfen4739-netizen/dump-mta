-- ByteRevenant
-- LuaQ 5.1 structured decompile

convertToTimestamp = function(arg1)
    if not string.match(arg1, "^%d%d%.%d%d%.%d%d %d%d:%d%d$") then
        return nil
    end
    if tonumber(value_1) and tonumber(value_2) and tonumber(value_3) and tonumber(value_4) then
        local value_1, value_2, value_3, value_4, value_5 = string.match(arg1, "(%d%d)%.(%d%d)%.(%d%d) (%d%d):(%d%d)")
    end
    return nil
    end

    if 59 < tonumber(value_5) then
        return nil
    end
    if tonumber(value_3) % 4 == 0 then
        if tonumber(value_3) % 100 == 0 then
            local value_1, value_2, value_3, value_4, value_5 = string.match(arg1, "(%d%d)%.(%d%d)%.(%d%d) (%d%d):(%d%d)")
            local var = {
                31,
                28,
                31,
                30,
                31,
                30,
                31,
                31,
                30,
                31,
                30,
                31,
            }
            local var_6 = 30
            local var_7 = 31
            local var_8 = 31
            local var_9 = 30
            local var_10 = 31
            local var_11 = 30
            local var_12 = 31
        end
        local value_1, value_2, value_3, value_4, value_5 = string.match(arg1, "(%d%d)%.(%d%d)%.(%d%d) (%d%d):(%d%d)")
        local var = {
            31,
            28,
            31,
            30,
            31,
            30,
            31,
            31,
            30,
            31,
            30,
            31,
            [2] = 29,
        }
        local var_6 = 30
        local var_7 = 31
        local var_8 = 31
        local var_9 = 30
        local var_10 = 31
        local var_11 = 30
        local var_12 = 31
    end
    if nil[tonumber(value_2)] < tonumber(value_1) then
        return nil
    end
    local var = {
        year = 2000 + tonumber(value_3),
        month = tonumber(value_2),
        day = tonumber(value_1),
        hour = tonumber(value_4),
        min = tonumber(value_5),
        sec = 0,
    }
    return os.time(var) + os.time() - os.time(os.date("!*t")) + 10800
end

plateFixup = function(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local utf8 = data and data.utf8
    local upper = data and data.upper
    local gsub = data and data.gsub
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

EXCHANGE_RATE = 1000
CATEGORY_DEFAULT = 1
CATEGORY_SPECIAL = 2
PRODUCT_ITEM = 1
PRODUCT_VINYL = 2
PRODUCT_WHEELS = 3
PRODUCT_VEHICLE = 4
PRODUCT_FRAME = 5

isNaN = function(arg1)
    if arg1 == arg1 then
    end
    return true
end

splitWithPoints = function(arg1, arg2)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or nil))
    local tostring = data and data.tostring
    local string = data and data.string
    local gsub = data and data.gsub
end

getWordCase = function(arg1, arg2, arg3, arg4)
    if not tonumber(arg1) then
        return ""
    end
    if type(arg2) ~= "string" then
        local var = ""
    end
    if type(arg3) ~= "string" then
        local var = ""
    end
    if type(arg4) ~= "string" then
        local var = ""
    end
    if arg1 % 10 == 1 then
        if arg1 % 100 ~= 11 then
            return arg2
        end
    end
    if 2 <= arg1 % 10 then
        if arg1 % 10 <= 4 then
            if arg1 % 100 < 12 then
                return arg3
            end
            if 14 < arg1 % 100 then
                return arg3
            end
        end
    end
    return arg4
end

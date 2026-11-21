-- ByteRevenant
-- LuaQ 5.1 structured decompile

extendTable = function(arg1, arg2)
    for k, v in pairs(arg2) do
        arg1[k] = v
    end
end

copyTable = function(arg1, arg2)
    for k, v in pairs(arg1) do
        if arg2 then
            if type(v) == "table" then
            end
            var[k] = v
        end
        var[k] = v
    end
    return setmetatable, var, getmetatable(arg1)
end

reverseTable = function(arg1)
end

figma = function(arg1)
    return arg1 * 0.70999999999999996
end

convertSecondToDate = function(arg1)
    if not arg1 then
        return 0, 0, 0
    end
    return math.floor(arg1 / 86400), math.floor((arg1 - math.floor(arg1 / 86400) * 86400) / 3600), math.floor((arg1 - math.floor(arg1 / 86400) * 86400 - math.floor((arg1 - math.floor(arg1 / 86400) * 86400) / 3600) * 3600) / 60)
end

isBusinessRunning = function()
    if getResourceFromName("province_business") then
    end
    return false
end

isMenuRunning = function()
    if getResourceFromName("province_menu") then
    end
    return false
end

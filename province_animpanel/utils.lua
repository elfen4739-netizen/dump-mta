-- ByteRevenant
-- LuaQ 5.1 structured decompile

isEvent = function(arg1, arg2, arg3)
    if type(arg1) == "string" then
        if isElement(arg2) then
            if type(arg3) == "function" then
                if type(getEventHandlers(arg1, arg2)) == "table" then
                    if 0 < #getEventHandlers(arg1, arg2) then
                        for k, v in ipairs(getEventHandlers(arg1, arg2)) do
                            if v == arg3 then
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

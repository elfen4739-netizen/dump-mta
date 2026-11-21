-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}

local function var_1(arg1)
    if var[arg1] then
        if var[arg1].callback then
            var[arg1].callback()
        end
    end
    var[arg1] = nil
    if not arg1 then
        return
    end
    if not isTimer(arg1) then
        return
    end
    killTimer(arg1)
end

local function var_2()
    outputDebugString("[ERROR] forAsyncIter invalid sourceTimer element", 1)
    var_1(sourceTimer)
    setTimerPaused(sourceTimer, true)
    if var[sourceTimer] then
        if not next(var[sourceTimer]) then
            var_1(sourceTimer)
        end
    end
    if var[sourceTimer].table then
        if next(var[sourceTimer].table) then
            for k, v in pairs(var[sourceTimer].table) do
                if var[sourceTimer].onIter then
                    var[sourceTimer].onIter(k, v)
                    local var_2 = var[sourceTimer]
                end
            end
        end
    end
    if nil then
        if next(var) then
            for k, v in pairs({}) do
                var[sourceTimer].table[v] = nil
            end
        end
    end
    var_1(sourceTimer)
    setTimerPaused(sourceTimer, false)
end

forAsync = function(arg1, arg2)
    if arg2 then
    end
    return outputDebugString("[ERROR] forAsync not found tArgs table", 1)
    end

    if arg2.table then
    end
    return outputDebugString("[ERROR] forAsync not found iteration table", 1)
    end
    var = var
    if not setTimer(var_2, 100, 0) then
        return
    end
    if not isTimer(setTimer(var_2, 100, 0)) then
        return
    end
    var[setTimer(var_2, 100, 0)] = arg2
end

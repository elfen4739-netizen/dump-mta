-- ByteRevenant
-- LuaQ 5.1 structured decompile

table.copy = function(arg1)
    local var = {}
    for k, v in pairs(arg1) do
        var[k] = v
    end
    return var
end

local var = {
    [0] = { 4, 6 },
    [1] = { 3, 5 },
    [2] = { 2, 4 },
    [3] = { 1, 3 },
}
local var_1 = {
    [0] = { 500, 1000 },
    [1] = { 500, 1000 },
    [2] = { 1000, 1500 },
    [3] = { 1500, 2000 },
}
local var_2 = {
    [0] = { 1 },
    [1] = { 1 },
    [2] = { 2 },
    [3] = { 3 },
}
local lockClient = {}
local tripClient = {
    [nil.vehicle_left] = {
        id = nil.vehicle_left,
        delay =         function()
            return math.random(3, var[getCurrentStage()][2]) * 1000
        end,
        intervalSpam =         function()
            return math.random(var[getCurrentStage()][1], var[getCurrentStage()][2]) * 1000
        end,
        pressTime =         function()
            return math.random(var_1[getCurrentStage()][1], var_1[getCurrentStage()][2])
        end,
        countSpam =         function()
            return math.random(1, var_2[getCurrentStage()][1])
        end,
        condition =         function(arg1)
            if arg1 then
                setPedControlState(localPlayer, "vehicle_right", false)
            end
            setPedControlState(localPlayer, "vehicle_left", arg1)
        end,
    },
    [nil.vehicle_right] = {
        id = nil.vehicle_right,
        delay =         function()
            return math.random(3, 6) * 1000
        end,
        intervalSpam =         function()
            return math.random(var[getCurrentStage()][1], var[getCurrentStage()][2]) * 1000
        end,
        pressTime =         function()
            return math.random(var_1[getCurrentStage()][1], var_1[getCurrentStage()][2])
        end,
        countSpam =         function()
            return math.random(1, var_2[getCurrentStage()][1])
        end,
        condition =         function(arg1)
            if arg1 then
                setPedControlState(localPlayer, "vehicle_left", false)
            end
            setPedControlState(localPlayer, "vehicle_right", arg1)
        end,
    },
}

generationHindrance = function()
    checkCanHindrance()
end

getVehicleSpeed = function(arg1)
    if not isElement(arg1) then
        return 0
    end
    if value_1 * value_1 + value_2 * value_2 + value_3 * value_3 ~= 0 then
        local var = 180 * math.sqrt(value_1 * value_1 + value_2 * value_2 + value_3 * value_3)
    end
    if math.abs(value_1 * value_1 + value_2 * value_2 + value_3 * value_3) then
        return math.abs(value_1 * value_1 + value_2 * value_2 + value_3 * value_3)
    end
    return 0
end

local flag = false

checkCanHindrance = function()
    if isTimer(flag) then
        killTimer(flag)
    end
    if not next((lockClient or {})) then
        flag = false
        return
    end
    flag = setTimer(tickHindrance, 100, 0)
end

tickHindrance = function()
    if not getPedOccupiedVehicle(localPlayer) then
        return
    end
    if getVehicleSpeed(getPedOccupiedVehicle(localPlayer)) >= 5 then
    end
    local var = getTickCount()
    local flag = true
    local function sub_1001(arg1, arg2)
        arg2.lastTick = getTickCount()
        if flag then
            if not arg2.pressed then
                return
            end
            arg2.condition(false)
            local var = var - arg2.lastTick
        end
        if not arg2.isActived then
            arg2.delay = arg2.delay - var - arg2.lastTick
            if arg2.delay > 0 then
                return
            end
            arg2.isActived = true
            arg2.pressed = true
            arg2.condition(true)
            local var = var - arg2.lastTick
        end
        if 0 <= arg2.countSpam then
            if tonumber(arg2.intervalCondition) then
                arg2.intervalCondition = arg2.intervalCondition - var - arg2.lastTick
                if arg2.intervalCondition <= 0 then
                    arg2.intervalSpam = tripClient[arg2.id].intervalSpam()
                    arg2.condition(false)
                    arg2.pressed = false
                    arg2.intervalCondition = false
                    local var = var - arg2.lastTick
                end
                arg2.pressed = true
                arg2.condition(true)
                local var = var - arg2.lastTick
            end
            arg2.intervalSpam = arg2.intervalSpam - var - arg2.lastTick
            if arg2.intervalSpam > 0 then
                return
            end
            arg2.countSpam = arg2.countSpam - 1
            arg2.condition(true)
            arg2.pressed = true
            arg2.intervalCondition = arg2.pressTime
        end
        arg2.condition(false)
        table.remove(lockClient, arg1)
    end
    foreach(lockClient, sub_1001)
    if next(lockClient) then
        return
    end
    if select(1, getPlayerIntoxication()) <= 0 then
        return
    end
    generationHindrance()
end

destroyHindrance = function()
    if flag then
        if isTimer(flag) then
            killTimer(flag)
        end
    end
    lockClient = {}
end

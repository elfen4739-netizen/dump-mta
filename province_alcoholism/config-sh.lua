-- ByteRevenant
-- LuaQ 5.1 structured decompile

TIME_TICK_INTOXICATION = 1000
TIME_TICK_VOMIT = 5000
TIME_TICK_DROP_PLAYER = 3000
TIME_STAND_TIME = 10000
LIMIT_ENTER_ALCOHOL_TIME = 300
WALKING_STYLE = 126
ONE_HOUR = 3600
RESET_LAST_DRINK_TIME = ONE_HOUR * 1000
tControlTable = {
    "forwards",
    "backwards",
    "left",
    "right",
    "jump",
    "sprint",
    "crouch",
    "walk",
    "enter_exit",
}
tToggle = { "sprint", "jump", "crouch" }
local var = { 15, 30, 60 }

getIntoxicationStages = function(arg1)
    for k, v in ipairs(var) do
        if v <= arg1 then
        end
        local var = 0
    end
    return 0
end

AlcoholAttributes = nil

getAlcoholAttributes = function(arg1)
    if AlcoholAttributes then
    end
    return false
end

isInventoryRunning = function()
    if getResourceFromName("province_inventory") then
    end
    return false
end

foreach = function(arg1, arg2)
    for k, v in pairs(arg1) do
        arg2(k, v)
    end
end

getNearPlayers = function(arg1, arg2)
    if not isElement(arg1) then
        return {}
    end
    return getElementsWithinRange(value_1, value_2, value_3 + 0.5, (arg2 or 300), "player", getElementInterior(arg1), getElementDimension(arg1))
end

table.deepcopy = function(arg1)
    local var = {}
    for k, v in pairs(arg1) do
        if type(v) == "table" then
            var[k] = table.deepcopy(v)
        end
        var[k] = v
    end
    return var
end

math.round = function(arg1, arg2, arg3)
    if not arg2 then
        local var = 0
    end
    if arg3 ~= "ceil" then
        local var = 10 ^ arg2
    end
    return math[arg3](arg1 * 10 ^ arg2) / 10 ^ arg2
end

generateRandomNumber = function(arg1, arg2)
    return math.round(arg1 + math.random() * (arg2 - arg1), 2, "floor")
end

getTimestamp = function(arg1)
    return getRealTime(arg1).timestamp
end

getTimeAtTimestamp = function(arg1)
    return string.format("%02d:%02d", getRealTime(arg1).hour, getRealTime(arg1).minute)
end

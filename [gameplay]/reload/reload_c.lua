-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {
    "TASK_SIMPLE_IN_AIR",
    "TASK_SIMPLE_JUMP",
    "TASK_SIMPLE_LAND",
    "TASK_SIMPLE_GO_TO_POINT",
    "TASK_SIMPLE_NAMED_ANIM",
    "TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE",
    "TASK_SIMPLE_CAR_GET_IN",
    "TASK_SIMPLE_CLIMB",
    "TASK_SIMPLE_SWIM",
    "TASK_SIMPLE_HIT_HEAD",
    "TASK_SIMPLE_FALL",
    "TASK_SIMPLE_GET_UP",
}

local function var_1()
    for k, v in ipairs(var) do
        if getPedSimplestTask(localPlayer) == v then
            return
        end
    end
    triggerServerEvent("relWep", resourceRoot)
end

local function sub_1001()
    setTimer(var_1, 50, 1)
end

addCommandHandler("Reload weapon", sub_1001)
bindKey("r", "down", "Reload weapon")

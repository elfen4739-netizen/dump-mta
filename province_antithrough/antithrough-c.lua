-- ByteRevenant
-- LuaQ 5.1 structured decompile

if not getElementOffsetFromXYZ then
    getElementOffsetFromXYZ =     function(arg1, arg2, arg3, arg4)
        local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or nil))))
        local getElementPosition = data and data.getElementPosition
        local getElementMatrix = data and data.getElementMatrix
    end
    local var = {
        [449] = 1,
        [611] = 1,
        [604] = 1,
        [572] = 1,
        [607] = 1,
        [608] = 1,
        [485] = 1,
        [590] = 1,
        [537] = 1,
        [574] = 1,
        [476] = 1,
        [460] = 1,
        [593] = 1,
        [577] = 1,
        [583] = 1,
        [18593] = 1,
        [18603] = 1,
        [538] = 3,
        [570] = 3,
        [569] = 3,
        [594] = 3,
    }
    local function sub_1001(arg1, arg2, arg3)
        if (arg3 or getTrainSpeed(arg1)) <= 20 then
            setTrainSpeed(arg1, -0.00050000000000000001)
            local var = getTrainSpeed(arg1)
        end
        if arg3 >= 80 then
            return
        end
        if 0 >= getTrainSpeed(arg1) then
            return
        end
        if 0.00050000000000000001 < getTrainSpeed(arg1) then
        end
        setTrainSpeed(arg1, 0.00050000000000000001)
    end
end
local var = {}
local var_1 = {
    [449] = 1,
    [611] = 1,
    [604] = 1,
    [572] = 1,
    [607] = 1,
    [608] = 1,
    [485] = 1,
    [590] = 1,
    [537] = 1,
    [574] = 1,
    [476] = 1,
    [460] = 1,
    [593] = 1,
    [577] = 1,
    [583] = 1,
    [18593] = 1,
    [18603] = 1,
    [538] = 3,
    [570] = 3,
    [569] = 3,
    [594] = 3,
}

local function onClientElementStreamIn()
    if var[source] then
        return
    end
    if getElementType(source) ~= "vehicle" then
        return
    end
    if not var_1[getElementModel(source)] then
        return
    end
    var[source] = true
end

addEventHandler("onClientElementStreamIn", root, onClientElementStreamIn)

local function onClientElementStreamOut()
    if not var[source] then
        return
    end
    var[source] = nil
end

addEventHandler("onClientElementStreamOut", root, onClientElementStreamOut)

local function onClientElementDestroy()
    if not var[source] then
        return
    end
    var[source] = nil
end

addEventHandler("onClientElementDestroy", root, onClientElementDestroy)

local function onClientResourceStart()
    for k, v in ipairs(getElementsByType("vehicle", root, true)) do
        if not var[v] then
            if var_1[getElementModel(v)] then
                var[v] = true
            end
        end
    end
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

local function var_6(arg1, arg2)
    if getVehicleTowedByVehicle(arg1) then
        if getVehicleTowedByVehicle(arg1) == arg2 then
            return true
        end
        return getElementOffsetFromXYZ(getVehicleTowedByVehicle(arg1), arg2)
    end
    return false
end

local function var_7(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local getVehicleTowingVehicle = data and data.getVehicleTowingVehicle
    local getVehicleController = data and data.getVehicleController
end

local function var_8(arg1, arg2, arg3)
    if (arg3 or getTrainSpeed(arg1)) <= 20 then
        setTrainSpeed(arg1, -0.00050000000000000001)
        local var = getTrainSpeed(arg1)
    end
    if arg3 >= 80 then
        return
    end
    if 0 >= getTrainSpeed(arg1) then
        return
    end
    if 0.00050000000000000001 < getTrainSpeed(arg1) then
    end
    setTrainSpeed(arg1, 0.00050000000000000001)
end

local function var_9(arg1)
    if not getVehicleTowedByVehicle(arg1) then
        return arg1
    end
    return getVehicleTowedByVehicle(arg1)
end

local function onClientPreRender()
    if value_1 <= -1533.1610000000001 then
        if -2053.1610000000001 <= value_1 then
            if 560.96799999999996 <= value_2 then
                local var = getPedOccupiedVehicle(localPlayer)
                local var_7 = var_1[getElementModel(getPedOccupiedVehicle(localPlayer))]
            end
            local var = getPedOccupiedVehicle(localPlayer)
            local var_7 = var_1[getElementModel(getPedOccupiedVehicle(localPlayer))]
        end
        local var = getPedOccupiedVehicle(localPlayer)
        local var_7 = var_1[getElementModel(getPedOccupiedVehicle(localPlayer))]
    end
    for k, v in pairs(var) do
        if getPedOccupiedVehicle(localPlayer) ~= k then
            if var_1[getElementModel(k)] and var_1[getElementModel(k)] == var_1[getElementModel(getPedOccupiedVehicle(localPlayer))] then
                if not var_6(getPedOccupiedVehicle(localPlayer), k) then
                    if not var_7(k) then
                        if 180 < math.abs(value_12 - value_6) then
                            local var = getPedOccupiedVehicle(localPlayer)
                            local var_13 = var_1[getElementModel(getPedOccupiedVehicle(localPlayer))]
                            local var_14 = var_1[getElementModel(k)]
                            local var_15 = 360 - math.abs(value_12 - value_6)
                        end
                        if var_1[getElementModel(k)] == var_1[getElementModel(getPedOccupiedVehicle(localPlayer))] then
                            if math.abs(value_12 - value_6) <= 90 then
                                if 0 < math.abs(value_14) and math.abs(value_14) < 35 then
                                    if value_14 < 0 then
                                        if math.abs(value_13) < 4 then
                                            local var = getPedOccupiedVehicle(localPlayer)
                                            local var_16 = getDistanceBetweenPoints3D(value_7, value_8, value_9, value_1, value_2, value_3)
                                        end
                                        setTrainSpeed(getPedOccupiedVehicle(localPlayer), 1.0000000000000001e-05)
                                        local var = getPedOccupiedVehicle(localPlayer)
                                        local var_16 = getDistanceBetweenPoints3D(value_7, value_8, value_9, value_1, value_2, value_3)
                                    end
                                    if math.abs(value_13) < 4 then
                                        local var = getPedOccupiedVehicle(localPlayer)
                                        local var_16 = getDistanceBetweenPoints3D(value_7, value_8, value_9, value_1, value_2, value_3)
                                    end
                                    if value_8 > math.abs(value_13) then
                                        local var = getPedOccupiedVehicle(localPlayer)
                                        local var_16 = getDistanceBetweenPoints3D(value_7, value_8, value_9, value_1, value_2, value_3)
                                    end
                                    var_8(getPedOccupiedVehicle(localPlayer), k, getDistanceBetweenPoints3D(value_7, value_8, value_9, value_1, value_2, value_3))
                                    local var = getPedOccupiedVehicle(localPlayer)
                                end
                                local var = getPedOccupiedVehicle(localPlayer)
                            end
                            if var_9(getPedOccupiedVehicle(localPlayer)) and var_9(getPedOccupiedVehicle(localPlayer)) ~= getPedOccupiedVehicle(localPlayer) then
                                if 180 < math.abs(value_12 - value_24) then
                                    local var = getPedOccupiedVehicle(localPlayer)
                                    local var_25 = 360 - math.abs(value_12 - value_24)
                                end
                                if math.abs(value_12 - value_24) <= 90 and value_20 < 0 and -35 < value_20 then
                                    if math.abs(value_19) < 6 then
                                        local var = getPedOccupiedVehicle(localPlayer)
                                        local var_25 = getDistanceBetweenPoints3D(value_7, value_8, value_9, value_16, value_17, value_18)
                                    end
                                    if value_8 <= math.abs(value_19) then
                                        if getTrainSpeed(getPedOccupiedVehicle(localPlayer)) <= 0 and getDistanceBetweenPoints3D(value_7, value_8, value_9, value_16, value_17, value_18) <= 20 then
                                            setTrainSpeed(getPedOccupiedVehicle(localPlayer), 1.0000000000000001e-05)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

addEventHandler("onClientPreRender", root, onClientPreRender)

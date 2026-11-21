-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {
    "fire",
    "vehicle_fire",
    "aim_weapon",
    "next_weapon",
    "previous_weapon",
    "vehicle_secondary_fire",
}

local function sub_1001(arg1)
    if arg1 then
    end
    prvToggleControl(var, false)
end

local var_2 = {}
local lockClient = {}
local tripClient = { Vector3(2010.3399999999999, -1760.3320000000001, 28.291) }

local function var_5(arg1, arg2, arg3, arg4, arg5)
    if isElement(arg1) then
        if arg2 then
            if arg3 then
                if arg4 then
                    if arg5 then
                        if getDistanceBetweenPoints3D(arg2, arg3, arg4, getElementPosition(arg1)) > arg5 then
                        end
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function var_6(arg1, arg2)
    if arg1 == localPlayer then
        for k in pairs(var_2) do
            if isElement(k) then
                setElementCollidableWith(localPlayer, k, true)
            end
            var_2[k] = nil
        end
    end
    setElementCollidableWith(localPlayer, arg1, true)
end

local function onLogout()
    if localPlayer == source then
        var_6(localPlayer, true)
    end
    if not isElement(source) then
        return
    end
    if not var_2[source] then
        return
    end
    setElementCollidableWith(localPlayer, source, true)
    var_2[source] = nil
end

addEventHandler("onLogout", root, onLogout)

local function var_8(arg1, arg2)
    if arg1 == localPlayer then
        for k, v in pairs(getElementsWithinRange(value_1, value_2, value_3, 5, "player")) do
            if isElement(v) then
                setElementCollidableWith(localPlayer, v, false)
                var_2[v] = true
            end
        end
    end
    setElementCollidableWith(localPlayer, arg1, false)
end

local function onClientResourceStart()
    for k, v in pairs(tripClient) do
        if var_5(localPlayer, v.x, v.y, v.z, 3) then
            var_8(localPlayer)
            local colshape = createColSphere(v, 3)
        end
        lockClient[createColSphere(v, 3)] = k
        addEventHandler("onClientColShapeHit", createColSphere(v, 3), var_8, false)
        addEventHandler("onClientColShapeLeave", createColSphere(v, 3), var_6, false)
    end
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

-- ByteRevenant
-- LuaQ 5.1 structured decompile

addEvent("actionPoint:onClientCancel", true)
addEvent("actionPoint:onClientTrigger", true)
addEvent("actionPoint:clientOnInteractionStart", true)
addEvent("actionPoint:clientOnInteractionCancel", true)
addEvent("actionPoint:clientOnInteractionStop", true)

createActionPoint = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(createElement("actionPoint")) then
        return
    end
    setElementPosition(createElement("actionPoint"), arg1, arg2, arg3)
    local var = {
        key = arg4,
        text = arg5,
        name = name,
        serverKey = arg6,
    }
    setElementData(createElement("actionPoint"), "actionPointData", var, false)
    return createElement("actionPoint")
end

getActionPointData = function(arg1)
    if arg1 then
        if isElement(arg1) then
            return getElementData(arg1, "actionPointData", false)
        end
    end
    return false
end

setActionPointHold = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    getElementData(arg1, "actionPointData", false).holdTime = arg2
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

setActionPointKey = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    getElementData(arg1, "actionPointData", false).key = arg2
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

setActionPointText = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    getElementData(arg1, "actionPointData", false).text = arg2
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

attachActionPoints = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) then
        return
    end
    if not isElement(arg2) then
        return
    end
    if not arg3 then
        return
    end
    if not arg4 then
        return
    end
    if not arg5 then
        return
    end
    setElementParent(arg1, arg2)
    setElementData(arg1, "actionPointAttachOffset", { arg3, arg4, arg5 }, false)
end

setActionPointVisible = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if arg2 then
        setElementData(arg1, "actionPointVisible", nil, false)
    end
    setElementData(arg1, "actionPointVisible", {}, false)
end

setActionPointLineOfSight = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    getElementData(arg1, "actionPointData", false).lineOfSight = arg2
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

setActionPointMenu = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    if type(arg2) ~= "table" then
        return
    end
    if not next(arg2) then
        return
    end
    getElementData(arg1, "actionPointData", false).menu = arg2
    getElementData(arg1, "actionPointData", false).menuHeader = arg3
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

setActionPointMenuHeader = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    getElementData(arg1, "actionPointData", false).menuHeader = arg2
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

setPlayerActionText = function(arg1, arg2)
    if not arg1 then
        return
    end
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    triggerEvent("actionPoint:onClientPlayerAction", arg1, arg2)
end

setActionPointProhibited = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    getElementData(arg1, "actionPointData", false).prohibited = nil
    setElementData(arg1, "actionPointData", getElementData(arg1, "actionPointData", false), false)
end

getActionPointPosition = function(arg1)
    if isElement(arg1) then
        if getElementData(arg1, "actionPointAttachOffset", false) then
            if next(getElementData(arg1, "actionPointAttachOffset", false)) then
                if isElement(getElementParent(arg1)) then
                    local value_1, value_2, value_3 = getElementPosition(arg1)
                end
                local value_1, value_2, value_3 = getElementPosition(arg1)
            end
            local value_1, value_2, value_3 = getElementPosition(arg1)
        end
        return value_1, value_2, value_3
    end
    return false
end

createFX = function(arg1, arg2, arg3, arg4)
    setElementID(createElement("fx"), arg4)
    setElementPosition(createElement("fx"), arg1, arg2, arg3)
    triggerLatentClientEvent("onFxCreate", 50000, false, createElement("fx"))
    return createElement("fx")
end

playDefaultActionAnimation = function(arg1, arg2)
    if arg2 then
        local var = -1
    end
    setPedAnimation(arg1, "BD_FIRE", "wash_up", 600, false, false, false, false)
end

getRotatedCoordsByOffset = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or (type(arg5) == "table" and arg5 or (type(arg6) == "table" and arg6 or (type(arg7) == "table" and arg7 or nil)))))))
    local math = data and data.math
    local rad = data and data.rad
    local cos = data and data.cos
    local sin = data and data.sin
end

rotatePlayerToElement = function(arg1, arg2)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "Vector3", "getElementPosition", "math", "deg", "atan2", "setElementRotation"
end

rotatePlayersFace2Face = function(arg1, arg2)
    setElementRotation(arg2, 0, 0, (math.deg(math.atan2(Vector3(getElementPosition(arg1)).y - Vector3(getElementPosition(arg2)).y, Vector3(getElementPosition(arg1)).x - Vector3(getElementPosition(arg2)).x)) - 90) % 360)
end

getPositionFromElementOffset = function(arg1, arg2, arg3, arg4)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or nil))))
    local getElementMatrix = data and data.getElementMatrix
end

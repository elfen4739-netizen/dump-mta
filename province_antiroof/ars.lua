-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function sub_1001()
    if not getPedContactElement(localPlayer) then
        return
    end
    if getElementType(getPedContactElement(localPlayer)) ~= "vehicle" then
        return
    end
    if getVehicleType(getPedContactElement(localPlayer)) == "Train" then
        return
    end
    if getVehicleType(getPedContactElement(localPlayer)) == "Boat" then
        return
    end
    if 1 >= getElementSpeed(getPedContactElement(localPlayer)) then
        return
    end
    setElementVelocity(localPlayer, 5.5, 5.5, 0.20000000000000001)
end

setTimer(sub_1001, 500, 0)

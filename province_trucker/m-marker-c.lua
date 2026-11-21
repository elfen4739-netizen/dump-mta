-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}

create3DMarker = function(arg1, arg2)
    if not arg1 then
        return
    end
    if not arg2 then
        return
    end
    if not next(arg2) then
        return
    end
    var[arg1] = arg2
    triggerEvent("gui:createMarker", localPlayer, arg1, arg2)
end

addEvent("markerModule:addTarget", true)
addEventHandler("markerModule:addTarget", resourceRoot, create3DMarker)

destroy3DMarker = function(arg1)
    if not arg1 then
        return
    end
    var[arg1] = nil
    triggerEvent("gui:destroyMarker", localPlayer, arg1)
end

addEvent("markerModule:removeTarget", true)
addEventHandler("markerModule:removeTarget", resourceRoot, destroy3DMarker)

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

local function onClientResourceStart(arg1)
    if not arg1 then
        return
    end
    if getResourceName(arg1) ~= "province_gui" then
        return
    end
    if not var then
        return
    end
    if not next(var) then
        return
    end
    for k, v in pairs(var) do
        triggerEvent("gui:createMarker", localPlayer, k, v)
    end
end

addEventHandler("onClientResourceStart", root, onClientResourceStart)

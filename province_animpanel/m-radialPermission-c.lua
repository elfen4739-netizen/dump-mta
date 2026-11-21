-- ByteRevenant
-- LuaQ 5.1 structured decompile

addEvent("radial:updatePermission", true)
addEvent("radial:updateGroupPermission", true)
addEvent("radial:updateElementPermission", true)
addEvent("radial:updateElementGroupPermission", true)
local var = {}

radialUpdatePermission = function(arg1, arg2)
    if not arg1 then
        return
    end
    var[arg1] = nil
    triggerEvent("radial:updatePermission", localPlayer, arg1, arg2)
end

radialUpdateGroupPermission = function(arg1)
    if not arg1 then
        return
    end
    for k, v in pairs(arg1) do
        var[k] = nil
    end
    triggerEvent("radial:updateGroupPermission", localPlayer, arg1)
end

addEvent("onLogout", true)

local function onLogout()
    var = {}
end

addEventHandler("onLogout", localPlayer, onLogout)

local function onClientResourceStart(arg1)
    if getResourceName(arg1) ~= "province_radialInteraction" then
        return
    end
    local function sub_1001()
        for k, v in pairs(var) do
            var[k] = nil
        end
        triggerEvent("radial:updateGroupPermission", localPlayer, var)
        triggerEvent("radial:updateGroupPermission", localPlayer, tripClient)
    end
    setTimer(sub_1001, 2000, 1)
end

addEventHandler("onClientResourceStart", root, onClientResourceStart)

radialUpdateElementPermission = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    if not arg2 then
        return
    end
    triggerEvent("radial:updateElementPermission", arg1, arg2, arg3)
end

radialUpdateElementGroupPermission = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if type(arg2) ~= "table" then
        return
    end
    if not next(arg2) then
        return
    end
    triggerEvent("radial:updateElementGroupPermission", arg1, arg2)
end

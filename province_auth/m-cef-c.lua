-- ByteRevenant
-- LuaQ 5.1 structured decompile

IS_CEF_RUNNING = false

isCEFRunning = function()
    if getResourceFromName("province_cef") then
    end
    return false
end

local var = {}

addCEFEventHandler = function(arg1, arg2)
    if not var[arg1] then
        var[arg1] = {}
    end
    var[arg1][arg2] = true
end

removeCEFEventHandler = function(arg1, arg2)
    if not var[arg1] then
        return
    end
    var[arg1][arg2] = nil
    if next(var[arg1]) then
        return
    end
    var[arg1] = nil
end

local var_1 = {}

setCEFEventRedirect = function(arg1, arg2)
    if arg2 then
    end
    var_1[arg1] = nil
end

addEvent("cef:clientEmit")

local function sub_1001(arg1)
    if var_1[arg1] then
        triggerServerEvent("cef:serverEmit", resourceRoot, arg1)
    end
    if not var[arg1] then
        return
    end
    for k in pairs(var[arg1]) do
        k()
    end
end

addEventHandler("cef:clientEmit", root, sub_1001)

triggerCEFEvent = function(arg1)
    triggerEvent("cef:clientTrigger", localPlayer, arg1)
end

getRoute = function()
    if not isCEFRunning() then
        return
    end
    return exports.province_cef:getRoute()
end

setRoute = function(arg1)
    if not isCEFRunning() then
        return
    end
    return exports.province_cef:setRoute(arg1)
end

isActiveRoute = function(arg1)
    if not isCEFRunning() then
        return
    end
    return exports.province_cef:isActiveRoute(arg1)
end

local lockClient = {}

registerRoute = function(arg1)
    lockClient[arg1] = true
end

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

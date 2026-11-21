-- ByteRevenant
-- LuaQ 5.1 structured decompile

addEvent("controls:toggleControl", true)
local var = {}

local function var_1(arg1, arg2)
    if type(arg1) == "table" then
        for k, v in ipairs(arg1) do
            var[v] = nil
        end
    end
    var[arg1] = nil
end

prvToggleControl = function(arg1, arg2)
    if not arg1 then
        return
    end
    triggerEvent("controls:toggleControl", resourceRoot, arg1, arg2)
    var_1(arg1, arg2)
end

local function onClientResourceStart(arg1)
    for k in pairs(var) do
        table.insert(var, k)
    end
    triggerEvent("controls:toggleControl", resourceRoot, var, true)
    triggerEvent("controls:toggleControl", resourceRoot, onClientPlayerQuit, true)
end

addEventHandler("onClientResourceStart", root, onClientResourceStart)

local function onLogout()
    var = {}
end

addEventHandler("onLogout", localPlayer, onLogout)

local function onClientPlayerQuit()
    var = {}
end

addEventHandler("onClientPlayerQuit", localPlayer, onClientPlayerQuit)

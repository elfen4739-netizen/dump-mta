-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function onClientResourceStart()
    triggerServerEvent("requestLODsClient", resourceRoot)
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
addEvent("setLODsClient", true)

local function sub_1001(arg1)
    for k, v in ipairs(arg1) do
        engineSetModelLODDistance(v, 300)
    end
end

addEventHandler("setLODsClient", resourceRoot, sub_1001)

local function onClientResourceStart()
    for k, v in pairs(getElementsByType("object", resourceRoot)) do
        if getElementData(v, "breakable") then
            if getElementData(v, "breakable") ~= "true" then
            end
            setObjectBreakable(v, true)
        end
    end
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

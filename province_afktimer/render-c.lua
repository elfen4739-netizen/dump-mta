-- ByteRevenant
-- LuaQ 5.1 structured decompile

local flag = true

local function sub_1001(arg1, arg2)
    if arg2 then
        if math.floor((tonumber(arg2) or 0)) ~= 1 then
        end
        flag = true
    end
    flag = not flag
    if flag then
        outputChatBox("Отображение афк-таймеров включено.", 120, 255, 120)
    end
    outputChatBox("Отображение афк-таймеров выключено.", 120, 255, 120)
    exports.province_menu:setSettingCheckboxState(6, flag)
end

addCommandHandler("showafktimer", sub_1001)
addEvent("afktimer:showTimers")

local function sub_1002(arg1)
    if arg1 then
    end
    flag = false
end

addEventHandler("afktimer:showTimers", localPlayer, sub_1002)

local function tripClient(arg1)
    if arg1 then
    end
    flag = false
end

local function onClientResourceStart()
    if not getResourceFromName("province_menu") then
        return
    end
    if getResourceState(getResourceFromName("province_menu")) ~= "running" then
        return
    end
    tripClient(exports.province_menu:getSettingCheckboxState(6))
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
local var_6 = {}
local var_7 = 0.34999999999999998 * screenX * 0.5 * 0.5
local var_8 = 0.34999999999999998 * screenX * 0.5
addEvent("onClientPlayerStreamDataChange")

local function var_9()
    if not isElement(value_1) then
        local var = exports.province_main:getServerTime().timestamp
    end
end

local function onClientPlayerStreamDataChange(arg1, arg2, arg3)
    if arg1 ~= "afk" then
        return
    end
    if getElementType(source) ~= "player" then
        return
    end
    removeEventHandler("onClientHUDRender", root, var_9)
    if tonumber(arg3) then
    end
    var_6[source] = nil
    if not next(var_6) then
        return
    end
    addEventHandler("onClientHUDRender", root, var_9)
end

addEventHandler("onClientPlayerStreamDataChange", root, onClientPlayerStreamDataChange)

local function onClientPlayerQuit()
    removeEventHandler("onClientHUDRender", root, var_9)
    var_6[source] = nil
    if not next(var_6) then
        return
    end
    addEventHandler("onClientHUDRender", root, var_9)
end

addEventHandler("onClientPlayerQuit", root, onClientPlayerQuit)

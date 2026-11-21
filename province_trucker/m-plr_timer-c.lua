-- ByteRevenant
-- LuaQ 5.1 structured decompile

if createStaticMessage then
end
outputDebugString("Notification module is absent, resource " .. getResourceName(getThisResource()), 1)
local var = {}

local function onClientElementDestroy()
    if not var[source] then
        return
    end
    if isElement(var[source].notification) then
        destroyElement(var[source].notification)
    end
    if var[source].group then
        exports.province_notifications:clearGroup(value_1)
    end
    var[source] = nil
end

local flag = false
addEvent("plrTimer:secs", true)

local function var_2(arg1, arg2, arg3, arg4)
    if not arg1 then
        onClientElementDestroy()
    end
    mins = math.floor(arg1 / 60)
    secs = arg1 % 60
    if not var[source] then
        var[source] = {}
        if arg4 then
            if next(arg4) then
                var[source].group = arg4
            end
        end
        var[source].notification = createStaticMessage(arg2, arg3, mins, secs)
    end
    if var[source].group then
        if next(var[source].group) then
            exports.province_notifications:setGroupData(value_1, value_2, { value = string.format("%02d:%02d", mins, secs) })
        end
    end
    if flag then
        setStaticMessageTimerValue(var[source].notification, mins, secs)
    end
    var[source].mins = mins
    var[source].secs = secs
end

local function sub_1001(arg1)
    var_2(arg1)
end

addEventHandler("plrTimer:secs", resourceRoot, sub_1001)
addEvent("plrTimer:init", true)
addEventHandler("plrTimer:init", resourceRoot, var_2)
addEvent("plrTimer:updateText", true)

local function sub_1002(arg1)
    if not isElement(source) then
        return
    end
    if not var[source] then
        return
    end
    if not var[source].notification or not arg1 then
    end
    if var[source].notification then
        setStaticMessageText(var[source].notification, arg1)
    end
    if not var[source].group then
        return
    end
    exports.province_notifications:setGroupData(value_1, value_2, { value = arg1 })
end

addEventHandler("plrTimer:updateText", resourceRoot, sub_1002)
addEventHandler("onClientElementDestroy", resourceRoot, onClientElementDestroy)

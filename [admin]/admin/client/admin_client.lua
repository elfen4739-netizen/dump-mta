-- ByteRevenant
-- LuaQ 5.1 structured decompile

_root = getRootElement()
_flags = {}
_widgets = {}
_settings = nil
aWeathers = {}
_weathers_max = 0

aClientAdminMenu = function()
    if aAdminForm then
        if guiGetVisible(aAdminForm) == true then
            for k, v in pairs(_widgets) do
                if k ~= "Spectator" then
                    v.close(false)
                end
            end
            aAdminMenuClose(false)
        end
    end
    aAdminMenu()
end

addEvent("onAdminInitialize", true)
addEvent("aMessage", true)
addEvent("aClientLog", true)
addEvent("aClientSync", true)
addEvent("aClientPlayerJoin", true)
addEvent("aModdetails", true)
addEvent("aClientAdminChat", true)
addEvent("aClientResourceStart", true)
addEvent("aClientResourceStop", true)
addEvent("aClientAdminMenu", true)

aAdminResourceStart = function()
    addEventHandler("aClientAdminMenu", _root, aClientAdminMenu)
    if xmlLoadFile("conf\\weathers.xml") then
        if not xmlFindChild(xmlLoadFile("conf\\weathers.xml"), "weather", _weathers_max) then
            local var = xmlLoadFile("conf\\weathers.xml")
            local var_1 = xmlFindChild(xmlLoadFile("conf\\weathers.xml"), "weather", _weathers_max)
        end
        if 1 <= _weathers_max then
            local var = xmlLoadFile("conf\\weathers.xml")
            local var_2 = "name"
        end
        xmlUnloadFile(xmlLoadFile("conf\\weathers.xml"))
        local var_1 = "name"
    end
    aLoadSettings()
    triggerServerEvent("aPermissions", getLocalPlayer())
    guiSetInputMode("no_binds_when_editing")
end

aAdminResourceStop = function()
    showCursor(false)
end

aRegister = function(arg1, arg2, arg3, arg4)
    _widgets[arg1] = {}
    _widgets[arg1].element = arg2
    _widgets[arg1].initialize = arg3
    _widgets[arg1].close = arg4
end

aAdminDestroy = function()
    if not aAdminForm then
        return
    end
    for k, v in pairs(_widgets) do
        v.close(true)
    end
    _widgets = {}
    aAdminMenuClose(true)
end

aLoadSettings = function()
    if _settings then
        xmlUnloadFile(_settings)
    end
    _settings = xmlLoadFile("admin.xml")
    if _settings then
        return
    end
    _settings = xmlCreateFile("admin.xml", "main")
    xmlSaveFile(_settings)
end

aGetSetting = function(arg1)
    if xmlFindChild(_settings, tostring(arg1), 0) then
        if xmlNodeGetValue(xmlFindChild(_settings, tostring(arg1), 0)) == "true" then
            return true
        end
        if xmlNodeGetValue(xmlFindChild(_settings, tostring(arg1), 0)) ~= "false" then
            return xmlNodeGetValue(xmlFindChild(_settings, tostring(arg1), 0))
        end
        return false
    end
    return false
end

aSetSetting = function(arg1, arg2)
    xmlNodeSetValue((xmlFindChild(_settings, tostring(arg1), 0) or xmlCreateChild(_settings, tostring(arg1))), tostring(arg2))
    xmlSaveFile(_settings)
end

aRemoveSetting = function(arg1)
    if xmlFindChild(_settings, tostring(arg1), 0) then
        xmlDestroyNode(xmlFindChild(_settings, tostring(arg1), 0))
    end
    xmlSaveFile(_settings)
end

getWeatherNameFromID = function(arg1)
    return iif(aWeathers[arg1], aWeathers[arg1], "Unknown")
end

iif = function(arg1, arg2, arg3)
    if arg1 then
        return arg2
    end
    return arg3
end

getPlayerFromNick = function(arg1)
    for k, v in ipairs(getElementsByType("player")) do
        if getPlayerNametagText(v) == arg1 then
            return v
        end
    end
    return false
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), aAdminResourceStart)
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), aAdminResourceStop)

getRealTimeSeconds = function()
    return realTimeToSeconds(getRealTime())
end

realTimeToSeconds = function(self)
    return ((self.year - 70) * 365 + math.floor((self.year - 72 + 3) / 4) + self.yearday) * 60 * 60 * 24 + self.hour * 60 * 60 + self.minute * 60 + self.second - self.isdst * 60 * 60
end

realTimeToSecondsTest = function()
    assert(true)
end

secondsToTimeDesc = function(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local ipairs = data and data.ipairs
    local math = data and data.math
    local floor = data and data.floor
    local tostring = data and data.tostring
end

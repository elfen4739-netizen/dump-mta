-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

local function onLogout()
    guiSetInputMode("allow_binds")
    showCursor(false)
end

addEventHandler("onLogout", resourceRoot, onLogout)

local function sub_1001()
    guiSetInputMode("allow_binds")
    showCursor(false)
end

local function onClientResourceStart()
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "guiCreateWindow", "Вайтлист ссылок", "guiWindowSetSizable", "guiSetVisible", "guiCreateGridList", "guiGridListAddColumn"
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
addEvent("ac:onClientWhiteLinksLoaded", true)

local function sub_1002(arg1)
    guiSetInputMode("no_binds")
    showCursor(true)
end

addEventHandler("ac:onClientWhiteLinksLoaded", localPlayer, sub_1002)

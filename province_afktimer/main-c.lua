-- ByteRevenant
-- LuaQ 5.1 structured decompile

local state = nil

toggleLocalPlayerAFK = function(arg1)
    if arg1 == state then
        return
    end
    state = arg1
    triggerServerEvent("afktimer:toggleAFK", resourceRoot, state)
end

local state_1 = nil
local var = 60000

local function onClientKey()
    if isTimer(state_1) then
        return resetTimer(state_1)
    end
    toggleLocalPlayerAFK(false)
    state_1 = setTimer(toggleLocalPlayerAFK, var, 1, true)
end

addEventHandler("onClientKey", root, onClientKey)

local function onClientCursorMove()
    if isTimer(state_1) then
        return resetTimer(state_1)
    end
    toggleLocalPlayerAFK(false)
    state_1 = setTimer(toggleLocalPlayerAFK, var, 1, true)
end

addEventHandler("onClientCursorMove", root, onClientCursorMove)

local function onClientMinimize()
    if isTimer(state_1) then
        killTimer(state_1)
    end
    toggleLocalPlayerAFK(true)
end

addEventHandler("onClientMinimize", root, onClientMinimize)

local function var_5()
    if isTimer(state_1) then
        return resetTimer(state_1)
    end
    toggleLocalPlayerAFK(false)
    state_1 = setTimer(toggleLocalPlayerAFK, var, 1, true)
end

local function onClientRestore()
    var_5()
end

addEventHandler("onClientRestore", root, onClientRestore)

local function onClientResourceStart()
    if isMTAWindowFocused() then
        var_5()
    end
    toggleLocalPlayerAFK(true)
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

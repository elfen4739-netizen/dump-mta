-- ByteRevenant
-- LuaQ 5.1 structured decompile

addEvent("onClientFmodPlay", true)
addEvent("onClientFmodStop", true)
local var = {}

local function onClientElementInteriorChange(arg1, arg2)
    if not var[source] then
        return
    end
    for k in pairs(var[source]) do
        if isElement(k) then
            setElementInterior(k, arg2)
        end
        var[source][k] = nil
    end
end

addEventHandler("onClientElementInteriorChange", root, onClientElementInteriorChange)

local function onClientElementDimensionChange(arg1, arg2)
    if not var[source] then
        return
    end
    for k in pairs(var[source]) do
        if isElement(k) then
            setElementDimension(k, arg2)
        end
        var[source][k] = nil
    end
end

addEventHandler("onClientElementDimensionChange", root, onClientElementDimensionChange)

local function lockClient(arg1, arg2)
    for k, v in pairs(var[arg1]) do
        if v == arg2 then
            if isElement(k) then
                destroyElement(k)
            end
            var[arg1][k] = nil
        end
    end
end

local function onClientFmodStop(arg1)
    if arg1 then
        if type(arg1) == "number" then
            local var = aAudio[arg1]
        end
        if not var[source] then
            for k in pairs(var) do
                lockClient(k, arg1)
            end
        end
        lockClient(source, arg1)
    end
    for k in pairs(var[source]) do
        destroyElement(k)
    end
end

addEventHandler("onClientFmodStop", root, onClientFmodStop)

local function var_5(arg1)
    if arg1 then
        if type(arg1) == "number" then
            local var = aAudio[arg1]
        end
        if not var[source] then
            for k in pairs(var) do
                lockClient(k, arg1)
            end
        end
        lockClient(source, arg1)
    end
    for k in pairs(var[source]) do
        destroyElement(k)
    end
end

local function var_6()
    if not getElementAttachedTo(source) then
    end
    if var[getElementAttachedTo(source)] then
        var[getElementAttachedTo(source)][source] = nil
        local var = getElementAttachedTo(source)
    end
    if not var[getElementAttachedTo(source)] then
        return
    end
    if next(var[getElementAttachedTo(source)]) then
        return
    end
    var[getElementAttachedTo(source)] = nil
end

local function var_7(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    setElementInterior(arg1, arg2)
    setElementDimension(arg1, arg3)
end

local function onClientFmodPlay(arg1, arg2)
    if not arg1 then
        return
    end
    if arg2 then
        if var[source] then
            var_5(arg1)
        end
    end
    if not isElement(source) then
        return
    end
    if type(arg1) == "number" then
        local var = aAudio[arg1]
    end
    if not isElement(FMOD_playEvent(arg1)) then
        return
    end
    if not var[source] then
        var[source] = {}
        local var = FMOD_playEvent(arg1)
    end
    var[source][FMOD_playEvent(arg1)] = arg1
    addEventHandler("onClientElementDestroy", FMOD_playEvent(arg1), var_6)
    var_7(FMOD_playEvent(arg1), getElementInterior(source), getElementDimension(source))
    attachElements(FMOD_playEvent(arg1), source)
end

addEventHandler("onClientFmodPlay", root, onClientFmodPlay)

local function onClientElementDestroy()
    if not var[source] then
        return
    end
    var_5()
end

addEventHandler("onClientElementDestroy", root, onClientElementDestroy)
local var_10 = {
    "audio/Master Bank.strings.bank",
    "audio/Master Bank.bank",
    "audio/Noizes.bank",
    "audio/Vehicles.bank",
    "audio/Evrei.bank",
    "audio/Beta2.bank",
}
local flag = false

loadFMODData = function()
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "FMOD_loadBank", "iprint", "fmod bank", "outputChatBox", "setTimer", "playBetaSounds"
    if flag then
    end
    if not FMOD_loadBank(var_10[r5]) then
        outputChatBox("Ошибка загрузки банков FMOD'а")
    end
    if true then
        setTimer(playBetaSounds, 1250, 1)
    end
    outputChatBox("Ошибка загрузки банков FMOD'а")
end

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

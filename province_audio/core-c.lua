-- ByteRevenant
-- LuaQ 5.1 structured decompile

addEvent("onClientElementSound", true)
addEvent("onClientElementClearSounds", true)

local function onClientResourceStart()
    loadFMODData()
    prepareVehicleSounds()
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
addEvent("playGuiSound", true)

local function sub_1001(arg1)
    if arg1 == 1 then
        setSoundPan(playSFX("genrl", 52, 12, false), -1)
        setSoundPan(playSFX("genrl", 52, 13, false), 1)
    end
    if arg1 ~= 2 then
        return
    end
    setSoundPan(playSFX("genrl", 52, 18, false), -1)
    setSoundPan(playSFX("genrl", 52, 19, false), 1)
end

addEventHandler("playGuiSound", localPlayer, sub_1001)
local var_2 = {}

local function lockClient(arg1)
    if var_2[arg1] then
        return var_2[arg1]
    end
    return false
end

local tripClient = {}

local function var_5(arg1, arg2)
    if not lockClient(source) then
        return
    end
    for k, v in ipairs(lockClient(source)) do
        if arg2 ~= arg1 then
            if isElement(v) then
                setElementInterior(v, arg2)
            end
        end
    end
end

local function var_6(arg1, arg2)
    if not lockClient(source) then
        return
    end
    for k, v in ipairs(lockClient(source)) do
        if arg2 ~= arg1 then
            if isElement(v) then
                setElementDimension(v, arg2)
            end
        end
    end
end

local state = nil

local function var_7(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not isElement(arg2) then
        return
    end
    tripClient[arg1] = { sound = arg1, element = arg2 }
    setElementInterior(arg1, getElementInterior(arg2))
    setElementDimension(arg1, getElementDimension(arg2))
    if not var_2[arg2] then
        var_2[arg2] = {}
        addEventHandler("onClientElementInteriorChange", arg2, var_5)
        addEventHandler("onClientElementDimensionChange", arg2, var_6)
    end
    table.insert(var_2[arg2], arg1)
    attachElements(arg1, arg2)
    return true
end

createSoundOnElement = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if arg2 then
    end
    return nil
    end

    if type(arg2) == "number" then
        local onClientResourceStart = aAudio[arg2]
    end
    if playSound3D(arg2, arg1.position, arg5) then
        setElementDimension(playSound3D(arg2, arg1.position, arg5), getElementDimension(arg1))
        setElementInterior(playSound3D(arg2, arg1.position, arg5), getElementInterior(arg1))
        if tonumber(arg6) then
            setTimer(state, tonumber(arg6), 1, playSound3D(arg2, arg1.position, arg5))
            local onClientResourceStart = playSound3D(arg2, arg1.position, arg5)
        end
        setSoundMaxDistance(playSound3D(arg2, arg1.position, arg5), 1)
        setSoundVolume(playSound3D(arg2, arg1.position, arg5), 1)
        var_7(playSound3D(arg2, arg1.position, arg5), arg1)
        return playSound3D(arg2, arg1.position, arg5)
    end
    return nil
end

local function onClientElementSound(arg1, arg2, arg3, arg4, arg5)
    createSoundOnElement(source, arg1, arg2, arg3, arg4, arg5)
end

addEventHandler("onClientElementSound", root, onClientElementSound)

local function onClientElementClearSounds()
    if not var_2[source] then
        return
    end
    for k, v in ipairs(var_2[source]) do
        table.insert({}, v)
        local var_1 = {}
    end
    for k, v in ipairs({}) do
        destroyElement(v)
    end
end

addEventHandler("onClientElementClearSounds", root, onClientElementClearSounds)

local function sub_1002()
    for k, v in ipairs(lockClient(source)) do
        tripClient[v] = nil
        if isElement(v) then
            if getElementType(v) == "sound" then
                destroyElement(v)
                local onClientResourceStart = lockClient(source)
            end
            local onClientResourceStart = lockClient(source)
        end
        local onClientResourceStart = lockClient(source)
    end
    var_2[source] = nil
    removeEventHandler("onClientElementInteriorChange", source, var_5)
    removeEventHandler("onClientElementDimensionChange", source, var_6)
end

addEventHandler("onClientElementDestroy", root, sub_1002, true, "low-100")

local function onClientVehicleRespawn()
    for k, v in ipairs(lockClient(source)) do
        tripClient[v] = nil
        if isElement(v) then
            if getElementType(v) == "sound" then
                destroyElement(v)
                local onClientResourceStart = lockClient(source)
            end
            local onClientResourceStart = lockClient(source)
        end
        local onClientResourceStart = lockClient(source)
    end
    var_2[source] = nil
    removeEventHandler("onClientElementInteriorChange", source, var_5)
    removeEventHandler("onClientElementDimensionChange", source, var_6)
end

addEventHandler("onClientVehicleRespawn", root, onClientVehicleRespawn)

local function onClientVehicleExplode()
    for k, v in ipairs(lockClient(source)) do
        tripClient[v] = nil
        if isElement(v) then
            if getElementType(v) == "sound" then
                destroyElement(v)
                local onClientResourceStart = lockClient(source)
            end
            local onClientResourceStart = lockClient(source)
        end
        local onClientResourceStart = lockClient(source)
    end
    var_2[source] = nil
    removeEventHandler("onClientElementInteriorChange", source, var_5)
    removeEventHandler("onClientElementDimensionChange", source, var_6)
end

addEventHandler("onClientVehicleExplode", root, onClientVehicleExplode)

local function var_13(arg1, arg2)
    for k, v in ipairs((var_2[tripClient[arg1].element] or tripClient[arg1].element)) do
        if v == arg1 then
            local onClientResourceStart = tripClient[arg1].element
        end
        local onClientResourceStart = tripClient[arg1].element
    end
    if nil then
        table.remove(var_2[tripClient[arg1].element], nil)
        local onClientResourceStart = tripClient[arg1].element
    end
    if #var_2[tripClient[arg1].element] <= 0 then
        if isElement(tripClient[arg1].element) then
            removeEventHandler("onClientElementInteriorChange", tripClient[arg1].element, var_5)
            removeEventHandler("onClientElementDimensionChange", tripClient[arg1].element, var_6)
            local onClientResourceStart = tripClient[arg1].element
        end
        var_2[tripClient[arg1].element] = nil
    end
    destroyElement(arg1)
end

local function sub_1003(arg1)
    if arg1 then
        if arg1 == "paused" then
            return
        end
    end
    var_13(source, arg1)
end

addEventHandler("onClientElementDestroy", root, sub_1003, true, "low-100")

local function onClientSoundStopped(arg1)
    if arg1 then
        if arg1 == "paused" then
            return
        end
    end
    var_13(source, arg1)
end

addEventHandler("onClientSoundStopped", root, onClientSoundStopped)

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

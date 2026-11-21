-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}

local function onClientElementDestroy()
    if not var[source] then
        return
    end
    var[source] = nil
    if not isElement(var[source]) then
        return
    end
    destroyElement(var[source])
end

addEventHandler("onClientElementDestroy", root, onClientElementDestroy)

local function var_2()
    if not var[source] then
        return
    end
    var[source] = nil
    if not isElement(var[source]) then
        return
    end
    destroyElement(var[source])
end

local lockClient = {
    [3] = {
        rp1 = "https://radio.gtaprovince.ru:8443/listen/province_special_1/radio.mp3",
        rp2 = "https://radio.gtaprovince.ru:8443/listen/province_special_2/radio.mp3",
        rp3 = "https://radio.gtaprovince.ru:8443/listen/province_special_3/radio.mp3",
        rp4 = "https://radio.gtaprovince.ru:8443/listen/province_special_4/radio.mp3",
        rp5 = "https://radio.gtaprovince.ru:8443/listen/province_special_5/radio.mp3",
        rp6 = "https://radio.gtaprovince.ru:8443/listen/province_special_6/radio.mp3",
        rp7 = "https://radio.gtaprovince.ru:8443/listen/province_special_7/radio.mp3",
    },
    "https://radio.gtaprovince.ru:8443/listen/radio_province/radio.mp3",
}

local function onClientElementDataChange(arg1)
    if getElementType(source) ~= "vehicle" then
        return
    end
    if arg1 ~= "radio" then
        return
    end
    var_2()
    if not getElementData(source, arg1) then
        return
    end
    if not lockClient[getElementData(source, arg1)] then
        return
    end
    if type(lockClient[getElementData(source, arg1)]) == "table" then
        if not getElementData(root, "serverID") then
            return
        end
        local var = getElementData(source, arg1)
        local onClientElementDestroy = lockClient[getElementData(source, arg1)][getElementData(root, "serverID")]
    end
    if not createSoundOnElement(source, lockClient[getElementData(source, arg1)], 60) then
        return
    end
    if not isElement(createSoundOnElement(source, lockClient[getElementData(source, arg1)], 60)) then
        return
    end
    var[source] = createSoundOnElement(source, lockClient[getElementData(source, arg1)], 60)
    setSoundRadio(createSoundOnElement(source, lockClient[getElementData(source, arg1)], 60), true)
    if getElementData(source, arg1) ~= 2 then
        return
    end
    setSoundVolume(createSoundOnElement(source, lockClient[getElementData(source, arg1)], 60), 0.80000000000000004)
end

addEventHandler("onClientElementDataChange", root, onClientElementDataChange)

local function onClientResourceStart()
    for k, v in ipairs(getElementsByType("vehicle")) do
        if getElementData(v, "radio") then
            if lockClient[getElementData(v, "radio")] then
                if type(lockClient[getElementData(v, "radio")]) == "table" then
                    local var = getElementData(v, "radio")
                    local onClientElementDestroy = lockClient[getElementData(v, "radio")][getElementData(root, "serverID")]
                end
                if createSoundOnElement(v, lockClient[getElementData(v, "radio")], 60) then
                    if isElement(createSoundOnElement(v, lockClient[getElementData(v, "radio")], 60)) then
                        var[v] = createSoundOnElement(v, lockClient[getElementData(v, "radio")], 60)
                        setSoundRadio(createSoundOnElement(v, lockClient[getElementData(v, "radio")], 60), true)
                        if getElementData(v, "radio") == 2 then
                            setSoundVolume(createSoundOnElement(v, lockClient[getElementData(v, "radio")], 60), 0.80000000000000004)
                        end
                    end
                end
            end
        end
    end
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
local state = nil
local var_6 = {}

local function onClientVehicleHornStop()
    state(source)
end

local function var_8(arg1, arg2)
    if arg2 ~= 0 then
        return
    end
    if not var_6[source] then
        return
    end
    state(source)
end

addEvent("onClientVehicleHornStart", true)

local function onClientVehicleHornStart(arg1, arg2)
    onClientVehicleHornStop(source)
    if getElementModel(source) ~= 466 then
        local var = getElementModel(source)
    end
    if getElementModel(source) ~= 538 and getElementModel(source) ~= 18602 then
    end
    var_6[source] = createSoundOnElement(source, "audio/horn_loco.wav", 65, 1, true)
    addEventHandler("onClientElementDestroy", source, onClientVehicleHornStop)
    addEventHandler("onClientVehicleExit", source, var_8)
end

addEventHandler("onClientVehicleHornStart", root, onClientVehicleHornStart)
addEvent("onClientVehicleHornStop", true)
addEventHandler("onClientVehicleHornStop", root, onClientVehicleHornStop)

local function var_10(arg1, arg2)
    if arg2 then
        if getElementModel(arg1) ~= 449 and getElementModel(arg1) ~= 611 then
            local var = getElementModel(arg1)
        end
        return true
    end
    if getElementModel(arg1) ~= 449 and getElementModel(arg1) ~= 460 and getElementModel(arg1) ~= 476 and getElementModel(arg1) ~= 485 and getElementModel(arg1) ~= 537 and getElementModel(arg1) ~= 572 and getElementModel(arg1) ~= 574 and getElementModel(arg1) ~= 583 and getElementModel(arg1) ~= 593 and getElementModel(arg1) ~= 594 and getElementModel(arg1) ~= 604 and getElementModel(arg1) ~= 607 and getElementModel(arg1) ~= 608 and getElementModel(arg1) ~= 610 and getElementModel(arg1) ~= 611 then
    end
    return true
end

local function var_11(arg1)
    if getElementModel(arg1) ~= 466 and getElementModel(arg1) ~= 543 then
    end
    return true
end

local var_12 = {}
local var_13 = {}

local function var_14(self)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "Tram/TramAccelerate", "Metro/Accelerate", "getElementPosition", "FMOD_playEvent3D", "attachElements", "engine"
    if var_10(self) then
    end
    if var_11(self) then
        local var = "Metro/Accelerate"
    end
    if r1 then
        if not var_12[self] then
            var_12[self] = {}
        end
    end
    if var_10(self, true) then
        attachElements(FMOD_playEvent("Tram/TatraAccelerate"), self)
        setElementInterior(FMOD_playEvent("Tram/TatraAccelerate"), getElementInterior(self))
        setElementDimension(FMOD_playEvent("Tram/TatraAccelerate"), getElementDimension(self))
        var_12[self].engine2 = FMOD_playEvent("Tram/TatraAccelerate")
    end
end

local function onClientElementStreamIn()
    if getElementType(source) ~= "vehicle" then
        return
    end
    var_14(source)
end

addEventHandler("onClientElementStreamIn", root, onClientElementStreamIn)

local function onClientElementStreamOut()
    if getElementType(source) ~= "vehicle" then
        return
    end
    var_13[source] = nil
    if var_12[source] then
        if isElement(var_12[source].engine) then
            FMOD_stopEvent(var_12[source].engine)
        end
        if isElement(var_12[source].engine2) then
            FMOD_stopEvent(var_12[source].engine2)
        end
    end
    var_12[source] = nil
end

addEventHandler("onClientElementStreamOut", root, onClientElementStreamOut)

local function onClientElementDestroy()
    if getElementType(source) ~= "vehicle" then
        return
    end
    var_13[source] = nil
    if var_12[source] then
        if isElement(var_12[source].engine) then
            FMOD_stopEvent(var_12[source].engine)
        end
        if isElement(var_12[source].engine2) then
            FMOD_stopEvent(var_12[source].engine2)
        end
    end
    var_12[source] = nil
end

addEventHandler("onClientElementDestroy", root, onClientElementDestroy)

local function onClientPreRender()
    for k, v in pairs(var_12) do
        if isElement(k) then
            if isElementStreamedIn(k) then
                if isElement(v.engine) then
                    FMOD_setParameterEvent(v.engine, "speed", getElementSpeed(k, 1))
                    if getDistanceBetweenPoints3D(value_1, value_2, value_3, 2792.6849999999999, 2750.2809999999999, 14.456) <= 20 then
                        FMOD_setParameterEvent(v.engine, "reverb", 1 - getDistanceBetweenPoints3D(value_1, value_2, value_3, 2792.6849999999999, 2750.2809999999999, 14.456) / 20)
                        local var = getElementSpeed(k, 1)
                    end
                    local var = getElementSpeed(k, 1)
                end
                if isElement(v.engine2) then
                    if 16 < getElementSpeed(k, 1) and getElementSpeed(k, 1) < 32 then
                        local var = 16 - getElementSpeed(k, 1) - 16
                    end
                    FMOD_setParameterEvent(v.engine2, "speed", getElementSpeed(k, 1))
                end
            end
        end
    end
end

addEventHandler("onClientPreRender", root, onClientPreRender)

local function var_19()
    for k, v in pairs(var_13) do
        if isElement(k) then
            if var_12[k] then
                if isElement(var_12[k].engine) then
                    FMOD_setParameterEvent(var_12[k].engine, "rotating", 1)
                end
            end
        end
    end
end

prepareVehicleSounds = function()
    for k, v in ipairs(getElementsByType("vehicle", root, true)) do
        var_14(v)
    end
    setTimer(var_19, 160, 0)
end

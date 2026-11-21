-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function var()
    if getMemory(7169725, 1)[1] ~= -112 then
    end
    return true
end

local function var_1()
    if getMemory(4201037, 1)[1] ~= -112 then
    end
    return true
end

local function var_2()
    if getMemory(4928287, 1)[1] ~= -112 then
    end
    return true
end

local function onClientResourceStart()
    local flag = false
    local function sub_1001(arg1, arg2, arg3, arg4, arg5)
        if resource ~= arg1 then
        end
        if flag then
            return
        end
        flag = true
        local var = {
            getFileHash("mods/deathmatch/client.dll"),
            getFileTime("mods/deathmatch/client.dll"),
            getFileHash("MTA/netc.dll"),
            getFileTime("MTA/netc.dll"),
            hash3,
            hash4,
            hash5,
            { var(), var_1(), var_2() },
            true,
        }
        triggerServerEvent("radio:xnykuxcazgmqruzg", resourceRoot, var)
    end
    addDebugHook("preFunction", sub_1001, { "addDebugHook" })
    local flag_2 = false
    local function onClientResourceStart()
        flag_2 = true
        return "skip"
    end
    addDebugHook("preFunction", onClientResourceStart, { "blowVehicle" })
    blowVehicle()
    if flag_2 then
        return
    end
    triggerServerEvent("ac:bruh", resourceRoot, getPlayerSerial())
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
local state = nil

local function sub_1002()
    if isElement(getPedOccupiedVehicle(localPlayer)) then
        triggerServerEvent("ac:snd_adm_sp", resourceRoot, math.ceil(getElementSpeed(getPedOccupiedVehicle(localPlayer), 3)))
        local function sub_1003()
            -- ByteRevenant: synthetic fallback, structured recovery was partial
        end
        state = setTimer(sub_1003, 5000, 1)
        local var_1 = getPedOccupiedVehicle(localPlayer)
    end
    if not isPedWearingJetpack(localPlayer) then
        return
    end
    if isTimer(state) then
        return
    end
    triggerServerEvent("ac:snd_adm_jt", resourceRoot)
    local function sub_1004()
        -- ByteRevenant: synthetic fallback, structured recovery was partial
    end
    state = setTimer(sub_1004, 10000, 1)
end

setTimer(sub_1002, 2000, 0)

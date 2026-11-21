-- ByteRevenant
-- LuaQ 5.1 structured decompile

local flag = false

local function onLogout()
    flag = false
end

addEventHandler("onLogout", root, onLogout)
local var_1 = 0

local function sub_1001()
    if var_1 % 4 == 0 then
        if not canPedBeKnockedOffBike(localPlayer) then
            triggerServerEvent("ac:b_ch", resourceRoot)
        end
        triggerServerEvent("ac:b_ch", resourceRoot)
    end
    if var_1 % 10 == 0 then
        if not flag then
            for k, v in ipairs({ "poor", "std", "pro" }) do
                for k, v in ipairs({
                "anim_loop_start",
                "anim_loop_bullet_fire",
                "anim_loop_stop",
                "anim2_loop_start",
                "anim2_loop_bullet_fire",
                "anim2_loop_stop",
            }) do
                    if getWeaponProperty(getPedWeapon(localPlayer), v, v) then
                        if getOriginalWeaponProperty(getPedWeapon(localPlayer), v, v) then
                            if getWeaponProperty(getPedWeapon(localPlayer), v, v) < getOriginalWeaponProperty(getPedWeapon(localPlayer), v, v) then
                                flag = true
                                triggerServerEvent("ac:snd_adm_fstammo", resourceRoot, getPedWeapon(localPlayer))
                            end
                        end
                    end
                end
            end
        end
    end

end
setTimer(sub_1001, 1000, 0)

local function onClientExplosion(arg1, arg2, arg3, arg4)
    if arg4 ~= 2 then
    end
    cancelEvent(true)
end

addEventHandler("onClientExplosion", root, onClientExplosion)

local function onClientProjectileCreation(arg1)
    if 1 < getProjectileForce(source) then
        triggerServerEvent("ac:snd_prj_info", resourceRoot, arg1, getProjectileType(source), getProjectileTarget(source), getProjectileForce(source))
        local onLogout = getProjectileType(source)
    end
    if getProjectileType(source) == 17 then
        setElementPosition(source, 5000, 5000, -999)
        destroyElement(source)
        local onLogout = getProjectileType(source)
    end
    if getProjectileType(source) == 39 then
        triggerServerEvent("skybox:checkRainUpdate", localPlayer)
        setElementPosition(source, 5000, 5000, -999)
        destroyElement(source)
        local onLogout = getProjectileType(source)
    end
    if getProjectileType(source) ~= 19 and getProjectileType(source) ~= 20 then
    end
    setElementPosition(source, 5000, 5000, -999)
    destroyElement(source)
    if getElementType(arg1) ~= "player" then
        return
    end
    if arg1 ~= localPlayer then
        return
    end
    triggerServerEvent("ac:b_rckt", resourceRoot)
end

addEventHandler("onClientProjectileCreation", root, onClientProjectileCreation)

local function onClientPlayerDamage(arg1, arg2, arg3, arg4)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or nil))))
    local localPlayer = data and data.localPlayer
end

addEventHandler("onClientPlayerDamage", localPlayer, onClientPlayerDamage)

local function onClientVehicleDamage(arg1, arg2, arg3)
    if not arg2 then
        return
    end
    if 0 <= arg2 then
    end
    if arg2 ~= 14 and arg2 ~= 15 and arg2 ~= 16 and arg2 ~= 17 and arg2 ~= 18 and arg2 ~= 19 and arg2 ~= 35 and arg2 ~= 36 and arg2 ~= 37 and arg2 ~= 39 and arg2 ~= 46 and arg2 ~= 51 then
    end
    cancelEvent()
    if 2 > arg2 then
        return
    end
    if arg2 > 9 then
        return
    end
    setElementHealth(source, getElementHealth(source) - arg3 * 0.10000000000000001)
end

addEventHandler("onClientVehicleDamage", root, onClientVehicleDamage)
local state = nil

local function sub_1002()
    if isElement(getPedOccupiedVehicle(localPlayer)) then
        triggerServerEvent("ac:snd_adm_sp", resourceRoot, math.ceil(getElementSpeed(getPedOccupiedVehicle(localPlayer), 3)))
        local function onLogout()
            -- ByteRevenant: synthetic fallback, structured recovery was partial
        end
        state = setTimer(onLogout, 5000, 1)
        local var_1 = getPedOccupiedVehicle(localPlayer)
    end
    if not isPedWearingJetpack(localPlayer) then
        return
    end
    if isTimer(state) then
        return
    end
    triggerServerEvent("ac:snd_adm_jt", resourceRoot)
    local function onLogout()
        -- ByteRevenant: synthetic fallback, structured recovery was partial
    end
    state = setTimer(onLogout, 10000, 1)
end

setTimer(sub_1002, 2000, 0)

local function onClientElementInteriorChange(arg1, arg2, arg3, arg4)
    if source ~= localPlayer then
        return
    end
    if arg3 == arg1 then
        return
    end
    if arg1 ~= 0 then
        return
    end
    if arg2 ~= 0 then
        return
    end
    triggerServerEvent("ac:snd_adm_int", resourceRoot)
end

addEventHandler("onClientElementInteriorChange", root, onClientElementInteriorChange)
local var_9 = {}
local var_10 = {}

local function onClientPlayerWeaponFire(arg1, arg2, arg3)
    if isPedReloadingWeapon(source) or arg2 == 0 then
    end
    if source == localPlayer then
        triggerServerEvent("ac:snd", resourceRoot, { arg1, arg2, arg3 })
    end
    if var_9[source] then
        if var_9[source] == arg2 then
            cancelEvent()
            if var_10[source] then
                return
            end
            if arg1 == 43 then
                return
            end
            triggerServerEvent("ac:snd_adm_ammo", resourceRoot, source)
            local function onLogout(arg1)
                var_10[arg1] = nil
            end
            var_10[source] = setTimer(onLogout, 2000, 1, source)
        end
        var_9[source] = nil
    end
    var_9[source] = arg2
end

addEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFire)
local var_12 = {
    setElementHealth = { province_garage = true, province_ac = true },
    setVehicleDamageProof = { province_carshop = true },
    setVehiclePlateText = { province_garage = true, province_tuning = true },
    setElementVelocity = {
        admin = true,
        parachute = true,
        province_parachute = true,
        province_antiroof = true,
        province_sightboat = true,
        province_riverboat = true,
        province_pizza = true,
        province_gasoline = true,
        province_carsystem = true,
    },
    setElementSpeed = {
        province_carsystem = true,
        province_components = true,
        province_riverboat = true,
        province_sightboat = true,
    },
    setClipboard = {
        admin = true,
        guieditor = true,
        province_actionPoints = true,
        province_debug = true,
        province_dx = true,
        province_fractions = true,
        province_menu = true,
        province_mpObjectEditor = true,
        province_phone = true,
        province_privateatp = true,
        dgs = true,
        province_pedEditor = true,
        province_setupwheels = true,
        tool_screenmakers = true,
        tool_taxiLamp = true,
        hedit = true,
        privateatp = true,
        province_gpsNav = true,
        shader_tex_names = true,
    },
    loadstring = {
        admin = true,
        runcode = true,
        guieditor = true,
        sirenEdit = true,
    },
    setVehicleHandling = { province_tuning = true, province_garage = true, hedit = true },
    getVehicleHandling = { province_tuning = true, hedit = true },
    getOriginalHandling = { province_tuning = true, hedit = true },
}
local var_13 = {
    blowVehicle = "ot:checkTramsOnLine",
    detonateSatchels = "ot:checkBusOnLine",
    fixVehicle = "ot:checkTrollOnLine",
    createProjectile = "ot:checkCarOnLine",
    setElementHealth = "ot:checkSubOnLine",
    setVehicleDamageProof = "ot:checkAirOnLine",
    setElementVelocity = "ot:checkWaterOnLine",
    setElementSpeed = "ot:checkWaterOnLine",
    setPlayerNametagText = "menu:timestampCoroutine",
    getResourceRootElement = "menu:timestampUpd",
    outputChatBox = "menu:gpsCheckpoint",
    setVehiclePlateText = "ot:checkRiverboatOnLine",
    setClipboard = "ot:updateOTTimer",
    setElementModel = "ot:resetOTTimer",
    triggerServerEvent = "menu:getMenuID",
    setPedArmor = "carsystem:getVehState",
    attachTrailerToVehicle = "carsystem:getMileage",
    outputConsole = "carsystem:checkPassenger",
    addDebugHook = "carshop:getPanelState",
    loadstring = "carshop:getDoorLockedState",
    setElementPosition = "carshop:lockDoorHood",
    processLineOfSight = "docs:getSpecialData",
    isLineOfSightClear = "docs:getOchsStatus",
    setElementData = "docs:askWorkStatus",
    getElementData = "docs:askRestStatus",
    fireWeapon = "radial:getSlotStatus",
    guiCreateWindow = "bus:initRouteValue",
    setVehicleHandling = "police:getCuffed",
    getVehicleHandling = "medic:getCouch",
    getOriginalHandling = "lift:getElevator",
}
local var_14 = {}
addEvent("ac:yoclmn", true)

local function var_15()
end

local function sub_1003()
    if addEventHandler("onTextItemCreated", root, var_15) then
        removeEventHandler("onTextItemCreated", root, var_15)
        local onLogout = addEventHandler("onTextItemCreated", root, var_15)
    end
    triggerServerEvent("ac:yoclmn", resourceRoot, getPlayerSerial(), addEventHandler("onTextItemCreated", root, var_15))
end

addEventHandler("ac:yoclmn", resourceRoot, sub_1003)

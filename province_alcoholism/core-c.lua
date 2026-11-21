-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = 0

getCurrentStage = function()
    return var
end

local flag = false
local var_1 = 0
local var_2 = {}
local lockClient = getTickCount()
local tripClient = 0
local var_5 = {}

local function onLogout(arg1)
    if addEventHandler("onClientElementInteriorChange", localPlayer, onClientInteriorChange) then
        addEventHandler("onClientElementInteriorChange", localPlayer, onClientInteriorChange)
    end
    if addEventHandler("onClientElementDimensionChange", localPlayer, onClientInteriorChange) then
        addEventHandler("onClientElementDimensionChange", localPlayer, onClientInteriorChange)
    end
    destroyHindrance()
    setControlState("walk", false)
    setControlState("forwards", false)
    if isTimer(flag) then
        killTimer(flag)
    end
    flag = false
    var_1 = 0
    var = 0
    var_2 = {}
    lockClient = getTickCount()
    tripClient = 0
    var_5 = nil
    resetCameraShake(arg1)
    exports.province_main:resetPlayerWalkingStyle(localPlayer)
end

addEventHandler("onLogout", localPlayer, onLogout)
addEvent("alcoholism:onDrunkStateChange", true)

local function var_7(arg1)
    if addEventHandler("onClientElementInteriorChange", localPlayer, onClientInteriorChange) then
        addEventHandler("onClientElementInteriorChange", localPlayer, onClientInteriorChange)
    end
    if addEventHandler("onClientElementDimensionChange", localPlayer, onClientInteriorChange) then
        addEventHandler("onClientElementDimensionChange", localPlayer, onClientInteriorChange)
    end
    destroyHindrance()
    setControlState("walk", false)
    setControlState("forwards", false)
    if isTimer(flag) then
        killTimer(flag)
    end
    flag = false
    var_1 = 0
    var = 0
    var_2 = {}
    lockClient = getTickCount()
    tripClient = 0
    var_5 = nil
    resetCameraShake(arg1)
    exports.province_main:resetPlayerWalkingStyle(localPlayer)
end

local function sub_1001(arg1, arg2, arg3, arg4)
    setElementData(localPlayer, "isDrunk", arg1, false, "deny")
    lockClient = getTickCount()
    tripClient = arg2
    var_2 = arg3
    var_1 = 0
    if not arg1 or arg2 == 0 then
        return var_7(not arg1)
    end
    if not addEventHandler("onClientElementInteriorChange", localPlayer, onClientInteriorChange) then
        addEventHandler("onClientElementInteriorChange", localPlayer, onClientInteriorChange)
    end
    if not addEventHandler("onClientElementDimensionChange", localPlayer, onClientInteriorChange) then
        addEventHandler("onClientElementDimensionChange", localPlayer, onClientInteriorChange)
    end
    if arg1 == 0 then
        if arg1 < var then
            resetCameraShake()
        end
    end
    if not isTimer(flag) then
        flag = setTimer(checkAlcoEffect, 100, 0)
    end
    if 1 <= var_1 and 0 < arg2 then
        generationHindrance()
    end
    var = (tonumber(arg1) or 0)
end

addEventHandler("alcoholism:onDrunkStateChange", resourceRoot, sub_1001)

resetCameraShake = function(arg1)
    setCameraDrunkLevel(0)
    if arg1 then
        return
    end
    setElementDimension(localPlayer, getElementDimension(localPlayer) + 1)
    setElementDimension(localPlayer, getElementDimension(localPlayer))
end

setVisibleHud = function(arg1)
    setPedTargetingMarkerEnabled(arg1)
    setPlayerNametagShowing(root, arg1)
    if next((var_5 or {})) then
    end
    if false then
    end
    if false then
    end
    if false then
    end
    if false then
    end
    if isCustomHudRunning() then
        exports.province_hud:setPlayerHudVisible(arg1)
    end
    showChat(arg1)
    setPlayerHudComponentVisible("radar", arg1)
    triggerEvent("battlePass:toggleEventBanner", localPlayer, arg1)
end

local function sub_1002()
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "tToggle", "isControlEnabled", "prvToggleControl"
    if isControlEnabled(tToggle[r3]) then
        prvToggleControl(tToggle, false)
    end
    prvToggleControl(tToggle, false)
end

local flag_10 = false
local var_11 = 5000

checkAlcoEffect = function()
    lockClient = getTickCount()
    for k, v in pairs(var_2) do
        if 0 < v.rate then
            v.points = v.points - (getTickCount() - lockClient) / 1000 / v.rate
            (v.hiddenPoints or math.max) = math.max(v.hiddenPoints - (getTickCount() - lockClient) / 1000 / v.rate, 0)
            local var = getTickCount()
            local var_2 = v.hiddenPoints - (getTickCount() - lockClient) / 1000 / v.rate
        end
        if v.points <= 0 then
            if (v.hiddenPoints or getTickCount()) <= 0 then
                var_2[k] = nil
                local var = getTickCount()
            end
            local var = getTickCount()
        end
        if not v.hiddenPoints then
            local var = getTickCount()
        end
        local var = getTickCount()
        local var_1 = 0 + v.points + v.hiddenPoints
        local var_2 = v.points + v.hiddenPoints
    end
    if getPedWalkingStyle(localPlayer) ~= WALKING_STYLE then
        setPedWalkingStyle(localPlayer, WALKING_STYLE)
        local var = getTickCount()
    end
    if not isAnimActived(localPlayer) then
        if getPedWalkingStyle(localPlayer) == WALKING_STYLE then
            setPedControlState(localPlayer, "forwards", false)
            setPedControlState(localPlayer, "walk", true)
            local var = getTickCount()
        end
        local var = getTickCount()
    end
    if flag_10 then
        flag_10 = false
    end
    setCameraDrunkLevel(math.ceil(tripClient))
end

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

getPlayerIntoxication = function()
    return tripClient, var
end

onClientInteriorChange = function()
    flag_10 = getTickCount()
    setCameraDrunkLevel(0)
end

local function onClientResourceStart(arg1)
    AlcoholAttributes = exports.province_inventory:getAlcoholItems()
end

addEventHandler("onClientResourceStart", root, onClientResourceStart)

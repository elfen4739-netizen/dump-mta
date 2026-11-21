-- ByteRevenant
-- LuaQ 5.1 structured decompile

utf8.count = function(arg1, arg2)
    return 0
end

local function sub_1000(arg1, arg2)
    return 0
end

local var_1 = {
    "fire",
    "vehicle_fire",
    "aim_weapon",
    "next_weapon",
    "previous_weapon",
    "vehicle_secondary_fire",
}

local function sub_1001(arg1)
    if arg1 then
    end
    prvToggleControl(var_1, false)
end

local lockClient = {}
local tripClient = {}

local function var_5(arg1, arg2, arg3, arg4, arg5)
    if isElement(arg1) then
        if arg2 then
            if arg3 then
                if arg4 then
                    if arg5 then
                        if getDistanceBetweenPoints3D(arg2, arg3, arg4, getElementPosition(arg1)) > arg5 then
                        end
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function var_6(arg1, arg2)
    if arg1 == localPlayer then
        for k in pairs(lockClient) do
            if isElement(k) then
                setElementCollidableWith(localPlayer, k, true)
            end
            lockClient[k] = nil
        end
    end
    setElementCollidableWith(localPlayer, arg1, true)
end

local function onLogout()
    if localPlayer == source then
        var_6(localPlayer, true)
    end
    if not isElement(source) then
        return
    end
    if not lockClient[source] then
        return
    end
    setElementCollidableWith(localPlayer, source, true)
    lockClient[source] = nil
end

addEventHandler("onLogout", root, onLogout)
local var_8 = {}
local var_9 = {}
addEvent("onClientNPCDialogStart")

local function var_10(arg1)
    if localPlayer ~= arg1 then
        return
    end
    endDialog(arg1)
end

local function var_11()
    if not var_8[var_9[source]] then
        return
    end
    if activeDialog then
        return
    end
    if getElementData(localPlayer, "camhunt:enabled") then
        return
    end
    triggerEvent("onClientNPCDialogStart", resourceRoot, var_9[source])
    triggerServerEvent("onNPCDialogStart", resourceRoot, var_9[source])
end

local function var_12(arg1, arg2)
    if arg1 == localPlayer then
        for k, v in pairs(getElementsWithinRange(value_1, value_2, value_3, 5, "player")) do
            if isElement(v) then
                setElementCollidableWith(localPlayer, v, false)
                lockClient[v] = true
            end
        end
    end
    setElementCollidableWith(localPlayer, arg1, false)
end

createNPC = function(arg1, arg2)
    if not arg1 then
        return
    end
    if var_8[arg1] then
        return
    end
    setTimer(setElementRotation, 200, 1, createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, (arg2.rot or 0)), 0, 0, arg2.rot, "default", true)
    setElementInterior(createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot), (arg2.int or 0))
    setElementDimension(createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot), (arg2.dim or 0))
    setElementFrozen(createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot), true)
    if arg2.anim_idle then
        setTimer(setPedAnimation, 200, 1, createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot), arg2.anim_idle[1], arg2.anim_idle[2])
        local var = createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot)
    end
    setElementInterior(createColSphere(arg2.pos.x, arg2.pos.y, arg2.pos.z, 3), (arg2.int or 0))
    setElementDimension(createColSphere(arg2.pos.x, arg2.pos.y, arg2.pos.z, 3), (arg2.dim or 0))
    addEventHandler("onClientColShapeLeave", createColSphere(arg2.pos.x, arg2.pos.y, arg2.pos.z, 3), var_10, false)
    setElementInterior(createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false), arg2.int)
    setElementDimension(createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false), arg2.dim)
    var_9[createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false)] = arg1
    addEventHandler("actionPoint:onClientTrigger", createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false), var_11, false)
    if arg2.antiCollision then
        if var_5(localPlayer, arg2.pos.x, arg2.pos.y, arg2.pos.z, 5) then
            var_12(localPlayer)
            local var = createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot)
            local colshape = createColSphere(arg2.pos.x, arg2.pos.y, arg2.pos.z, 3)
            local var_1 = createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false)
            local colshape_2 = createColSphere(arg2.pos, 5)
        end
        tripClient[createColSphere(arg2.pos, 5)] = arg2.pos
        addEventHandler("onClientColShapeHit", createColSphere(arg2.pos, 5), var_12, false)
        addEventHandler("onClientColShapeLeave", createColSphere(arg2.pos, 5), var_6, false)
        local var = createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot)
        local colshape = createColSphere(arg2.pos.x, arg2.pos.y, arg2.pos.z, 3)
        local var_1 = createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false)
        local colshape_2 = createColSphere(arg2.pos, 5)
    end
    arg2.uid = arg1
    arg2.ped = createPed(arg2.skin, arg2.pos.x, arg2.pos.y, arg2.pos.z, arg2.rot)
    arg2.colshape = createColSphere(arg2.pos.x, arg2.pos.y, arg2.pos.z, 3)
    arg2.antiCollisionColshape = nil
    arg2.actionPoint = createActionPoint(arg2.pos.x, arg2.pos.y, arg2.pos.z + 0.33500000000000002, "E", false)
    var_8[arg1] = arg2
    return arg2
end

local function var_13(self, arg2)
    if arg2 ~= false then
        for k, v in pairs({}) do
            if isTimer(v) then
                killTimer(v)
                self[k] = nil
            end
            if isElement(v) then
                destroyElement(v)
                self[k] = nil
            end
            if type(v) == "table" then
                var(v)
            end
        end
    end
    for k, v in pairs({}) do
        if isTimer(v) then
            self[k] = nil
        end
        if isElement(v) then
            self[k] = nil
        end
        if type(v) == "table" then
            var(v, arg2)
        end
    end
end

destroyNPC = function(arg1)
    if not var_8[arg1] then
        return
    end
    if arg1 == activeDialog then
        endDialog()
        local var = var_8[arg1]
    end
    var_13(var_8[arg1], true)
    var_8[arg1] = nil
end

local function var_14(arg1)
    return arg1[math.random(1, #arg1)]
end

local function var_15(arg1, arg2)
    if not var_8[arg1] then
        return
    end
    var_8[arg1].phrase = nil
    if isTimer(var_8[arg1].phraseTimer) then
        killTimer(var_8[arg1].phraseTimer)
        local var = var_8[arg1]
    end
    var_8[arg1].phraseTimer = nil
    if not var_8[arg1].nameOnScreen then
        return
    end
    if not var_8[arg1].phrases then
        return
    end
    if not next(var_8[arg1].phrases) then
        return
    end
    if not arg2 then
        local var = var_8[arg1]
    end
    var_8[arg1].phraseI = 0
    if getTickCount() < (var_8[arg1].phraseCooldown or 0) then
        return
    end
    if #var_8[arg1].phrases < var_8[arg1].phraseI + 1 then
        return
    end
    if type(var_8[arg1].phrases[var_8[arg1].phraseI + 1]) == "table" then
        local var = var_8[arg1]
        local var_1 = var_8[arg1].phraseI + 1
        local var_2 = var_14(var_8[arg1].phrases[var_8[arg1].phraseI + 1])
        local lockClient = 0
    end
    if type("") == "function" then
        local var = var_8[arg1]
        local var_1 = var_8[arg1].phraseI + 1
        local var_2 = ""(arg1)
        local lockClient = 0
    end
    if type(0) == "function" then
        local var = var_8[arg1]
        local var_1 = var_8[arg1].phraseI + 1
        local var_2 = ""
        local lockClient = 0
    end
    if type("") == "table" then
        local var = var_8[arg1]
        local lockClient = var_8[arg1].phraseI + 1
        local tripClient = 0
    end
    setNPCPhrase(arg1, "", 0, false, nil)
    var_8[arg1].phraseI = var_8[arg1].phraseI + 1
    if var_8[arg1].phraseI + 1 ~= #var_8[arg1].phrases then
        return
    end
    if not var_8[arg1].phrases.cooldown then
        return
    end
    var_8[arg1].phraseCooldown = getTickCount() + var_8[arg1].phrases.cooldown + 0
end

setNPCPhrase = function(arg1, arg2, arg3, arg4, arg5)
    if not var_8[arg1] then
        return
    end
    var_8[arg1].phrase = arg2
    if isTimer(var_8[arg1].phraseTimer) then
        killTimer(var_8[arg1].phraseTimer)
        local var = var_8[arg1]
    end
    var_8[arg1].phraseTimer = nil
    if isElement(var_8[arg1].phraseSound) then
        destroyElement(var_8[arg1].phraseSound)
        local var = var_8[arg1]
    end
    var_8[arg1].phraseSound = nil
    if arg5 then
        if fileExists(arg5) then
            var_8[arg1].phraseSound = playSound3D(arg5, var_8[arg1].pos)
            setSoundVolume(var_8[arg1].phraseSound, 0.10000000000000001)
        end
    end
    if not arg3 then
        return
    end
    if 0 >= arg3 then
        return
    end
    var_8[arg1].phraseTimer = setTimer(var_15, arg3, 1, arg1, arg4)
end

local function onClientPedDamage()
    cancelEvent(true)
    setPedAnimation(source)
end

addEventHandler("onClientPedDamage", resourceRoot, onClientPedDamage)
activeDialog = false
local var_17 = {}
local var_18 = {}
local var_19 = {}
local var_20 = {
    "prtial_gngtlkA",
    "prtial_gngtlkB",
    "prtial_gngtlkC",
    "prtial_gngtlkD",
    "prtial_gngtlkE",
    "prtial_gngtlkF",
    "prtial_gngtlkG",
    "prtial_gngtlkH",
}
local state = nil

openDialog = function(arg1, arg2)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "activeDialog", "dialog", "escape", "answers", "showCondition", "type"
    var_17.escape = var_8[activeDialog].dialog[arg1].escape
    if var_8[activeDialog].dialog[arg1].answers[r9].showCondition then
        local var = var_8[activeDialog].dialog[arg1]
    end
    if type(var_8[activeDialog].dialog[arg1].answers[r9][1]) == "function" then
        local var = var_8[activeDialog].dialog[arg1]
    end
    hdxSetElementColor(hdxCreatePanel(0, 0, 550, 0, 0, list), STATE_ALL, 0)
    hdxSetElementColor(hdxCreatePanel(0, 0, 550, 0, 0, list), STATE_IDLE, 0)
    hdxSetElementColor(hdxCreatePanel(0, 0, 550, 0, 0, list), STATE_HOVERED, tocolor(255, 255, 255, 25))
    hdxSetElementRounded(hdxCreatePanel(0, 0, 550, 0, 0, list), 3)
    hdxSetElementSize(hdxCreatePanel(0, 0, 550, 0, 0, list), _x(550), _y(value_2 + 8 * 2))
    exports.province_dx:storeElementDataCache(hdxCreatePanel(0, 0, 550, 0, 0, list))
    table.insert(var_19, var)
    hdxSetElementContentHeight(list, 0 + value_2 + 8 * 2)
    if isElement(var_8[activeDialog].ped) then
        local lockClient = var_8[activeDialog].ped
        local function sub_1002()
            if not isElement(lockClient) then
                return
            end
            if not var_8[activeDialog] then
                return
            end
            if var_8[activeDialog].bDisableTalkAnimation then
                return
            end
            setPedAnimation(lockClient, "GANGS", var_20[math.random(#var_20)], -1, false)
        end
        setTimer(sub_1002, 100, 1)
        local var_5 = var_8[activeDialog].dialog[arg1]
    end
    if not arg2 then
        if isElement(state) then
            destroyElement(state)
            local lockClient = var_8[activeDialog].dialog[arg1]
        end
        state = nil
        if type(var_8[activeDialog].dialog[arg1][1]) == "table" then
            local lockClient = var_8[activeDialog].dialog[arg1]
            local tripClient = var_14(var_8[activeDialog].dialog[arg1][1])
        end
        if type(var_8[activeDialog].dialog[arg1][1]) == "function" then
            local lockClient = var_8[activeDialog].dialog[arg1]
            local tripClient = var_8[activeDialog].dialog[arg1][1](activeDialog)
        end
        if type(var_8[activeDialog].dialog[arg1][2]) == "table" then
            local lockClient = var_8[activeDialog].dialog[arg1][1]
            local tripClient = var_14(var_8[activeDialog].dialog[arg1][2])
        end
        if type(var_8[activeDialog].dialog[arg1][2]) == "function" then
            local lockClient = var_8[activeDialog].dialog[arg1][1]
            local tripClient = var_8[activeDialog].dialog[arg1][2](activeDialog)
        end
        if type(var_8[activeDialog].dialog[arg1][2]) == "table" then
            local var_5 = var_8[activeDialog].dialog[arg1][1]
        end
        if nil then
            if fileExists(nil) then
                state = playSound(nil)
                setSoundVolume(state, 0.29999999999999999)
                local lockClient = var_8[activeDialog].dialog[arg1][1]
                local tripClient = var_8[activeDialog].dialog[arg1][2]
            end
            local lockClient = var_8[activeDialog].dialog[arg1][1]
            local tripClient = var_8[activeDialog].dialog[arg1][2]
        end
        hdxSetElementText(labelName, var_8[activeDialog].dialog[arg1][1])
        hdxSetElementText(labelMain, var_8[activeDialog].dialog[arg1][2])
    end
    hdxSetElementVisible(panelInteraction, true)
    hdxSetElementRelativePosition(list, labelMain, "left", "under", false, 0, 25)
    text = nil
    name = nil
end

addEvent("openNPCDialog", true)
addEventHandler("openNPCDialog", resourceRoot, openDialog, false)

local function var_21()
    if timerClose then
        if isTimer(timerClose) then
            killTimer(timerClose)
        end
    end
    timerClose = nil
end

local state_22 = nil

local function var_23(arg1)
    if var_8[activeDialog] then
        if isElement(var_8[activeDialog].ped) then
            setElementDimension(var_8[activeDialog].ped, arg1)
        end
    end
    for k, v in pairs(var_8) do
        if isElement(v.ped) then
            setElementDimension(v.ped, arg1)
        end
    end
    setElementDimension(localPlayer, arg1)
end

local function var_24(arg1)
    return exports.province_inventory:setDisabledAttachObjects(arg1)
end

local state_25 = nil
local state_26 = nil

local function var_27(arg1, arg2)
    if arg1 ~= "escape" then
        return
    end
    if not arg2 then
        return
    end
    cancelEvent()
    if activeDialog then
        if var_17 then
            if type(var_17.escape) == "function" then
                var_17.escape()
            end
        end
    end
    endDialog()
end

endDialog = function()
    if not activeDialog then
        return
    end
    var_17 = nil
    hdxSetElementVisible(panelInteraction, false)
    var_21()
    showCursor(false)
    setCameraTarget(localPlayer, localPlayer)
    setElementData(localPlayer, "radialMenuDisable", false, false)
    if isElement(state) then
        destroyElement(state)
    end
    state = nil
    if state_22 then
        var_23(state_22)
        state_22 = nil
        local var = var_8[activeDialog]
    end
    var_24(false)
    setElementAlpha(localPlayer, 255)
    if type(state_25) == "boolean" then
        setPlayerHudComponentVisible("radar", state_25)
        local var = var_8[activeDialog]
    end
    if type(state_26) == "boolean" then
        showChat(state_26)
        local var = var_8[activeDialog]
    end
    state_26 = nil
    state_25 = nil
    if var_8[activeDialog].phrases then
        if var_8[activeDialog].phrases.cooldown then
            var_8[activeDialog].phraseCooldown = getTickCount() + var_8[activeDialog].phrases.cooldown
            var_8[activeDialog].phraseI = 0
            local var = var_8[activeDialog]
        end
        var_15(activeDialog, true)
        local var = var_8[activeDialog]
    end
    if isElement(var_8[activeDialog].ped) then
        if var_8[activeDialog].anim_idle then
            setTimer(setPedAnimation, 100, 1, var_8[activeDialog].ped, var_8[activeDialog].anim_idle[1], var_8[activeDialog].anim_idle[2])
            local var = var_8[activeDialog]
        end
        setTimer(setPedAnimation, 100, 1, var_8[activeDialog].ped)
        local var = var_8[activeDialog]
    end
    if isEvent("onClientKey", root, var_27) then
        removeEventHandler("onClientKey", root, var_27)
    end
    addEventHandler("onClientNPCDialogEnd", resourceRoot, activeDialog)
    addEventHandler("onNPCDialogEnd", resourceRoot, activeDialog)
    activeDialog = false
end

addEvent("onClientNPCDialogEnd")
addEvent("endNPCDialog", true)
addEventHandler("endNPCDialog", resourceRoot, endDialog, false)

startDialog = function(arg1, arg2, arg3)
    if activeDialog then
        if activeDialog == arg1 then
            openDialog(arg2)
            return
        end
        if not arg3 then
            return
        end
        endDialog()
    end
    if not var_8[arg1] then
        return
    end
    if not var_8[arg1].dialog then
        return
    end
    if not var_8[arg1].dialog[arg2] then
        return
    end
    if not value_1 then
        if not (var_8[arg1].length or 1.1100000000000001)Offset then
            local var = var_8[arg1]
            local var_9 = var_8[arg1].length
            local var_10 = 0.14999999999999999
        end
        if not (var_8[arg1].zCamDelta or 0.65600000000000003)2 then
            local var = var_8[arg1]
            local var_9 = var_8[arg1].length
            local var_10 = var_8[arg1].lengthOffset
            local var_11 = var_8[arg1].zCamDelta
            local var_12 = 0.56399999999999995
        end
        if not (var_8[arg1].rotCam or 0)Offset then
            local var = var_8[arg1]
            local var_9 = var_8[arg1].length
            local var_10 = var_8[arg1].lengthOffset
            local var_11 = var_8[arg1].zCamDelta
            local var_12 = var_8[arg1].zCamDelta2
            local var_13 = var_8[arg1].rotCam
            local var_14 = 90
        end
        local value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8 = unpack(var_8[arg1].camera)
        local var = var_8[arg1]
    end
    setCameraMatrix(value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8)
    activeDialog = arg1
    if not var_8[arg1].saveDimension then
        state_22 = getElementDimension(localPlayer)
        var_23(state_22 + 1)
        local var = var_8[arg1]
    end
    var_24(true)
    setElementAlpha(localPlayer, 0)
    openDialog(arg2)
    showCursor(true)
    setElementData(localPlayer, "radialMenuDisable", "showHud", false)
    if not var_8[arg1].showRadar then
        state_25 = isPlayerHudComponentVisible("radar")
        setPlayerHudComponentVisible("radar", false)
        local var = var_8[arg1]
    end
    if var_8[arg1].hideChat then
        state_26 = isChatVisible()
        showChat(false)
    end
    if isEvent("onClientKey", root, var_27) then
        return
    end
    addEventHandler("onClientKey", root, var_27)
end

addEvent("startNPCDialog", true)
addEventHandler("startNPCDialog", resourceRoot, startDialog, false)

local function onHdxElementPressed(arg1, arg2, arg3, arg4)
    if arg2 then
        return
    end
    if arg1 ~= "left" then
        return
    end
    if not var_17 then
        return
    end
    if not var_17[source] then
        return
    end
    if type(var_17[source]) ~= "number" then
    end
    openDialog(var_17[source])
    var_17[source](var_18[source])
end

addEventHandler("onHdxElementPressed", resourceRoot, onHdxElementPressed)
local var_29 = {}

local function var_30()
    panelInteraction = hdxCreatePanel(0, 0, 685, 1080, tocolor(31, 31, 40, 55))
    hdxSetElementSize(panelInteraction, _x(685), screenH)
    hdxSetElementRelativePosition(panelInteraction, "right", "top", false, 0, 0)
    hdxSetElementDisabled(panelInteraction, true)
    hdxSetElementVisible(panelInteraction, false)
    labelName = addEventHandler("Name", 0, 0, tColor.white, "FuturaDemi", 16, panelInteraction)
    hdxSetElementRelativePosition(labelName, panelInteraction, "left", "top", false, 0 + 25, 420)
    hdxSetElementDisabled(labelName, true)
    labelMain = addEventHandler("Main", 0, 0, tColor.white, "FuturaBook", 14, panelInteraction)
    hdxSetElementRelativePosition(labelMain, panelInteraction, "left", "top", false, 0 + 25, 420 + 35)
    hdxSetLabelWordwrapped(labelMain, true, 550)
    hdxSetElementDisabled(labelMain, true)
    list = hdxCreateSpace(0, 0, 550, 400, "", panelInteraction)
    hdxSetElementColor(list, STATE_ALL, 0)
    hdxSetElementScrollColor(list, STATE_ALL, tocolor(255, 255, 255))
    hdxSetElementScrollWidth(list, 6)
end

local function onClientResourceStart()
    var_29 = { value_1 }
    var_30()
    addEventHandler("onClientPlayerWasted", localPlayer, endDialog)
    addEventHandler("onClientPlayerBusted", localPlayer, endDialog)
    addEventHandler("onLogout", localPlayer, endDialog)
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)
local var_33 = 10

local function var_34(arg1)
    if not var_8[arg1] then
        return
    end
    if var_8[arg1].phrase then
        return
    end
    if not var_8[arg1].nameOnScreen then
        return
    end
    if not var_8[arg1].phrases then
        return
    end
    if not next(var_8[arg1].phrases) then
        return
    end
    if var_8[arg1].phraseI then
        if var_8[arg1].phraseI ~= #var_8[arg1].phrases then
            local var = var_8[arg1]
        end
        var_8[arg1].phraseI = math.max(var_8[arg1].phraseI - 1, 0)
    end
    var_15(arg1, false)
end

local function var_35(arg1)
    if not var_8[arg1] then
        return
    end
    if not isElement(var_29[1]) then
        var_29 = { value_7 }
        local value_1, value_2, value_3, value_4, value_5, value_6 = getCameraMatrix()
        local var = var_8[arg1]
        local var_9 = getCameraTarget(localPlayer)
    end
    if isElementOnScreen(var_8[arg1].ped) and getCameraTarget(localPlayer) then
        if getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) < var_33 and value_10 and value_11 then
            if isLineOfSightClear(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002, true, false, false, true, false, true, false, ped) then
                if not var_8[arg1].nameOnScreen then
                    var_8[arg1].nameOnScreen = true
                    var_34(arg1)
                    local value_1, value_2, value_3, value_4, value_5, value_6 = getCameraMatrix()
                    local value_7, value_8, value_9 = getPedBonePosition(var_8[arg1].ped, 8)
                    local value_10, value_11 = getScreenFromWorldPosition(value_7, value_8, value_9 + 0.40000000000000002)
                    local var = var_8[arg1]
                end
                nickname = nickname or ""
                if var_8[arg1].phrase then
                    local value_10, value_11 = getScreenFromWorldPosition(value_7, value_8, value_9 + 0.40000000000000002)
                    local value_12, value_13, value_14 = unpack(var_29)
                    local var = var_8[arg1]
                    local var_15 = value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01)
                    local onClientPedDamage = value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) * 0.5
                    local var_17 = (utf8.count(var_8[arg1].phrase, "\n") + 1 + 1) * (value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) - 0.070000000000000007)
                end
                dxDrawText(tostring(var_8[arg1].name), value_10 + 2, value_11 - value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) * 0.5 + 2, value_10 + 2, value_11 + value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) * 0.5 + 2, tocolor(0, 0, 0, 100), value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01), "default-bold", "center", "center", false, false, false, true)
                dxDrawText(tostring(var_8[arg1].name), value_10, value_11 - value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) * 0.5, value_10, value_11 + value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) * 0.5, tocolor(255, 255, 255), value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01), "default-bold", "center", "center", false, false, false, true)
                dxDrawText(tostring(var_8[arg1].phrase), value_10 + 2, value_11 - value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) + 2, value_10 + 2, value_11 - 0 + 2, tocolor(0, 0, 0, 100), value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) - 0.070000000000000007, "default-bold", "center", "center", false, false, false, true)
                dxDrawText(tostring(var_8[arg1].phrase), value_10, value_11 - value_14 * value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01), value_10, value_11 - 0, tocolor(255, 255, 255), value_13 * math.max(0.014999999999999999 * 5 / getDistanceBetweenPoints3D(value_1, value_2, value_3, value_7, value_8, value_9 + 0.40000000000000002) * 30, 0.01) - 0.070000000000000007, "default-bold", "center", "center", false, false, false, true)
            end
        end
        var_8[arg1].nameOnScreen = nil
    end
    var_8[arg1].nameOnScreen = nil
end

local function sub_1003()
    for k, v in pairs(var_8) do
        if v.name then
            if isElement(v.ped) then
                if isElementStreamedIn(v.ped) then
                    if isElementOnScreen(v.ped) then
                        var_35(k)
                    end
                end
            end
        end
    end
end

addEventHandler("onClientRender", root, sub_1003, false, "high+99")

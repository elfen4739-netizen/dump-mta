-- ByteRevenant
-- LuaQ 5.1 structured decompile

animationList = {}
currentAnim = nil
local var = {}
for k, v in pairs(tRawAnimationsBlockOrder) do
    if not tRawAnimationsList[v] then
        local var_1 = { name = v }
        local onClientResourceStop = {}
    end
    local var_1 = { name = v }
    for k, v in ipairs(tRawAnimationsList[v]) do
        if not v.time then
            local onClientResourceStop = {
                category = v,
                anim = v.anim,
                blockname = v.group,
                name = v.name,
                looped = v.looped,
                freezeLastFrame = v.freezeLastFrame,
            }
            local lockClient = 250
        end
        if not v.duration then
            local onClientResourceStop = {
                category = v,
                anim = v.anim,
                blockname = v.group,
                name = v.name,
                looped = v.looped,
                freezeLastFrame = v.freezeLastFrame,
                time = v.time,
            }
            local lockClient = -1
        end
        var_1[k] = {
            category = v,
            anim = v.anim,
            blockname = v.group,
            name = v.name,
            looped = v.looped,
            freezeLastFrame = v.freezeLastFrame,
            time = v.time,
            duration = v.duration,
        }
        if v.isPrivate then
            var[v.group] = var[v.group] or {}
            var[v.group][v.anim] = true
        end
    end
    animationList[k] = var_1
end

findAnimationIdFromName = function(arg1, arg2)
    if not arg1 or not arg2 then
    end
    return false
end

getAnimationData = function(arg1, arg2)
    for k, v in ipairs(animationList) do
        for k, v in ipairs(v) do
            if k == arg1 then
                if k == arg2 then
                    return v
                end
            end
        end
    end
    return false
end

getAnimationsByCategory = function(arg1)
    if animationList[arg1] then
        return animationList[arg1]
    end
    return false
end

getAllAnimations = function()
    local var = {}
    for k, v in ipairs(animationList) do
        var[k] = {}
        for k, v in ipairs(v) do
            table.insert(var[k], k)
        end
    end
    return var
end

playPlayerAnim = function(arg1, arg2)
    if not value_1 then
        return
    end
    if not value_2 then
        return
    end
    setClientAnimation(value_1, value_2)
end

setClientAnimation = function(arg1, arg2)
    triggerServerEvent("animpanel:setPlayerAnim", resourceRoot, arg1, arg2, isAnimationAdded(arg1, arg2), animationList[arg1][arg2].category)
end

stopAnimation = function()
    if currentAnim then
        triggerServerEvent("animpanel:setPlayerAnim", resourceRoot, false)
        local value_1, value_2 = getPedAnimation(localPlayer)
    end
    if value_2 then
        if currentAnim then
            if value_2 == currentAnim then
                setPedAnimation(localPlayer, false)
            end
        end
    end
    currentAnim = nil
end

addCommandHandler("stopanim", stopAnimation)
bindKey("lshift", "down", "stopanim")
addEvent("animpanel:setClientAnim", true)

local function sub_1001(arg1, arg2)
    if not animationList[arg1] then
        return
    end
    setPedAnimation(source, animationList[arg1][arg2].blockname, animationList[arg1][arg2].anim, animationList[arg1][arg2].duration, animationList[arg1][arg2].looped, false, true, animationList[arg1][arg2].freezeLastFrame, (animationList[arg1][arg2].time or 250), true)
    if source ~= localPlayer then
        return
    end
    currentAnim = animationList[arg1][arg2].anim
end

addEventHandler("animpanel:setClientAnim", root, sub_1001)

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)
local lockClient = {}

local function onClientPlayerAnimation(arg1, arg2)
    if arg1 ~= "guitar" then
        return
    end
    if arg2 ~= "GUITAR_PRBR" then
        return
    end
    if lockClient[source] then
        return
    end
    setElementInterior(createObject(336, value_1, value_2, value_3), getElementInterior(source))
    setElementDimension(createObject(336, value_1, value_2, value_3), getElementDimension(source))
    attachElements(createObject(336, value_1, value_2, value_3), source, -0.35999999999999999, 0.32000000000000001, -0.68999999999999995, 99.5, -2, 83.5)
    lockClient[source] = createObject(336, value_1, value_2, value_3)
    setPedWeaponSlot(source, 0)
end

addEventHandler("onClientPlayerAnimation", root, onClientPlayerAnimation)

local function onClientPreRender()
    for k, v in pairs(lockClient) do
        if value_1 == "guitar" then
        end
        lockClient[k] = nil
        destroyElement(v)
        setPedWeaponSlot(k, 0)
    end
end

addEventHandler("onClientPreRender", root, onClientPreRender)

local function onClientPlayerQuit()
    if not lockClient[source] then
        return
    end
    lockClient[source] = nil
    destroyElement(lockClient[source])
end

addEventHandler("onClientPlayerQuit", root, onClientPlayerQuit)
addEvent("setAnimClient", true)

local function sub_1002(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    setPedAnimation(source, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
end

addEventHandler("setAnimClient", root, sub_1002)
local var_8 = {}

local function onClientResourceStart()
    for k, v in ipairs(getElementsByType("player")) do
        if getElementData(v, "syncAnimationData") then
            if type(getElementData(v, "syncAnimationData")) == "table" then
                if next(getElementData(v, "syncAnimationData")) then
                    var_8[v] = getElementData(v, "syncAnimationData")
                end
            end
        end
    end
end

addEventHandler("onClientResourceStart", root, onClientResourceStart)

local function onClientElementDataChange(arg1, arg2, arg3)
    if arg1 ~= "syncAnimationData" then
        return
    end
    if getElementType(source) ~= "player" then
        return
    end
    if arg3 then
        if type(arg3) == "table" then
            if next(arg3) then
                var_8[source] = arg3
            end
        end
    end
    if not var_8[source] then
        return
    end
    var_8[source] = nil
end

addEventHandler("onClientElementDataChange", root, onClientElementDataChange)

local function onClientElementStreamIn()
    if getElementType(source) ~= "player" then
        return
    end
    if not var_8[source] then
        return
    end
    setPedAnimation(source, value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8)
end

addEventHandler("onClientElementStreamIn", root, onClientElementStreamIn)
local var_12 = {}

hasAccessToAnim = function(arg1, arg2)
    if var[arg1] then
        if var[arg1][arg2] then
            if not var_12[arg1] then
                return var_12[arg1]
            end
            return var_12[arg1][arg2]
        end
    end
    return true
end

addEvent("animpanel.receivePrivateAnimations", true)

local function sub_1003(arg1)
    var_12 = arg1
    initFavoriteAnimations()
    reloadAnimsList()
end

addEventHandler("animpanel.receivePrivateAnimations", resourceRoot, sub_1003)

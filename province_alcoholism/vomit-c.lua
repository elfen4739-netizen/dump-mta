-- ByteRevenant
-- LuaQ 5.1 structured decompile

isAnimActived = function(arg1)
    if value_1 == "food" then
    end
    return true
end

cancelClick = function()
    if isAnimActived(localPlayer) then
        return cancelEvent()
    end
    addEventHandler("onClientKey", root, cancelClick)
end

local var = {}
local var_1 = {}
local var_2 = {}

local function lockClient(self)
    if isElement((var[self] or {}).effect) then
        destroyElement(var[self].effect)
    end
    if isTimer(var_1[self]) then
        killTimer(var_1[self])
    end
    if isElement(var_2[self]) then
        destroyElement(var_2[self])
    end
    var[self] = nil
    var_1[self] = nil
    var_2[self] = nil
end

local tripClient = 60000
local vec = Vector3(0, 0.13, 0.050000000000000003)
local flag = false

local function var_5(arg1, arg2)
    if not var[arg1] then
        local var = {}
    end
    if isTimer(var_1[arg1]) then
        if not arg2 then
            return
        end
        if isTimer(var_1[arg1]) then
            killTimer(var_1[arg1])
            local var = var[arg1]
        end
        local var = var[arg1]
    end
    if isElement(var[arg1].effect) then
        destroyElement(var[arg1].effect)
        var[arg1].effect = nil
    end
    if arg2 then
    end
    var_1[arg1] = setTimer(lockClient, tripClient, 1, arg1)
end

local var_6 = 0
addEvent("alcoholism:playerVomit", true)
local var_7 = 1.5

local function var_8()
    -- ByteRevenant: semantic fallback
    -- reconstructed nested cleanup
    for _, group in pairs(Matrix.elements or {}) do
        if type(group) == "table" then
            for _, list in pairs(group) do
                if type(list) == "table" then
                    for _, element in pairs(list) do
                        if isElement(element) then
                            destroyElement(element)
                        end
                    end
                elseif isElement(list) then
                    destroyElement(list)
                end
            end
        elseif isElement(group) then
            destroyElement(group)
        end
    end
    Matrix.elements = {}
end

local var_9 = 3800

local function sub_1001(arg1)
    var_5(arg1, true)
    if isTimer(var_1[arg1]) then
        killTimer(var_1[arg1])
    end
    if arg1 == localPlayer then
        setPedControlState(arg1, "walk", false)
        setPedControlState(arg1, "forwards", false)
        setPedControlState(arg1, "backwards", false)
        setPedControlState(arg1, "left", false)
        setPedControlState(arg1, "right", false)
        prvToggleControl(tControlTable, false)
    end
    local function sub_1002()
        if not isElement(arg1) then
            return
        end
        if not isElementStreamedIn(arg1) then
            return
        end
        if not isElement(flag) then
            flag = dxCreateTexture("assets/vomit.dds")
        end
        var[arg1] = {}
        if isElement(var[arg1].effect) then
            destroyElement(var[arg1].effect)
        end
        attachElements(createEffect("puke", 0, 0, 0, 0, 0, 0, 0, false), arg1)
        setEffectDensity(createEffect("puke", 0, 0, 0, 0, 0, 0, 0, false), 2)
        var[arg1].effect = createEffect("puke", 0, 0, 0, 0, 0, 0, 0, false)
        var[arg1].effectTest = getTickCount()
        var[arg1].progress = 0
        var[arg1].startTick = getTickCount()
        var[arg1].finish = var_7 * 1000
        var[arg1].spriteData = {}
        (Vector3(getPedBonePosition(arg1, 54)) + arg1.matrix:getRight() * 0.69999999999999996).z = (Vector3(getPedBonePosition(arg1, 54)) + arg1.matrix:getRight() * 0.69999999999999996).z + 0.014999999999999999
        var[arg1].spriteData.vPos = Vector3(getPedBonePosition(arg1, 54)) + arg1.matrix:getRight() * 0.69999999999999996
        if isElement(var_2[arg1]) then
            destroyElement(var_2[arg1])
        end
        var_2[arg1] = playSound3D("assets/vomit.mp3", getElementPosition(arg1))
        setElementDimension(var_2[arg1], getElementDimension(arg1))
        removeEventHandler("onClientPreRender", root, var_8)
        addEventHandler("onClientPreRender", root, var_8)
    end
    setTimer(sub_1002, var_9, 1)
end

addEventHandler("alcoholism:playerVomit", resourceRoot, sub_1001)

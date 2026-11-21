-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {
    categoriesPanel = {},
    categoriesID = {},
    animsElements = {},
    favoriteButtons = {},
}

updateAnimRow = function(arg1, arg2)
    for k, v in pairs(var.animsElements) do
        if v.category == arg1 then
            if v.id == arg2 then
                if isAnimationAdded(arg1, arg2) then
                    hdxSetElementColor(v.favoriteIcon, STATE_IDLE, 4076863487)
                end
                hdxSetElementColor(v.favoriteIcon, STATE_IDLE, 1308622847)
                    hdxSetElementColor(k, STATE_IDLE, 4279274614)
                    hdxSetElementColor(k, STATE_HOVERED, 3641740406)
                end
                hdxSetElementColor(k, STATE_IDLE, 4280229671)
                hdxSetElementColor(k, STATE_HOVERED, 234881023)
            end
        end
    end

end

local function var_1(arg1)
    return arg1 * 0.71875
end

updateAnimsCategories = function()
    -- ByteRevenant: semantic fallback
    -- reconstructed nested cleanup
    for _, group in pairs(STATE_HOVERED.elements or {}) do
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
    STATE_HOVERED.elements = {}
end

local function var_2(arg1)
    for k in pairs(var.animsElements) do
        destroyElement(k)
    end
    var.animsElements = {}
    var.favoriteButtons = {}
    hdxSetElementScrolledValue(var.anims, 0)
    if animationList[arg1] then
        if 0 < #animationList[arg1] then
            for k, v in ipairs(animationList[arg1]) do
                if hasAccessToAnim(v.blockname, v.anim) then
                    hdxSetElementRounded(hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims), 5)
                    hdxSetElementColor(hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims), STATE_HOVERED, 234881023)
                    if arg1 ~= "favorites" then
                        v.id = k
                        local var_1 = hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims)
                    end
                    if isAnimationAdded(v.category, v.id) then
                        local var_1 = hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims)
                    end
                    if value_3 == v.category then
                        if value_4 == v.id then
                            hdxSetElementColor(hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims), STATE_IDLE, 4279274614)
                            hdxSetElementColor(hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims), STATE_HOVERED, 3641740406)
                            local var_5 = hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims)
                        end
                        local var_5 = hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims)
                    end
                    var.animsElements[hdxCreatePanel(0, 0, 240, 48, 4280229671, var.anims)] = v
                end
            end
        end
    end
    hdxSetElementContentHeight(var.anims, 0)
end

reloadAnimsList = function(arg1)
    if arg1 then
        if var.selectedCategory ~= "favorites" then
            return
        end
    end
    updateAnimsCategories()
    var_2(var.selectedCategory)
end

isAnimpanelVisible = function()
    if not isElement(var.mainPanel) then
        return isElement(var.mainPanel)
    end
    return hdxIsElementVisible(var.mainPanel)
end

selectCategory = function(arg1)
    if not var.categoriesID[arg1] then
        return
    end
    if var.selectedCategory then
        hdxSetElementDisabled(var.categoriesID[var.selectedCategory], false)
        hdxSetElementColor(var.categoriesID[var.selectedCategory], STATE_IDLE, 4279900706)
    end
    var.selectedCategory = arg1
    hdxSetElementDisabled(var.categoriesID[arg1], true)
    hdxSetElementColor(var.categoriesID[arg1], STATE_IDLE, 234881023)
    var_2(arg1)
end

local function lockClient(arg1, arg2)
    if arg1 ~= "left" or arg2 then
    end
    if source == var.close then
        closeAnimpanel()
    end
    if var.categoriesPanel[source] then
        selectCategory(var.categoriesPanel[source])
    end
    if var.favoriteButtons[source] then
        if not var.animsElements[var.favoriteButtons[source]] then
            return
        end
        if isAnimationAdded(var.animsElements[var.favoriteButtons[source]].category, var.animsElements[var.favoriteButtons[source]].id) then
            deleteFavoriteAnimation(var.animsElements[var.favoriteButtons[source]].category, var.animsElements[var.favoriteButtons[source]].id)
            local var = var.animsElements[var.favoriteButtons[source]]
        end
        saveFavoriteAnimation(var.animsElements[var.favoriteButtons[source]].category, var.animsElements[var.favoriteButtons[source]].id)
    end
    if not var.animsElements[source] then
        return
    end
    stopAnimation()
    if value_1 and value_2 then
        if string.lower(value_1) == string.lower(var.animsElements[source].blockname) then
            local var = var.animsElements[source]
        end
        local var = var.animsElements[source]
    end
    setClientAnimation(var.animsElements[source].category, var.animsElements[source].id)
end

local function tripClient()
    if isElement(var.mainPanel) then
        return
    end
    var.mainPanel = hdxCreatePanel(0, 0, 430, 560, 4279834913)
    hdxSetElementRounded(var.mainPanel, 10)
    hdxSetElementGradientColor(var.mainPanel, 4279834913, 4279374359, false, true)
    hdxSetElementRelativePosition(var.mainPanel, "right", "top", false, 20, 302)
    hdxSetElementDragable(var.mainPanel, true)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 381, 48, 4280163878, var.mainPanel), 0)
    hdxSetElementGradientColor(hdxCreatePanel(0, 0, 381, 48, 4280163878, var.mainPanel), 4280163878, 1973798)
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 381, 48, 4280163878, var.mainPanel), var.mainPanel, "left", "top", false, 0, 12)
    hdxSetElementRelativePosition(hdxCreateLabel("Панель анимаций", 0, 0, 4294967295, "FuturaDemi", var_1(20), hdxCreatePanel(0, 0, 381, 48, 4280163878, var.mainPanel)), hdxCreatePanel(0, 0, 381, 48, 4280163878, var.mainPanel), "left", "center", false, 24, 0)
    var.close = hdxCreatePanel(0, 0, 32, 32, 234881023, hdxCreatePanel(0, 0, 381, 48, 4280163878, var.mainPanel))
    hdxSetElementRounded(var.close, 4)
    hdxSetElementColor(var.close, STATE_HOVERED, 4290715680)
    hdxSetElementRelativePosition(var.close, var.mainPanel, "right", "top", false, 24, 20)
    hdxSetElementDisabled(hdxCreateImage(0, 0, 14, 14, "assets/close.dds", 4294967295, var.close), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 14, 14, "assets/close.dds", 4294967295, var.close), var.close, "center", "center")
    var.anims = hdxCreateSpace(0, 0, 240, 464, "", var.mainPanel)
    hdxSetElementColor(var.anims, STATE_ALL, 16777215)
    hdxSetElementRelativePosition(var.anims, var.mainPanel, "right", "top", false, 24, 76)
    hdxSetElementScrollWidth(var.anims, 6)
    hdxSetElementScrollColor(var.anims, STATE_IDLE, 4280229671)
    hdxSetElementScrollColor(var.anims, STATE_HOVERED, 234881023)
    hdxSetElementScrollColor(var.anims, STATE_PRESSED, 234881023)
    hdxSetElementScrollTabWidth(var.anims, 15)
    addEventHandler("onHdxElementPressed", var.mainPanel, lockClient)
    updateAnimsCategories()
    if not animationList[next(var.categoriesID)] then
        return
    end
    selectCategory(next(var.categoriesID))
end

local var_5 = {
    id = "AnimationCamera",
    key = { "ПКМ" },
    text = "Управлять камерой",
}

local function var_6(arg1, arg2)
    if arg1 ~= "mouse2" then
        return
    end
    if not isAnimpanelVisible() then
        return
    end
    showCursor(not arg2)
end

openAnimpanel = function()
    if isAnimpanelVisible() then
        return
    end
    if isResourceStarted("Province_RP") then
        if exports.Province_RP:isLoginPanelVisible() then
            return
        end
    end
    if not isElement(var.mainPanel) then
        tripClient()
    end
    hdxSetElementVisible(var.mainPanel, true)
    showCursor(true)
    triggerEvent("notifications.addQuickButtons.client", localPlayer, var_5)
    if isEvent("onClientKey", root, var_6) then
        return
    end
    addEventHandler("onClientKey", root, var_6)
end

local function sub_1001(arg1)
    if arg1 then
        return
    end
    if not isElement(var.mainPanel) then
        return
    end
    if not hdxIsElementVisible(var.mainPanel) then
        return
    end
    if not isCursorShowing() then
        return
    end
    showCursor(false)
    showCursor(true)
end

addEventHandler("radialMenu:onVisibilityChange", root, sub_1001)

closeAnimpanel = function()
    if not isAnimpanelVisible() then
        return
    end
    hdxSetElementVisible(var.mainPanel, false)
    showCursor(false)
    triggerEvent("notifications.removeQuickButtons.client", localPlayer, var_5.id)
    if not isEvent("onClientKey", root, var_6) then
        return
    end
    removeEventHandler("onClientKey", root, var_6)
end

addEventHandler("onLogout", localPlayer, closeAnimpanel)
addEventHandler("onClientPlayerWasted", localPlayer, closeAnimpanel)
addEventHandler("onClientPlayerPreWasted", localPlayer, closeAnimpanel)

toggleAnimpanel = function()
    if isAnimpanelVisible() then
        closeAnimpanel()
    end
    openAnimpanel()
end

addEventHandler("f1", "down", toggleAnimpanel)
addCommandHandler("anims", toggleAnimpanel)
addEvent("animpanel:setAnimPanelVisible", true)
addEventHandler("animpanel:setAnimPanelVisible", root, toggleAnimpanel)

local function onClientKey(arg1, arg2)
    if arg1 ~= "escape" or not arg2 then
    end
    if not isAnimpanelVisible() then
        return
    end
    closeAnimpanel()
    cancelEvent()
end

addEventHandler("onClientKey", root, onClientKey)
local flag = false
local flag_9 = false
local var_10 = {
    id = "AnimationCancel",
    key = { "L SHIFT" },
    text = "Остановить анимацию",
}

local function onClientPreRender()
    if flag == value_1 then
        local value_1, value_2 = getPedAnimation(localPlayer)
    end
    if flag then
        if flag_9 then
            if value_3 and value_4 then
                updateAnimRow(value_3, value_4)
                local value_1, value_2 = getPedAnimation(localPlayer)
            end
            local value_1, value_2 = getPedAnimation(localPlayer)
        end
        local value_1, value_2 = getPedAnimation(localPlayer)
    end
    if value_2 then
        if currentAnim then
            if value_2 == currentAnim then
                triggerEvent("notifications.addQuickButtons.client", localPlayer, var_10)
                updateAnimRow(value_3, value_4)
                local value_1, value_2 = getPedAnimation(localPlayer)
            end
            local value_1, value_2 = getPedAnimation(localPlayer)
        end
        local value_1, value_2 = getPedAnimation(localPlayer)
    end
    if currentAnim then
        stopAnimation()
        local value_1, value_2 = getPedAnimation(localPlayer)
    end
    triggerEvent("notifications.removeQuickButtons.client", localPlayer, var_10.id)
    flag_9 = value_2
    flag = value_1
end

addEventHandler("onClientPreRender", root, onClientPreRender)

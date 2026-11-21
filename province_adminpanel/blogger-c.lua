-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}
local flag = false

local function sub_1001()
    if isElement(var.mainPanel) then
        return
    end
    var.mainPanel = hdxCreatePanel(0, 0, 800, 562, 4280361249)
    hdxSetElementRelativePosition(var.mainPanel, "center", "center")
    hdxSetElementDragable(var.mainPanel, true)
    hdxSetElementRounded(var.mainPanel, 30)
    hdxSetElementVisible(var.mainPanel, true)
    hdxSetElementRelativePosition(hdxCreateLabel("Список блогеров", 0, 0, 4294967295, "FuturaDemi", convertFigmaFontSize(30), var.mainPanel), var.mainPanel, "left", "top", false, 35, 33)
    hdxSetElementDisabled(hdxCreateLabel("Список блогеров", 0, 0, 4294967295, "FuturaDemi", convertFigmaFontSize(30), var.mainPanel), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/icon_cross.dds", 4294967295, var.mainPanel), var.mainPanel, "right", "top", false, 35, 35)
    hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/icon_cross.dds", 4294967295, var.mainPanel), STATE_HOVERED, tocolor(120, 120, 120, 255))
    hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/icon_cross.dds", 4294967295, var.mainPanel), STATE_PRESSED, tocolor(120, 120, 120, 255))
    hdxSetElementHoverAnim(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/icon_cross.dds", 4294967295, var.mainPanel), true, 1.05, 1.05)
    var.gridList = hdxCreateGridlist(0, 0, 735, 380, 0, 30, 4280361249, var.mainPanel)
    hdxSetGridlistRowSolidMode(var.gridList, true)
    hdxSetGridlistSelectionMode(var.gridList, "row")
    hdxSetListRowHeight(var.gridList, 48)
    hdxSetElementSlotRounded(var.gridList, 10)
    hdxSetElementTextColor(var.gridList, STATE_ALL, 4294967295)
    hdxSetElementFont(var.gridList, "FuturaBook", convertFigmaFontSize(20))
    hdxSetGridlistContentBackgroundColor(var.gridList, 4280361249)
    hdxSetGridlistColumnHeaderTextColor(var.gridList, 1, 4291611852)
    hdxSetGridlistColumnHeaderTextTab(var.gridList, 1, 5, -10)
    hdxSetGridlistRowColor(var.gridList, STATE_ALL, 4281545523)
    hdxSetGridlistRowColor(var.gridList, STATE_HOVERED, 4282400832)
    hdxSetGridlistRowColor(var.gridList, STATE_PRESSED, 4282992969)
    hdxInsertGridlistColumn(var.gridList, 1, "Логин", 700, 0)
    hdxSetElementScrollColor(var.gridList, STATE_ALL, 4283124555)
    hdxSetElementScrollWidth(var.gridList, 8)
    hdxSetElementScrollTabWidth(var.gridList, 16)
    hdxSetElementScrollColor(var.gridList, STATE_ALL, 4281545523)
    hdxSetElementScrollColor(var.gridList, STATE_HOVERED, 4282400832)
    hdxSetElementScrollColor(var.gridList, STATE_PRESSED, 4282992969)
    hdxSetElementRelativePosition(var.gridList, var.mainPanel, "left", "top", false, 10, 80)
    var.addBloggerButton = hdxCreateButton(0, 0, 160, 40, tocolor(71, 178, 125, 255), "Добавить", var.mainPanel)
    hdxSetElementRelativePosition(var.addBloggerButton, var.mainPanel, "right", "bottom", false, 35, 35)
    hdxSetElementColor(var.addBloggerButton, STATE_HOVERED, tocolor(71, 178, 125, 180))
    hdxSetElementColor(var.addBloggerButton, STATE_PRESSED, tocolor(71, 178, 125, 140))
    hdxSetElementRounded(var.addBloggerButton, 12)
    hdxSetElementFont(var.addBloggerButton, "FuturaBook", convertFigmaFontSize(16))
    var.removeBloggerButton = hdxCreateButton(0, 0, 160, 40, tocolor(217, 76, 76, 255), "Удалить", var.mainPanel)
    hdxSetElementRelativePosition(var.removeBloggerButton, var.addBloggerButton, "atleft", "center", false, 20, 0)
    hdxSetElementColor(var.removeBloggerButton, STATE_HOVERED, tocolor(217, 76, 76, 180))
    hdxSetElementColor(var.removeBloggerButton, STATE_PRESSED, tocolor(217, 76, 76, 140))
    hdxSetElementRounded(var.removeBloggerButton, 12)
    hdxSetElementFont(var.removeBloggerButton, "FuturaBook", convertFigmaFontSize(16))
    local var = hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/icon_cross.dds", 4294967295, var.mainPanel)
    local function sub_1002(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source == var then
            setBloggerACLPanelVisble(false)
        end
        if source == var.addBloggerButton then
            setAddBloggerPanelVisible(true)
        end
        if source ~= var.removeBloggerButton then
            return
        end
        if not hdxGetGridlistSelectedRow(var.gridList) or hdxGetGridlistSelectedRow(var.gridList) < 1 then
            outputNotification("Вы не выбрали блогера для удаления.")
            local var = hdxGetGridlistSelectedRow(var.gridList)
        end
        flag = hdxGetGridlistRowKey(var.gridList, hdxGetGridlistSelectedRow(var.gridList))
        setRemoveBloggerPanelVisible(true)
    end
    addEventHandler("onHdxElementPressed", var.mainPanel, sub_1002)
end

setBloggerACLPanelVisble = function(arg1, arg2)
    flag = false
    setAddBloggerPanelVisible(false)
    setRemoveBloggerPanelVisible(false)
    if arg1 then
        hdxSetGridlistContent(var.gridList, arg2)
        for k, v in pairs(arg2) do
            hdxSetGridlistRowKey(var.gridList, k, v[1])
        end
    end
    triggerServerEvent("adminpanel:onPlayerCloseACLPanel", resourceRoot)
    hdxSetElementVisible(var.mainPanel, arg1)
    showCursor(arg1)
end

addEvent("adminpanel:setBloggerAclPanelVisible", true)
addEventHandler("adminpanel:setBloggerAclPanelVisible", resourceRoot, setBloggerACLPanelVisble)

local function var_2()
    if isElement(var.addBloggerPanel) then
        return
    end
    var.addBloggerPanel = hdxCreatePanel(0, 0, 480, 200, tocolor(45, 45, 45))
    hdxSetElementRelativePosition(var.addBloggerPanel, "center", "center")
    hdxSetElementRounded(var.addBloggerPanel, 30)
    hdxSetElementTopRenderOrder(var.addBloggerPanel, true)
    hdxSetElementDragable(var.addBloggerPanel, true)
    hdxSetElementRelativePosition(hdxCreateLabel("Добавление ACL блогера", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(26), var.addBloggerPanel), var.addBloggerPanel, "left", "top", false, 35, 33)
    hdxSetElementDisabled(hdxCreateLabel("Добавление ACL блогера", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(26), var.addBloggerPanel), true)
    var.editLoginAdd = hdxCreateEditbox(0, 0, 410, 44, tocolor(38, 38, 38), "Введите логин", false, 80, var.addBloggerPanel, "FuturaBook", convertFigmaFontSize(20), tocolor(255, 255, 255))
    hdxSetElementRelativePosition(var.editLoginAdd, var.addBloggerPanel, "left", "top", false, 35, 80)
    hdxSetElementRounded(var.editLoginAdd, 10)
    hdxSetEditboxPlaceholderColor(var.editLoginAdd, STATE_ALL, tocolor(77, 77, 77))
    var.confirmButton = hdxCreateButton(0, 0, 160, 40, tocolor(71, 178, 125, 255), "Добавить", var.addBloggerPanel)
    hdxSetElementRelativePosition(var.confirmButton, var.addBloggerPanel, "right", "bottom", false, 70, 15)
    hdxSetElementColor(var.confirmButton, STATE_HOVERED, tocolor(71, 178, 125, 180))
    hdxSetElementColor(var.confirmButton, STATE_PRESSED, tocolor(71, 178, 125, 140))
    hdxSetElementRounded(var.confirmButton, 12)
    hdxSetElementFont(var.confirmButton, "FuturaBook", convertFigmaFontSize(16))
    var.cancelAddButton = hdxCreateButton(0, 0, 160, 40, tocolor(217, 76, 76, 255), "Отмена", var.addBloggerPanel)
    hdxSetElementRelativePosition(var.cancelAddButton, var.confirmButton, "atleft", "center", false, 20, 0)
    hdxSetElementColor(var.cancelAddButton, STATE_HOVERED, tocolor(217, 76, 76, 180))
    hdxSetElementColor(var.cancelAddButton, STATE_PRESSED, tocolor(217, 76, 76, 140))
    hdxSetElementRounded(var.cancelAddButton, 12)
    hdxSetElementFont(var.cancelAddButton, "FuturaBook", convertFigmaFontSize(16))
    local function sub_1003(arg1, arg2)
        if arg1 ~= "left" or not arg2 then
        end
        if source == var.cancelAddButton then
            setAddBloggerPanelVisible(false)
        end
        if source ~= var.confirmButton then
            return
        end
        if not hdxGetEditboxText(var.editLoginAdd) or hdxGetEditboxText(var.editLoginAdd) == "" then
            outputNotification("Поле ввода не может быть пустым")
            local var = hdxGetEditboxText(var.editLoginAdd)
        end
        triggerServerEvent("adminpanel:addBloggerInACL", resourceRoot, hdxGetEditboxText(var.editLoginAdd))
        setAddBloggerPanelVisible(false)
    end
    addEventHandler("onHdxElementPressed", sub_1003.addBloggerPanel, sub_1003)
end

setAddBloggerPanelVisible = function(arg1)
    if not isElement(var.addBloggerPanel) then
        var_2()
    end
    if arg1 then
        hdxSetEditboxText(var.editLoginAdd, "")
    end
    hdxSetElementVisible(var.addBloggerPanel, arg1)
    if not arg1 then
        return
    end
    hdxSetElementTopRenderOrder(var.addBloggerPanel, true)
end

local function lockClient()
    if isElement(var.removeBloggerPanel) then
        return
    end
    var.removeBloggerPanel = hdxCreatePanel(0, 0, 480, 200, tocolor(45, 45, 45))
    hdxSetElementRelativePosition(var.removeBloggerPanel, "center", "center")
    hdxSetElementRounded(var.removeBloggerPanel, 30)
    hdxSetElementTopRenderOrder(var.removeBloggerPanel, true)
    hdxSetElementDragable(var.removeBloggerPanel, true)
    hdxSetElementRelativePosition(hdxCreateLabel("Удаление ACL блогера", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(26), var.removeBloggerPanel), var.removeBloggerPanel, "left", "top", false, 35, 33)
    hdxSetElementDisabled(hdxCreateLabel("Удаление ACL блогера", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(26), var.removeBloggerPanel), true)
    var.loginText = hdxCreateLabel("Вы действительно хотите удалить login из списка блогеров?", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var.removeBloggerPanel)
    hdxSetElementRelativePosition(var.loginText, hdxCreateLabel("Удаление ACL блогера", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(26), var.removeBloggerPanel), "left", "under", false, 0, 10)
    hdxSetLabelWordwrapped(var.loginText, true, 410)
    hdxSetElementDisabled(var.loginText, true)
    var.cancelRemoveButton = hdxCreateButton(0, 0, 160, 40, tocolor(71, 178, 125, 255), "Отмена", var.removeBloggerPanel)
    hdxSetElementRelativePosition(var.cancelRemoveButton, var.removeBloggerPanel, "right", "bottom", false, 70, 15)
    hdxSetElementColor(var.cancelRemoveButton, STATE_HOVERED, tocolor(71, 178, 125, 180))
    hdxSetElementColor(var.cancelRemoveButton, STATE_PRESSED, tocolor(71, 178, 125, 140))
    hdxSetElementRounded(var.cancelRemoveButton, 12)
    hdxSetElementFont(var.cancelRemoveButton, "FuturaBook", convertFigmaFontSize(16))
    var.acceptRemoveButton = hdxCreateButton(0, 0, 160, 40, tocolor(217, 76, 76, 255), "Удалить", var.removeBloggerPanel)
    hdxSetElementRelativePosition(var.acceptRemoveButton, var.confirmButton, "atleft", "center", false, 20, 0)
    hdxSetElementColor(var.acceptRemoveButton, STATE_HOVERED, tocolor(217, 76, 76, 180))
    hdxSetElementColor(var.acceptRemoveButton, STATE_PRESSED, tocolor(217, 76, 76, 140))
    hdxSetElementRounded(var.acceptRemoveButton, 12)
    hdxSetElementFont(var.acceptRemoveButton, "FuturaBook", convertFigmaFontSize(16))
    local function sub_1004(arg1, arg2)
        if arg1 ~= "left" or not arg2 then
        end
        if source == var.cancelRemoveButton then
            setRemoveBloggerPanelVisible(false)
        end
        if source == var.acceptRemoveButton then
            if flag then
                triggerServerEvent("adminpanel:removeBloggerFromACL", resourceRoot, flag)
            end
            setRemoveBloggerPanelVisible(false)
        end
    end
    addEventHandler("onHdxElementPressed", sub_1004.removeBloggerPanel, sub_1004)
end

setRemoveBloggerPanelVisible = function(arg1)
    if not isElement(var.removeBloggerPanel) then
        lockClient()
    end
    hdxSetElementVisible(var.removeBloggerPanel, arg1)
    if not arg1 then
        return
    end
    hdxSetElementTopRenderOrder(var.removeBloggerPanel, true)
    hdxSetElementText(var.loginText, string.format("Вы действительно хотите удалить %s из списка блогеров?", (flag or "")))
end

addEvent("adminpanel:updateBloggerACLList", true)

local function sub_1005(arg1)
    setRemoveBloggerPanelVisible(false)
    hdxSetGridlistContent(var.gridList, arg1)
    hdxSetGridlistRowSelected(var.gridList, 0)
    for k, v in pairs(arg1) do
        hdxSetGridlistRowKey(var.gridList, k, v[1])
    end
end

addEventHandler("adminpanel:updateBloggerACLList", resourceRoot, sub_1005)

local function onLogout()
    if not isElement(var.mainPanel) then
        return
    end
    if not hdxIsElementVisible(var.mainPanel) then
        return
    end
    setBloggerACLPanelVisble(false)
end

addEventHandler("onLogout", root, onLogout)

local function onClientKey(arg1, arg2)
    if arg1 ~= "escape" or not arg2 then
    end
    if not isElement(var.mainPanel) then
        return
    end
    if not hdxIsElementVisible(var.mainPanel) then
        return
    end
    setBloggerACLPanelVisble(false)
    cancelEvent()
end

addEventHandler("onClientKey", root, onClientKey)

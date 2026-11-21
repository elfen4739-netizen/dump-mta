-- ByteRevenant
-- LuaQ 5.1 structured decompile

aScreenShotWindows = {}
aScreenShotForm = nil

aPlayerScreenShot = function(arg1)
    if aScreenShotForm == nil then
        aScreenShotForm = guiCreateWindow(screenX / 2 - 300, screenY / 2 - 125, 600, 250, "Скриншоты", false)
        aScreenShotList = guiCreateGridList(0.029999999999999999, 0.080000000000000002, 0.69999999999999996, 0.90000000000000002, true, aScreenShotForm)
        aScreenShotNew = guiCreateButton(0.75, 0.080000000000000002, 0.41999999999999998, 0.089999999999999997, "Снять новый", true, aScreenShotForm)
        aScreenShotDelete = guiCreateButton(0.75, 0.17999999999999999, 0.41999999999999998, 0.089999999999999997, "Удалить", true, aScreenShotForm)
        aScreenShotView = guiCreateButton(0.75, 0.28000000000000003, 0.41999999999999998, 0.089999999999999997, "Просмотр", true, aScreenShotForm)
        aScreenShotRefresh = guiCreateButton(0.75, 0.38, 0.41999999999999998, 0.089999999999999997, "Обновить", true, aScreenShotForm)
        aScreenShotClose = guiCreateButton(0.75, 0.88, 0.41999999999999998, 0.089999999999999997, "Закрыть", true, aScreenShotForm)
        guiGridListAddColumn(aScreenShotList, "Игрок", 0.31)
        guiGridListAddColumn(aScreenShotList, "Админ", 0.31)
        guiGridListAddColumn(aScreenShotList, "Дата", 0.27000000000000002)
        addEventHandler("onClientGUIClick", aScreenShotForm, aScreenShotsClick)
        addEventHandler("onClientGUIDoubleClick", aScreenShotForm, aScreenShotsDoubleClick)
        addEventHandler("PlayerScreenShot", aScreenShotForm, aPlayerScreenShot, aPlayerScreenShotClose)
    end
    guiSetVisible(aScreenShotForm, true)
    guiBringToFront(aScreenShotForm)
    aScreenShotsRefresh()
end

aScreenShotsRefresh = function()
    if not aScreenShotList then
        return
    end
    guiGridListClear(aScreenShotList)
    addEventHandler("aScreenShot", resourceRoot, "list", localPlayer)
end

aPlayerScreenShotClose = function()
    if not aScreenShotForm then
        return
    end
    addEventHandler("onClientGUIClick", aScreenShotForm, aScreenShotsClick)
    addEventHandler("onClientGUIDoubleClick", aScreenShotForm, aScreenShotsDoubleClick)
    destroyElement(aScreenShotForm)
    aScreenShotForm = nil
    aScreenShotClose = nil
    aScreenShotRefresh = nil
    aScreenShotView = nil
    aScreenShotDelete = nil
    aScreenShotNew = nil
    aScreenShotList = nil
    aScreenShotForm = nil
end

aScreenShotsDoubleClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source ~= aScreenShotList then
        return
    end
    if guiGridListGetSelectedItem(aScreenShotList) == -1 then
        return
    end
    triggerServerEvent("aScreenShot", resourceRoot, "view", localPlayer, guiGridListGetItemData(aScreenShotList, guiGridListGetSelectedItem(aScreenShotList), 1), guiGridListGetItemText(aScreenShotList, guiGridListGetSelectedItem(aScreenShotList), 1))
end

aScreenShotsClick = function(arg1)
    if source == aScreenShotClose then
        aPlayerScreenShotClose()
    end
    if source == aScreenShotNew then
        if guiGridListGetSelectedItem(aTab1.PlayerList) == -1 then
            aMessageBox("error", "Игрок не выбран!")
        end
        triggerServerEvent("aScreenShot", resourceRoot, "new", localPlayer, guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))
    end
    if source == aScreenShotDelete then
        triggerServerEvent("aScreenShot", resourceRoot, "delete", localPlayer, guiGridListGetItemData(aScreenShotList, guiGridListGetSelectedItem(aScreenShotList), 1))
        guiGridListRemoveRow(aScreenShotList, guiGridListGetSelectedItem(aScreenShotList))
    end
    if source == aScreenShotRefresh then
        aScreenShotsRefresh()
    end
    if source == aScreenShotView then
        local var = "view"
    end
    for k, v in pairs(aScreenShotWindows) do
        destroyElement(v.window)
        aScreenShotWindows[k] = nil
    end
end

addEvent("aClientScreenShot", true)

local function sub_1001(arg1, arg2, arg3, arg4, arg5, arg6)
    if arg1 == "new" then
        aScreenShotWindows[arg2] = {}
        aScreenShotWindows[arg2].window = guiCreateWindow(screenX / 2 - 400, screenY / 2 - 300, 800, 600, getPlayerNametagText(arg2), false)
        aScreenShotWindows[arg2].button = guiCreateButton(0.82999999999999996, 0.94999999999999996, 0.69999999999999996, 0.40000000000000002, "Закрыть", true, aScreenShotWindows[arg2].window)
        addEventHandler("onClientGUIClick", aScreenShotWindows[arg2].button, aScreenShotsClick)
        guiLabelSetHorizontalAlign(aScreenShotWindows[arg2].label, "center")
        guiLabelSetVerticalAlign(aScreenShotWindows[arg2].label, "center")
        local var = aScreenShotWindows[arg2].label
    end
    if arg1 == "list" then
        guiGridListClear(aScreenShotList)
        for k, v in ipairs(arg3) do
            guiGridListSetItemText(aScreenShotList, guiGridListAddRow(aScreenShotList), 1, v.player, false, false)
            guiGridListSetItemText(aScreenShotList, guiGridListAddRow(aScreenShotList), 2, v.admin, false, false)
            guiGridListSetItemText(aScreenShotList, guiGridListAddRow(aScreenShotList), 3, v.realtime, false, false)
            guiGridListSetItemData(aScreenShotList, guiGridListAddRow(aScreenShotList), 1, v.id)
        end
    end
    if arg1 == "view" then
        fileWrite(fileCreate("screenshots/" .. tostring(getRealTime().timestamp) .. ".jpg"), arg3)
        fileClose(fileCreate("screenshots/" .. tostring(getRealTime().timestamp) .. ".jpg"))
        aScreenShotWindows[arg2].screenshot = guiCreateStaticImage(0, 0, 1, 1, "screenshots/" .. tostring(getRealTime().timestamp) .. ".jpg", true, aScreenShotWindows[arg2].window)
        addEventHandler("onClientGUIClick", aScreenShotWindows[arg2].screenshot, aScreenShotsClick)
        guiBringToFront(aScreenShotWindows[arg2].button)
        guiGridListSetItemText(aScreenShotList, guiGridListAddRow(aScreenShotList), 1, getPlayerNametagText(arg2), false, false)
        guiGridListSetItemText(aScreenShotList, guiGridListAddRow(aScreenShotList), 2, arg4, false, false)
        guiGridListSetItemText(aScreenShotList, guiGridListAddRow(aScreenShotList), 3, arg5, false, false)
        guiGridListSetItemData(aScreenShotList, guiGridListAddRow(aScreenShotList), 1, arg6)
    end
    if arg1 == "minimized" then
        guiSetText(aScreenShotWindows[arg2].label, "Игрок свернул игру, повторите позднее")
    end
    if arg1 == "disabled" then
        guiSetText(aScreenShotWindows[arg2].label, "Игрок не разрешает делать скриншоты")
    end
    guiSetText(aScreenShotWindows[arg2].label, "Игрок вышел")
end

addEventHandler("aClientScreenShot", resourceRoot, sub_1001)

-- ByteRevenant
-- LuaQ 5.1 structured decompile

aWarpForm = r0

aPlayerWarp = function(arg1)
    if aWarpForm == nil then
        aWarpForm = guiCreateWindow(screenX / 2 - 110, screenY / 2 - 150, 200, 300, "Телепортация игрока", false)
        aWarpList = guiCreateGridList(0.029999999999999999, 0.080000000000000002, 0.93999999999999995, 0.72999999999999998, true, aWarpForm)
        guiGridListAddColumn(aWarpList, "Игрок", 0.90000000000000002)
        aWarpSelect = guiCreateButton(0.029999999999999999, 0.81999999999999995, 0.93999999999999995, 0.074999999999999997, "Выбрать", true, aWarpForm)
        aWarpCancel = guiCreateButton(0.029999999999999999, 0.90000000000000002, 0.93999999999999995, 0.074999999999999997, "Отмена", true, aWarpForm)
        addEventHandler("onClientGUIDoubleClick", aWarpForm, aClientWarpDoubleClick)
        addEventHandler("onClientGUIClick", aWarpForm, aClientWarpClick)
        addEventHandler("PlayerWarp", aWarpForm, aPlayerWarp, aPlayerWarpClose)
        local var = "PlayerWarp"
        local var_1 = "Отмена"
    end
    guiGridListClear(aWarpList)
    for k, v in ipairs(getElementsByType("player")) do
        guiGridListSetItemPlayer(aWarpList, nil, 1, v, false, false)
    end
    guiSetVisible(aWarpForm, true)
    guiBringToFront(aWarpForm)
end

aPlayerWarpClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIDoubleClick", aWarpForm, aClientWarpDoubleClick)
        addEventHandler("onClientGUIClick", aWarpForm, aClientWarpClick)
        destroyElement(aWarpForm)
        aWarpForm = nil
    end
    guiSetVisible(aWarpForm, false)
end

aClientWarpDoubleClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source ~= aWarpList then
        return
    end
    if guiGridListGetSelectedItem(aWarpList) == -1 then
        return
    end
    triggerServerEvent("aPlayer", getLocalPlayer(), aWarpSelectPointer, "warpto", guiGridListGetItemPlayer(aWarpList, guiGridListGetSelectedItem(aWarpList), 1))
    aPlayerWarpClose(false)
end

aClientWarpClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aWarpSelect then
        triggerServerEvent("aPlayer", getLocalPlayer(), aWarpSelectPointer, "warpto", guiGridListGetItemPlayer(aWarpList, guiGridListGetSelectedItem(aWarpList), 1))
        aPlayerWarpClose(false)
    end
    if source ~= aWarpCancel then
        return
    end
    aPlayerWarpClose(false)
end

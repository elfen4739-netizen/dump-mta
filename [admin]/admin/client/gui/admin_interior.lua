-- ByteRevenant
-- LuaQ 5.1 structured decompile

aInteriorForm = r0

aPlayerInterior = function(arg1)
    if aInteriorForm == nil then
        aInteriorForm = guiCreateWindow(screenX / 2 - 110, screenY / 2 - 150, 220, 300, "Выбор интерьера", false)
        aInteriorList = guiCreateGridList(0.029999999999999999, 0.080000000000000002, 0.93999999999999995, 0.72999999999999998, true, aInteriorForm)
        guiGridListAddColumn(aInteriorList, "Мир", 0.20000000000000001)
        guiGridListAddColumn(aInteriorList, "Описание", 0.75)
        aInteriorSelect = guiCreateButton(0.029999999999999999, 0.81999999999999995, 0.93999999999999995, 0.074999999999999997, "Выбрать", true, aInteriorForm)
        aInteriorCancel = guiCreateButton(0.029999999999999999, 0.90000000000000002, 0.93999999999999995, 0.074999999999999997, "Отмена", true, aInteriorForm)
        if xmlLoadFile("conf\\interiors.xml") then
            if xmlFindChild(xmlLoadFile("conf\\interiors.xml"), "interior", 0) ~= false then
                guiGridListSetItemText(aInteriorList, guiGridListAddRow(aInteriorList), 1, xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("conf\\interiors.xml"), "interior", 0), "world"), false, true)
                guiGridListSetItemText(aInteriorList, guiGridListAddRow(aInteriorList), 2, xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("conf\\interiors.xml"), "interior", 0), "id"), false, false)
                local var = xmlLoadFile("conf\\interiors.xml")
            end
            xmlUnloadFile(xmlLoadFile("conf\\interiors.xml"))
        end
        addEventHandler("onClientGUIDoubleClick", aInteriorForm, aClientInteriorDoubleClick)
        addEventHandler("onClientGUIClick", aInteriorForm, aClientInteriorClick)
        addEventHandler("PlayerInterior", aInteriorForm, aPlayerInterior, aPlayerInteriorClose)
    end
    guiSetVisible(aInteriorForm, true)
    guiBringToFront(aInteriorForm)
end

aPlayerInteriorClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIDoubleClick", aInteriorForm, aClientInteriorDoubleClick)
        addEventHandler("onClientGUIClick", aInteriorForm, aClientInteriorClick)
        destroyElement(aInteriorForm)
        aInteriorForm = nil
    end
    guiSetVisible(aInteriorForm, false)
end

aClientInteriorDoubleClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source ~= aInteriorList then
        return
    end
    if guiGridListGetSelectedItem(aInteriorList) == -1 then
        return
    end
    triggerServerEvent("aPlayer", getLocalPlayer(), aInteriorSelectPointer, "setinterior", guiGridListGetItemText(aInteriorList, guiGridListGetSelectedItem(aInteriorList), 2))
    aPlayerInteriorClose(false)
end

aClientInteriorClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aInteriorSelect then
        triggerServerEvent("aPlayer", getLocalPlayer(), aInteriorSelectPointer, "setinterior", guiGridListGetItemText(aInteriorList, guiGridListGetSelectedItem(aInteriorList), 2))
        guiSetVisible(aInteriorForm, false)
    end
    if source ~= aInteriorCancel then
        return
    end
    aPlayerInteriorClose(false)
end

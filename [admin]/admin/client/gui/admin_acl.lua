-- ByteRevenant
-- LuaQ 5.1 structured decompile

aAclForm = r0
aAclData = {}

aManageACL = function()
    if aAclForm == nil then
        aAclData.group_objects = {}
        aAclData.group_acls = {}
        aAclData.acl_rights = {}
        aAclForm = guiCreateWindow(screenX / 2 - 230, screenY / 2 - 250, 460, 500, "Управление ACL", false)
        aACLList = guiCreateGridList(0.029999999999999999, 0.050000000000000003, 0.5, 0.90000000000000002, true, aAclForm)
        guiGridListSetSortingEnabled(aACLList, false)
        guiGridListAddColumn(aACLList, "", 0.10000000000000001)
        guiGridListAddColumn(aACLList, "", 0.84999999999999998)
        aACLCreateGroup = guiCreateButton(0.55000000000000004, 0.050000000000000003, 0.40000000000000002, 0.040000000000000001, "Создать группу", true, aAclForm)
        aACLCreateACL = guiCreateButton(0.55000000000000004, 0.10000000000000001, 0.40000000000000002, 0.040000000000000001, "Создать ACL", true, aAclForm)
        aACLLabel = guiCreateLabel(0.55000000000000004, 0.19, 0.40000000000000002, 0.040000000000000001, "", true, aAclForm)
        aACLSeparator = guiCreateStaticImage(0.55000000000000004, 0.23499999999999999, 0.40000000000000002, 0.0025000000000000001, "client\\images\\dot.png", true, aAclForm)
        aACLDestroyGroup = guiCreateButton(0.55000000000000004, 0.25, 0.40000000000000002, 0.040000000000000001, "Удалить группу", true, aAclForm)
        aACLDestroyACL = guiCreateButton(0.55000000000000004, 0.25, 0.40000000000000002, 0.040000000000000001, "Удалить ACL", true, aAclForm)
        aACLAddObject = guiCreateButton(0.55000000000000004, 0.29999999999999999, 0.40000000000000002, 0.040000000000000001, "Добавить объект", true, aAclForm)
        aACLRemoveObject = guiCreateButton(0.55000000000000004, 0.34999999999999998, 0.40000000000000002, 0.040000000000000001, "Удалить объект", true, aAclForm)
        aACLAddACL = guiCreateButton(0.55000000000000004, 0.40000000000000002, 0.40000000000000002, 0.040000000000000001, "Добавить ACL", true, aAclForm)
        aACLRemoveACL = guiCreateButton(0.55000000000000004, 0.45000000000000001, 0.40000000000000002, 0.040000000000000001, "Убрать ACL", true, aAclForm)
        aACLActionLabel = guiCreateLabel(0.55000000000000004, 0.31, 0.40000000000000002, 0.040000000000000001, "", true, aAclForm)
        aACLDropCurrent = guiCreateEdit(0.55000000000000004, 0.34999999999999998, 0.40000000000000002, 0.040000000000000001, "", true, aAclForm)
        guiSetEnabled(aACLDropCurrent, false)
        aACLDropDown = guiCreateStaticImage(0.91000000000000003, 0.34999999999999998, 0.040000000000000001, 0.040000000000000001, "client\\images\\dropdown.png", true, aAclForm)
        aACLDropList = guiCreateGridList(0.55000000000000004, 0.34999999999999998, 0.40000000000000002, 0.29999999999999999, true, aAclForm)
        guiGridListAddColumn(aACLDropList, "", 0.84999999999999998)
        guiSetVisible(aACLDropList, false)
        aACLOk = guiCreateButton(0.55000000000000004, 0.40000000000000002, 0.19, 0.040000000000000001, "OK", true, aAclForm)
        aACLCancel = guiCreateButton(0.76000000000000001, 0.40000000000000002, 0.19, 0.040000000000000001, "Отменить", true, aAclForm)
        aACLAddRight = guiCreateButton(0.55000000000000004, 0.29999999999999999, 0.40000000000000002, 0.040000000000000001, "Добавить право", true, aAclForm)
        aACLExit = guiCreateButton(0.75, 0.90000000000000002, 0.27000000000000002, 0.040000000000000001, "Закрыть", true, aAclForm)
        aclDisplayOptions("", "")
        addEvent("aAdminACL", true)
        addEventHandler("aAdminACL", localPlayer, aAdminACL)
        addEventHandler("onClientGUIClick", aAclForm, aClientACLClick)
        addEventHandler("onClientGUIDoubleClick", aAclForm, aClientACLDoubleClick)
        addEventHandler("ACLManage", aAclForm, aManageACL, aACLClose)
        triggerServerEvent("aAdmin", localPlayer, "sync", "aclgroups")
    end
    guiSetVisible(aAclForm, true)
    guiBringToFront(aAclForm)
end

aACLClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIClick", aAclForm, aClientACLClick)
        addEventHandler("onClientGUIDoubleClick", aAclForm, aClientACLDoubleClick)
        destroyElement(aAclForm)
        aAclForm = nil
    end
    guiSetVisible(aAclForm, false)
end

aAdminACL = function(arg1, arg2)
    guiGridListClear(aACLList)
    if arg1 == "aclgroups" then
        aAclData.viewing = nil
        aAclData.group_row = guiGridListAddRow(aACLList)
        guiGridListSetItemText(aACLList, aAclData.group_row, 2, "Группы:", true, false)
        aAclData.groups = arg2.groups
        for k, v in ipairs(arg2.groups) do
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "+", false, false)
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, v, false, false)
        end
        aAclData.acl_row = guiGridListAddRow(aACLList)
        guiGridListSetItemText(aACLList, aAclData.acl_row, 2, "ACL:", true, false)
        aAclData.acl = arg2.acl
        for k, v in ipairs(arg2.acl) do
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "+", false, false)
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, v, false, false)
        end
        aclDisplayOptions("", "")
    end
    if arg1 == "aclobjects" then
        aAclData.group_row = guiGridListAddRow(aACLList)
        guiGridListSetItemText(aACLList, aAclData.group_row, 2, "Группы:", true, false)
        for k, v in ipairs(aAclData.groups) do
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, v, false, false)
            if v == arg2.name then
                aclDisplayOptions("Группа", arg2.name)
                aAclData.objects_row = guiGridListAddRow(aACLList)
                aAclData.group_objects[v] = arg2.objects
                guiGridListSetItemText(aACLList, aAclData.objects_row, 2, "  объекты:", true, false)
                for k, v in ipairs(arg2.objects) do
                    guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, "  " .. v, false, false)
                    local var = guiGridListAddRow(aACLList)
                end
                aAclData.acls_row = guiGridListAddRow(aACLList)
                aAclData.group_acls[v] = arg2.acl
                guiGridListSetItemText(aACLList, aAclData.acls_row, 2, "  acl:", true, false)
                for k, v in ipairs(arg2.acl) do
                    guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, "  " .. v, false, false)
                    local var = guiGridListAddRow(aACLList)
                end
                guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "-", false, false)
                local var = guiGridListAddRow(aACLList)
            end
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "+", false, false)
        end
        aAclData.acl_row = guiGridListAddRow(aACLList)
        guiGridListSetItemText(aACLList, aAclData.acl_row, 2, "ACL:", true, false)
        for k, v in ipairs(aAclData.acl) do
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "+", false, false)
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, v, false, false)
        end
    end
    aAclData.viewing = "rights"
    aAclData.group_row = guiGridListAddRow(aACLList)
    guiGridListSetItemText(aACLList, aAclData.group_row, 2, "Группы:", true, false)
    for k, v in ipairs(aAclData.groups) do
        guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "+", false, false)
        guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, v, false, false)
    end
    aAclData.acl_row = guiGridListAddRow(aACLList)
    guiGridListSetItemText(aACLList, aAclData.acl_row, 2, "ACL:", true, false)
    for k, v in ipairs(aAclData.acl) do
        guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, v, false, false)
        if v == arg2.name then
            aAclData.acl_rights[v] = arg2.rights
            aclDisplayOptions("ACL", arg2.name)
            aAclData.rights_row = guiGridListAddRow(aACLList)
            guiGridListSetItemText(aACLList, aAclData.rights_row, 2, "  права:", true, false)
            for k, v in pairs(arg2.rights) do
                guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 2, "  " .. k, false, false)
                if guiGridListSetItemColor then
                    if v then
                        local var = guiGridListAddRow(aACLList)
                        local var_1 = guiGridListAddRow(aACLList)
                    end
                    if v then
                        local var = guiGridListAddRow(aACLList)
                        local var_1 = guiGridListAddRow(aACLList)
                    end
                    guiGridListSetItemColor(aACLList, guiGridListAddRow(aACLList), 2, 255, 0, 0, 255)
                    local var = guiGridListAddRow(aACLList)
                end
                local var = guiGridListAddRow(aACLList)
            end
            guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "-", false, false)
            local var = guiGridListAddRow(aACLList)
        end
        guiGridListSetItemText(aACLList, guiGridListAddRow(aACLList), 1, "+", false, false)
    end
end

aClientACLDoubleClick = function(arg1)
    if source == aACLList then
        if aAclData.acl_row < guiGridListGetSelectedItem(aACLList) then
            for k, v in ipairs(aAclData.acl) do
                if v == guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2) then
                    if guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 1) == "-" then
                        triggerServerEvent("aAdmin", localPlayer, "sync", "aclgroups")
                        local var = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2)
                        local var_1 = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 1)
                    end
                    triggerServerEvent("aAdmin", localPlayer, "sync", "aclrights", guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2))
                    local var = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2)
                    local var_1 = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 1)
                end
                local var = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2)
                local var_1 = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 1)
            end
            local var = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2)
            local var_1 = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 1)
        end
        for k, v in ipairs(aAclData.groups) do
            if v == guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2) then
                if guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 1) == "-" then
                    triggerServerEvent("aAdmin", localPlayer, "sync", "aclgroups")
                    local var = guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2)
                end
                triggerServerEvent("aAdmin", localPlayer, "sync", "aclobjects", guiGridListGetItemText(aACLList, guiGridListGetSelectedItem(aACLList), 2))
            end
        end
    end
    guiSetText(aACLDropCurrent, guiGridListGetItemText(aACLDropList, guiGridListGetSelectedItem(aACLDropList), 1))
    guiSetVisible(aACLDropList, false)
end

aClientACLClick = function(arg1)
    if source ~= aACLDropList then
        guiSetVisible(aACLDropList, false)
    end
    if source == aACLExit then
        aACLClose(false)
    end
    if source == aACLCreateGroup then
        aInputBox("Создать ACL группу", "Введите название группы:", "", "aclCreateGroup")
    end
    if source == aACLCreateACL then
        aInputBox("Создать ACL", "Введите название acl:", "", "aclCreate")
    end
    if source == aACLAddObject then
        aInputBox("Создать ACL группу", "Введите название объекта:", "", "aclAddObject", aAclData.current)
    end
    if source == aACLAddRight then
        aInputBox("Создать ACL", "Введите название права:", "", "aclAddRight", aAclData.current)
    end
    if source == aACLDestroyGroup then
        aMessageBox("warning", "Вы точно хотите уничтожить группу " .. aAclData.current .. "?", "aclDestroyGroup", aAclData.current)
    end
    if source == aACLDestroyACL then
        aMessageBox("warning", "Вы точно хотите уничтожить ACL " .. aAclData.current .. "?", "aclDestroy", aAclData.current)
    end
    guiSetVisible(aACLAddObject, false)
    guiSetVisible(aACLRemoveObject, false)
    guiSetVisible(aACLAddACL, false)
    guiSetVisible(aACLRemoveACL, false)
    guiSetVisible(aACLDropCurrent, true)
    guiSetVisible(aACLDropDown, true)
    guiSetVisible(aACLOk, true)
    guiSetVisible(aACLCancel, true)
    guiSetVisible(aACLActionLabel, true)
    guiGridListClear(aACLDropList)
    guiSetText(aACLActionLabel, guiGetText(source) .. ":")
    if source == aACLRemoveACL then
        local var = aAclData.group_acls[aAclData.current]
    end
    if 1 <= #nil then
        guiSetText(aACLDropCurrent, nil[1])
    end
    for k, v in ipairs({}) do
        guiGridListSetItemText(aACLDropList, guiGridListAddRow(aACLDropList), 1, v, false, false)
    end
    if source == aACLDropDown then
        guiSetVisible(aACLDropList, true)
        guiBringToFront(aACLDropList)
    end
    if source == aACLCancel then
        aclDisplayOptions(aAclData.viewing, aAclData.current)
    end
    if guiGetText(aACLActionLabel) == "Удалить объект:" then
        triggerServerEvent("aAdmin", localPlayer, "aclremove", "object", aAclData.current, guiGetText(aACLDropCurrent))
        local var = guiGetText(aACLActionLabel)
    end
    if guiGetText(aACLActionLabel) == "Добавить ACL:" then
        triggerServerEvent("aAdmin", localPlayer, "acladd", "acl", aAclData.current, guiGetText(aACLDropCurrent))
        local var = guiGetText(aACLActionLabel)
    end
    triggerServerEvent("aAdmin", localPlayer, "aclremove", "acl", aAclData.current, guiGetText(aACLDropCurrent))
end

aclDisplayOptions = function(arg1, arg2)
    guiSetVisible(aACLSeparator, false)
    aAclData.viewing = arg1
    if arg1 ~= "" then
        aAclData.current = arg2
        guiSetVisible(aACLSeparator, true)
        guiSetText(aACLLabel, arg1 .. ": " .. arg2)
    end
    aAclData.current = ""
    guiSetText(aACLLabel, "")
    guiSetVisible(aACLDestroyGroup, false)
    guiSetVisible(aACLDestroyACL, false)
    guiSetVisible(aACLAddObject, false)
    guiSetVisible(aACLRemoveObject, false)
    guiSetVisible(aACLAddACL, false)
    guiSetVisible(aACLRemoveACL, false)
    guiSetVisible(aACLAddRight, false)
    guiSetVisible(aACLDropCurrent, false)
    guiSetVisible(aACLDropList, false)
    guiSetVisible(aACLDropDown, false)
    guiSetVisible(aACLCancel, false)
    guiSetVisible(aACLOk, false)
    guiSetVisible(aACLActionLabel, false)
    if arg1 == "ACL" then
        guiSetVisible(aACLDestroyACL, true)
        guiSetVisible(aACLAddRight, true)
    end
    if arg1 ~= "Группа" then
        return
    end
    guiSetVisible(aACLDestroyGroup, true)
    guiSetVisible(aACLAddObject, true)
    guiSetVisible(aACLAddACL, true)
    guiSetVisible(aACLRemoveObject, true)
    guiSetVisible(aACLRemoveACL, true)
end

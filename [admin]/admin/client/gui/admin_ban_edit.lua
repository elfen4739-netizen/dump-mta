-- ByteRevenant
-- LuaQ 5.1 structured decompile

aBanEditForm = r0
editBanID = false
local var = {
    "s",
    "m",
    "h",
    "d",
}

aBanEdit = function(arg1)
    if aBanEditForm == nil then
        aBanEditForm = guiCreateWindow(screenX / 2 - 185, screenY / 2 - 150, 400, 370, "Редактирование бана", false)
        guiWindowSetSizable(aBanEditForm, false)
        aBanEditID = guiCreateLabel(0.029999999999999999, 0.050000000000000003, 0.80000000000000004, 0.089999999999999997, "", true, aBanEditForm)
        aBanEditSerial = guiCreateLabel(0.029999999999999999, 0.14000000000000001, 0.80000000000000004, 0.089999999999999997, "", true, aBanEditForm)
        aBanEditNick = guiCreateLabel(0.029999999999999999, 0.23000000000000001, 0.80000000000000004, 0.089999999999999997, "", true, aBanEditForm)
        aBanEditReasonLabel = guiCreateLabel(0.029999999999999999, 0.32000000000000001, 0.80000000000000004, 0.089999999999999997, "Причина:", true, aBanEditForm)
        aBanEditReason = guiCreateEdit(0.029999999999999999, 0.37, 0.80000000000000004, 0.080000000000000002, "", true, aBanEditForm)
        guiEditSetMaxLength(aBanEditReason, 128)
        aBanEditDurationLabel = guiCreateLabel(0.029999999999999999, 0.47999999999999998, 0.80000000000000004, 0.089999999999999997, "Срок:", true, aBanEditForm)
        aBanEditDurationType = guiCreateComboBox(0.029999999999999999, 0.54000000000000004, 0.14999999999999999, 0.23000000000000001, "", true, aBanEditForm)
        for k, v in pairs(var) do
            guiComboBoxAddItem(aBanEditDurationType, v)
        end
        aBanEditDuration = guiCreateEdit(0.20000000000000001, 0.54000000000000004, 0.29999999999999999, 0.059999999999999998, "", true, aBanEditForm)
        guiEditSetMaxLength(aBanEditDuration, 10)
        aBanEditCloseButton = guiCreateButton(0.80000000000000004, 0.88, 0.17000000000000001, 0.10000000000000001, "Закрыть", true, aBanEditForm)
        aBanEditSave = guiCreateButton(0.29999999999999999, 0.88, 0.29999999999999999, 0.10000000000000001, "Сохранить", true, aBanEditForm)
        guiSetVisible(aBanEditForm, false)
        addEventHandler("onClientGUIClick", aBanEditForm, aClientBanEditClick)
        addEventHandler("BanEdit", aBanEditForm, aBanEdit, aBanEditClose)
        local var = "Сохранить"
    end
    guiSetText(aBanEditID, string.format("Ban ID: %s", (tostring(arg1) or "n/a")))
    if aBans[arg1].serial then
        local var = aBans[arg1]
        local var_2 = "Serial: %s"
        local lockClient = aBans[arg1].serial
    end
    guiSetText(aBanEditSerial, string.format("Serial: %s", "n/a"))
    if aBans[arg1].nick then
        local var = aBans[arg1]
        local var_2 = "Логин: %s"
        local lockClient = aBans[arg1].nick
    end
    guiSetText(aBanEditNick, string.format("Логин: %s", "n/a"))
    if aBans[arg1].unban == 0 then
        guiComboBoxSetSelected(aBanEditDurationType, 0)
        local var = aBans[arg1]
    end
    if (aBans[arg1].unban - aBans[arg1].seconds) % 86400 == 0 and 86400 <= aBans[arg1].unban - aBans[arg1].seconds then
        guiComboBoxSetSelected(aBanEditDurationType, 3)
        local var = aBans[arg1]
        local var_1 = aBans[arg1].unban - aBans[arg1].seconds
    end
    if (aBans[arg1].unban - aBans[arg1].seconds) % 3600 == 0 then
        if (aBans[arg1].unban - aBans[arg1].seconds) / 3600 <= 24 then
            guiComboBoxSetSelected(aBanEditDurationType, 2)
            local var = aBans[arg1]
            local var_1 = math.floor((aBans[arg1].unban - aBans[arg1].seconds) / 3600)
            local var_2 = aBans[arg1].unban - aBans[arg1].seconds
        end
        local var = aBans[arg1]
        local var_2 = aBans[arg1].unban - aBans[arg1].seconds
    end
    if (aBans[arg1].unban - aBans[arg1].seconds) % 60 == 0 then
        if (aBans[arg1].unban - aBans[arg1].seconds) / 60 <= 60 then
            guiComboBoxSetSelected(aBanEditDurationType, 1)
            local var = aBans[arg1]
            local var_1 = aBans[arg1].unban - aBans[arg1].seconds
        end
        local var = aBans[arg1]
        local var_1 = aBans[arg1].unban - aBans[arg1].seconds
    end
    guiComboBoxSetSelected(aBanEditDurationType, 0)
    guiSetText(aBanEditDuration, aBans[arg1].unban - aBans[arg1].seconds)
    if aBans[arg1].reason then
        local var_1 = "%s"
        local var_2 = aBans[arg1].reason
    end
    guiSetText(aBanEditReason, string.format("%s", "n/a"))
    guiSetVisible(aBanEditForm, true)
    guiBringToFront(aBanEditForm)
end

aBanEditClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIClick", aBanEditForm, aClientBanEditClick)
        destroyElement(aBanEditForm)
        aBanEditForm = nil
    end
    guiSetVisible(aBanEditForm, false)
    editBanID = false
end

aClientBanEditClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aBanEditCloseButton then
        aBanEditClose(false)
    end
    if source ~= aBanEditSave then
        return
    end
    if not guiComboBoxGetSelected(aBanEditDurationType) then
        return
    end
    if not guiComboBoxGetItemText(aBanEditDurationType, guiComboBoxGetSelected(aBanEditDurationType)) then
        return
    end
    if not guiGetText(aBanEditReason) or guiGetText(aBanEditReason) == "" then
        local var = guiComboBoxGetItemText(aBanEditDurationType, guiComboBoxGetSelected(aBanEditDurationType))
        local var_1 = guiGetText(aBanEditReason)
    end
    if not tonumber(guiGetText(aBanEditDuration)) or tonumber(guiGetText(aBanEditDuration)) < 0 then
        local var = guiComboBoxGetItemText(aBanEditDurationType, guiComboBoxGetSelected(aBanEditDurationType))
        local var_1 = guiGetText(aBanEditReason)
        local var_2 = tonumber(guiGetText(aBanEditDuration))
    end
    if editBanID then
        triggerServerEvent("aBanEdit", localPlayer, editBanID, guiComboBoxGetItemText(aBanEditDurationType, guiComboBoxGetSelected(aBanEditDurationType)), tonumber(guiGetText(aBanEditDuration)), guiGetText(aBanEditReason))
    end
    aBanEditClose(false)
end

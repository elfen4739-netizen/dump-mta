-- ByteRevenant
-- LuaQ 5.1 structured decompile

aBanForm = r0
local state = nil

aBanDetails = function(arg1)
    if aBanForm == nil then
        aBanForm = guiCreateWindow(screenX / 2 - 185, screenY / 2 - 150, 400, 370, "Детали бана", false)
        aBanID = guiCreateLabel(0.029999999999999999, 0.050000000000000003, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanSerial = guiCreateLabel(0.029999999999999999, 0.14000000000000001, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanIP = guiCreateLabel(0.029999999999999999, 0.23000000000000001, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanNick = guiCreateLabel(0.029999999999999999, 0.32000000000000001, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanDate = guiCreateLabel(0.029999999999999999, 0.40999999999999998, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanTime = guiCreateLabel(0.029999999999999999, 0.5, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanBanner = guiCreateLabel(0.029999999999999999, 0.58999999999999997, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanUnban = guiCreateLabel(0.029999999999999999, 0.68000000000000005, 0.80000000000000004, 0.089999999999999997, "", true, aBanForm)
        aBanReason = guiCreateLabel(0.029999999999999999, 0.77000000000000002, 0.80000000000000004, 0.29999999999999999, "", true, aBanForm)
        aBanClose = guiCreateButton(0.80000000000000004, 0.88, 0.17000000000000001, 0.10000000000000001, "Закрыть", true, aBanForm)
        aBanCopySerial = guiCreateButton(0.75, 0.14000000000000001, 0.55000000000000004, 0.050000000000000003, "Копировать", true, aBanForm)
        aBanCopyIP = guiCreateButton(0.75, 0.23000000000000001, 0.55000000000000004, 0.050000000000000003, "Копировать", true, aBanForm)
        aBanCopyNick = guiCreateButton(0.75, 0.32000000000000001, 0.55000000000000004, 0.050000000000000003, "Копировать", true, aBanForm)
        aBanEditButton = guiCreateButton(0.29999999999999999, 0.88, 0.29999999999999999, 0.10000000000000001, "Изменить бан", true, aBanForm, "banid")
        guiSetVisible(aBanForm, false)
        addEventHandler("onClientGUIClick", aBanForm, aClientBanClick)
        addEventHandler("onClientGUISize", aBanForm, aBanDetailsWindowResize, false)
        addEventHandler("BanEdit", aBanForm, aBanDetails, aBanDetailsClose)
        local var = "Изменить бан"
        local var_1 = "banid"
    end
    if arg1 then
    end
    return false
    end

    guiSetText(aBanID, string.format("Ban ID: %s", tostring(arg1)))
    if aBans[arg1].serial then
        local var = aBans[arg1]
        local var_2 = "Serial: %s"
        local lockClient = aBans[arg1].serial
    end
    guiSetText(aBanSerial, string.format("Serial: %s", "n/a"))
    if aBans[arg1].ip then
        local var = aBans[arg1]
        local var_2 = "IP: %s"
        local lockClient = aBans[arg1].serial
    end
    guiSetText(aBanIP, string.format("IP: %s", "n/a"))
    if aBans[arg1].nick then
        local var = aBans[arg1]
        local var_2 = "Логин: %s"
        local lockClient = aBans[arg1].nick
    end
    guiSetText(aBanNick, string.format("Логин: %s", "n/a"))
    if aBans[arg1].date then
        local var = aBans[arg1]
        local var_2 = "Дата: %s"
        local lockClient = aBans[arg1].date
    end
    guiSetText(aBanDate, string.format("Дата: %s", "n/a"))
    if aBans[arg1].time then
        local var = aBans[arg1]
        local var_2 = "Время: %s"
        local lockClient = aBans[arg1].time
    end
    guiSetText(aBanTime, string.format("Время: %s", "n/a"))
    if aBans[arg1].banner then
        local var = aBans[arg1]
        local var_2 = "Забанил: %s"
        local lockClient = aBans[arg1].banner
    end
    guiSetText(aBanBanner, string.format("Забанил: %s", "n/a"))
    if tostring(aBans[arg1].unban) then
        local var = aBans[arg1]
        local var_1 = tostring(aBans[arg1].unban)
    end
    guiSetText(aBanUnban, "Unban: Permanent", tostring(aBans[arg1].unban))
    guiSetText(aBanUnban, "Unban: " .. FormatDate("d/m/y h:i:s", "'", tostring(aBans[arg1].unban)))
    if aBans[arg1].reason then
        local var_1 = "Причина: %s"
        local var_2 = aBans[arg1].reason
        local lockClient = tostring(aBans[arg1].unban)
    end
    guiSetText(aBanReason, string.format("Причина: %s", "n/a"))
    guiLabelSetHorizontalAlign(aBanReason, "left", true)
    guiSetVisible(aBanForm, true)
    guiBringToFront(aBanForm)
end

aBanDetailsClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIClick", aBanForm, aClientBanClick)
        destroyElement(aBanForm)
        aBanForm = nil
        clipContent = nil
    end
    guiSetVisible(aBanForm, false)
end

aClientBanClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aBanClose then
        aBanDetailsClose(false)
    end
    if source == aBanCopySerial then
        if state then
            if aBans[state] then
                if aBans[state].serial then
                    local var = aBans[state].serial
                end
                local var = "n/a"
            end
            local var = "n/a"
        end
        setClipboard("n/a")
        outputChatBox("Серийный номер успешно скопирован в буфер обмена.", 255, 100, 70)
    end
    if source == aBanCopyIP then
        if state then
            if aBans[state] then
                if aBans[state].ip then
                    local var = aBans[state].ip
                end
                local var = "n/a"
            end
            local var = "n/a"
        end
        setClipboard("n/a")
        outputChatBox("IP успешно скопирован в буфер обмена.", 255, 100, 70)
    end
    if source == aBanCopyNick then
        if state then
            if aBans[state] then
                if aBans[state].nick then
                    local var = aBans[state].nick
                end
                local var = "n/a"
            end
            local var = "n/a"
        end
        setClipboard("n/a")
        outputChatBox("Логин успешно скопирован в буфер обмена.", 255, 100, 70)
    end
    if source ~= aBanEditButton then
        return
    end
    aBanEdit(state)
    aBanDetailsClose(false)
end

aBanDetailsWindowResize = function()
    guiSetSize(aBanCopySerial, 0.5, 0.080000000000000002, true)
    guiSetSize(aBanCopyIP, 0.5, 0.080000000000000002, true)
    guiSetSize(aBanCopyNick, 0.5, 0.080000000000000002, true)
    guiSetSize(aBanClose, 0.17000000000000001, 0.080000000000000002, true)
    guiSetSize(aBanEditButton, 0.29999999999999999, 0.10000000000000001, true)
    guiSetPosition(aBanCopySerial, 0.80000000000000004, 0.080000000000000002, true)
    guiSetPosition(aBanCopyIP, 0.80000000000000004, 0.17999999999999999, true)
    guiSetPosition(aBanCopyNick, 0.80000000000000004, 0.28000000000000003, true)
    guiSetPosition(aBanClose, 0.80000000000000004, 0.88, true)
    guiSetPosition(aBanEditButton, 0.29999999999999999, 0.88, true)
end

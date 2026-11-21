-- ByteRevenant
-- LuaQ 5.1 structured decompile

aInputForm = r0
local state = nil
local state_1 = nil

aInputBox = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    if aInputForm == nil then
        aInputForm = guiCreateWindow(screenX / 2 - 150, screenY / 2 - 64, 300, 170, "", false)
        guiWindowSetSizable(aInputForm, false)
        aInputLabel = guiCreateLabel(20, 24, 270, 15, "", false, aInputForm)
        guiLabelSetHorizontalAlign(aInputLabel, "center")
        aInputValue = guiCreateEdit(35, 47, 230, 24, "", false, aInputForm)
        aInputOk = guiCreateButton(90, 80, 55, 17, "ОК", false, aInputForm)
        aInputCancel = guiCreateButton(150, 80, 55, 17, "Отмена", false, aInputForm)
        guiSetProperty(aInputForm, "AlwaysOnTop", "true")
        aInputAction = nil
        addEventHandler("onClientGUIClick", aInputForm, aInputBoxClick)
        addEventHandler("InputBox", aInputForm, aInputBox, aInputBoxClose)
    end
    if arg4 then
    end
    guiSetSize(aInputForm, 300, 170, false)
    guiSetPosition(aInputOk, 90, 80, false)
    guiSetPosition(aInputCancel, 150, 80, false)
    if isElement(banSerialLbl) then
        destroyElement(banSerialLbl)
    end
    if isElement(banNickEdit) then
        destroyElement(banNickEdit)
    end
    if isElement(banReasonEdit) then
        destroyElement(banReasonEdit)
    end
    if isElement(banSerialCombo) then
        destroyElement(banSerialCombo)
    end
    if isElement(banDurationLbl) then
        destroyElement(banDurationLbl)
    end
    if isElement(durationEdit) then
        destroyElement(durationEdit)
        guiSetSize(aInputForm, 300, 210, false)
        guiSetPosition(aInputOk, 90, 180, false)
        guiSetPosition(aInputCancel, 150, 180, false)
        if not isElement(banSerialCombo) then
            banSerialCombo = guiCreateComboBox(180, 80, 120, 100, "Perm", false, aInputForm)
            guiComboBoxAddItem(banSerialCombo, "Mins")
            guiComboBoxAddItem(banSerialCombo, "Hours")
            guiComboBoxAddItem(banSerialCombo, "Days")
            guiComboBoxAddItem(banSerialCombo, "Perm")
        end
        if not isElement(durationEdit) then
            durationEdit = guiCreateEdit(110, 80, 60, 24, "", false, aInputForm)
        end
        guiSetText(durationEdit, "")
        if not isElement(banDurationLbl) then
            banDurationLbl = guiCreateLabel(40, 83, 50, 15, "Duration:", false, aInputForm)
            guiLabelSetHorizontalAlign(banDurationLbl, "center")
        end
        if not isElement(banSerialLbl) then
            banSerialLbl = guiCreateLabel(20, 110, 270, 15, "Enter player nick & reason", false, aInputForm)
            guiLabelSetHorizontalAlign(banSerialLbl, "center")
        end
        if not isElement(banNickEdit) then
            banNickEdit = guiCreateEdit(35, 130, 60, 24, "", false, aInputForm)
        end
        guiSetText(banNickEdit, "Nick")
        if not isElement(banReasonEdit) then
            banReasonEdit = guiCreateEdit(100, 130, 165, 24, "", false, aInputForm)
        end
        guiSetText(banReasonEdit, "Reason")
    end
    guiSetText(aInputForm, arg1)
    guiSetText(aInputLabel, arg2)
    guiSetText(aInputValue, arg3)
    aHideFloaters()
    guiSetVisible(aInputForm, true)
    guiBringToFront(aInputForm)
    aInputAction = arg4
    state = arg5
    state_1 = arg6
end

local function onClientGUIClick()
    if source == banNickEdit then
        guiSetText(banNickEdit, "")
    end
    if source ~= banReasonEdit then
        return
    end
    if guiGetText(banReasonEdit) ~= "Reason" then
        return
    end
    guiSetText(banReasonEdit, "")
end

addEventHandler("onClientGUIClick", guiRoot, onClientGUIClick)

aInputBoxClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIClick", aInputForm, aInputBoxClick)
        aInputAction = nil
        destroyElement(aInputForm)
        aInputForm = nil
    end
    guiSetVisible(aInputForm, false)
end

keepEscapeCharacter = function(arg1)
    return string.gsub(arg1, "%%", "%%%%")
end

aInputBoxClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aInputOk then
        if aInputAction == "kickPlayer" then
            triggerServerEvent("aPlayer", localPlayer, state, "kick", guiGetText(aInputValue))
        end
        if aInputAction == "setHealth" then
            triggerServerEvent("aPlayer", localPlayer, state, "sethealth", guiGetText(aInputValue))
        end
        if aInputAction == "setArmor" then
            triggerServerEvent("aPlayer", localPlayer, state, "setarmour", guiGetText(aInputValue))
        end
        if aInputAction == "setNick" then
            triggerServerEvent("aPlayer", localPlayer, state, "setnick", guiGetText(aInputValue))
        end
        if aInputAction == "shout" then
            triggerServerEvent("aPlayer", localPlayer, state, "shout", guiGetText(aInputValue))
        end
        if aInputAction == "setMoney" then
            triggerServerEvent("aPlayer", localPlayer, state, "setmoney", guiGetText(aInputValue))
        end
        if aInputAction == "setDimension" then
            triggerServerEvent("aPlayer", localPlayer, state, "setdimension", guiGetText(aInputValue))
            local onClientGUIClick = "setdimension"
            local var_1 = guiGetText(aInputValue)
        end
        if aInputAction == "setCurrentAmmo" then
            aSetCurrentAmmo(guiGetText(aInputValue))
        end
        if aInputAction == "setGameType" then
            triggerServerEvent("aServer", localPlayer, "setgame", guiGetText(aInputValue))
        end
        if aInputAction == "setMapName" then
            triggerServerEvent("aServer", localPlayer, "setmap", guiGetText(aInputValue))
        end
        if aInputAction == "setWelcome" then
            triggerServerEvent("aServer", localPlayer, "setwelcome", guiGetText(aInputValue))
        end
        if aInputAction == "setServerPassword" then
            triggerServerEvent("aServer", localPlayer, "setpassword", guiGetText(aInputValue))
        end
        if aInputAction == "serverShutdown" then
            triggerServerEvent("aServer", localPlayer, "shutdown", guiGetText(aInputValue))
        end
        if aInputAction == "unbanIP" then
            triggerServerEvent("aBans", localPlayer, "unbanip", guiGetText(aInputValue))
        end
        if aInputAction == "unbanSerial" then
            triggerServerEvent("aBans", localPlayer, "unbanserial", guiGetText(aInputValue))
        end
        if aInputAction ~= "banIP" then
            if aInputAction ~= "banSerial" then
            end
        end
        if guiGetText(banSerialCombo) and guiGetText(banSerialCombo) ~= "Perm" then
            if tonumber(guiGetText(durationEdit)) then
                local onClientGUIClick = guiGetText(banSerialCombo)
                local var_1 = tonumber(guiGetText(durationEdit))
            end
            return outputChatBox("* Error: Enter a valid numeric duration value", 255, 0, 0)
            end
            if guiGetText(banSerialCombo) == "Hours" then
                local onClientGUIClick = guiGetText(banSerialCombo)
                local var_1 = tonumber(guiGetText(durationEdit))
                local var_2 = 0
                local lockClient = 0
            end
            if guiGetText(banSerialCombo) == "Days" then
                local onClientGUIClick = math.floor(math.abs(tonumber(guiGetText(durationEdit)))) * 24 * 60 * 60
            end
            local onClientGUIClick = 0
        end
        if aInputAction == "banIP" then
            triggerServerEvent("aBans", localPlayer, "banip", guiGetText(aInputValue), guiGetText(banNickEdit), guiGetText(banReasonEdit), 0)
            local onClientGUIClick = 0
        end
        if aInputAction == "banSerial" then
            triggerServerEvent("aBans", localPlayer, "banserial", guiGetText(aInputValue), guiGetText(banNickEdit), guiGetText(banReasonEdit), 0)
            local onClientGUIClick = 0
        end
        if aInputAction == "banLogin" then
            triggerServerEvent("aBans", localPlayer, "banlogin", guiGetText(aInputValue), guiGetText(banNickEdit), guiGetText(banReasonEdit), 0)
            if aInputAction == "settingChange" then
                triggerServerEvent("aAdmin", localPlayer, "settings", "change", state, state_1, guiGetText(aInputValue))
                local onClientGUIClick = guiGetText(aInputValue)
                local var_1 = 0
            end
            if aInputAction == "aclCreateGroup" then
                triggerServerEvent("aAdmin", localPlayer, "aclcreate", "group", guiGetText(aInputValue))
                local onClientGUIClick = guiGetText(banNickEdit)
                local var_1 = guiGetText(banReasonEdit)
                local var_2 = 0
            end
            if aInputAction == "aclCreate" then
                triggerServerEvent("aAdmin", localPlayer, "aclcreate", "acl", guiGetText(aInputValue))
                local onClientGUIClick = guiGetText(banReasonEdit)
                local var_1 = 0
            end
            if aInputAction == "aclAddObject" then
                triggerServerEvent("aAdmin", localPlayer, "acladd", "object", state, guiGetText(aInputValue))
                local onClientGUIClick = guiGetText(banReasonEdit)
                local var_1 = 0
            end
            if aInputAction == "aclAddRight" then
                triggerServerEvent("aAdmin", localPlayer, "acladd", "right", state, guiGetText(aInputValue))
            end
        end
        aInputAction = nil
        aInputBoxClose(false)
    end

    if source ~= aInputCancel then
        return
    end
    aInputAction = nil
    aInputBoxClose(false)
end
aBanInputForm = nil
local var_2 = {}

aBanInputBox = function(arg1)
    table.insert(onClientGUIClick, "Другое:")
    for k, v in ipairs(split("60,3600,43200,0", string.byte(","))) do
        if tonumber(v) then
            table.insert({}, tonumber(v))
            local var_2 = split("60,3600,43200,0", string.byte(","))
        end
        local var_2 = split("60,3600,43200,0", string.byte(","))
    end
    if #var_2 ~= #nil then
        if aBanInputForm then
            _widgets.BanInputBox = nil
            destroyElement(aBanInputForm)
            aBanInputForm = nil
        end
    end
    if aBanInputForm == nil then
        aBanInputForm = guiCreateWindow(screenX / 2 - 150, screenY / 2 - 64, 400, math.max(100, math.floor(#var_2 * 1.02 * 15) + 20) + 130, "", false)
        guiWindowSetSizable(aBanInputForm, false)
        guiSetAlpha(aBanInputForm, 1)
        aBanInputLabel = guiCreateLabel(20, 24, 270, 15, "", false, aBanInputForm)
        guiLabelSetHorizontalAlign(aBanInputLabel, "center")
        aBanInputValue = guiCreateEdit(35, 24 + 23, 230, 24, "", false, aBanInputForm)
        aBanInputRadioSet1bg = guiCreateTabPanel(10, 24 + 23 + 33, 120, 100, false, aBanInputForm)
        aBanInputRadioSet1 = guiCreateStaticImage(0, 0, 1, 1, "client\\images\\empty.png", true, aBanInputRadioSet1bg)
        guiSetAlpha(aBanInputRadioSet1bg, 0.29999999999999999)
        guiSetProperty(aBanInputRadioSet1, "InheritsAlpha", "false")
        aBanInputRadio1Label = guiCreateLabel(10, 20, 270, 15, "Тип:", false, aBanInputRadioSet1)
        aBanInputRadio1A = guiCreateRadioButton(50, 20, 50, 15, "IP", false, aBanInputRadioSet1)
        aBanInputRadio1B = guiCreateRadioButton(50, 35, 120, 15, "Serial", false, aBanInputRadioSet1)
        aBanInputRadioSet2bg = guiCreateTabPanel(135, 24 + 23 + 33, 260, math.floor(#var_2 * 1.02 * 15) + 20, false, aBanInputForm)
        aBanInputRadioSet2 = guiCreateStaticImage(0, 0, 1, 1, "client\\images\\empty.png", true, aBanInputRadioSet2bg)
        guiSetAlpha(aBanInputRadioSet2bg, 0.29999999999999999)
        guiSetProperty(aBanInputRadioSet2, "InheritsAlpha", "false")
        aBanInputRadio2Label = guiCreateLabel(10, 5, 270, 15, "Длит.:", false, aBanInputRadioSet2)
        aBanInputRadio2s = {}
        for k, v in ipairs(var_2) do
            aBanInputRadio2s[k] = guiCreateRadioButton(70, 5, 90, 15, "-", false, aBanInputRadioSet2)
            local screenX, screenY = guiGetScreenSize()
            local var_1 = math.max(100, math.floor(#var_2 * 1.02 * 15) + 20)
        end
        customDuration = guiCreateEdit(138, 3, 50, 24, "", false, aBanInputRadioSet2)
        customType = guiCreateComboBox(190, 4, 65, 80, "минут", false, aBanInputRadioSet2)
        guiComboBoxAddItem(customType, "минут")
        guiComboBoxAddItem(customType, "часов")
        guiComboBoxAddItem(customType, "дней")
        aBanInputOk = guiCreateButton(90, 24 + 23 + 33 + math.max(100, math.floor(#var_2 * 1.02 * 15) + 20) + 10, 55, 17, "ОК", false, aBanInputForm)
        aBanInputCancel = guiCreateButton(150, 24 + 23 + 33 + math.max(100, math.floor(#var_2 * 1.02 * 15) + 20) + 10, 55, 17, "Отмена", false, aBanInputForm)
        guiSetSize(aBanInputForm, guiGetSize(aBanInputForm, false), 24 + 23 + 33 + math.max(100, math.floor(#var_2 * 1.02 * 15) + 20) + 10 + 30, false)
        guiSetProperty(aBanInputForm, "AlwaysOnTop", "true")
        aBanInputPlayer = nil
        addEventHandler("onClientGUIClick", aBanInputForm, aBanInputBoxClick)
        addEventHandler("onClientGUIAccepted", aBanInputValue, aBanInputBoxAccepted)
        addEventHandler("BanInputBox", aBanInputForm, aBanInputBox, aBanInputBoxClose)
        local screenX, screenY = guiGetScreenSize()
    end
    for k, v in ipairs(var_2) do
        if v == "Другое:" then
            guiSetText(aBanInputRadio2s[k], "Другое:")
        end
        if 0 < v then
            local var_1 = aBanInputRadio2s[k]
        end
        guiSetText(aBanInputRadio2s[k], "Вечный")
    end
    guiSetText(aBanInputForm, "Бан игрока " .. string.gsub(getPlayerNametagText(arg1), "#%x%x%x%x%x%x", ""))
    guiSetText(aBanInputLabel, "Введите причину бана")
    aHideFloaters()
    guiSetVisible(aBanInputForm, true)
    guiBringToFront(aBanInputForm)
end

aBanInputBoxClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIClick", aBanInputForm, aBanInputBoxClick)
        addEventHandler("onClientGUIAccepted", aBanInputValue, aBanInputBoxAccepted)
        aBanInputPlayer = nil
        destroyElement(aBanInputForm)
        aBanInputForm = nil
    end
    guiSetVisible(aBanInputForm, false)
end

aBanInputBoxAccepted = function()
    aBanInputBoxFinish()
end

aBanInputBoxClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aBanInputOk then
        aBanInputBoxFinish()
        aBanInputPlayer = nil
        aBanInputBoxClose(false)
    end
    if source ~= aBanInputCancel then
        return
    end
    aBanInputPlayer = nil
    aBanInputBoxClose(false)
end

aBanInputBoxFinish = function()
    for k, v in ipairs(var_2) do
        if guiRadioButtonGetSelected(aBanInputRadio2s[k]) then
            if guiGetText(aBanInputRadio2s[k]) == "Другое:" then
                if guiComboBoxGetItemText(customType, guiComboBoxGetSelected(customType)) == "минут" then
                    local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1A)
                    local var_1 = guiRadioButtonGetSelected(aBanInputRadio1B)
                end
                if guiComboBoxGetItemText(customType, guiComboBoxGetSelected(customType)) == "часов" then
                    local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1A)
                    local var_1 = guiRadioButtonGetSelected(aBanInputRadio1B)
                end
                local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1A)
                local var_1 = guiRadioButtonGetSelected(aBanInputRadio1B)
            end
            local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1A)
            local var_1 = guiRadioButtonGetSelected(aBanInputRadio1B)
        end
        local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1A)
        local var_1 = guiRadioButtonGetSelected(aBanInputRadio1B)
    end
    if not guiRadioButtonGetSelected(aBanInputRadio1A) then
        if not guiRadioButtonGetSelected(aBanInputRadio1B) then
            aMessageBox("error", "Тип не выбран!")
            local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1B)
            local var_1 = guiGetText(aBanInputValue)
        end
        local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1B)
        local var_1 = guiGetText(aBanInputValue)
    end
    if false == false then
        aMessageBox("error", "Длительность не определена!")
        local onClientGUIClick = guiRadioButtonGetSelected(aBanInputRadio1B)
        local var_1 = guiGetText(aBanInputValue)
    end
    triggerServerEvent("aPlayer", localPlayer, aBanInputPlayer, "ban", guiGetText(aBanInputValue), false, guiRadioButtonGetSelected(aBanInputRadio1B))
    guiSetText(aBanInputValue, "")
    for k, v in ipairs(var_2) do
        guiRadioButtonSetSelected(aBanInputRadio2s[k], false)
    end
end

aMuteInputForm = nil
local lockClient = {}

aMuteInputBox = function(arg1)
    for k, v in ipairs(split("60,120,300,600,0", string.byte(","))) do
        if tonumber(v) then
            table.insert({}, tonumber(v))
            local var_1 = split("60,120,300,600,0", string.byte(","))
        end
        local var_1 = split("60,120,300,600,0", string.byte(","))
    end
    if #lockClient ~= #nil then
        if aMuteInputForm then
            _widgets.MuteInputBox = nil
            destroyElement(aMuteInputForm)
            aMuteInputForm = nil
        end
    end
    if aMuteInputForm == nil then
        aMuteInputForm = guiCreateWindow(screenX / 2 - 150, screenY / 2 - 64, 300, 150 + #lockClient * 15, "", false)
        guiWindowSetSizable(aMuteInputForm, false)
        guiSetAlpha(aMuteInputForm, 1)
        aMuteInputLabel = guiCreateLabel(20, 24, 270, 15, "", false, aMuteInputForm)
        guiLabelSetHorizontalAlign(aMuteInputLabel, "center")
        aMuteInputValue = guiCreateEdit(35, 24 + 23, 230, 24, "", false, aMuteInputForm)
        aMuteInputRadioSet2bg = guiCreateTabPanel(55, 24 + 23 + 33, 190, math.floor(#lockClient * 1.02 * 15) + 20, false, aMuteInputForm)
        aMuteInputRadioSet2 = guiCreateStaticImage(0, 0, 1, 1, "client\\images\\empty.png", true, aMuteInputRadioSet2bg)
        guiSetAlpha(aMuteInputRadioSet2bg, 0.29999999999999999)
        guiSetProperty(aMuteInputRadioSet2, "InheritsAlpha", "false")
        aMuteInputRadio2Label = guiCreateLabel(10, 5, 270, 15, "Длит.:", false, aMuteInputRadioSet2)
        aMuteInputRadio2s = {}
        for k, v in ipairs(lockClient) do
            aMuteInputRadio2s[k] = guiCreateRadioButton(70, 5, 120, 15, "-", false, aMuteInputRadioSet2)
            local screenX, screenY = guiGetScreenSize()
            local onClientGUIClick = math.floor(#lockClient * 1.02 * 15) + 20
        end
        aMuteInputOk = guiCreateButton(90, 24 + 23 + 33 + math.floor(#lockClient * 1.02 * 15) + 20 + 10, 55, 17, "OK", false, aMuteInputForm)
        aMuteInputCancel = guiCreateButton(150, 24 + 23 + 33 + math.floor(#lockClient * 1.02 * 15) + 20 + 10, 55, 17, "Отмена", false, aMuteInputForm)
        guiSetSize(aMuteInputForm, guiGetSize(aMuteInputForm, false), 24 + 23 + 33 + math.floor(#lockClient * 1.02 * 15) + 20 + 10 + 30, false)
        guiSetProperty(aMuteInputForm, "AlwaysOnTop", "true")
        aMuteInputPlayer = nil
        addEventHandler("onClientGUIClick", aMuteInputForm, aMuteInputBoxClick)
        addEventHandler("onClientGUIAccepted", aMuteInputValue, aMuteInputBoxFinish)
        addEventHandler("MuteInputBox", aMuteInputForm, aMuteInputBox, aMuteInputBoxClose)
    end
    for k, v in ipairs(lockClient) do
        if 0 < v then
            local onClientGUIClick = aMuteInputRadio2s[k]
        end
        guiSetText(aMuteInputRadio2s[k], "До отключения")
    end
    guiSetText(aMuteInputForm, "Заткнуть игрока " .. getPlayerNametagText(arg1))
    guiSetText(aMuteInputLabel, "Введите причину")
    aHideFloaters()
    guiSetVisible(aMuteInputForm, true)
    guiBringToFront(aMuteInputForm)
end

aMuteInputBoxClose = function(arg1)
    if arg1 then
        addEventHandler("onClientGUIClick", aMuteInputForm, aMuteInputBoxClick)
        addEventHandler("onClientGUIAccepted", aMuteInputValue, aMuteInputBoxFinish)
        aMuteInputPlayer = nil
        destroyElement(aMuteInputForm)
        aMuteInputForm = nil
    end
    guiSetVisible(aMuteInputForm, false)
end

aMuteInputBoxClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aMuteInputOk then
        aMuteInputBoxFinish()
        aMuteInputPlayer = nil
        aMuteInputBoxClose(false)
    end
    if source ~= aMuteInputCancel then
        return
    end
    aMuteInputPlayer = nil
    aMuteInputBoxClose(false)
end

aMuteInputBoxFinish = function()
    for k, v in ipairs(lockClient) do
    end
    if false == false then
        aMessageBox("error", "Длительность не определена!")
        local onClientGUIClick = guiGetText(aMuteInputValue)
    end
    triggerServerEvent("aPlayer", localPlayer, aMuteInputPlayer, "mute", guiGetText(aMuteInputValue), false)
    guiSetText(aMuteInputValue, "")
    for k, v in ipairs(lockClient) do
        guiRadioButtonSetSelected(aMuteInputRadio2s[k], false)
    end
end

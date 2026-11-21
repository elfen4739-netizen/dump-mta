-- ByteRevenant
-- LuaQ 5.1 structured decompile

aMessageForm = r0

aMessageBox = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if aMessageForm == nil then
        aMessageForm = guiCreateWindow(screenX / 2 - 150, screenY / 2 - 64, 300, 110, "", false)
        guiWindowSetSizable(aMessageForm, false)
        aMessageWarning = guiCreateStaticImage(10, 32, 60, 60, "client\\images\\warning.png", false, aMessageForm)
        aMessageQuestion = guiCreateStaticImage(10, 32, 60, 60, "client\\images\\question.png", false, aMessageForm)
        aMessageError = guiCreateStaticImage(10, 32, 60, 60, "client\\images\\error.png", false, aMessageForm)
        aMessageInfo = guiCreateStaticImage(10, 32, 60, 60, "client\\images\\info.png", false, aMessageForm)
        aMessageLabel = guiCreateLabel(100, 32, 180, 64, "", false, aMessageForm)
        guiLabelSetHorizontalAlign(aMessageLabel, "center", true)
        aMessageYes = guiCreateButton(120, 70, 55, 17, "Да", false, aMessageForm)
        aMessageNo = guiCreateButton(180, 70, 55, 17, "Нет", false, aMessageForm)
        aMessageOk = guiCreateButton(160, 70, 55, 17, "ОК", false, aMessageForm)
        guiSetProperty(aMessageForm, "AlwaysOnTop", "true")
        aMessageAction = nil
        addEventHandler("enter", "down", aMessageBoxAccept)
        addEventHandler("n", "down", aMessageBoxAccept)
        addEventHandler("onClientGUIClick", aMessageForm, aMessageBoxClick)
        addEventHandler("MessageBox", aMessageForm, aMessageBox, aMessageBoxClose)
        local screenX, screenY = guiGetScreenSize()
        local var = "ОК"
    end
    guiSetText(aMessageForm, arg1)
    guiSetText(aMessageLabel, tostring(arg2))
    if 180 < guiLabelGetTextExtent(aMessageLabel) then
        guiSetSize(aMessageForm, 500, 120, false)
        guiSetSize(aMessageLabel, 350, 100, false)
        local screenX, screenY = guiGetScreenSize()
    end
    guiSetSize(aMessageForm, 300, 120, false)
    guiSetSize(aMessageLabel, 180, 16, false)
    guiSetPosition(aMessageOk, value_1 / 2 - 22, 90, false)
    guiSetPosition(aMessageForm, screenX / 2 - value_1 / 2, screenY / 2 - value_2 / 2, false)
    guiBringToFront(aMessageForm)
    guiSetVisible(aMessageWarning, false)
    guiSetVisible(aMessageQuestion, false)
    guiSetVisible(aMessageError, false)
    guiSetVisible(aMessageInfo, false)
    guiSetVisible(aMessageYes, false)
    guiSetVisible(aMessageNo, false)
    guiSetVisible(aMessageOk, false)
    aHideFloaters()
    guiSetVisible(aMessageForm, true)
    if arg1 == "warning" then
        guiSetVisible(aMessageWarning, true)
    end
    if arg1 == "question" then
        guiSetVisible(aMessageQuestion, true)
    end
    if arg1 == "error" then
        guiSetVisible(aMessageError, true)
    end
    guiSetVisible(aMessageInfo, true)
    if arg3 ~= "" and arg3 ~= nil and arg3 ~= false then
        guiSetVisible(aMessageYes, true)
        guiSetVisible(aMessageNo, true)
        aMessageAction = arg3
        vThree = arg6
        vTwo = arg5
        vOne = arg4
    end
    guiSetVisible(aMessageOk, true)
end

aMessageBoxClose = function(arg1)
    if arg1 then
        addEventHandler("enter", "down", aMessageBoxAccept)
        addEventHandler("n", "down", aMessageBoxAccept)
        addEventHandler("onClientGUIClick", aMessageForm, aMessageBoxClick)
        aMessageAction = nil
        destroyElement(aMessageForm)
        aMessageForm = nil
    end
    if not aMessageForm then
        return
    end
    guiSetVisible(aMessageForm, false)
end

aMessageBoxAccept = function(arg1, arg2)
    if not guiGetVisible(aMessageForm) then
        return
    end
    if guiGetVisible(aMessageOk) then
        aMessageAction = nil
        aMessageBoxClose(false)
    end
    if arg1 == "enter" then
        if aMessageAction ~= nil then
            runMessageAction(aMessageAction)
        end
        aMessageAction = nil
        aMessageBoxClose(false)
    end
    if arg1 ~= "n" then
        return
    end
    aMessageAction = nil
    aMessageBoxClose(false)
end

aMessageBoxClick = function(arg1)
    if arg1 ~= "left" then
        return
    end
    if source == aMessageYes then
        if aMessageAction ~= nil then
            runMessageAction(aMessageAction)
        end
        aMessageAction = nil
        aMessageBoxClose(false)
    end
    if source ~= aMessageNo then
    end
    aMessageAction = nil
    aMessageBoxClose(false)
end

runMessageAction = function(arg1)
    if arg1 == "aclDestroyGroup" then
        triggerServerEvent("aAdmin", localPlayer, "acldestroy", "group", vOne)
    end
    if arg1 == "aclDestroy" then
        triggerServerEvent("aAdmin", localPlayer, "acldestroy", "acl", vOne)
    end
    if arg1 == "revokeAdmin" then
        triggerServerEvent("aPlayer", localPlayer, vOne, "setgroup", false)
    end
    if arg1 == "giveAdmin" then
        triggerServerEvent("aPlayer", localPlayer, vOne, "setgroup", true)
    end
    if arg1 == "stopDelete" then
        triggerServerEvent("aResource", localPlayer, vOne, "delete")
    end
    if arg1 == "stopAll" then
        triggerServerEvent("aResource", localPlayer, nil, "stopall")
    end
    if arg1 == "unbanLogin" then
        triggerServerEvent("aBans", localPlayer, "unbanlogin", vOne)
    end
    if arg1 == "unbanSerial" then
        triggerServerEvent("aBans", localPlayer, "unbanserial", vOne)
    end
    if arg1 == "unbanIP" then
        triggerServerEvent("aBans", localPlayer, "unbanip", vOne)
    end
    if arg1 == "unmute" then
        triggerServerEvent("aPlayer", localPlayer, vOne, "mute")
    end
    if arg1 == "deleteMap" then
        triggerServerEvent("deleteRevertMap_s", localPlayer, true, vOne, vTwo)
    end
    if arg1 == "spectatorClose" then
        aSpectator.Close(false)
    end
    if arg1 ~= "deleteTeam" then
        return
    end
    triggerServerEvent("aTeam", localPlayer, "destroyteam", vOne)
end

aHideFloaters = function()
    if aMessagesForm then
        guiSetVisible(aMessagesForm, false)
    end
    if aMessageForm then
        guiSetVisible(aMessageForm, false)
    end
    if aInputForm then
        guiSetVisible(aInputForm, false)
    end
    if aBanInputForm then
        guiSetVisible(aBanInputForm, false)
    end
    if not aMuteInputForm then
        return
    end
    guiSetVisible(aMuteInputForm, false)
end

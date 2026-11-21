-- ByteRevenant
-- LuaQ 5.1 structured decompile

guiSetVisible(nil.window, false)
guiWindowSetSizable(nil.window, false)
guiSetProperty(nil.window, "AlwaysOnTop", "True")
guiLabelSetVerticalAlign(nil.text, "center")
guiLabelSetHorizontalAlign(nil.text, "center")
nil.button.close = guiCreateButton(10, 130, 125, 30, "Нет", false, nil.window)

local function sub_1001(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    hideConfirm()
end

addEventHandler("onClientGUIClick", nil.button.close, sub_1001, false)
nil.button.accept = guiCreateButton(165, 130, 125, 30, "Да", false, nil.window)
local state = nil

local function sub_1002(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    if state then
        state()
    end
    hideConfirm()
end

addEventHandler("onClientGUIClick", nil.button.accept, sub_1002, false)
local var_2 = {
    button = {},
    window = guiCreateWindow((screenX - 300) / 2, (screenY - 200) / 2, 300, 175, "Подтверждение", false),
    text = guiCreateLabel(0, 0, 300, 125, "?????", false, nil.window),
}

hideConfirm = function()
    guiSetVisible(var_2.window, false)
    state = nil
end

showConfirmUI = function(arg1, arg2, arg3)
    guiSetText(var_2.window, arg1)
    guiSetText(var_2.text, arg2)
    guiSetVisible(var_2.window, true)
    state = arg3
end

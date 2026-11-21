-- ByteRevenant
-- LuaQ 5.1 structured decompile

guiSetVisible(nil.window, false)
guiWindowSetSizable(nil.window, false)
guiGridListAddColumn(nil.list, "Название", 0.20000000000000001)
guiGridListAddColumn(nil.list, "Начальная ставка", 0.14999999999999999)
guiGridListAddColumn(nil.list, "Текущая ставка", 0.20000000000000001)
guiGridListAddColumn(nil.list, "Тип лота", 0.10000000000000001)
guiGridListAddColumn(nil.list, "Начало", 0.14999999999999999)
guiGridListAddColumn(nil.list, "Конец", 0.14999999999999999)
nil.button.add = guiCreateButton(25, 430, 150, 30, "Добавить лот", false, nil.window)

local function sub_1000(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    showLotEditGUI("add")
end

addEventHandler("onClientGUIClick", nil.button.add, var, false)
nil.button.remove = guiCreateButton(185, 430, 150, 30, "Удалить лот", false, nil.window)
local var_1 = {
    button = {},
    window = guiCreateWindow((screenX - 900) / 2, (screenY - 485) / 2, 900, 485, "Панель управления аукционами", false),
    list = guiCreateGridList(25, 25, 850, 400, false, nil.window),
}

local function sub_1001(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    if not guiGridListGetItemData(var_1.list, guiGridListGetSelectedItem(var_1.list), 1) then
        return
    end
    local var = guiGridListGetItemData(var_1.list, guiGridListGetSelectedItem(var_1.list), 1).id
    local function sub_1002()
        triggerServerEvent("auction:removeLot", resourceRoot, var)
    end
    showConfirmUI("Удаление лота", "Вы дейтвительно хотите это удалить\nлот " .. guiGridListGetItemData(sub_1002.list, guiGridListGetSelectedItem(sub_1002.list), 1).name .. "?", sub_1002)
end

addEventHandler("onClientGUIClick", nil.button.remove, sub_1001, false)
var_1.button.edit = guiCreateButton(345, 430, 150, 30, "Редактировать лот", false, var_1.window)

local function sub_1003(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    if not guiGridListGetItemData(var_1.list, guiGridListGetSelectedItem(var_1.list), 1) then
        return
    end
    showLotEditGUI("edit", guiGridListGetItemData(var_1.list, guiGridListGetSelectedItem(var_1.list), 1))
end

addEventHandler("onClientGUIClick", var_1.button.edit, sub_1003, false)
var_1.button.close = guiCreateButton(725, 430, 150, 30, "Закрыть меню", false, var_1.window)

local function sub_1004(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    showAuctionAdminGUI(false)
end

addEventHandler("onClientGUIClick", var_1.button.close, sub_1004, false)

showAuctionAdminGUI = function(arg1)
    guiSetVisible(var_1.window, arg1)
    showCursor(arg1)
    hideConfirm()
    if arg1 then
    end
    triggerServerEvent("auction:quitPlayer", resourceRoot)
end

updateAuctionAdminGUI = function()
    guiGridListClear(var_1.list)
    for k, v in pairs(getAuctionContainer()) do
        if tConfig.lotsTypes[v.type] == "plate" then
            local var = v.name .. " | " .. v.data.text .. " | " .. v.data.region
        end
    end
end

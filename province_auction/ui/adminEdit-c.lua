-- ByteRevenant
-- LuaQ 5.1 structured decompile

guiSetVisible(nil.window, false)
guiWindowSetSizable(nil.window, false)
guiSetProperty(nil.window, "AlwaysOnTop", "True")
nil.label.auctionDate = guiCreateLabel(25, 25, 300, 30, "Дата начала аукциона (Формат: ДД.ММ.ГГ ЧЧ:ММ)", false, nil.window)
guiLabelSetVerticalAlign(nil.label.auctionDate, "center")
nil.edit.auctionDate = guiCreateEdit(25, 25 + 30, 300, 30, "", false, nil.window)
nil.button.now = guiCreateButton(25, 25 + 30 + 35, 300, 30, "Установить текущую дату и время (+1 min)", false, nil.window)
local var = {
    button = {},
    label = {},
    edit = {},
    preset = {},
    window = guiCreateWindow((screenX - 450) / 2, (screenY - 450) / 2, 350, 900, "", false),
}

local function sub_1001(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    guiSetText(var.edit.auctionDate, string.format("%02d.%02d.%02d %02d:%02d", getServerTime().monthday, getServerTime().month + 1, getServerTime().year + 1900 - 2000, getServerTime().hour, getServerTime().minute + 1))
end

addEventHandler("onClientGUIClick", nil.button.now, sub_1001, false)
var.label.lotName = guiCreateLabel(25, 25 + 30 + 35 + 35, 300, 30, "Название лота", false, var.window)
guiLabelSetVerticalAlign(var.label.lotName, "center")
var.edit.lotName = guiCreateEdit(25, 25 + 30 + 35 + 35 + 30, 300, 30, "", false, var.window)
var.label.startBet = guiCreateLabel(25, 25 + 30 + 35 + 35 + 30 + 35, 300, 30, "Начальная ставка", false, var.window)
guiLabelSetVerticalAlign(var.label.startBet, "center")
var.edit.startBet = guiCreateEdit(25, 25 + 30 + 35 + 35 + 30 + 35 + 30, 300, 30, "", false, var.window)
var.label.lotType = guiCreateLabel(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35, 300, 30, "Тип лота", false, var.window)
guiLabelSetVerticalAlign(var.label.lotType, "center")
var.listTypes = guiCreateComboBox(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30, 300, 100, "", false, var.window)
for k, v in ipairs(tConfig.lotsTypes) do
    guiComboBoxAddItem(var.listTypes, tConfig.lotTypeName[v])
    local screenX, screenY = guiGetScreenSize()
    local var_2 = "add"
    local lockClient = 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30
end
var.preset.plate = guiCreateGridList(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35, 300, 100, false, var.window)
guiSetVisible(var.preset.plate, false)
var.label.plateText = guiCreateLabel(25, 10, 40, 30, "Номер", false, var.preset.plate)
guiLabelSetVerticalAlign(var.label.plateText, "center")
var.edit.plateText = guiCreateEdit(105, 10, 155, 30, "", false, var.preset.plate)
guiEditSetMaxLength(var.edit.plateText, 6)
guiSetProperty(var.edit.plateText, "ValidationString", "^[A-Za-z0-9]*$")
local flag = false

local function sub_1002(arg1)
    if arg1 ~= var.edit.plateText then
        return
    end
    if flag then
        return
    end
    flag = true
    guiSetText(arg1, utf8.upper(guiGetText(arg1)))
    flag = false
end

addEventHandler("onClientGUIChanged", var.edit.plateText, sub_1002, false)
var.label.regionText = guiCreateLabel(25, 55, 40, 30, "Регион", false, var.preset.plate)
guiLabelSetVerticalAlign(var.label.regionText, "center")
var.edit.regionText = guiCreateEdit(105, 55, 155, 30, "", false, var.preset.plate)
guiEditSetMaxLength(var.edit.regionText, 3)
guiSetProperty(var.edit.regionText, "ValidationString", "^[0-9]*$")
var.preset.accessory = guiCreateGridList(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35, 300, 100, false, var.window)
guiSetVisible(var.preset.accessory, false)
var.label.accessoryId = guiCreateLabel(25, 10, 40, 30, "ID", false, var.preset.accessory)
guiLabelSetVerticalAlign(var.label.accessoryId, "center")
var.edit.accessoryId = guiCreateEdit(105, 10, 155, 30, "", false, var.preset.accessory)
var.label.accessoryCount = guiCreateLabel(25, 55, 75, 30, "Количество", false, var.preset.accessory)
guiLabelSetVerticalAlign(var.label.accessoryCount, "center")
var.edit.accessoryCount = guiCreateEdit(105, 55, 155, 30, "", false, var.preset.accessory)
var.preset.house = guiCreateGridList(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35, 300, 100, false, var.window)
guiSetVisible(var.preset.house, false)
var.label.houseId = guiCreateLabel(25, 35, 55, 30, "ID дома", false, var.preset.house)
guiLabelSetVerticalAlign(var.label.houseId, "center")
var.edit.houseId = guiCreateEdit(105, 35, 155, 30, "", false, var.preset.house)
var.preset.vehicle = guiCreateGridList(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35, 300, 100, false, var.window)
guiSetVisible(var.preset.vehicle, false)
var.label.vehicleId = guiCreateLabel(25, 35, 55, 30, "ID авто", false, var.preset.vehicle)
guiLabelSetVerticalAlign(var.label.vehicleId, "center")
var.edit.vehicleId = guiCreateEdit(105, 35, 155, 30, "", false, var.preset.vehicle)

local function lockClient()
    for k, v in ipairs(tConfig.lotsTypes) do
        if isElement(var.preset[v]) then
            if k ~= guiComboBoxGetSelected(var.listTypes) + 1 then
                local var = var.preset[v]
            end
            guiSetVisible(var.preset[v], true)
        end
    end
end

local function sub_1003(arg1)
    lockClient()
end

addEventHandler("onClientGUIComboBoxAccepted", var.listTypes, sub_1003, false)
var.button.save = guiCreateButton(25, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35 + 120, 130, 30, "Сохранить", false, var.window)

local function var_5(arg1)
    if utf8.len(arg1) == 0 then
    end
    if tonumber("0") then
        local var = "" .. "0"
    end
    return ""
end

local var_6 = "add"
local state = nil

local function sub_1004(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    if not convertToTimestamp(guiGetText(var.edit.auctionDate)) then
        return outputNotification("Дата введена неверно")
    end
    if convertToTimestamp(guiGetText(var.edit.auctionDate)) < getServerTime().timestamp then
        return outputNotification("Вы не можете указать прошедшую дату")
    end
    if utf8.len(guiGetText(var.edit.lotName)) < 3 then
        return outputNotification("Название введено неверно")
    end
    if tonumber(var_5(guiGetText(var.edit.startBet))) then
        local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
        local var_1 = guiGetText(var.edit.lotName)
        local var_2 = var_5(guiGetText(var.edit.startBet))
    end
    return outputNotification("Начальная ставка введена неверно")
    end

    if tConfig.lotsTypes[guiComboBoxGetSelected(var.listTypes) + 1] == "vehicle" then
        if tonumber(guiGetText(var.edit.vehicleId)) then
            local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
            local var_1 = guiGetText(var.edit.lotName)
            local var_2 = var_5(guiGetText(var.edit.startBet))
            local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
            local tripClient = {}
            local var_5 = guiGetText(var.edit.vehicleId)
        end
        return outputNotification("ID авто введено неверно")
    end
    if tConfig.lotsTypes[guiComboBoxGetSelected(var.listTypes) + 1] == "plate" then
        if utf8.len(guiGetText(var.edit.plateText)) < 6 then
            return outputNotification("Номер введен неверно")
        end
        if tonumber(guiGetText(var.edit.regionText)) then
            local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
            local var_1 = guiGetText(var.edit.lotName)
            local var_2 = var_5(guiGetText(var.edit.startBet))
            local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
            local tripClient = { id = guiGetText(var.edit.vehicleId) }
            local var_5 = guiGetText(var.edit.plateText)
            local var_6 = guiGetText(var.edit.regionText)
        end
        return outputNotification("Регион введен неверно")
        end
        if not string.match(plateFixup(guiGetText(var.edit.plateText)), "^[ABCEHOPTKYMX][0-9][0-9][0-9][ABCEHOPTKYMX][ABCEHOPTKYMX]$") then
            if not string.match(plateFixup(guiGetText(var.edit.plateText)), "^[0-9][0-9][0-9][0-9][ABCEHOPTKYMX][ABCEHOPTKYMX]$") then
                return outputNotification("Номер введен неверно")
            end
            local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
            local var_1 = guiGetText(var.edit.lotName)
            local var_2 = var_5(guiGetText(var.edit.startBet))
            local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
            local tripClient = { id = guiGetText(var.edit.vehicleId) }
            local var_5 = plateFixup(guiGetText(var.edit.plateText))
            local var_6 = guiGetText(var.edit.regionText)
            local var_7 = plateFixup(guiGetText(var.edit.plateText))
            local var_8 = "^[0-9][0-9][0-9][0-9][ABCEHOPTKYMX][ABCEHOPTKYMX]$"
        end
        local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
        local var_1 = guiGetText(var.edit.lotName)
        local var_2 = var_5(guiGetText(var.edit.startBet))
        local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
        local tripClient = { id = guiGetText(var.edit.vehicleId), text = plateFixup(guiGetText(var.edit.plateText)), region = guiGetText(var.edit.regionText) }
        local var_5 = plateFixup(guiGetText(var.edit.plateText))
        local var_6 = "^[ABCEHOPTKYMX][0-9][0-9][0-9][ABCEHOPTKYMX][ABCEHOPTKYMX]$"
    end
    if tConfig.lotsTypes[guiComboBoxGetSelected(var.listTypes) + 1] == "house" then
        if tonumber(guiGetText(var.edit.houseId)) then
            local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
            local var_1 = guiGetText(var.edit.lotName)
            local var_2 = var_5(guiGetText(var.edit.startBet))
            local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
            local tripClient = { id = guiGetText(var.edit.vehicleId), text = plateFixup(guiGetText(var.edit.plateText)), region = guiGetText(var.edit.regionText) }
            local var_5 = guiGetText(var.edit.houseId)
        end
        return outputNotification("ID дома введено неверно")
    end
    if tConfig.lotsTypes[guiComboBoxGetSelected(var.listTypes) + 1] == "accessory" then
        if tonumber(guiGetText(var.edit.accessoryId)) then
            local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
            local var_1 = guiGetText(var.edit.lotName)
            local var_2 = var_5(guiGetText(var.edit.startBet))
            local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
            local tripClient = {
                id = guiGetText(var.edit.vehicleId),
                text = plateFixup(guiGetText(var.edit.plateText)),
                region = guiGetText(var.edit.regionText),
                id = guiGetText(var.edit.houseId),
            }
            local var_5 = guiGetText(var.edit.accessoryId)
            local var_6 = guiGetText(var.edit.accessoryCount)
        end
        return outputNotification("ID аксессуара введено неверно")
        end
        return outputNotification("Количество аксессуара введено неверно")
    end
    if var_6 == "add" then
        triggerServerEvent("auction:addNewLot", resourceRoot, guiGetText(var.edit.lotName), tonumber(var_5(guiGetText(var.edit.startBet))), tonumber(guiComboBoxGetSelected(var.listTypes) + 1), {
        id = guiGetText(var.edit.vehicleId),
        text = plateFixup(guiGetText(var.edit.plateText)),
        region = guiGetText(var.edit.regionText),
        id = guiGetText(var.edit.houseId),
        id = guiGetText(var.edit.accessoryId),
        count = guiGetText(var.edit.accessoryCount),
    }, tonumber(convertToTimestamp(guiGetText(var.edit.auctionDate))))
        local var = convertToTimestamp(guiGetText(var.edit.auctionDate))
        local var_1 = guiGetText(var.edit.lotName)
        local var_2 = var_5(guiGetText(var.edit.startBet))
        local lockClient = guiComboBoxGetSelected(var.listTypes) + 1
        local tripClient = {
            id = guiGetText(var.edit.vehicleId),
            text = plateFixup(guiGetText(var.edit.plateText)),
            region = guiGetText(var.edit.regionText),
            id = guiGetText(var.edit.houseId),
            id = guiGetText(var.edit.accessoryId),
            count = guiGetText(var.edit.accessoryCount),
        }
    end
    triggerServerEvent("auction:editLot", resourceRoot, state.id, guiGetText(var.edit.lotName), tonumber(var_5(guiGetText(var.edit.startBet))), tonumber(guiComboBoxGetSelected(var.listTypes) + 1), {
    id = guiGetText(var.edit.vehicleId),
    text = plateFixup(guiGetText(var.edit.plateText)),
    region = guiGetText(var.edit.regionText),
    id = guiGetText(var.edit.houseId),
    id = guiGetText(var.edit.accessoryId),
    count = guiGetText(var.edit.accessoryCount),
}, tonumber(convertToTimestamp(guiGetText(var.edit.auctionDate))))
    guiSetVisible(var.window, false)
end
addEventHandler("onClientGUIClick", var.button.save, sub_1004, false)
var.button.close = guiCreateButton(195, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35 + 120, 130, 30, "Отмена", false, var.window)

local function sub_1005(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 ~= "up" then
        return
    end
    guiSetVisible(var.window, false)
    state = {}
end

addEventHandler("onClientGUIClick", var.button.close, sub_1005, false)
guiSetSize(var.window, 350, 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35 + 120 + 50, false)
guiSetPosition(var.window, (screenX - 450) / 2, (screenY - 25 + 30 + 35 + 35 + 30 + 35 + 30 + 35 + 30 + 35 + 120 + 50) / 2, false)

local function var_9()
    if var_6 == "add" then
    end
    guiSetText(var.window, "Редактирование" .. " лота")
    if var_6 == "add" then
    end
    guiSetText(var.button.save, "Сохранить")
    guiSetText(var.edit.vehicleId, "")
    guiSetText(var.edit.houseId, "")
    guiSetText(var.edit.accessoryId, "")
    guiSetText(var.edit.accessoryCount, "")
    guiSetText(var.edit.plateText, "")
    guiSetText(var.edit.regionText, "")
    guiSetText(var.edit.lotName, "")
    guiSetText(var.edit.startBet, "")
    guiSetText(var.edit.auctionDate, "")
    guiSetEnabled(var.edit.startBet, true)
    guiComboBoxSetSelected(var.listTypes, 1)
    if var_6 == "edit" then
        guiSetText(var.edit.lotName, state.name)
        guiSetText(var.edit.startBet, state.startBet)
        guiSetText(var.edit.auctionDate, string.format("%02d.%02d.%02d %02d:%02d", getServerTime(state.timestamp).monthday, getServerTime(state.timestamp).month + 1, getServerTime(state.timestamp).year + 1900 - 2000, getServerTime(state.timestamp).hour, getServerTime(state.timestamp).minute))
        guiSetEnabled(var.edit.startBet, not state.active)
        guiComboBoxSetSelected(var.listTypes, state.type - 1)
        if tConfig.lotsTypes[state.type] == "vehicle" then
            guiSetText(var.edit.vehicleId, state.data.id)
            local var = tConfig.lotsTypes[state.type]
        end
        if tConfig.lotsTypes[state.type] == "house" then
            guiSetText(var.edit.houseId, state.data.id)
            local var = tConfig.lotsTypes[state.type]
        end
        if tConfig.lotsTypes[state.type] == "accessory" then
            guiSetText(var.edit.accessoryId, state.data.id)
            guiSetText(var.edit.accessoryCount, state.data.count)
            local var = tConfig.lotsTypes[state.type]
        end
        if tConfig.lotsTypes[state.type] == "plate" then
            guiSetText(var.edit.plateText, state.data.text)
            guiSetText(var.edit.regionText, state.data.region)
        end
    end
    lockClient()
end

showLotEditGUI = function(arg1, arg2)
    state = {}
    var_6 = arg1
    guiSetVisible(var.window, true)
    var_9()
    guiSetInputMode("no_binds_when_editing")
end

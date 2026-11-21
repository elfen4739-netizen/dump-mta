-- ByteRevenant
-- LuaQ 5.1 structured decompile

local flag = false
local flag_1 = false
local flag_2 = true
local var = {}

local function lockClient(arg1, arg2)
    if flag_2 == arg2 then
        return
    end
    if arg2 then
        hdxSetElementText(var[arg1].OrderGUI.inOutButton, "Записаться в очередь")
        hdxSetElementColor(var[arg1].OrderGUI.inOutButton, STATE_IDLE, tocolor(70, 185, 124, 255))
        hdxSetElementColor(var[arg1].OrderGUI.inOutButton, STATE_HOVERED, tocolor(62, 165, 110, 255))
        hdxSetElementColor(var[arg1].OrderGUI.inOutButton, STATE_PRESSED, tocolor(62, 165, 110, 255))
        local var = var[arg1].OrderGUI
    end
    hdxSetElementText(var[arg1].OrderGUI.inOutButton, "Выйти из очереди")
    hdxSetElementColor(var[arg1].OrderGUI.inOutButton, STATE_IDLE, tocolor(212, 76, 76, 255))
    hdxSetElementColor(var[arg1].OrderGUI.inOutButton, STATE_HOVERED, tocolor(212, 76, 76, 200))
    hdxSetElementColor(var[arg1].OrderGUI.inOutButton, STATE_PRESSED, tocolor(212, 76, 76, 200))
    flag_2 = arg2
end

local function tripClient()
    flag = false
    flag_1 = false
end

local function onClientResourceStart()
    for k, v in ipairs(getElementsByType("queue", resourceRoot)) do
        hdxSetElementRounded(hdxCreatePanel(0, 0, 480, 760, tocolor(45, 45, 45, 255)), 20)
        hdxSetElementVisible(hdxCreatePanel(0, 0, 480, 760, tocolor(45, 45, 45, 255)), false)
        local function sub_1001(arg1, arg2)
            if arg1 ~= "left" then
                return
            end
            if not arg2 then
                return
            end
            if source == var then
                triggerServerEvent(jobOrderName .. ":DeleteSpectator", v)
                CloseGUIOrder(v)
            end
            if source ~= var_1 then
                return
            end
            if not flag then
                if flag_2 then
                    triggerServerEvent(jobOrderName .. ":AddInOrder", v)
                    lockClient(v, false)
                end
                triggerServerEvent(jobOrderName .. ":DeleteFromOrder", v)
                lockClient(v, true)
                flag = true
                setTimer(tripClient, 1500, 1)
            end
            if flag_1 then
                return
            end
            flag_1 = true
            exports.province_notifications:sendNotification("Немного подождите!")
        end
        addEventHandler("onHdxElementPressed", resourceRoot, sub_1001)
    end
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

local function var_6(arg1, arg2)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or nil))
    local hdxSetListCustomRowColor = data and data.hdxSetListCustomRowColor
    local gridlist = data and data.gridlist
    local tocolor = data and data.tocolor
end

local function var_7(arg1, arg2)
    hdxSetListCustomRowColor(var[arg1].OrderGUI.gridlist, arg2, STATE_IDLE, false)
    hdxSetListCustomRowColor(var[arg1].OrderGUI.gridlist, arg2, STATE_HOVERED, false)
end

AddRowGridlist = function(arg1, arg2)
    hdxChangeListContent(var[arg1].OrderGUI.gridlist, var)
    for k, v in ipairs(var[arg1].clientTable.Order) do
        hdxAddListRow(var[arg1].OrderGUI.gridlist, k .. ". " .. v)
        if getPlayerNametagText(localPlayer) == v then
            var_6(arg1, k)
            local var_1 = var[arg1].OrderGUI
            local var_2 = var[arg1].clientTable.Order
        end
        var_7(arg1, k)
        local var_1 = var[arg1].OrderGUI
        local var_2 = var[arg1].clientTable.Order
    end
    if not false then
        local var_1 = var[arg1].OrderGUI
        local var_2 = var[arg1].clientTable.Order
    end
    hdxSetElementContentHeight(var[arg1].OrderGUI.gridlist, _y(50) * #var[arg1].clientTable.Order)
end

DeleteRowGridlist = function(arg1, arg2)
    if arg2 == getPlayerNametagText(localPlayer) then
        local var = var[arg1].clientTable.Order
        local var_1 = var[arg1].OrderGUI
    end
    hdxChangeListContent(var[arg1].OrderGUI.gridlist, var)
    for k, v in ipairs(var[arg1].clientTable.Order) do
        hdxAddListRow(var[arg1].OrderGUI.gridlist, k .. ". " .. v)
        if getPlayerNametagText(localPlayer) == v then
            var_6(arg1, k)
            local var_1 = var[arg1].clientTable.Order
            local var_2 = var[arg1].OrderGUI
        end
        var_7(arg1, k)
        local var_1 = var[arg1].clientTable.Order
        local var_2 = var[arg1].OrderGUI
    end
    if not false then
        local var_1 = var[arg1].clientTable.Order
        local var_2 = var[arg1].OrderGUI
    end
    hdxSetElementContentHeight(var[arg1].OrderGUI.gridlist, _y(50) * #var[arg1].clientTable.Order)
end

ChangeRowGridlist = function(arg1, arg2, arg3)
    if not arg2 or not arg3 then
        local var = var[arg1].clientTable
        local var_1 = var[arg1].OrderGUI
    end
    hdxChangeListContent(var[arg1].OrderGUI.gridlist, var)
    for k, v in ipairs(var[arg1].clientTable) do
        hdxAddListRow(var[arg1].OrderGUI.gridlist, k .. ". " .. v)
        if getPlayerNametagText(localPlayer) == v then
            var_6(arg1, k)
            local var_1 = var[arg1].clientTable
            local var_2 = var[arg1].OrderGUI
        end
        var_7(arg1, k)
        local var_1 = var[arg1].clientTable
        local var_2 = var[arg1].OrderGUI
    end
    if not false then
        local var_1 = var[arg1].clientTable
        local var_2 = var[arg1].OrderGUI
    end
    hdxSetElementContentHeight(var[arg1].OrderGUI.gridlist, _y(50) * #var[arg1].clientTable)
end

UpdateCommonClientGUI = function(arg1)
    if not var[arg1].clientTable then
        return
    end
    hdxSetElementText(var[arg1].OrderGUI.label, "Работают:  " .. (#var[arg1].clientTable.Drivers or 0))
end

UpdateClientGUI = function(arg1)
    if not var[arg1].OrderGUI.gridlist or not var[arg1].clientTable.Order then
        local var = var[arg1].OrderGUI
        local var_1 = var[arg1].clientTable.Order
    end
    hdxChangeListContent(var[arg1].OrderGUI.gridlist, var)
    for k, v in ipairs(var[arg1].clientTable.Order) do
        hdxAddListRow(var[arg1].OrderGUI.gridlist, k .. ". " .. var[arg1].clientTable.Order[k])
        if getPlayerNametagText(localPlayer) == v then
            var_6(arg1, item)
            local var_1 = var[arg1].OrderGUI
            local var_2 = var[arg1].clientTable.Order
        end
        var_7(arg1, k)
        local var_1 = var[arg1].OrderGUI
        local var_2 = var[arg1].clientTable.Order
    end
    if not false then
        local var_1 = var[arg1].OrderGUI
        local var_2 = var[arg1].clientTable.Order
    end
    hdxSetElementContentHeight(var[arg1].OrderGUI.gridlist, _y(50) * #var[arg1].clientTable.Order)
    UpdateCommonClientGUI(arg1)
end

local function var_8(arg1, arg2)
    if arg1 == false then
        for k, v in ipairs(getElementsByType("gui-window", guiRoot)) do
            if guiGetVisible(v) then
                local var = guiGetVisible(v)
            end
            local var = guiGetVisible(v)
        end
    end
    return showCursor(arg1, arg2)
end

addEvent(jobOrderName .. ":OpenOrderWindow", true)

local function sub_1002()
    hdxSetElementVisible(var[source].OrderGUI.window, true)
    var_8(true)
end

addEventHandler(jobOrderName .. ":OpenOrderWindow", resourceRoot, sub_1002)

CloseGUIOrder = function(arg1)
    hdxSetElementVisible(var[arg1].OrderGUI.window, false)
    var_8(false)
    var[arg1].clientTable = {
        Drivers = {},
        Order = {},
    }
    var[arg1].clientTableAssociative = {
        Drivers = {},
        Order = {},
    }
end

addEvent(jobOrderName .. ":CloseGUIOrder", true)

local function sub_1003()
    CloseGUIOrder(source)
end

addEventHandler(jobOrderName .. ":CloseGUIOrder", resourceRoot, sub_1003)

CopyServerTableToClient = function(self)
    if not self then
        return
    end
    var[source].clientTable = self.sOrderTable
    var[source].clientTableAssociative = self.sOrderTableAssociative
    UpdateClientGUI(source)
end

addEvent(jobOrderName .. ":SendOrderTableToClient", true)
addEventHandler(jobOrderName .. ":SendOrderTableToClient", resourceRoot, CopyServerTableToClient)

AddToOrderTable = function(arg1, arg2)
    if not arg1 then
        return
    end
    if not arg2 then
        return
    end
    if arg1 == "Order" then
        AddInOrder(source, arg2)
    end
    if arg1 == "Drivers" then
        AddDriver(source, arg2)
    end
    UpdateCommonClientGUI(source)
end

addEvent(jobOrderName .. ":AddToOrderTable", true)
addEventHandler(jobOrderName .. ":AddToOrderTable", resourceRoot, AddToOrderTable)

DelFromOrderTable = function(arg1, arg2)
    if not arg1 then
        return
    end
    if not arg2 then
        return
    end
    if arg1 == "Drivers" then
        DeleteDriver(source, arg2)
    end
    if arg1 == "Order" then
        DeleteInOrder(source, arg2)
    end
    UpdateCommonClientGUI(source)
end

addEvent(jobOrderName .. ":DelFromOrderTable", true)
addEventHandler(jobOrderName .. ":DelFromOrderTable", resourceRoot, DelFromOrderTable)

local function sub_1004(self, arg2)
    local data = (type(arg2) == "table" and arg2 or nil)
    local pairs = data and data.pairs
    local clientTableAssociative = data and data.clientTableAssociative
    local tonumber = data and data.tonumber
    local clientTable = data and data.clientTable
end

addEventHandler("province:onClientPlayerNicknameChanged", root, sub_1004)

RecountIdTable = function(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local clientTable = data and data.clientTable
    local clientTableAssociative = data and data.clientTableAssociative
end

AddDriver = function(arg1, arg2)
    if var[arg1].clientTableAssociative.Drivers[arg2] then
        return
    end
    if var[arg1].workPlaces <= table.getn(var[arg1].clientTable.Drivers) then
        return
    end
    var[arg1].clientTable.Drivers[table.getn(var[arg1].clientTable.Drivers) + 1] = arg2
    var[arg1].clientTableAssociative.Drivers[arg2] = table.getn(var[arg1].clientTable.Drivers) + 1
end

DeleteDriver = function(arg1, arg2)
    if not var[arg1].clientTableAssociative.Drivers[arg2] then
        return
    end
    table.remove(var[arg1].clientTable.Drivers, var[arg1].clientTableAssociative.Drivers[arg2])
    var[arg1].clientTableAssociative.Drivers[arg2] = nil
    RecountIdTable(arg1)
end

AddInOrder = function(arg1, arg2, arg3)
    if var[arg1].clientTableAssociative.Order[arg2] then
        return
    end
    var[arg1].clientTable.Order[table.getn(var[arg1].clientTable.Order) + 1] = arg2
    var[arg1].clientTableAssociative.Order[arg2] = table.getn(var[arg1].clientTable.Order) + 1
    AddRowGridlist(arg1, table.getn(var[arg1].clientTable.Order) + 1)
end

DeleteInOrder = function(arg1, arg2)
    if not var[arg1].clientTableAssociative.Order[arg2] then
        return
    end
    table.remove(var[arg1].clientTable.Order, var[arg1].clientTableAssociative.Order[arg2])
    var[arg1].clientTableAssociative.Order[arg2] = nil
    RecountIdTable(arg1)
    DeleteRowGridlist(arg1, arg2)
end

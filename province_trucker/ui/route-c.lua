local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local state = nil
local var = {}
local state_1 = nil

getSelectRouteId = function()
    return var[state_1].routeId
end

getSelectContractId = function()
    return var[state_1].contractId
end

local function var_2(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local hdxSetElementColor = data and data.hdxSetElementColor
    local tocolor = data and data.tocolor
end

local function lockClient(arg1)
    state = arg1
    hdxSetElementColor(arg1, STATE_ALL, tocolor(32, 172, 191, 39))
end

local function tripClient(arg1)
    if arg1 then
        hdxSetElementColor(tGUI.route.rent, STATE_IDLE, tocolor(17, 47, 54))
        hdxSetElementColor(tGUI.route.rent, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(tGUI.route.rent, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementDisabled(tGUI.route.rent, false)
        hdxSetElementColor(tGUI.route.buttonText, STATE_ALL, tocolor(255, 255, 255))
        hdxSetElementColor(tGUI.route.buttonImage, STATE_ALL, tocolor(255, 255, 255))
    end
    hdxSetElementColor(tGUI.route.rent, STATE_ALL, tocolor(25, 27, 32))
    hdxSetElementDisabled(tGUI.route.rent, true)
    hdxSetElementColor(tGUI.route.buttonText, STATE_ALL, tocolor(255, 255, 255, 85))
    hdxSetElementColor(tGUI.route.buttonImage, STATE_ALL, tocolor(255, 255, 255, 85))
end

local function sub_1001(self)
    if isElement(tGUI.route.myContractPanel) then
        return
    end
    hdxSetElementColor(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), STATE_HOVERED, tocolor(24, 32, 40, 200))
    hdxSetElementColor(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), STATE_PRESSED, tocolor(24, 32, 40, 200))
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), tGUI.route.window, "left", "top", false, 32, 256)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), 5)
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 1007, 2, tocolor(34, 35, 41, 255), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), "left", "under", false, 0, 8)
    hdxSetElementRelativePosition(hdxCreateLabel(self.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), "left", "top", false, 10, 8)
    hdxSetElementDisabled(hdxCreateLabel(self.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), true)
    if 1 < value_4 then
        hdxSetElementRelativePosition(hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreateLabel(self.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), "left", "under", false, 0, 0)
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)
        local var_5 = hdxCreateLabel(self.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window))
        local var_6 = hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window))
    end
    hdxSetElementRelativePosition(hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreateLabel(self.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), "left", "under", false, 0, 8)
    hdxSetElementDisabled(hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(getGoodsName(self.goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), "left", "center", false, 294, 5)
    hdxSetElementDisabled(hdxCreateLabel(getGoodsName(self.goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format("%s ед.", splitWithPoints((self.goodsCount or 5), " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), "left", "center", false, 529, 5)
    hdxSetElementDisabled(hdxCreateLabel(string.format("%s ед.", splitWithPoints(self.goodsCount, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(self.salary, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), "left", "center", false, 678, 5)
    hdxSetElementDisabled(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(self.salary, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), true)
    if getGoodsTruckType(self.goods) == "all" then
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)
        local var_5 = getGoodsTruckType(self.goods)
    end
    if getGoodsTruckType(self.goods) == "van" then
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)
        local var_5 = "Фургон"
    end
    hdxSetElementRelativePosition(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window), "left", "center", false, 867, 5)
    hdxSetElementDisabled(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)), true)
    tGUI.route.myContractPanel = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 32, 40, 255), tGUI.route.window)
end

local function var_6(arg1)
    local var = {}
    for k, v in pairs(tPlayerData.contracts) do
        v.businessId = k
        var[#var + 1] = v
    end
    if not next(var) then
        return var
    end
    local function sub_1002(arg1, arg2)
        if arg2.time >= arg1.time then
        end
        return true
    end
    table.sort(var, sub_1002)
    return var
end

local function var_7(arg1, arg2)
    hdxSetElementColor(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), STATE_HOVERED, tocolor(30, 31, 38, 50))
    hdxSetElementColor(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), STATE_PRESSED, tocolor(30, 31, 38, 50))
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), tGUI.route.space, "left", "top", false, 0, 77 * (arg1 - 1))
    hdxSetElementRounded(hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), 5)
    hdxSetElementRelativePosition(hdxCreateLabel(arg2.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), "left", "top", false, 10, 8)
    hdxSetElementDisabled(hdxCreateLabel(arg2.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), true)
    if not isElement(tGUI.route.routeFont) then
        tGUI.route.routeScale = value_2
        tGUI.route.routeFont = value_1
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)
        local lockClient = hdxCreateLabel(arg2.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space))
        local text = string.format("%s > %s", getZoneName(arg2.load), getZoneName(arg2.unload))
    end
    if 1 < value_4 then
        hdxSetElementRelativePosition(hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreateLabel(arg2.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), "left", "under", false, 0, 0)
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)
        local var_5 = hdxCreateLabel(arg2.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space))
        local var_6 = hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space))
    end
    hdxSetElementRelativePosition(hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreateLabel(arg2.name, 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), "left", "under", false, 0, 8)
    hdxSetElementDisabled(hdxCreateLabel(value_1, 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(getGoodsName(arg2.goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), "left", "center", false, 294, 5)
    hdxSetElementDisabled(hdxCreateLabel(getGoodsName(arg2.goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format("%s ед.", splitWithPoints((arg2.goodsCount or 5), " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), "left", "center", false, 529, 5)
    hdxSetElementDisabled(hdxCreateLabel(string.format("%s ед.", splitWithPoints(arg2.goodsCount, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(arg2.salary, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), "left", "center", false, 678, 5)
    hdxSetElementDisabled(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(arg2.salary, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), true)
    if getGoodsTruckType(arg2.goods) == "all" then
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)
        local var_5 = getGoodsTruckType(arg2.goods)
    end
    if getGoodsTruckType(arg2.goods) == "van" then
        local var = hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)
        local var_5 = "Фургон"
    end
    hdxSetElementRelativePosition(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space), "left", "center", false, 867, 5)
    hdxSetElementDisabled(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space)), true)
    table.insert(tGUI.route.spaceElements, hdxCreatePanel(0, 0, 1007, 71, tocolor(24, 26, 32, 50), tGUI.route.space))
end

local var_8 = {
    pressFunc =     function(arg1, arg2)
        if source == tGUI.route.rent then
            if not getSelectRouteId() then
                local var = getSelectContractId()
            end
            if not isElement(tPlayerData.vehicle) then
                outputNotification("Произошла ошибка")
                closeInterface()
            end
            if not checkValidTruck(tPlayerData.vehicle, var[state_1].goods) then
                outputNotification("Тип вашего транспорта не подходит для выполнения этого контракта.")
            end
            openInterface("route_detail", var[state_1])
            local var = "route_detail"
            local var_1 = var[state_1]
        end
        if source == tGUI.route.cancelRoute then
            tPlayerData.routeInProgress = false
            triggerServerEvent("trucker:cancelRoute", resourceRoot)
            hdxSetElementVisible(tGUI.route.cancelRoute, false)
            hdxSetElementVisible(tGUI.route.rent, true)
        end
        if source == tGUI.route.closePanel then
            closeInterface()
        end
        for k, v in pairs(tGUI.route.spaceElements) do
            if source == v then
                if not state then
                    var_2(state)
                    lockClient(v)
                    state_1 = k
                end
                if state then
                    if state == v then
                        var_2(state)
                        state_1 = nil
                    end
                end
            end
        end
    end,
    create =     function()
        if tGUI.route then
            if isElement(tGUI.route.window) then
                return
            end
            local var = {}
        end
        hdxSetElementRounded(nil.window, 10)
        hdxSetElementRelativePosition(nil.window, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 296, 592, "images/truckIcon.dds", tocolor(255, 255, 255), nil.window), nil.window, "left", "center", false, 0, 0)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 237, 253, "images/backIcon.dds", tocolor(255, 255, 255), nil.window), nil.window, "right", "top", false, 0, 0)
        hdxSetElementColor(nil.closePanel, STATE_HOVERED, tocolor(191, 32, 32))
        hdxSetElementColor(nil.closePanel, STATE_PRESSED, tocolor(191, 32, 32))
        hdxSetElementRelativePosition(nil.closePanel, nil.window, "right", "top", false, 32, 32)
        hdxSetElementRounded(nil.closePanel, 5)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 13, 13, "images/close.dds", tocolor(255, 255, 255), nil.closePanel), nil.closePanel, "center", "center", false, 30, 30)
        hdxSetElementDisabled(hdxCreateImage(0, 0, 13, 13, "images/close.dds", tocolor(255, 255, 255), nil.closePanel), true)
        hdxSetElementRelativePosition(hdxCreateLabel("РАБОТА ДАЛЬНОБОЙЩИКА", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(32), nil.window), nil.window, "left", "top", false, 32, 32)
        hdxSetElementRelativePosition(nil.labelBase, hdxCreateLabel("РАБОТА ДАЛЬНОБОЙЩИКА", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(32), nil.window), "left", "under", false, 0, 6)
        hdxSetElementRelativePosition(nil.labelSelectContract, nil.labelBase, "atright", "center", false, 8, 0)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 20, 20, "images/myTruck.dds", tocolor(255, 255, 255), nil.window), nil.window, "left", "top", false, 32, 159)
        hdxSetElementDisabled(hdxCreateImage(0, 0, 20, 20, "images/myTruck.dds", tocolor(255, 255, 255), nil.window), true)
        hdxSetElementRelativePosition(hdxCreateLabel("Ваш транспорт", 0, 0, tocolor(255, 255, 255, 85), "FuturaBook", convertFigmaFontSize(16), nil.window), hdxCreateImage(0, 0, 20, 20, "images/myTruck.dds", tocolor(255, 255, 255), nil.window), "left", "above", false, 0, 3)
        hdxSetElementRelativePosition(nil.hrHeader, nil.window, "right", "top", false, 32, 166)
        hdxSetElementRounded(nil.hrHeader, 1)
        hdxSetElementRelativePosition(nil.truckName, hdxCreateImage(0, 0, 20, 20, "images/myTruck.dds", tocolor(255, 255, 255), nil.window), "atright", "center", false, 10, 0)
        hdxSetElementRelativePosition(nil.truckGoodsPanel, nil.truckName, "atright", "center", false, 10, 0)
        hdxSetElementRounded(nil.truckGoodsPanel, 5)
        hdxSetElementRelativePosition(nil.truckGoodsLabel, nil.truckGoodsPanel, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(nil.space, nil.window, "left", "top", false, 32, 256)
        hdxSetElementScrollWidth(nil.space, 6)
        hdxSetElementColor(nil.space, STATE_ALL, tocolor(0, 0, 0, 0))
        hdxSetElementScrollColor(nil.space, STATE_IDLE, tocolor(30, 31, 38))
        hdxSetElementScrollColor(nil.space, STATE_HOVERED, tocolor(30, 31, 38, 200))
        hdxSetElementScrollColor(nil.space, STATE_PRESSED, tocolor(30, 31, 38, 200))
        hdxSetElementRelativePosition(nil.labelHeader, nil.window, "left", "top", false, 42, 217)
        hdxSetElementRelativePosition(nil.labelHeader2, nil.window, "left", "top", false, 326, 217)
        hdxSetElementRelativePosition(nil.labelHeader3, nil.window, "left", "top", false, 561, 217)
        hdxSetElementRelativePosition(nil.labelHeader4, nil.window, "left", "top", false, 710, 217)
        hdxSetElementRelativePosition(nil.labelHeader5, nil.window, "left", "top", false, 899, 217)
        hdxSetElementRelativePosition(nil.rent, nil.window, "right", "bottom", false, 32, 32)
        hdxSetElementColor(nil.rent, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(nil.rent, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementRounded(nil.rent, 5)
        hdxSetElementDisabled(nil.buttonText, true)
        hdxSetElementDisabled(nil.buttonImage, true)
        hdxSetElementRelativePosition(nil.buttonImage, nil.rent, "right", "center", false, math.floor((180 - xFHD(dxGetTextWidth("Начать рейс", nil.fontScale, nil.font)) + 24) / 2), 0)
        hdxSetElementRelativePosition(nil.buttonText, nil.rent, "left", "center", false, math.floor((180 - xFHD(dxGetTextWidth("Начать рейс", nil.fontScale, nil.font)) + 24) / 2), 0)
        hdxSetElementRelativePosition(nil.cancelRoute, nil.window, "right", "bottom", false, 32, 32)
        hdxSetElementColor(nil.cancelRoute, STATE_HOVERED, tocolor(191, 32, 32, 128))
        hdxSetElementColor(nil.cancelRoute, STATE_PRESSED, tocolor(191, 32, 32, 128))
        hdxSetElementRounded(nil.cancelRoute, 5)
        hdxSetElementFont(nil.cancelRoute, "FuturaDemi", 11)
        tGUI.route = {
            window = hdxCreatePanel(0, 0, 1071, 731, tocolor(23, 24, 32)),
            closePanel = hdxCreatePanel(0, 0, 32, 32, tocolor(32, 33, 40), nil.window),
            labelBase = hdxCreateLabel("БАЗА Т1", 0, 0, tocolor(32, 172, 191), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelSelectContract = hdxCreateLabel("ВЫБЕРИТЕ КОНТРАКТ", 0, 0, tocolor(255, 255, 255, 85), "FuturaBook", convertFigmaFontSize(20), nil.window),
            hrHeader = hdxCreatePanel(0, 0, 880, 2, tocolor(255, 255, 255, 10), nil.window),
            maxHrHeader = _x(880),
            truckName = hdxCreateLabel("", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), nil.window),
            truckGoodsPanel = hdxCreatePanel(0, 0, 87, 32, tocolor(29, 30, 36), nil.window),
            truckGoodsLabel = hdxCreateLabel("1000 ед.", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), nil.truckGoodsPanel),
            space = hdxCreateSpace(0, 0, 1026, 366, "", nil.window),
            labelHeader = hdxCreateLabel("Предприятие", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelHeader2 = hdxCreateLabel("Тип груза", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelHeader3 = hdxCreateLabel("Заказ", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelHeader4 = hdxCreateLabel("Плата за рейс", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelHeader5 = hdxCreateLabel("Условия", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            rent = hdxCreatePanel(0, 0, 180, 48, tocolor(17, 47, 54), nil.window),
            fontScale = value_2,
            font = value_1,
            buttonText = hdxCreateLabel("Начать рейс", 0, 0, tocolor(255, 255, 255, 85), "FuturaBook", convertFigmaFontSize(18), nil.rent),
            buttonImage = hdxCreateImage(0, 0, 24, 24, "images/buttonNext.dds", tocolor(255, 255, 255), nil.rent),
            cancelRoute = hdxCreateButton(0, 0, 180, 48, tocolor(191, 32, 32, 51), "Завершить рейс", nil.window),
            routeScale = value_4,
            routeFont = value_3,
            spaceElements = {},
        }
    end,
    update =     function(arg1)
        hdxSetElementVisible(tGUI.route.rent, not tPlayerData.routeInProgress)
        hdxSetElementVisible(tGUI.route.cancelRoute, tPlayerData.routeInProgress)
        if tGUI.route.spaceElements then
            if next(tGUI.route.spaceElements) then
                for k, v in pairs(tGUI.route.spaceElements) do
                    if isElement(v) then
                        destroyElement(v)
                    end
                end
            end
        end
        tGUI.route.spaceElements = {}
        if not tBusinessData then
            tBusinessData = exports.province_business:getAllBusiness()
        end
        if getTruckType(tPlayerData.vehicle) == VEHICLE_VAN then
            if not getElementData(tPlayerData.vehicle, "Complectation") then
                local var_2 = getOpenRouteIdDetail()
                local lockClient = getOpenContractIdDetail()
                local tripClient = getElementModel(tPlayerData.vehicle)
            end
            if not value_1 then
                local var_5 = getOpenRouteIdDetail()
                local var_6 = getOpenContractIdDetail()
            end
            if not value_2 then
                local tripClient = getOpenRouteIdDetail()
                local var_5 = getOpenContractIdDetail()
            end
            local tripClient = getOpenRouteIdDetail()
            local var_5 = getOpenContractIdDetail()
        end
        if tPlayerData.routeInProgress then
            if tPlayerData.contractInProgress and exports.province_business:getBusinessData(tPlayerData.routeInProgress) then
                if not (tPlayerData.contractData or exports.province_business:getBusinessData(tPlayerData.routeInProgress)).goods then
                    local lockClient = getOpenRouteIdDetail()
                    local tripClient = getOpenContractIdDetail()
                end
                if not tPlayerData.contractData.salary then
                    local lockClient = getOpenRouteIdDetail()
                    local tripClient = getOpenContractIdDetail()
                end
                if not tPlayerData.contractData.goods then
                    local lockClient = getOpenRouteIdDetail()
                    local tripClient = getOpenContractIdDetail()
                end
                local lockClient = getOpenRouteIdDetail()
                local tripClient = getOpenContractIdDetail()
            end
            if tRoutes[tPlayerData.routeInProgress] then
                if 30 < exports.province_levels:GetClientLevel() then
                    local lockClient = getOpenRouteIdDetail()
                    local tripClient = getOpenContractIdDetail()
                end
                local var = {
                    isVan = false,
                    isRent = tPlayerData.isRentVehicle,
                    maxGoods = 1000,
                    vanCoef = 1,
                }
                local tripClient = getOpenRouteIdDetail()
                local var_5 = getOpenContractIdDetail()
            end
            if false then
                hdxSetElementSize(tGUI.route.space, _x(1026), _y(289))
                hdxSetElementRelativePosition(tGUI.route.space, tGUI.route.window, "left", "top", false, 32, 352)
                local tripClient = getOpenRouteIdDetail()
                local var_5 = getOpenContractIdDetail()
                local var_8 = "left"
                local var_9 = "top"
            end
            local lockClient = getOpenRouteIdDetail()
            local tripClient = getOpenContractIdDetail()
        end
        if tPlayerData.routeInProgress then
            local lockClient = getOpenRouteIdDetail()
            local tripClient = getOpenContractIdDetail()
        end
        if isElement(tGUI.route.myContractPanel) then
            destroyElement(tGUI.route.myContractPanel)
            local lockClient = getOpenRouteIdDetail()
            local tripClient = getOpenContractIdDetail()
        end
        tGUI.route.myContractPanel = nil
        hdxSetElementSize(tGUI.route.space, _x(1026), _y(366))
        hdxSetElementRelativePosition(tGUI.route.space, tGUI.route.window, "left", "top", false, 32, 256)
        if var_6(tPlayerData.contracts) then
            if next(var_6(tPlayerData.contracts)) then
                for k, v in pairs(var_6(tPlayerData.contracts)) do
                    var.name = string.format("%s %s", tBusinessData[v.businessId].type, tBusinessData[v.businessId].name)
                    var.goods = tBusinessData[v.businessId].goods
                    var.load = tBusinessData[v.businessId].load
                    var.unload = tBusinessData[v.businessId].unload
                    if not v.deliveredGoods then
                        local tripClient = getOpenRouteIdDetail()
                        local var_5 = getOpenContractIdDetail()
                    end
                    var.goodsCount = v.goods - v.deliveredGoods - (v.delivery or v.goods - v.deliveredGoods)
                    var.contractId = v.businessId
                    local var_1 = { isVan = false, maxGoods = 1000 }
                    var.salary = getContractSalary(v.salary, var.goods, var.goodsCount, var_1)
                    if getOpenContractIdDetail() then
                        if getOpenContractIdDetail() == v.businessId then
                            local var_5 = getOpenRouteIdDetail()
                            local var_6 = getOpenContractIdDetail()
                        end
                        local var_5 = getOpenRouteIdDetail()
                        local var_6 = getOpenContractIdDetail()
                    end
                    var[1] = copyTable(var)
                    local var_5 = getOpenRouteIdDetail()
                    local var_6 = getOpenContractIdDetail()
                end
                local tripClient = getOpenRouteIdDetail()
                local var_5 = getOpenContractIdDetail()
            end
            local lockClient = getOpenRouteIdDetail()
            local tripClient = getOpenContractIdDetail()
        end
        if tPlayerData.routes then
            if next(tPlayerData.routes) then
                if 30 < exports.province_levels:GetClientLevel() then
                    local lockClient = getOpenRouteIdDetail()
                    local tripClient = getOpenContractIdDetail()
                end
                for k, v in pairs(tRoutes) do
                    if findInTable(tPlayerData.routes, k) then
                        var.name = "Государство"
                        var.goods = v.goods
                        var.load = v.load
                        var.unload = v.unload
                        var.goodsCount = 1000
                        var.routeId = k
                        var.salary = getRouteSalary(v.salary, v.goods, exports.province_levels:GetClientLevel(), var_1)
                        if false then
                            if getGoodsTruckType(var.goods) ~= "van" then
                                local var_5 = getOpenRouteIdDetail()
                                local var_6 = getOpenContractIdDetail()
                            end
                            var.goodsCount = 1000
                            local var_5 = getOpenRouteIdDetail()
                            local var_6 = getOpenContractIdDetail()
                        end
                        if getOpenRouteIdDetail() and getOpenRouteIdDetail() == k then
                            local var_5 = getOpenRouteIdDetail()
                            local var_6 = getOpenContractIdDetail()
                        end
                        var_7(1, var, isCurrentContract)
                        var[1] = copyTable(var)
                        local tripClient = getOpenRouteIdDetail()
                        local var_5 = getOpenContractIdDetail()
                        local var_7 = copyTable(var)
                    end
                    local lockClient = getOpenRouteIdDetail()
                    local tripClient = getOpenContractIdDetail()
                end
                local lockClient = getOpenRouteIdDetail()
                local tripClient = getOpenContractIdDetail()
            end
            local var_2 = getOpenRouteIdDetail()
            local lockClient = getOpenContractIdDetail()
        end
        hdxSetElementContentHeight(tGUI.route.space, 0)
        if isElement(tPlayerData.vehicle) then
            if not getElementData(tPlayerData.vehicle, "Complectation") then
                local var_1 = getOpenRouteIdDetail()
                local var_2 = getOpenContractIdDetail()
                local tripClient = getElementModel(tPlayerData.vehicle)
            end
            if getElementModel(tPlayerData.vehicle) then
                local var_1 = getOpenRouteIdDetail()
                local var_2 = getOpenContractIdDetail()
                local tripClient = "Неизвестно"
                local var_5 = getElementData(tPlayerData.vehicle, "Complectation")
            end
            local var_1 = getOpenRouteIdDetail()
            local var_2 = getOpenContractIdDetail()
            local tripClient = "Неизвестно"
        end
        if not isElement(tGUI.route.font) then
            local lockClient = getOpenRouteIdDetail()
            local tripClient = getOpenContractIdDetail()
            local var_6 = "Неизвестно"
        end
        hdxSetElementSize(tGUI.route.hrHeader, tGUI.route.maxHrHeader - dxGetTextWidth("Неизвестно", tGUI.route.fontScale, tGUI.route.font) + _x(32), _y(2))
        hdxSetElementText(tGUI.route.labelBase, string.format("БАЗА Т%s", (tPlayerData.city or "БАЗА Т%s")))
        hdxSetElementText(tGUI.route.truckName, "Неизвестно")
        hdxSetElementText(tGUI.route.truckGoodsLabel, 1000 .. " ед.")
        hdxSetElementRelativePosition(tGUI.route.truckGoodsPanel, tGUI.route.truckName, "atright", "center", false, 10, 0)
        hdxSetElementRelativePosition(tGUI.route.truckGoodsLabel, tGUI.route.truckGoodsPanel, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(tGUI.route.hrHeader, tGUI.route.window, "right", "top", false, 32, 166)
        if not getOpenRouteIdDetail() then
            local var = getOpenRouteIdDetail()
            local var_1 = getOpenContractIdDetail()
        end
        if true then
            closeInterface("route_detail")
            local var = getOpenRouteIdDetail()
            local var_1 = getOpenContractIdDetail()
        end
        if not getOpenRouteIdDetail() then
        end
        if false then
            if var[false] then
                openInterface("route_detail", var[false])
            end
        end
        hdxSetElementRelativePosition(tGUI.route.labelSelectContract, tGUI.route.labelBase, "atright", "center", false, 8, 0)
    end,
}

var_8.open = function(arg1)
    if tGUI.route then
    end
    var_8.create()
    var_8.update(arg1)
    hdxSetElementVisible(tGUI.route.window, true)
    tripClient(false)
    setElementData(localPlayer, "radialMenuDisable", "showHud", false)
    InterfaceEscClose = "route"
end

var_8.close = function()
    hdxSetElementVisible(tGUI.route.window, false)
    if isElement(tGUI.route.myContractPanel) then
        destroyElement(tGUI.route.myContractPanel)
    end
    tGUI.route.myContractPanel = nil
    if tGUI.route.spaceElements then
        if next(tGUI.route.spaceElements) then
            for k, v in pairs(tGUI.route.spaceElements) do
                if isElement(v) then
                    destroyElement(v)
                end
            end
        end
    end
    state_1 = nil
    tGUI.route.spaceElements = {}
    tPlayerData = {}
    triggerServerEvent("trucker:closeRouteWindow", resourceRoot)
    setElementData(localPlayer, "radialMenuDisable", false, false)
end

tInterface.route = var_8
addEvent("trucker:updateTruckerRoute", true)

local function sub_1003(arg1, arg2)
    if not hdxIsElementVisible(tGUI.route.window) then
        return
    end
    if arg2 then
        tPlayerData.contracts = arg2
    end
    if arg1 then
        tPlayerData.routes = arg1
    end
    tInterface.route.update()
end

addEventHandler("trucker:updateTruckerRoute", resourceRoot, sub_1003)
addEvent("trucker:openRoutePanel", true)

local function sub_1004(self)
    tPlayerData.city = (self.city or 1)
    tPlayerData.vehicle = (self.vehicle or false)
    tPlayerData.contracts = (self.contracts or false)
    tPlayerData.routes = (self.routes or false)
    tPlayerData.routeInProgress = (self.routeInProgress or false)
    tPlayerData.contractInProgress = (self.contractInProgress or false)
    tPlayerData.isRentVehicle = (self.isRentVehicle or false)
    tPlayerData.contractData = self.playerContract
    openInterface("route", self)
end

addEventHandler("trucker:openRoutePanel", resourceRoot, sub_1004)
addEvent("trucker:closeTruckPanel", true)

local function sub_1005()
    closeInterface()
end

addEventHandler("trucker:closeTruckPanel", resourceRoot, sub_1005)
addEvent("trucker:updateRoutePanel", true)

local function sub_1006()
    tPlayerData.routeInProgress = false
    tPlayerData.contractInProgress = false
    if not hdxIsElementVisible(tGUI.route.window) then
        return
    end
    tInterface.route.update()
end

addEventHandler("trucker:updateRoutePanel", resourceRoot, sub_1006)

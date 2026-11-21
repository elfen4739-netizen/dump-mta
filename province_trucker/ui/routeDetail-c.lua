local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local state = nil

getOpenRouteIdDetail = function()
    return state
end

local state_1 = nil

getOpenContractIdDetail = function()
    return state_1
end

tInterface.route_detail = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source == tGUI.route_detail.closePanel then
            closeInterface("route_detail")
        end
        if source ~= tGUI.route_detail.buttonNext then
            return
        end
        triggerServerEvent("trucker:takeContract", resourceRoot, getSelectRouteId(), getSelectContractId(), tPlayerData.vehicle)
        closeInterface()
    end,
    create =     function()
        if isElement(tGUI.route_detail.window) then
            return
        end
        hdxSetElementSize(nil.window, screenW, screenH)
        hdxSetElementRelativePosition(nil.window, "center", "center", false)
        hdxSetElementRounded(nil.window2, 10)
        hdxSetElementRelativePosition(nil.window2, nil.window, "center", "center", false)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 176, 290, "images/backDetail.dds", tocolor(255, 255, 255), nil.window), nil.window2, "right", "center", false, 0, 30)
        hdxSetElementColor(nil.closePanel, STATE_HOVERED, tocolor(191, 32, 32))
        hdxSetElementColor(nil.closePanel, STATE_PRESSED, tocolor(191, 32, 32))
        hdxSetElementRelativePosition(nil.closePanel, nil.window2, "right", "top", false, 32, 32)
        hdxSetElementRounded(nil.closePanel, 5)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 13, 13, "images/close.dds", tocolor(255, 255, 255), nil.closePanel), nil.closePanel, "center", "center", false, 30, 30)
        hdxSetElementDisabled(hdxCreateImage(0, 0, 13, 13, "images/close.dds", tocolor(255, 255, 255), nil.closePanel), true)
        hdxSetElementRelativePosition(hdxCreateLabel("ОКНО ПОДТВЕРЖДЕНИЯ", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), nil.window2, "left", "top", false, 32, 32)
        hdxSetElementDisabled(hdxCreateLabel("ОКНО ПОДТВЕРЖДЕНИЯ", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), true)
        hdxSetElementRelativePosition(nil.headerRouteLabel, hdxCreateLabel("ОКНО ПОДТВЕРЖДЕНИЯ", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), "left", "under", false, 0, 4)
        hdxSetElementDisabled(nil.headerRouteLabel, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Информация о рейсе", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), nil.window2, "left", "top", false, 32, 109)
        hdxSetElementDisabled(hdxCreateLabel("Информация о рейсе", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), true)
        hdxSetElementRelativePosition(nil.label1, nil.window2, "left", "top", false, 32, 148)
        hdxSetElementDisabled(nil.label1, true)
        hdxSetElementRelativePosition(nil.label2, nil.window2, "left", "top", false, 32, 175)
        hdxSetElementDisabled(nil.label2, true)
        hdxSetElementRelativePosition(nil.label3, nil.window2, "left", "top", false, 32, 202)
        hdxSetElementDisabled(nil.label3, true)
        hdxSetElementRelativePosition(nil.label4, nil.window2, "left", "top", false, 32, 229)
        hdxSetElementDisabled(nil.label4, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Условия", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), nil.window2, "left", "top", false, 32, 282)
        hdxSetElementDisabled(hdxCreateLabel("Условия", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window), true)
        hdxSetElementRelativePosition(nil.label5, nil.window2, "left", "top", false, 32, 321)
        hdxSetElementDisabled(nil.label5, true)
        hdxSetElementRelativePosition(nil.imageWarning, nil.label5, "atright", "center", false, 6, 0)
        hdxSetElementRelativePosition(nil.label6, nil.window2, "left", "top", false, 32, 348)
        hdxSetElementDisabled(nil.label6, true)
        hdxSetElementRelativePosition(nil.panel1, nil.label1, "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.panel2, nil.label2, "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.panel3, nil.label3, "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.panel4, nil.label4, "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.panel5, nil.label5, "atright", "center", false, 40, 0)
        hdxSetElementRelativePosition(nil.panel6, nil.label6, "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(hdxCreateLabel("Оплата за рейс", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window), nil.window2, "left", "top", false, 32, 401)
        hdxSetElementDisabled(hdxCreateLabel("Оплата за рейс", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.labelValue1, nil.window2, "right", "top", false, 32, 148)
        hdxSetElementDisabled(nil.labelValue1, true)
        hdxSetElementRelativePosition(nil.labelValue2, nil.window2, "right", "top", false, 32, 175)
        hdxSetElementDisabled(nil.labelValue2, true)
        hdxSetElementRelativePosition(nil.labelValue3, nil.window2, "right", "top", false, 32, 202)
        hdxSetElementDisabled(nil.labelValue3, true)
        hdxSetElementRelativePosition(nil.labelValue4, nil.window2, "right", "top", false, 32, 229)
        hdxSetElementDisabled(nil.labelValue4, true)
        hdxSetElementRelativePosition(nil.labelValue5, nil.window2, "right", "top", false, 32, 321)
        hdxSetElementDisabled(nil.labelValue5, true)
        hdxSetElementRelativePosition(nil.labelValue6, nil.window2, "right", "top", false, 32, 348)
        hdxSetElementDisabled(nil.labelValue6, true)
        hdxSetElementRelativePosition(nil.labelValue7, nil.window2, "left", "bottom", false, 32, 32)
        hdxSetElementDisabled(nil.labelValue7, true)
        hdxSetElementRelativePosition(nil.buttonNext, nil.window2, "right", "bottom", false, 32, 32)
        hdxSetElementColor(nil.buttonNext, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(nil.buttonNext, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementFont(nil.buttonNext, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRounded(nil.buttonNext, 5)
        hdxSetElementRelativePosition(nil.panelWarning, nil.imageWarning, "left", "bottom", false, 9, 9)
        hdxSetElementRounded(nil.panelWarning, 5)
        hdxSetElementVisible(nil.panelWarning, false)
        hdxSetElementSize(nil.panelWarning, dxGetTextWidth(value_7, value_6, value_5) + _x(20), value_8 + _y(20))
        hdxSetElementRelativePosition(nil.warningLabel, nil.panelWarning, "left", "top", false, 10, 10)
        addEvent("onHdxElementHovered", true)
        local var = {
            window = hdxCreatePanel(0, 0, screenW, screenH, tocolor(0, 0, 0, 120)),
            window2 = hdxCreatePanel(0, 0, 456, 481, tocolor(33, 33, 41), nil.window),
            closePanel = hdxCreatePanel(0, 0, 32, 32, tocolor(44, 44, 52), nil.window),
            headerRouteLabel = hdxCreateLabel("Отсюда > Туда", 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(16), nil.window),
            fontScale = value_2,
            font = value_1,
            scaleBold = value_4,
            fontBold = value_3,
            label1 = hdxCreateLabel("Тип предприятия", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            label2 = hdxCreateLabel("Тип товара", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            label3 = hdxCreateLabel("Точка загрузки", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            label4 = hdxCreateLabel("Точка выгрузки", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            label5 = hdxCreateLabel("Время на рейс", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            imageWarning = hdxCreateImage(0, 0, 18, 18, "images/warning.dds", tocolor(255, 255, 255), nil.window),
            label6 = hdxCreateLabel("Залог за прицеп", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            panel1 = hdxCreatePanel(0, 0, 392, 1, tocolor(255, 255, 255, 10), nil.window),
            panel2 = hdxCreatePanel(0, 0, 392, 1, tocolor(255, 255, 255, 10), nil.window),
            panel3 = hdxCreatePanel(0, 0, 392, 1, tocolor(255, 255, 255, 10), nil.window),
            panel4 = hdxCreatePanel(0, 0, 392, 1, tocolor(255, 255, 255, 10), nil.window),
            panel5 = hdxCreatePanel(0, 0, 392, 1, tocolor(255, 255, 255, 10), nil.window),
            panel6 = hdxCreatePanel(0, 0, 392, 1, tocolor(255, 255, 255, 10), nil.window),
            labelValue1 = hdxCreateLabel("Автосалон", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelValue2 = hdxCreateLabel("Завод «Кочерыжка»", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelValue3 = hdxCreateLabel("Автосалон «РОФЛ»", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelValue4 = hdxCreateLabel("1 000 ед.", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelValue5 = hdxCreateLabel(string.format("%s минут", CONTRACT_ROUTE_TIME), 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelValue6 = hdxCreateLabel(decode_hex_literal("31302030303020E282BD"), 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelValue7 = hdxCreateLabel(splitWithPoints(truckTrailerDeposit, " ") .. decode_hex_literal("20E282BD"), 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            buttonNext = hdxCreateButton(0, 0, 172, 48, tocolor(32, 172, 191, 51), "Приступить", nil.window),
            panelWarning = hdxCreatePanel(0, 0, 486, 38, tocolor(0, 0, 0, 190), nil.window),
            warningLabel = hdxCreateLabel(value_7, 0, 0, tocolor(191, 108, 32), "FuturaBook", convertFigmaFontSize(16), nil.panelWarning),
        }
        local function sub_1001(arg1)
            if source ~= var.imageWarning then
                return
            end
            if not hdxIsElementVisible(var.imageWarning) then
                return
            end
            hdxSetElementVisible(var.panelWarning, arg1)
        end
        addEventHandler("onHdxElementHovered", nil.imageWarning, sub_1001)
        tGUI.route_detail = var
    end,
    open =     function(self)
        tInterface.route_detail.update(self)
        hdxSetElementVisible(tGUI.route_detail.window, true)
        hdxSetElementVisible(tGUI.route_detail.panelWarning, false)
        hdxSetElementRenderOrder(tGUI.route_detail.window)
        state = self.routeId
        state_1 = self.contractId
        InterfaceEscClose = "route_detail"
        InterfacePrevEscClose = "route"
    end,
    close =     function()
        hdxSetElementVisible(tGUI.route_detail.window, false)
        hdxSetElementVisible(tGUI.route_detail.panelWarning, false)
        state_1 = nil
        state = nil
        InterfaceEscClose = "route"
        InterfacePrevEscClose = nil
    end,
    update =     function(self)
        if getTruckType(tPlayerData.vehicle) == VEHICLE_VAN then
            hdxSetElementVisible(tGUI.route_detail.label6, false)
            hdxSetElementVisible(tGUI.route_detail.labelValue6, false)
            hdxSetElementVisible(tGUI.route_detail.panel6, false)
        end
        hdxSetElementVisible(tGUI.route_detail.label6, true)
        hdxSetElementVisible(tGUI.route_detail.labelValue6, true)
        hdxSetElementVisible(tGUI.route_detail.panel6, true)
        hdxSetElementText(tGUI.route_detail.headerRouteLabel, string.format("%s > %s", getZoneName(self.load), getZoneName(self.unload)))
        hdxSetElementText(tGUI.route_detail.labelValue1, (self.name or self.unload))
        hdxSetElementText(tGUI.route_detail.labelValue2, getGoodsName(self.goods))
        hdxSetElementText(tGUI.route_detail.labelValue3, getZoneName(self.load))
        hdxSetElementText(tGUI.route_detail.labelValue4, getZoneName(self.unload))
        hdxSetElementText(tGUI.route_detail.labelValue7, string.format(decode_hex_literal("257320E282BD"), splitWithPoints((self.salary or decode_hex_literal("257320E282BD")), " ")))
        if not isElement(tGUI.route_detail.font) then
            local var = " "
        end
        if decode_hex_literal("257320E282BD") == 5 then
            local var = dxGetTextWidth(hdxGetElementText(tGUI.route_detail[string.format("label%d", decode_hex_literal("257320E282BD"))]), tGUI.route_detail.fontScale, tGUI.route_detail.font)
            local var_1 = dxGetTextWidth(hdxGetElementText(tGUI.route_detail[string.format("labelValue%s", decode_hex_literal("257320E282BD"))]), tGUI.route_detail.scaleBold, tGUI.route_detail.fontBold)
            local var_2 = tGUI.route_detail[string.format("panel%s", decode_hex_literal("257320E282BD"))]
        end
    end,
}

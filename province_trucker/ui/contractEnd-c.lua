local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

tInterface.contract_end = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source == tGUI.contract_end.buttonPrev then
            closeInterface("contract_end")
            openContractInterface("contract_new")
            openInterface("contract_new", { editContract = true })
        end
        if source ~= tGUI.contract_end.buttonNext then
            return
        end
    end,
    create =     function()
        if isElement(tGUI.contract_end.window) then
            return
        end
        hdxSetElementRelativePosition(nil.window, tGUI.contract.window, "left", "top", false, 32, 104)
        hdxSetElementVisible(nil.window, false)
        hdxSetElementRounded(nil.window, 5)
        hdxSetElementRelativePosition(hdxCreateLabel("Наименование", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), nil.window, "left", "top", false, 10, 10)
        hdxSetElementRelativePosition(hdxCreateLabel("Заказано товаров", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), nil.window, "left", "top", false, 10, 49)
        hdxSetElementRelativePosition(nil.hrGoods, hdxCreateLabel("Заказано товаров", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(hdxCreateLabel("Стоимость товара", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), nil.window, "left", "top", false, 10, 76)
        hdxSetElementRelativePosition(nil.hrGoodsPrice, hdxCreateLabel("Стоимость товара", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(hdxCreateLabel("Оплата за доставку 1 ед. товара", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), nil.window, "left", "top", false, 10, 130)
        hdxSetElementRelativePosition(nil.hrSalary, hdxCreateLabel("Оплата за доставку 1 ед. товара", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(hdxCreateLabel("Общая оплата за доставку", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), nil.window, "left", "top", false, 10, 157)
        hdxSetElementRelativePosition(nil.hrSalaryAll, hdxCreateLabel("Общая оплата за доставку", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(hdxCreateLabel("Стоимость размещения", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), nil.window, "left", "top", false, 10, 211)
        hdxSetElementRelativePosition(nil.hrPriceTK, hdxCreateLabel("Стоимость размещения", 0, 0, tocolor(255, 255, 255, 190), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.window2, tGUI.contract.window, "right", "top", false, 32, 104)
        hdxSetElementRounded(nil.window2, 5)
        hdxSetElementRelativePosition(hdxCreateLabel("Новые условия", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), nil.window2, "left", "top", false, 10, 10)
        hdxSetElementRelativePosition(nil.labelGoods, nil.window, "right", "top", false, 10, 49)
        hdxSetElementRelativePosition(nil.labelGoodsPrice, nil.window, "right", "top", false, 10, 76)
        hdxSetElementRelativePosition(nil.labelSalary, nil.window, "right", "top", false, 10, 130)
        hdxSetElementRelativePosition(nil.labelSalaryAll, nil.window, "right", "top", false, 10, 157)
        hdxSetElementRelativePosition(nil.labelPriceTK, nil.window, "right", "top", false, 10, 211)
        hdxSetElementRelativePosition(nil.labelGoodsNew, nil.window2, "left", "top", false, 10, 49)
        hdxSetElementRelativePosition(nil.labelGoodsPriceNew, nil.window2, "left", "top", false, 10, 76)
        hdxSetElementRelativePosition(nil.labelSalaryNew, nil.window2, "left", "top", false, 10, 130)
        hdxSetElementRelativePosition(nil.labelSalaryAllNew, nil.window2, "left", "top", false, 10, 157)
        hdxSetElementRelativePosition(nil.labelPriceTKNew, nil.window2, "left", "top", false, 10, 211)
        hdxSetElementRelativePosition(nil.labelDoplata, tGUI.contract.window, "left", "top", false, 32, 473)
        hdxSetElementRelativePosition(nil.labelDoplataValue, tGUI.contract.window, "right", "top", false, 32, 473)
        hdxSetElementRelativePosition(nil.buttonNext, tGUI.contract.window, "right", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonNext, 5)
        hdxSetElementColor(nil.buttonNext, STATE_HOVERED, tocolor(32, 172, 191, 41))
        hdxSetElementColor(nil.buttonNext, STATE_PRESSED, tocolor(32, 172, 191, 41))
        hdxSetElementFont(nil.buttonNext, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.buttonPrev, tGUI.contract.window, "left", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonPrev, 5)
        hdxSetElementColor(nil.buttonPrev, STATE_HOVERED, tocolor(30, 30, 38, 200))
        hdxSetElementColor(nil.buttonPrev, STATE_PRESSED, tocolor(30, 30, 38, 200))
        hdxSetElementFont(nil.buttonPrev, "FuturaBook", convertFigmaFontSize(18))
        tGUI.contract_end = {
            window = hdxCreatePanel(0, 0, 510, 353, tocolor(26, 27, 35), tGUI.contract.window),
            goodsWidth = dxGetTextWidth("Заказано товаров", value_2, value_1),
            hrGoods = hdxCreatePanel(0, 0, 490, 1, tocolor(32, 32, 40), nil.window),
            goodsPriceWidth = dxGetTextWidth("Стоимость товара", value_2, value_1),
            hrGoodsPrice = hdxCreatePanel(0, 0, 490, 1, tocolor(32, 32, 40), nil.window),
            salaryWidth = dxGetTextWidth("Оплата за доставку 1 ед. товара", value_2, value_1),
            hrSalary = hdxCreatePanel(0, 0, 490, 1, tocolor(32, 32, 40), nil.window),
            salaryAllWidth = dxGetTextWidth("Общая оплата за доставку", value_2, value_1),
            hrSalaryAll = hdxCreatePanel(0, 0, 490, 1, tocolor(32, 32, 40), nil.window),
            priceTkWidth = dxGetTextWidth("Стоимость размещения", value_2, value_1),
            hrPriceTK = hdxCreatePanel(0, 0, 490, 1, tocolor(32, 32, 40), nil.window),
            window2 = hdxCreatePanel(0, 0, 218, 353, tocolor(32, 32, 40), nil.window),
            labelGoods = hdxCreateLabel("5000 ед.", 0, 0, tocolor(191, 191, 191), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelGoodsPrice = hdxCreateLabel(decode_hex_literal("3132362030303020E282BD"), 0, 0, tocolor(191, 191, 191), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelSalary = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(191, 191, 191), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelSalaryAll = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(191, 191, 191), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelPriceTK = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(191, 191, 191), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelGoodsNew = hdxCreateLabel("5000 ед.", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelGoodsPriceNew = hdxCreateLabel(decode_hex_literal("3132362030303020E282BD"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelSalaryNew = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelSalaryAllNew = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelPriceTKNew = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelDoplata = hdxCreateLabel("Необходимо доплатить", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelDoplataValue = hdxCreateLabel(decode_hex_literal("31203030302030303020E282BD"), 0, 0, tocolor(200, 50, 50), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            buttonNext = hdxCreateButton(0, 0, 157, 48, tocolor(32, 172, 191, 51), "Подтвердить", nil.window),
            buttonPrev = hdxCreateButton(0, 0, 111, 48, tocolor(30, 30, 38), "Назад", nil.window),
            fontScale = value_4,
            font = value_3,
        }
    end,
    open =     function(arg1)
        if not isElement(tGUI.contract_end.window) then
            tInterface.contract_end.create()
        end
        tInterface.contract_end.update()
        hdxSetElementVisible(tGUI.contract_end.window, true)
        hdxSetElementVisible(tGUI.contract.buttonPrev, false)
    end,
    close =     function()
        hdxSetElementVisible(tGUI.contract_end.window, false)
    end,
    update =     function(arg1)
        hdxSetElementText(tGUI.contract_end.labelGoods, string.format("%s ед.", splitWithPoints(tContracts.goods, " ")))
        hdxSetElementText(tGUI.contract_end.labelGoodsPrice, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_6, " ")))
        hdxSetElementText(tGUI.contract_end.labelSalary, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.salary, " ")))
        hdxSetElementText(tGUI.contract_end.labelSalaryAll, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_7, " ")))
        hdxSetElementText(tGUI.contract_end.labelPriceTK, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_8, " ")))
        if not isElement(tGUI.contract_end.font) then
            tGUI.contract_end.fontScale = value_10
            tGUI.contract_end.font = value_9
            local value_1, value_2, value_3, value_4 = getContractPrice()
            local value_5, value_6, value_7, value_8 = getContractPrice(tContracts.goods, tContracts.salary)
            local text = string.format("%s ед.", splitWithPoints(tContracts.goods, " "))
            local text_11 = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_6, " "))
            local text_12 = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.salary, " "))
            local text_13 = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_7, " "))
            local text_14 = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_8, " "))
        end
        hdxSetElementSize(tGUI.contract_end.hrGoods, _x(466) - tGUI.contract_end.goodsWidth - dxGetTextWidth(string.format("%s ед.", splitWithPoints(tContracts.goods, " ")), tGUI.contract_end.fontScale, tGUI.contract_end.font), _y(1))
        hdxSetElementSize(tGUI.contract_end.hrGoodsPrice, _x(466) - tGUI.contract_end.goodsPriceWidth - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_6, " ")), tGUI.contract_end.fontScale, tGUI.contract_end.font), _y(1))
        hdxSetElementSize(tGUI.contract_end.hrSalary, _x(466) - tGUI.contract_end.salaryWidth - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.salary, " ")), tGUI.contract_end.fontScale, tGUI.contract_end.font), _y(1))
        hdxSetElementSize(tGUI.contract_end.hrSalaryAll, _x(466) - tGUI.contract_end.salaryAllWidth - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_7, " ")), tGUI.contract_end.fontScale, tGUI.contract_end.font), _y(1))
        hdxSetElementSize(tGUI.contract_end.hrPriceTK, _x(466) - tGUI.contract_end.priceTkWidth - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_8, " ")), tGUI.contract_end.fontScale, tGUI.contract_end.font), _y(1))
        hdxSetElementText(tGUI.contract_end.labelGoodsNew, string.format("%s ед.", splitWithPoints(tContracts.editGoods, " ")))
        hdxSetElementText(tGUI.contract_end.labelGoodsPriceNew, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_2, " ")))
        hdxSetElementText(tGUI.contract_end.labelSalaryNew, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.editSalary, " ")))
        hdxSetElementText(tGUI.contract_end.labelSalaryAllNew, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_3, " ")))
        hdxSetElementText(tGUI.contract_end.labelPriceTKNew, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(value_4, " ")))
        if 0 < value_1 - value_5 then
            hdxSetElementVisible(tGUI.contract_end.labelDoplata, true)
            hdxSetElementVisible(tGUI.contract_end.labelDoplataValue, true)
            hdxSetElementText(tGUI.contract_end.labelDoplata, "Необходимо доплатить")
            hdxSetElementText(tGUI.contract_end.labelDoplataValue, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.abs(value_1 - value_5), " ")))
            hdxSetElementColor(tGUI.contract_end.labelDoplataValue, STATE_ALL, tocolor(191, 32, 32))
            local var = value_1 - value_5
        end
        if value_1 - value_5 < 0 then
            hdxSetElementVisible(tGUI.contract_end.labelDoplata, true)
            hdxSetElementVisible(tGUI.contract_end.labelDoplataValue, true)
            hdxSetElementText(tGUI.contract_end.labelDoplata, "Вам вернётся")
            hdxSetElementText(tGUI.contract_end.labelDoplataValue, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.abs(value_1 - value_5), " ")))
            hdxSetElementColor(tGUI.contract_end.labelDoplataValue, STATE_ALL, tocolor(32, 172, 191))
        end
        hdxSetElementVisible(tGUI.contract_end.labelDoplata, false)
        hdxSetElementVisible(tGUI.contract_end.labelDoplataValue, false)
    end,
}

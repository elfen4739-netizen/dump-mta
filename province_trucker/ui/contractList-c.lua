local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

tInterface.contract_list = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source == tGUI.contract_list.buttonCreateContract then
            if tContracts.bizGoods ~= tContracts.maxBizGoods then
            end
            outputNotification("На складе вашего бизнеса максимальное количество товара.")
            return
        end
        if source == tGUI.contract_list.buttonEdit then
        end
        if source ~= tGUI.contract_list.buttonDelete then
            return
        end
        openInterface("contract_modal", "deleteContract")
    end,
    create =     function()
        if isElement(tGUI.contract_list.window) then
            return
        end
        hdxSetElementRelativePosition(nil.window, tGUI.contract.window, "left", "top", false, 32, 104)
        hdxSetElementRounded(nil.window, 5)
        hdxSetElementVisible(nil.window, false)
        hdxSetElementDisabled(nil.window, true)
        hdxSetElementRelativePosition(nil.imageDelivery, nil.window, "left", "center", false, 32, 0)
        hdxSetElementRelativePosition(nil.deliveryInfoLabel, nil.window, "left", "top", false, 112, 24)
        hdxSetElementRelativePosition(nil.deliveryValue, nil.window, "left", "bottom", false, 112, 24)
        hdxSetElementRelativePosition(nil.window2, nil.window, "atright", "center", false, 8, 0)
        hdxSetElementRounded(nil.window2, 5)
        hdxSetElementDisabled(nil.window2, true)
        hdxSetElementRelativePosition(nil.imageWarhouse, nil.window2, "left", "center", false, 32, 0)
        hdxSetElementRelativePosition(nil.warhouseInfoLabel, nil.window2, "left", "top", false, 112, 24)
        hdxSetElementRelativePosition(nil.warhouseValue, nil.window2, "left", "bottom", false, 112, 24)
        hdxSetElementRounded(nil.noContractPanel, 5)
        hdxSetElementRelativePosition(nil.noContractPanel, tGUI.contract.window, "left", "top", false, 32, 224)
        hdxSetElementVisible(nil.noContractPanel, false)
        hdxSetElementRelativePosition(nil.noContractLabel, nil.noContractPanel, "center", "top", false, 0, 90)
        hdxSetElementDisabled(nil.noContractLabel, true)
        hdxSetElementRelativePosition(nil.buttonCreateContract, nil.noContractPanel, "center", "top", false, 32, 134)
        hdxSetElementRounded(nil.buttonCreateContract, 5)
        hdxSetElementColor(nil.buttonCreateContract, STATE_HOVERED, tocolor(35, 36, 41))
        hdxSetElementColor(nil.buttonCreateContract, STATE_PRESSED, tocolor(35, 36, 41))
        hdxSetElementFont(nil.buttonCreateContract, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.myContractInfo, tGUI.contract.window, "left", "top", false, 32, 224)
        hdxSetElementDisabled(nil.myContractInfo, true)
        hdxSetElementVisible(nil.myContractInfo, false)
        hdxSetElementRelativePosition(nil.myContractId, nil.myContractInfo, "atright", "center", false, 5, 0)
        hdxSetElementDisabled(nil.myContractId, true)
        hdxSetElementRelativePosition(nil.createTimeLabel, tGUI.contract.window, "right", "top", false, 32, 224)
        hdxSetElementRelativePosition(nil.createTime, nil.createTimeLabel, "atleft", "center", false, 8, 0)
        panel = hdxCreatePanel(0, 0, 736, 45, tocolor(28, 29, 35), nil.myContractInfo)
        hdxSetElementRounded(panel, 5)
        hdxSetElementRelativePosition(panel, tGUI.contract.window, "center", "top", false, 32, 257)
        hdxSetElementRelativePosition(hdxCreateLabel("Осталось времени", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.myContractInfo), panel, "left", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.timeLabel, panel, "right", "center", false, 12, 0)
        panel = hdxCreatePanel(0, 0, 736, 45, tocolor(28, 29, 35), nil.myContractInfo)
        hdxSetElementRounded(panel, 5)
        hdxSetElementRelativePosition(panel, tGUI.contract.window, "center", "top", false, 32, 308)
        hdxSetElementRelativePosition(hdxCreateLabel("Доставлено товара", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.myContractInfo), panel, "left", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.goodsLabel, panel, "right", "center", false, 12, 0)
        panel = hdxCreatePanel(0, 0, 736, 45, tocolor(28, 29, 35), nil.myContractInfo)
        hdxSetElementRounded(panel, 5)
        hdxSetElementRelativePosition(panel, tGUI.contract.window, "center", "top", false, 32, 359)
        hdxSetElementRelativePosition(hdxCreateLabel("Оплата за ед. товара", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.myContractInfo), panel, "left", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.salaryLabel, panel, "right", "center", false, 12, 0)
        panel = hdxCreatePanel(0, 0, 736, 45, tocolor(28, 29, 35), nil.myContractInfo)
        hdxSetElementRounded(panel, 5)
        hdxSetElementRelativePosition(panel, tGUI.contract.window, "center", "top", false, 32, 410)
        hdxSetElementRelativePosition(hdxCreateLabel("Общая стоимость", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.myContractInfo), panel, "left", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.resultPriceLabel, panel, "right", "center", false, 12, 0)
        hdxSetElementRelativePosition(nil.buttonDelete, tGUI.contract.window, "right", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonDelete, 5)
        hdxSetElementColor(nil.buttonDelete, STATE_HOVERED, tocolor(110, 31, 35))
        hdxSetElementColor(nil.buttonDelete, STATE_PRESSED, tocolor(110, 31, 35))
        hdxSetElementFont(nil.buttonDelete, "FuturaBook", convertFigmaFontSize(18))
        tGUI.contract_list = {
            window = hdxCreatePanel(0, 0, 364, 96, tocolor(30, 30, 38), tGUI.contract.window),
            imageDelivery = hdxCreateImage(0, 0, 64, 64, "images/delivery.dds", tocolor(255, 255, 255), nil.window),
            deliveryInfoLabel = hdxCreateLabel("В доставке", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            deliveryValue = hdxCreateLabel("2400/2500 ед.", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            window2 = hdxCreatePanel(0, 0, 364, 96, tocolor(30, 30, 38), nil.window),
            imageWarhouse = hdxCreateImage(0, 0, 64, 64, "images/warhouse.dds", tocolor(255, 255, 255), nil.window),
            warhouseInfoLabel = hdxCreateLabel("На складе", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            warhouseValue = hdxCreateLabel("2400/5000 ед.", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            noContractPanel = hdxCreatePanel(0, 0, 736, 272, tocolor(25, 27, 33), nil.window),
            noContractLabel = hdxCreateLabel("У Вас нет размещённых контрактов, создайте их скорее!", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window),
            buttonCreateContract = hdxCreateButton(0, 0, 257, 48, tocolor(33, 34, 40), "Создать контракт", nil.noContractPanel),
            myContractInfo = hdxCreateLabel("Ваш контракт: ", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window),
            myContractId = hdxCreateLabel("A-1154232 ", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.myContractInfo),
            createTimeLabel = hdxCreateLabel("18.10.2030 (14:30)", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.myContractInfo),
            createTime = hdxCreateLabel("Создан", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.myContractInfo),
            timeLabel = hdxCreateLabel("4 ч 23 мин", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.myContractInfo),
            goodsLabel = hdxCreateLabel("2500/6500 ед.", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.myContractInfo),
            salaryLabel = hdxCreateLabel(decode_hex_literal("31303020E282BD"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.myContractInfo),
            resultPriceLabel = hdxCreateLabel(decode_hex_literal("31203039302035353020E282BD"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.myContractInfo),
            buttonDelete = hdxCreateButton(0, 0, 122, 48, tocolor(191, 32, 32, 51), "Удалить", nil.myContractInfo),
        }
    end,
    open =     function(arg1)
        if not isElement(tGUI.contract_list.window) then
            tInterface.contract_list.create()
        end
        tInterface.contract_list.update(arg1)
        hdxSetElementVisible(tGUI.contract_list.window, true)
        hdxSetElementVisible(tGUI.contract.buttonPrev, true)
    end,
    close =     function()
        hdxSetElementVisible(tGUI.contract_list.window, false)
    end,
    update =     function(arg1)
        if tContracts.goods then
            if 0 < value_1 then
                local value_1, value_2, value_3 = convertSecondToDate(tContracts.time + 604800 - getRealTime().timestamp)
                local var = getRealTime(tContracts.time)
            end
            hdxSetElementVisible(tGUI.contract_list.myContractInfo, true)
            hdxSetElementVisible(tGUI.contract_list.noContractPanel, false)
            hdxSetElementText(tGUI.contract_list.goodsLabel, string.format("%s/%s ед.", splitWithPoints(tContracts.delivered, " "), splitWithPoints(tContracts.goods, " ")))
            hdxSetElementText(tGUI.contract_list.salaryLabel, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.salary, " ")))
            hdxSetElementText(tGUI.contract_list.resultPriceLabel, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(getContractPrice(tContracts.goods, tContracts.salary), " ")))
            hdxSetElementText(tGUI.contract_list.timeLabel, string.format("%s ч. %s мин.", value_2, value_3))
            hdxSetElementText(tGUI.contract_list.myContractId, string.format("A-%07d", (tContracts.contractId or tContracts.salary)))
            hdxSetElementText(tGUI.contract_list.createTimeLabel, string.format("%02d.%02d.%04d (%02d:%02d)", getRealTime(tContracts.time).monthday, getRealTime(tContracts.time).month + 1, getRealTime(tContracts.time).year + 1900, getRealTime(tContracts.time).hour, getRealTime(tContracts.time).minute))
            hdxSetElementRelativePosition(tGUI.contract_list.createTime, tGUI.contract_list.createTimeLabel, "atleft", "center", false, 8, 0)
            local tripClient = "atleft"
            local var_5 = "center"
            local var_6 = 8
            local var_7 = 0
            local var_8 = getRealTime(tContracts.time).minute
        end
        hdxSetElementVisible(tGUI.contract_list.myContractInfo, false)
        hdxSetElementVisible(tGUI.contract_list.noContractPanel, true)
        if tContracts.deliveryCount then
            if 0 < tContracts.deliveryCount then
                hdxSetElementImage(tGUI.contract_list.imageDelivery, "images/delivery.dds")
            end
        end
        hdxSetElementImage(tGUI.contract_list.imageDelivery, "images/delivery_black.dds")
        hdxSetElementText(tGUI.contract_list.deliveryValue, string.format("%s ед.", splitWithPoints((tContracts.delivery or 0), " ")))
        if not tContracts.bizGoods then
            local var_2 = "%s/%s ед."
            local lockClient = 0
        end
        hdxSetElementText(tGUI.contract_list.warhouseValue, string.format("%s/%s ед.", splitWithPoints(tContracts.bizGoods, " "), splitWithPoints((tContracts.maxBizGoods or 0), " ")))
    end,
}
addEvent("trucker:updateContractId", true)

local function sub_1001(arg1)
    tContracts.contractId = 0
    hdxSetElementText(tGUI.contract_list.myContractId, string.format("A-%07d", 0))
end

addEventHandler("trucker:updateContractId", resourceRoot, sub_1001)

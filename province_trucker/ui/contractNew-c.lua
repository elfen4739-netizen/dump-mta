local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

getContractPrice = function(arg1, arg2)
    if math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE) < MIN_TK_PRICE then
        local var = math.ceil(tContracts.editGoods * 100)
        local var_1 = math.ceil(tContracts.editSalary * tContracts.editGoods)
    end
    return math.ceil(tContracts.editGoods * 100) + math.ceil(tContracts.editSalary * tContracts.editGoods) + math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE), math.ceil(tContracts.editGoods * 100), math.ceil(tContracts.editSalary * tContracts.editGoods), math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE)
end

tInterface.contract_new = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source == tGUI.contract_new.buttonPrev then
            openContractInterface("contract_list")
            openInterface("contract_list")
        end
        if source ~= tGUI.contract_new.buttonNext then
            return
        end
        if tGUI.contract_new.bEditContract then
        end
        if tContracts.currentGoods == tContracts.maxBizGoods then
            outputNotification("На складе вашего бизнеса максимальное количество товара.")
        end
        if tContracts.balance < getContractPrice() then
            outputNotification("Для размещения контракта недостаточно денежных средств на балансе.")
        end
        closeInterface("contract_new")
        triggerServerEvent("trucker:addContract", resourceRoot, tContracts)
    end,
    create =     function()
        if isElement(tGUI.contract_new.window) then
            return
        end
        hdxSetElementRelativePosition(nil.window, tGUI.contract.window, "left", "top", false, 32, 104)
        hdxSetElementDisabled(nil.window, true)
        hdxSetElementRelativePosition(nil.labelGoodsValue, nil.window, "atright", "center", false, 8, 0)
        hdxSetElementDisabled(nil.labelGoodsValue, true)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), 5)
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), tGUI.contract.window, "left", "top", false, 32, 159)
        hdxSetElementRelativePosition(hdxCreateLabel("Количество товара, которое необходимо\nдоставить", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "left", "top", false, 10, 10)
        hdxSetElementDisabled(hdxCreateLabel("Количество товара, которое необходимо\nдоставить", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.slider, hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "left", "top", false, 10, 70)
        hdxSetElementRounded(nil.slider, 5)
        hdxSetElementColor(getElementData(nil.slider, "scrollHorizontal", false), STATE_IDLE, tocolor(255, 255, 255, 255))
        hdxSetElementColor(getElementData(nil.slider, "scrollHorizontal", false), STATE_HOVERED, tocolor(244, 244, 244, 255))
        hdxSetElementColor(getElementData(nil.slider, "scrollHorizontal", false), STATE_PRESSED, tocolor(244, 244, 244, 255))
        hdxSetElementSize(getElementData(nil.slider, "scrollHorizontal", false), _x(20), _y(20))
        hdxSetElementRounded(getElementData(nil.slider, "scrollHorizontal", false), 10)
        hdxSetElementRelativePosition(nil.labelCurrent, nil.slider, "left", "under", false, 0, 10)
        hdxSetElementDisabled(nil.labelCurrent, true)
        hdxSetElementRelativePosition(nil.labelMax, nil.slider, "right", "under", false, 0, 10)
        hdxSetElementDisabled(nil.labelMax, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Ввод вручную", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "left", "bottom", false, 10, 18)
        hdxSetElementDisabled(hdxCreateLabel("Ввод вручную", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.editGoods, hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "right", "bottom", false, 10, 10)
        hdxSetEditboxAllowedChars(nil.editGoods, "0-9")
        hdxSetElementRounded(nil.editGoods, 5)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), 5)
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), tGUI.contract.window, "left", "top", false, 404, 159)
        hdxSetElementRelativePosition(nil.imageWarning, hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "right", "top", false, 10, 10)
        hdxSetElementRelativePosition(hdxCreateLabel("Оплата за 1 ед. доставленного\nтовара", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "left", "top", false, 10, 10)
        hdxSetElementDisabled(hdxCreateLabel("Оплата за 1 ед. доставленного\nтовара", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.sliderSalary, hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "left", "top", false, 10, 70)
        hdxSetElementRounded(nil.sliderSalary, 5)
        hdxSetElementColor(getElementData(nil.sliderSalary, "scrollHorizontal", false), STATE_IDLE, tocolor(255, 255, 255, 255))
        hdxSetElementColor(getElementData(nil.sliderSalary, "scrollHorizontal", false), STATE_HOVERED, tocolor(244, 244, 244, 255))
        hdxSetElementColor(getElementData(nil.sliderSalary, "scrollHorizontal", false), STATE_PRESSED, tocolor(244, 244, 244, 255))
        hdxSetElementSize(getElementData(nil.sliderSalary, "scrollHorizontal", false), _x(20), _y(20))
        hdxSetElementRounded(getElementData(nil.sliderSalary, "scrollHorizontal", false), 10)
        hdxSetElementRelativePosition(nil.labelCurrentSalary, nil.sliderSalary, "left", "under", false, 0, 10)
        hdxSetElementDisabled(nil.labelCurrentSalary, true)
        hdxSetElementRelativePosition(nil.labelMaxSalary, nil.sliderSalary, "right", "under", false, 0, 10)
        hdxSetElementDisabled(nil.labelMaxSalary, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Ввод вручную", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "left", "bottom", false, 10, 18)
        hdxSetElementDisabled(hdxCreateLabel("Ввод вручную", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.editSalary, hdxCreatePanel(0, 0, 364, 162, tocolor(29, 29, 36), nil.window), "right", "bottom", false, 10, 10)
        hdxSetEditboxAllowedChars(nil.editSalary, "0-9")
        hdxSetElementRounded(nil.editSalary, 5)
        hdxSetElementRelativePosition(hdxCreateLabel("Итого:", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 32, 337)
        hdxSetElementDisabled(hdxCreateLabel("Итого:", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), true)
        hdxSetElementRelativePosition(hdxCreateLabel("Стоимость товара", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), tGUI.contract.window, "left", "top", false, 32, 369)
        hdxSetElementDisabled(hdxCreateLabel("Стоимость товара", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.hrGoods, hdxCreateLabel("Стоимость товара", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 22, 0)
        hdxSetElementRelativePosition(nil.itogGoods, tGUI.contract.window, "right", "top", false, 32, 369)
        hdxSetElementDisabled(nil.itogGoods, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Оплата доставки", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), tGUI.contract.window, "left", "top", false, 32, 395)
        hdxSetElementDisabled(hdxCreateLabel("Оплата доставки", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.hrSalary, hdxCreateLabel("Оплата доставки", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 22, 0)
        hdxSetElementRelativePosition(nil.itogSalary, tGUI.contract.window, "right", "top", false, 32, 395)
        hdxSetElementDisabled(nil.itogSalary, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Размещение контракта", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), tGUI.contract.window, "left", "top", false, 32, 422)
        hdxSetElementDisabled(hdxCreateLabel("Размещение контракта", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), true)
        hdxSetElementRelativePosition(nil.hrTk, hdxCreateLabel("Размещение контракта", 0, 0, tocolor(191, 191, 191), "FuturaBook", convertFigmaFontSize(18), nil.window), "atright", "center", false, 22, 0)
        hdxSetElementRelativePosition(nil.itogTk, tGUI.contract.window, "right", "top", false, 32, 422)
        hdxSetElementDisabled(nil.itogTk, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Общая сумма:", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "bottom", false, 32, 104)
        hdxSetElementDisabled(hdxCreateLabel("Общая сумма:", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), true)
        hdxSetElementRelativePosition(nil.moneyAll, tGUI.contract.window, "right", "bottom", false, 32, 104)
        hdxSetElementDisabled(nil.moneyAll, true)
        hdxSetElementRelativePosition(nil.buttonPrev, tGUI.contract.window, "left", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonPrev, 5)
        hdxSetElementColor(nil.buttonPrev, STATE_HOVERED, tocolor(30, 30, 38, 200))
        hdxSetElementColor(nil.buttonPrev, STATE_PRESSED, tocolor(30, 30, 38, 200))
        hdxSetElementFont(nil.buttonPrev, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.buttonNext, tGUI.contract.window, "right", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonNext, 5)
        hdxSetElementColor(nil.buttonNext, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(nil.buttonNext, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementFont(nil.buttonNext, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.panelWarning, nil.imageWarning, "left", "bottom", false, 9, 9)
        hdxSetElementRounded(nil.panelWarning, 5)
        hdxSetElementVisible(nil.panelWarning, false)
        hdxSetElementRelativePosition(nil.warningLabel, nil.panelWarning, "center", "center", false, 0, 0)
        local var = {
            window = hdxCreateLabel("Товар в бизнесе", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(20), tGUI.contract.window),
            labelGoodsValue = hdxCreateLabel("17 400 / 67 000 ед.", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            slider = hdxCreateScrollBar(0, 0, 344, 10, tocolor(32, 172, 191, 255), tocolor(37, 37, 45), "horizontal", nil.window),
            labelCurrent = hdxCreateLabel("0шт.", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), nil.window),
            labelMax = hdxCreateLabel("0шт.", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), nil.window),
            editGoods = hdxCreateEditbox(0, 0, 200, 36, tocolor(22, 23, 31, 255), "", false, 24, nil.window, "FuturaBook", convertFigmaFontSize(18), tocolor(255, 255, 255)),
            imageWarning = hdxCreateImage(0, 0, 18, 18, "images/warning.dds", tocolor(255, 255, 255), nil.window),
            sliderSalary = hdxCreateScrollBar(0, 0, 344, 10, tocolor(32, 172, 191, 255), tocolor(37, 37, 45), "horizontal", nil.window),
            labelCurrentSalary = hdxCreateLabel("0шт.", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), nil.window),
            labelMaxSalary = hdxCreateLabel("0шт.", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), nil.window),
            editSalary = hdxCreateEditbox(0, 0, 200, 36, tocolor(22, 23, 31, 255), "", false, 24, nil.window, "FuturaBook", convertFigmaFontSize(18), tocolor(255, 255, 255)),
            hrGoods = hdxCreatePanel(0, 0, 560, 1, tocolor(25, 27, 32), nil.window),
            maxHrGoods = 560,
            itogGoods = hdxCreateLabel(decode_hex_literal("31302030303020D0A0"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            hrSalary = hdxCreatePanel(0, 0, 568, 1, tocolor(25, 27, 32), nil.window),
            maxHrSalary = 568,
            itogSalary = hdxCreateLabel(decode_hex_literal("31302030303020D0A0"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            hrTk = hdxCreatePanel(0, 0, 522, 1, tocolor(25, 27, 32), nil.window),
            maxHrTk = 522,
            itogTk = hdxCreateLabel(decode_hex_literal("31302030303020D0A0"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            moneyAll = hdxCreateLabel(decode_hex_literal("33302030303020D0A0"), 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            buttonPrev = hdxCreateButton(0, 0, 111, 48, tocolor(30, 30, 38), "Назад", nil.window),
            buttonNext = hdxCreateButton(0, 0, 145, 48, tocolor(32, 172, 191, 51), "Разместить", nil.window),
            panelWarning = hdxCreatePanel(0, 0, 486, 38, tocolor(0, 0, 0, 190), nil.window),
            warningLabel = hdxCreateLabel(decode_hex_literal("D092D0BED0B4D0B8D182D0B5D0BBD18C2C20D0BAD0BED182D0BED180D18BD0B920D0B2D18BD0BFD0BED0BBD0BDD0B8D18220D0B2D0B0D18820D180D0B5D0B9D18120D0BDD0B020D0B3D180D183D0B7D0BED0B2D0B8D0BAD0B52C20D0BFD0BED0BBD183D187D0B8D18220D0B7D0B020D0BDD0B5D0B3D0BE20353020303030E282BD"), 0, 0, tocolor(191, 108, 32), "FuturaBook", convertFigmaFontSize(16), nil.panelWarning),
            fontScale = value_2,
            font = value_1,
            warningScale = value_4,
            warningFont = value_3,
        }
        local function sub_1001(arg1)
            if var.slider == source then
                tContracts.editGoods = math.ceil(CONTRACT_MIN_GOODS + arg1 * (tContracts.maxGoods - CONTRACT_MIN_GOODS) / 100)
                hdxSetEditboxText(var.editGoods, math.ceil(CONTRACT_MIN_GOODS + arg1 * (tContracts.maxGoods - CONTRACT_MIN_GOODS) / 100))
            end
            if var.sliderSalary == source then
                tContracts.editSalary = math.ceil(CONTRACT_MIN_SALARY + arg1 * (CONTRACT_MAX_SALARY - CONTRACT_MIN_SALARY) / 100)
                hdxSetEditboxText(var.editSalary, math.ceil(CONTRACT_MIN_SALARY + arg1 * (CONTRACT_MAX_SALARY - CONTRACT_MIN_SALARY) / 100))
            end
            tInterface.contract_new.update()
        end
        addEventHandler("onHdxElementScrolledBar", resourceRoot, sub_1001)
        local function sub_1002()
            if var.editGoods == source then
                if false then
                    if false < CONTRACT_MIN_GOODS then
                        hdxSetEditboxText(var.editGoods, CONTRACT_MIN_GOODS)
                    end
                    if tContracts.maxGoods < false then
                        hdxSetEditboxText(var.editGoods, tContracts.maxGoods)
                    end
                    hdxSetScrollBarPos(tGUI.contract_new.slider, false / tContracts.maxGoods)
                    tContracts.editGoods = math.ceil(false)
                end
                hdxSetScrollBarPos(tGUI.contract_new.slider, 1 / tContracts.maxGoods)
                tContracts.editGoods = 1
            end
            if var.editSalary == source then
                if false then
                    if false < CONTRACT_MIN_SALARY then
                        hdxSetEditboxText(var.editSalary, CONTRACT_MIN_SALARY)
                    end
                    if CONTRACT_MAX_SALARY < false then
                        hdxSetEditboxText(var.editSalary, CONTRACT_MAX_SALARY)
                    end
                    hdxSetScrollBarPos(tGUI.contract_new.sliderSalary, false / CONTRACT_MAX_SALARY)
                end
                hdxSetScrollBarPos(tGUI.contract_new.sliderSalary, 1 / tContracts.maxGoods)
                tContracts.editSalary = 1
                tContracts.editSalary = math.ceil(1)
            end
            tInterface.contract_new.update()
        end
        addEventHandler("onHdxEditboxChanged", resourceRoot, sub_1002)
        tGUI.contract_new = var
        addEvent("onHdxElementHovered", true)
        local function sub_1003(arg1)
            if source ~= var.imageWarning then
                return
            end
            if not hdxIsElementVisible(var.imageWarning) then
                return
            end
            hdxSetElementVisible(var.panelWarning, arg1)
        end
        addEventHandler("onHdxElementHovered", var.imageWarning, sub_1003)
    end,
    open =     function(arg1)
        if arg1 then
            if arg1.editContract then
                hdxSetElementText(tGUI.contract_new.buttonNext, "Подтвердить")
                tContracts.editGoods = tonumber(tContracts.goods)
                tContracts.editSalary = tonumber(tContracts.salary)
                tGUI.contract_new.bEditContract = true
            end
        end
        tContracts.editGoods = 1
        tContracts.editSalary = 1
        hdxSetElementText(tGUI.contract_new.buttonNext, "Разместить")
        tGUI.contract_new.bEditContract = nil
        hdxSetEditboxText(tGUI.contract_new.editGoods, tContracts.editGoods)
        hdxSetScrollBarPos(tGUI.contract_new.slider, tContracts.editGoods / tContracts.maxGoods)
        hdxSetEditboxText(tGUI.contract_new.editSalary, tContracts.editSalary)
        hdxSetScrollBarPos(tGUI.contract_new.sliderSalary, tContracts.editSalary / CONTRACT_MAX_SALARY)
        hdxSetElementText(tGUI.contract_new.labelCurrent, string.format("%s ед.", splitWithPoints(CONTRACT_MIN_GOODS, " ")))
        hdxSetElementText(tGUI.contract_new.labelCurrentSalary, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(CONTRACT_MIN_SALARY, " ")))
        hdxSetElementText(tGUI.contract_new.labelGoodsValue, string.format("%s/%s ед.", splitWithPoints((tContracts.bizGoods or 0), " "), splitWithPoints(tContracts.maxBizGoods, " ")))
        hdxSetElementText(tGUI.contract_new.labelMax, string.format("%s ед.", splitWithPoints(tContracts.maxGoods, " ")))
        hdxSetElementText(tGUI.contract_new.labelMaxSalary, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(CONTRACT_MAX_SALARY, " ")))
        tInterface.contract_new.update(arg1)
        hdxSetElementVisible(tGUI.contract_new.window, true)
        hdxSetElementVisible(tGUI.contract.buttonNext, true)
        hdxSetElementVisible(tGUI.contract.buttonPrev, false)
    end,
    close =     function()
        hdxSetElementVisible(tGUI.contract_new.window, false)
        hdxSetElementVisible(tGUI.contract.buttonPrev, true)
        hdxSetElementVisible(tGUI.contract_new.panelWarning, false)
    end,
    update =     function(arg1)
        if math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE) < MIN_TK_PRICE then
            local var_2 = math.ceil(tContracts.editGoods * 100)
            local lockClient = math.ceil(tContracts.editSalary * tContracts.editGoods)
        end
        if not isElement(tGUI.contract_new.font) then
            tGUI.contract_new.fontScale = value_2
            tGUI.contract_new.font = value_1
            local tripClient = math.ceil(tContracts.editSalary * tContracts.editGoods)
            local var_5 = math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE)
            local var_6 = math.ceil(tContracts.editGoods * 100) + math.ceil(tContracts.editSalary * tContracts.editGoods) + math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE)
            local text = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * 100), " "))
        end
        if not isElement(tGUI.contract_new.warningFont) then
            tGUI.contract_new.warningScale = value_2
            tGUI.contract_new.warningFont = value_1
            local tripClient = math.ceil(tContracts.editSalary * tContracts.editGoods)
            local var_5 = math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE)
            local var_6 = math.ceil(tContracts.editGoods * 100) + math.ceil(tContracts.editSalary * tContracts.editGoods) + math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE)
            local text = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * 100), " "))
        end
        hdxSetElementText(tGUI.contract_new.itogGoods, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * 100), " ")))
        hdxSetElementSize(tGUI.contract_new.hrGoods, _x(tGUI.contract_new.maxHrGoods - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * 100), " ")), tGUI.contract_new.fontScale, tGUI.contract_new.font)), _y(1))
        hdxSetElementText(tGUI.contract_new.itogSalary, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editSalary * tContracts.editGoods), " ")))
        hdxSetElementSize(tGUI.contract_new.hrSalary, _x(tGUI.contract_new.maxHrSalary - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editSalary * tContracts.editGoods), " ")), tGUI.contract_new.fontScale, tGUI.contract_new.font)), _y(1))
        hdxSetElementText(tGUI.contract_new.itogTk, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE), " ")))
        hdxSetElementSize(tGUI.contract_new.hrTk, _x(tGUI.contract_new.maxHrTk - dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE), " ")), tGUI.contract_new.fontScale, tGUI.contract_new.font)), _y(1))
        hdxSetElementText(tGUI.contract_new.moneyAll, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(math.ceil(tContracts.editGoods * 100) + math.ceil(tContracts.editSalary * tContracts.editGoods) + math.ceil(tContracts.editGoods * CONTRACT_TK_PRICE), " ")))
        if tContracts.editGoods < 1000 then
        end
        hdxSetElementText(tGUI.contract_new.warningLabel, value_1)
        hdxSetElementSize(tGUI.contract_new.panelWarning, dxGetTextWidth(value_1, tGUI.contract_new.warningScale, tGUI.contract_new.warningFont) + _x(20), value_2 + _y(20))
        hdxSetElementRelativePosition(tGUI.contract_new.panelWarning, tGUI.contract_new.imageWarning, "left", "bottom", false, 9, 9)
        hdxSetElementRelativePosition(tGUI.contract_new.warningLabel, tGUI.contract_new.panelWarning, "left", "top", false, 10, 10)
    end,
}

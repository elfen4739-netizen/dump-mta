local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {
    pressFunc =     function()
        if source == tGUI.contract_continue.buttonYes then
            closeInterface()
            triggerServerEvent("trucker:continueContract", resourceRoot)
        end
        if source ~= tGUI.contract_continue.buttonNo then
            return
        end
        closeInterface()
        triggerServerEvent("trucker:cancelContract", resourceRoot)
    end,
    create =     function()
        if tGUI.contract_continue then
            if isElement(tGUI.contract_continue.window) then
                return
            end
            local var = {}
        end
        hdxSetElementRounded(nil.window, 10)
        hdxSetElementRelativePosition(nil.window, "center", "center", false, 0, 0)
        hdxSetElementGradientColor(nil.window, tocolor(10, 11, 14, 255), tocolor(21, 21, 25, 255), true, false)
        hdxSetElementVisible(nil.window, false)
        hdxSetElementRounded(nil.panel, 10)
        hdxSetElementRelativePosition(nil.panel, nil.window, "center", "top", false, 0, 103)
        hdxSetElementRelativePosition(nil.labelHeader, nil.window, "left", "top", false, 32, 32)
        hdxSetElementRelativePosition(nil.labelInfo, nil.window, "left", "top", false, 32, 59)
        hdxSetElementRelativePosition(nil.labelBusinessName, nil.panel, "left", "top", false, 16, 16)
        hdxSetElementRelativePosition(nil.labelRoutes, nil.labelBusinessName, "left", "under", false, 0, 0)
        hdxSetElementRelativePosition(hdxCreateLabel("Общее кол-во ед.", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window), nil.panel, "left", "top", false, 16, 86)
        hdxSetElementRelativePosition(hdxCreateLabel("Оплата за рейс", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window), nil.panel, "left", "top", false, 16, 138)
        hdxSetElementRounded(nil.panelGoods, 3)
        hdxSetElementRelativePosition(nil.panelGoods, nil.panel, "right", "top", false, 16, 83)
        hdxSetElementRelativePosition(nil.labelPanelGoods, nil.panelGoods, "center", "center", false, 0, 0)
        hdxSetElementRounded(nil.panelSalary, 3)
        hdxSetElementRelativePosition(nil.panelSalary, nil.panel, "right", "top", false, 16, 135)
        hdxSetElementRelativePosition(nil.labelPanelSalary, nil.panelSalary, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(nil.labelGoods, nil.panelGoods, "atleft", "center", false, 5, 0)
        hdxSetElementRelativePosition(nil.labelSalary, nil.panelSalary, "atleft", "center", false, 5, 0)
        hdxSetElementRelativePosition(nil.buttonYes, nil.window, "left", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonYes, 5)
        hdxSetElementColor(nil.buttonYes, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(nil.buttonYes, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementFont(nil.buttonYes, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.buttonNo, nil.window, "right", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonNo, 5)
        hdxSetElementColor(nil.buttonNo, STATE_HOVERED, tocolor(110, 31, 35, 41))
        hdxSetElementColor(nil.buttonNo, STATE_PRESSED, tocolor(110, 31, 35, 41))
        hdxSetElementFont(nil.buttonNo, "FuturaBook", convertFigmaFontSize(18))
        tGUI.contract_continue = {
            window = hdxCreatePanel(0, 0, 564, 386, tocolor(38, 38, 38, 255)),
            panel = hdxCreatePanel(0, 0, 500, 179, tocolor(26, 26, 34, 255), nil.window),
            labelHeader = hdxCreateLabel("НОВЫЕ УСЛОВИЯ КОНТРАКТА", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window),
            labelInfo = hdxCreateLabel("Продолжить выполнять контракт на новых условиях?", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window),
            labelBusinessName = hdxCreateLabel("Завод ЖБК", 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            labelRoutes = hdxCreateLabel("Отсюда > Туда", 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(18), nil.window),
            panelGoods = hdxCreatePanel(0, 0, 66, 28, tocolor(32, 172, 191, 51), nil.window),
            labelPanelGoods = hdxCreateLabel("1 000 ед.", 0, 0, tocolor(242, 242, 242), "FuturaBook", convertFigmaFontSize(18), nil.panelGoods),
            panelSalary = hdxCreatePanel(0, 0, 66, 28, tocolor(191, 32, 32, 51), nil.window),
            labelPanelSalary = hdxCreateLabel(decode_hex_literal("312030303020E282BD"), 0, 0, tocolor(242, 242, 242), "FuturaBook", convertFigmaFontSize(18), nil.panelSalary),
            labelGoods = hdxCreateLabel("15 000 ед.", 0, 0, tocolor(242, 242, 242), "FuturaBook", convertFigmaFontSize(18), nil.window),
            labelSalary = hdxCreateLabel(decode_hex_literal("36302030303020E282BD"), 0, 0, tocolor(242, 242, 242), "FuturaBook", convertFigmaFontSize(18), nil.window),
            buttonYes = hdxCreateButton(0, 0, 148, 48, tocolor(32, 172, 191, 51), "Принять", nil.window),
            buttonNo = hdxCreateButton(0, 0, 148, 48, tocolor(191, 32, 32, 51), "Отказаться", nil.window),
            fontScale = value_2,
            font = value_1,
        }
    end,
}

var.open = function(arg1)
    if tGUI.contract_continue then
    end
    var.create()
    tInterface.contract_continue.update()
    hdxSetElementVisible(tGUI.contract_continue.window, true)
    setElementData(localPlayer, "radialMenuDisable", "showHud", false)
end

var.close = function()
    hdxSetElementVisible(tGUI.contract_continue.window, false)
end

tInterface.contract_continue = var
local var_1 = {}

var.update = function()
    if not next(var_1) then
        return
    end
    hdxSetElementText(tGUI.contract_continue.labelBusinessName, var_1.name)
    hdxSetElementText(tGUI.contract_continue.labelRoutes, var_1.routes)
    hdxSetElementText(tGUI.contract_continue.labelGoods, string.format("%s ед.", splitWithPoints(var_1.contractGoods, " ")))
    hdxSetElementText(tGUI.contract_continue.labelSalary, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(var_1.salary * var_1.routeGoods, " ")))
    if var_1.oldGoods ~= var_1.goods then
        if var_1.goods - var_1.oldGoods < 0 then
            local var = var_1.salary * var_1.routeGoods
            local var_1 = var_1.oldSalary * var_1.oldRouteGoods
            local var_2 = tocolor(191, 32, 32, 51)
            local lockClient = var_1.goods - var_1.oldGoods
            local tripClient = ""
        end
        hdxSetElementText(tGUI.contract_continue.labelPanelGoods, string.format("%s%s ед.", "+", splitWithPoints(var_1.goods - var_1.oldGoods, " ")))
        hdxSetElementSize(tGUI.contract_continue.panelGoods, dxGetTextWidth(string.format("%s%s ед.", "+", splitWithPoints(var_1.goods - var_1.oldGoods, " ")), tGUI.contract_continue.fontScale, tGUI.contract_continue.font) + _x(10), _y(28))
        hdxSetElementRelativePosition(tGUI.contract_continue.panelGoods, tGUI.contract_continue.panel, "right", "top", false, 16, 83)
        hdxSetElementRelativePosition(tGUI.contract_continue.labelPanelGoods, tGUI.contract_continue.panelGoods, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(tGUI.contract_continue.labelGoods, tGUI.contract_continue.panelGoods, "atleft", "center", false, 10, 0)
        hdxSetElementColor(tGUI.contract_continue.panelGoods, STATE_ALL, tocolor(32, 172, 191, 51))
        hdxSetElementVisible(tGUI.contract_continue.panelGoods, true)
        local var = var_1.salary * var_1.routeGoods
        local var_1 = var_1.oldSalary * var_1.oldRouteGoods
        local var_2 = "center"
        local lockClient = 10
        local tripClient = 0
    end
    hdxSetElementVisible(tGUI.contract_continue.panelGoods, false)
    hdxSetElementRelativePosition(tGUI.contract_continue.labelGoods, tGUI.contract_continue.panel, "right", "top", false, 16, 86)
    if var_1.salary * var_1.routeGoods ~= var_1.oldSalary * var_1.oldRouteGoods then
        if var_1.salary * var_1.routeGoods - var_1.oldSalary * var_1.oldRouteGoods < 0 then
            local var = var_1.salary * var_1.routeGoods
            local var_1 = tocolor(191, 32, 32, 51)
            local var_2 = var_1.salary * var_1.routeGoods - var_1.oldSalary * var_1.oldRouteGoods
            local lockClient = ""
        end
        if not isElement(tGUI.contract_continue.font) then
            tGUI.contract_continue.fontScale = value_2
            tGUI.contract_continue.font = value_1
            local var = var_1.salary * var_1.routeGoods
            local lockClient = tocolor(32, 172, 191, 51)
            local text = string.format(decode_hex_literal("2573257320E282BD"), "+", splitWithPoints(var_1.salary * var_1.routeGoods - var_1.oldSalary * var_1.oldRouteGoods, " "))
        end
        hdxSetElementText(tGUI.contract_continue.labelPanelSalary, string.format(decode_hex_literal("2573257320E282BD"), "+", splitWithPoints(var_1.salary * var_1.routeGoods - var_1.oldSalary * var_1.oldRouteGoods, " ")))
        hdxSetElementSize(tGUI.contract_continue.panelSalary, dxGetTextWidth(string.format(decode_hex_literal("2573257320E282BD"), "+", splitWithPoints(var_1.salary * var_1.routeGoods - var_1.oldSalary * var_1.oldRouteGoods, " ")), tGUI.contract_continue.fontScale, tGUI.contract_continue.font) + _x(10), _y(28))
        hdxSetElementRelativePosition(tGUI.contract_continue.panelSalary, tGUI.contract_continue.panel, "right", "top", false, 16, 135)
        hdxSetElementRelativePosition(tGUI.contract_continue.labelPanelSalary, tGUI.contract_continue.panelSalary, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(tGUI.contract_continue.labelSalary, tGUI.contract_continue.panelSalary, "atleft", "center", false, 10, 0)
        hdxSetElementColor(tGUI.contract_continue.panelSalary, STATE_ALL, tocolor(32, 172, 191, 51))
        hdxSetElementVisible(tGUI.contract_continue.panelSalary, true)
        local var = var_1.salary * var_1.routeGoods
    end
    hdxSetElementVisible(tGUI.contract_continue.panelSalary, false)
    hdxSetElementRelativePosition(tGUI.contract_continue.labelSalary, tGUI.contract_continue.panel, "right", "top", false, 16, 138)
    if false then
        local var = var_1.salary * var_1.routeGoods
    end
    hdxSetElementText(tGUI.contract_continue.labelHeader, "УСЛОВИЯ КОНТРАКТА")
    if false then
    end
    hdxSetElementText(tGUI.contract_continue.labelInfo, "Продолжить выполнять контракт?")
    var_1 = {}
end

addEvent("trucker:openContinueWindow", true)

local function sub_1001(arg1)
    var_1.name = string.format("%s %s", exports.province_business:getBusinessData(value_1).type, exports.province_business:getBusinessData(value_1).name)
    var_1.routes = string.format("%s > %s", getZoneName(exports.province_business:getBusinessData(value_1).load), getZoneName(exports.province_business:getBusinessData(value_1).unload))
    var_1.oldSalary = value_4
    var_1.oldGoods = value_2
    var_1.salary = value_5
    var_1.goods = value_3
    var_1.routeGoods = value_7
    var_1.oldRouteGoods = value_6
    var_1.contractGoods = value_8
    openInterface("contract_continue")
end

addEventHandler("trucker:openContinueWindow", resourceRoot, sub_1001)

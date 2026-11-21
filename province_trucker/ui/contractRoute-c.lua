local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function var()
    if tGUI.contract_route.spaceElements then
        if next(tGUI.contract_route.spaceElements) then
            for k, v in pairs(tGUI.contract_route.spaceElements) do
                if isElement(v) then
                    destroyElement(v)
                end
            end
        end
    end
    tGUI.contract_route.spaceElements = {}
end

local function var_1(arg1, arg2, arg3)
    hdxSetElementGradientColor(hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), tocolor(25, 26, 34, 0), tocolor(25, 26, 34, 255), false, false)
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), tGUI.contract_route.space, "left", "top", false, 0, 70 * (arg1 - 1))
    hdxSetElementRounded(hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), 5)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format("%s %s", tBusinessData[arg2].type, tBusinessData[arg2].name), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), "left", "top", false, 10, 0)
    hdxSetElementDisabled(hdxCreateLabel(string.format("%s %s", tBusinessData[arg2].type, tBusinessData[arg2].name), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format("%s > %s", getZoneName(tBusinessData[arg2].load), getZoneName(tBusinessData[arg2].unload)), 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), hdxCreateLabel(string.format("%s %s", tBusinessData[arg2].type, tBusinessData[arg2].name), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), "left", "under", false, 0, 0)
    hdxSetElementDisabled(hdxCreateLabel(string.format("%s > %s", getZoneName(tBusinessData[arg2].load), getZoneName(tBusinessData[arg2].unload)), 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true)
    hdxSetLabelWordwrapped(hdxCreateLabel(string.format("%s > %s", getZoneName(tBusinessData[arg2].load), getZoneName(tBusinessData[arg2].unload)), 0, 0, tocolor(32, 172, 191), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true, 190)
    hdxSetElementRelativePosition(hdxCreateLabel(getGoodsName(tBusinessData[arg2].goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), "left", "center", false, 224, 5)
    hdxSetElementDisabled(hdxCreateLabel(getGoodsName(tBusinessData[arg2].goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true)
    hdxSetLabelWordwrapped(hdxCreateLabel(getGoodsName(tBusinessData[arg2].goods), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true, 110)
    if not arg3.delivered then
        local var = tBusinessData[arg2]
        local var_1 = hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)
        local lockClient = 0
        local tripClient = 5
    end
    if not arg3.delivery then
        local var = tBusinessData[arg2]
        local var_1 = hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)
        local var_2 = arg3.goods - arg3.delivered
        local lockClient = 0
        local tripClient = 5
    end
    hdxSetElementRelativePosition(hdxCreateLabel(string.format("%s ед.", splitWithPoints(0, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), "left", "center", false, 368, 5)
    hdxSetElementDisabled(hdxCreateLabel(string.format("%s ед.", splitWithPoints(0, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(arg3.salary, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), "left", "center", false, 487, 5)
    hdxSetElementDisabled(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(arg3.salary, " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true)
    if getGoodsTruckType(tBusinessData[arg2].goods) == "all" then
        local var = hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)
        local var_1 = getGoodsTruckType(tBusinessData[arg2].goods)
    end
    if getGoodsTruckType(tBusinessData[arg2].goods) == "van" then
        local var = hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)
        local var_1 = "Фургон"
    end
    hdxSetElementRelativePosition(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space), "left", "center", false, 605, 5)
    hdxSetElementDisabled(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true)
    hdxSetLabelWordwrapped(hdxCreateLabel("Тягач", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space)), true, 132)
    table.insert(tGUI.contract_route.spaceElements, hdxCreatePanel(0, 0, 736, 66, tocolor(25, 26, 34, 255), tGUI.contract_route.space))
end

tInterface.contract_route = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
    end,
    create =     function()
        if isElement(tGUI.contract_route.window) then
            return
        end
        hdxSetElementRelativePosition(nil.window, tGUI.contract.window, "left", "top", false, 42, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("Тип груза", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 255, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("Заказ", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 399, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("За 1 ед.", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 518, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("Условия", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 636, 104)
        hdxSetElementRelativePosition(nil.space, tGUI.contract.window, "left", "top", false, 32, 151)
        hdxSetElementScrollWidth(nil.space, 6)
        hdxSetElementColor(nil.space, STATE_ALL, tocolor(0, 0, 0, 0))
        hdxSetElementScrollColor(nil.space, STATE_IDLE, tocolor(30, 31, 38))
        hdxSetElementScrollColor(nil.space, STATE_HOVERED, tocolor(30, 31, 38, 200))
        hdxSetElementScrollColor(nil.space, STATE_PRESSED, tocolor(30, 31, 38, 200))
        tGUI.contract_route = { window = hdxCreateLabel("Предприятие", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), tGUI.contract.window), space = hdxCreateSpace(0, 0, 755, 345, "", nil.window) }
        tGUI.contract_route.spaceElements = {}
    end,
    open =     function(arg1)
        triggerServerEvent("trucker:getBusinessmanContracts", resourceRoot)
        hdxSetEditboxText(tGUI.contract_route.balanceEdit, "")
        hdxSetElementVisible(tGUI.contract_route.window, true)
        hdxSetElementVisible(tGUI.contract.buttonPrev, true)
    end,
    close =     function()
        var()
        hdxSetElementVisible(tGUI.contract_route.window, false)
    end,
    update =     function(arg1)
        if not tBusinessData then
            tBusinessData = exports.province_business:getAllBusiness()
        end
        for k, v in pairs(arg1) do
            var_1(1, k, v)
        end
        hdxSetElementContentHeight(tGUI.contract_route.space, 0 - _y(4))
    end,
}
addEvent("trucker:updateBusinessmanContracts", true)

local function sub_1001(arg1)
    if not isInterfaceOpen("contract_route") then
        return
    end
    tInterface.contract_route.update(arg1)
end

addEventHandler("trucker:updateBusinessmanContracts", resourceRoot, sub_1001)

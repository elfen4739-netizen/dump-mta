local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local state = nil
local var = {
    deleteContract = {
        event = "trucker:deleteContract",
        "Подтверждение удаления",
        "Уверены, что хотите удалить контракт",
        "Удалить",
        "Отменить",
    },
    rentTruck = {
        event = "trucker:rentTruck",
        "Рабочий транспорт",
        decode_hex_literal("D094D0BBD18F20D0BFD0BED0BBD183D187D0B5D0BDD0B8D18F20D180D0B0D0B1D0BED187D0B5D0B3D0BE20D182D180D0B0D0BDD181D0BFD0BED180D182D0B020D0BDD0B5D0BED0B1D185D0BED0B4D0B8D0BCD0BE20D0BED181D182D0B0D0B2D0B8D182D18C20D0B7D0B0D0BBD0BED0B320D0B220D180D0B0D0B7D0BCD0B5D180D0B52031302030303020E282BD"),
        "Согласиться",
        "Отказаться",
    },
}
local var_1 = {
    pressFunc =     function()
        if source == tGUI.contract_modal.buttonYes then
            if state then
            end
            closeInterface("contract_modal")
            return
            end
            closeInterface("contract_modal")
            closeInterface("contract_list")
        end
        if source ~= tGUI.contract_modal.buttonNo then
            return
        end
        closeInterface("contract_modal")
    end,
    create =     function()
        if tGUI.contract_modal then
            if isElement(tGUI.contract_modal.window) then
                return
            end
            local var = {}
        end
        hdxSetElementSize(nil.window, screenW, screenH)
        hdxSetElementRelativePosition(nil.window, "center", "center", false, 0, 0)
        hdxSetElementTopRenderOrder(nil.window, true)
        hdxSetElementRounded(nil.panel, 10)
        hdxSetElementRelativePosition(nil.panel, nil.window, "center", "center", false, 0, 0)
        hdxSetElementGradientColor(hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), tocolor(30, 30, 38, 255), tocolor(30, 30, 38, 0), false, false)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), 0)
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), nil.panel, "left", "top", false, 0, 22)
        hdxSetElementRelativePosition(nil.headerLabel, hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), "left", "center", false, 32, 0)
        hdxSetElementDisabled(nil.headerLabel, true)
        hdxSetElementRelativePosition(nil.labelText, nil.panel, "center", "top", false, 0, 80)
        hdxSetElementDisabled(nil.labelText, true)
        hdxSetLabelWordwrapped(nil.labelText, true, 392)
        hdxSetElementTextAlign(nil.labelText, "center", "center")
        hdxSetElementRelativePosition(nil.labelTextDemi, nil.labelText, "center", "under", false, 0, 0)
        hdxSetElementDisabled(nil.labelTextDemi, true)
        hdxSetElementVisible(nil.labelTextDemi, false)
        hdxSetElementRelativePosition(nil.buttonYes, nil.panel, "left", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonYes, 5)
        hdxSetElementColor(nil.buttonYes, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(nil.buttonYes, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementFont(nil.buttonYes, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.buttonNo, nil.panel, "right", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonNo, 5)
        hdxSetElementColor(nil.buttonNo, STATE_HOVERED, tocolor(110, 31, 35))
        hdxSetElementColor(nil.buttonNo, STATE_PRESSED, tocolor(110, 31, 35))
        hdxSetElementFont(nil.buttonNo, "FuturaBook", convertFigmaFontSize(18))
        tGUI.contract_modal = {
            window = hdxCreatePanel(0, 0, screenW, screenH, tocolor(0, 0, 0, 80)),
            panel = hdxCreatePanel(0, 0, 460, 225, tocolor(22, 22, 29, 255), nil.window),
            headerLabel = hdxCreateLabel("", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(24), nil.window),
            labelText = hdxCreateLabel("Вы хотите закончить работу дальнобойщика?", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window),
            labelTextDemi = hdxCreateLabel("", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            buttonYes = hdxCreateButton(0, 0, 194, 48, tocolor(32, 172, 191, 51), "Завершить", nil.window),
            buttonNo = hdxCreateButton(0, 0, 194, 48, tocolor(191, 32, 32, 51), "Закрыть", nil.window),
        }
    end,
}

var_1.open = function(arg1)
    if not arg1 then
        return
    end
    if not var[arg1] then
        return
    end
    if tGUI.contract_modal then
    end
    var_1.create()
    state = arg1
    tInterface.contract_modal.update()
    hdxSetElementVisible(tGUI.contract_modal.window, true)
    hdxSetElementTopRenderOrder(tGUI.contract_modal.window, true)
    InterfaceEscClose = "contract_modal"
    InterfacePrevEscClose = "contract"
end

var_1.close = function()
    state = nil
    hdxSetElementVisible(tGUI.contract_modal.window, false)
    InterfaceEscClose = "contract"
    InterfacePrevEscClose = nil
end

var_1.update = function()
    if not state then
        return
    end
    if not var[state] then
        return
    end
    hdxSetElementText(tGUI.contract_modal.buttonYes, value_3)
    hdxSetElementText(tGUI.contract_modal.buttonNo, value_4)
    hdxSetElementText(tGUI.contract_modal.headerLabel, value_1)
    hdxSetElementText(tGUI.contract_modal.labelText, value_2)
    if state == "deleteContract" then
        hdxSetElementVisible(tGUI.contract_modal.labelTextDemi, true)
        hdxSetElementText(tGUI.contract_modal.labelTextDemi, string.format("A-%07d?", (tContracts.contractId or 1)))
    end
    hdxSetElementVisible(tGUI.contract_modal.labelTextDemi, false)
end

tInterface.contract_modal = var_1
addEvent("trucker:updateContractId", true)

local function sub_1001(arg1)
    if not state then
        return
    end
    if state ~= "deleteContract" then
        return
    end
    hdxSetElementText(tGUI.contract_modal.labelTextDemi, string.format("A-%07d?", 0))
end

addEventHandler("trucker:updateContractId", resourceRoot, sub_1001)

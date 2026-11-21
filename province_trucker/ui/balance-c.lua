local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

tInterface.contract_balance = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source == tGUI.contract_balance.buttonAdd then
            if not tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)) or tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)) < 1 then
                local var = tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit))
            end
            if getPlayerMoney(localPlayer) < tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)) then
                outputNotification("Недостаточно средств для пополнения баланса.")
                local var = tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit))
            end
            triggerServerEvent("trucker:addBalanceMoney", resourceRoot, tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)))
            closeInterface("contract_balance")
            local var = tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit))
        end
        if source == tGUI.contract_balance.buttonTake then
            if not tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)) or tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)) < 1 then
                local var = tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit))
            end
            if tContracts.balance < tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)) then
                outputNotification("Недостаточно средств на балансе для снятия.")
                local var = tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit))
            end
            triggerServerEvent("trucker:takeBalanceMoney", resourceRoot, tonumber(hdxGetEditboxText(tGUI.contract_balance.balanceEdit)))
            closeInterface("contract_balance")
        end
        if source ~= tGUI.contract_balance.closePanel then
            return
        end
        closeInterface("contract_balance")
    end,
    create =     function()
        if isElement(tGUI.contract_balance.window) then
            return
        end
        hdxSetElementSize(nil.window, screenW, screenH)
        hdxSetElementRelativePosition(nil.window, "center", "center", false, 0, 0)
        hdxSetElementTopRenderOrder(nil.window, true)
        hdxSetElementRounded(nil.panel, 10)
        hdxSetElementRelativePosition(nil.panel, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 144, 287, "images/backBalance.dds", tocolor(255, 255, 255), nil.window), nil.panel, "right", "center", false, 0, 0)
        hdxSetElementColor(nil.closePanel, STATE_HOVERED, tocolor(191, 32, 32))
        hdxSetElementColor(nil.closePanel, STATE_PRESSED, tocolor(191, 32, 32))
        hdxSetElementRelativePosition(nil.closePanel, nil.panel, "right", "top", false, 32, 32)
        hdxSetElementRounded(nil.closePanel, 5)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 13, 13, "images/close.dds", tocolor(255, 255, 255), nil.closePanel), nil.closePanel, "center", "center", false, 0, 0)
        hdxSetElementDisabled(hdxCreateImage(0, 0, 13, 13, "images/close.dds", tocolor(255, 255, 255), nil.closePanel), true)
        hdxSetElementRelativePosition(hdxCreateLabel("Баланс", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(24), nil.window), nil.panel, "left", "top", false, 32, 32)
        hdxSetElementDisabled(hdxCreateLabel("Баланс", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(24), nil.window), true)
        hdxSetElementRelativePosition(nil.balanceValue, hdxCreateLabel("Баланс", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(24), nil.window), "atright", "center", false, 10, 0)
        hdxSetElementDisabled(nil.balanceValue, true)
        hdxSetElementRelativePosition(hdxCreateLabel("Введите значение", 0, 0, tocolor(255, 255, 255, 255), "FuturaBook", convertFigmaFontSize(20), nil.window), nil.panel, "left", "top", false, 32, 96)
        hdxSetElementDisabled(hdxCreateLabel("Введите значение", 0, 0, tocolor(255, 255, 255, 255), "FuturaBook", convertFigmaFontSize(20), nil.window), true)
        hdxSetElementRelativePosition(nil.balanceEdit, nil.panel, "left", "top", false, 32, 131)
        hdxSetEditboxAllowedChars(nil.balanceEdit, "0-9")
        hdxSetElementRounded(nil.balanceEdit, 5)
        hdxSetElementTextColor(nil.balanceEdit, STATE_ALL, tocolor(255, 255, 255, 128))
        hdxSetElementRelativePosition(nil.buttonAdd, nil.panel, "left", "bottom", false, 32, 32)
        hdxSetElementColor(nil.buttonAdd, STATE_HOVERED, tocolor(31, 101, 114))
        hdxSetElementColor(nil.buttonAdd, STATE_PRESSED, tocolor(31, 101, 114))
        hdxSetElementFont(nil.buttonAdd, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRounded(nil.buttonAdd, 5)
        hdxSetElementRelativePosition(nil.buttonTake, nil.panel, "right", "bottom", false, 32, 32)
        hdxSetElementColor(nil.buttonTake, STATE_HOVERED, tocolor(110, 31, 35))
        hdxSetElementColor(nil.buttonTake, STATE_PRESSED, tocolor(110, 31, 35))
        hdxSetElementFont(nil.buttonTake, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRounded(nil.buttonTake, 5)
        tGUI.contract_balance = {
            window = hdxCreatePanel(0, 0, screenW, screenH, tocolor(0, 0, 0, 80)),
            panel = hdxCreatePanel(0, 0, 450, 298, tocolor(33, 33, 41), nil.window),
            closePanel = hdxCreatePanel(0, 0, 32, 32, tocolor(46, 46, 54), nil.window),
            balanceValue = hdxCreateLabel("", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(24), nil.window),
            balanceEdit = hdxCreateEditbox(0, 0, 386, 55, tocolor(27, 27, 33, 255), "Сумма", false, 24, nil.window, "FuturaBook", convertFigmaFontSize(20), tocolor(255, 255, 255)),
            buttonAdd = hdxCreateButton(0, 0, 189, 48, tocolor(32, 172, 191, 51), "Пополнить", nil.window),
            buttonTake = hdxCreateButton(0, 0, 189, 48, tocolor(191, 32, 32, 51), "Снять", nil.window),
        }
    end,
    open =     function(arg1)
        tInterface.contract_balance.update()
        hdxSetEditboxText(tGUI.contract_balance.balanceEdit, "")
        hdxSetElementVisible(tGUI.contract_balance.window, true)
        hdxSetElementTopRenderOrder(tGUI.contract_balance.window, true)
        InterfaceEscClose = "contract_balance"
        InterfacePrevEscClose = "contract"
    end,
    close =     function()
        hdxSetElementVisible(tGUI.contract_balance.window, false)
        InterfaceEscClose = "contract"
        InterfacePrevEscClose = nil
    end,
    update =     function(arg1)
        hdxSetElementText(tGUI.contract_balance.balanceValue, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.balance, " ")))
    end,
}
addEvent("trucker:updateBalance", true)

local function sub_1001(arg1)
    tContracts.balance = arg1
    tInterface.contract_balance.update()
    tInterface.contract.update()
end

addEventHandler("trucker:updateBalance", resourceRoot, sub_1001)

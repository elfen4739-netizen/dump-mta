local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {
    { 23, 32, 39 },
    { 29, 22, 29 },
    { 28, 29, 36 },
    { 23, 32, 39 },
}
local var_1 = {
    "Пополнение",
    "Списание",
    "Оплата за контракт",
    "Возврат",
}
local var_2 = {
    "+",
    "-",
    "-",
    "+",
}
local lockClient = {}
local state = nil

local function tripClient(arg1, arg2)
    hdxSetElementColor(hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), STATE_HOVERED, tocolor(32, 172, 191, 35))
    hdxSetElementColor(hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), STATE_PRESSED, tocolor(32, 172, 191, 35))
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), tGUI.balance_history.space, "left", "top", false, 0, 48 * (arg1 - 1))
    hdxSetElementRounded(hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), 5)
    hdxSetElementGradientColor(hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), tocolor(value_1, value_2, value_3, 10), tocolor(value_1, value_2, value_3, 255), false, false)
    hdxSetElementRelativePosition(hdxCreateLabel(var_1[arg2[3]], 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space)), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), "left", "center", false, 10, 0)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format(decode_hex_literal("2573257320E282BD"), var_2[arg2[3]], splitWithPoints(arg2[1], " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space)), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), "left", "center", false, 244, 0)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(arg2[2], " ")), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space)), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), "left", "center", false, 406, 0)
    hdxSetElementRelativePosition(hdxCreateLabel(string.format("%02d.%02d.%02d (%02d:%02d)", getRealTime(arg2[4]).monthday, getRealTime(arg2[4]).month + 1, getRealTime(arg2[4]).year - 100, getRealTime(arg2[4]).hour, getRealTime(arg2[4]).minute), 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space)), hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space), "left", "center", false, 568, 0)
    table.insert(tGUI.balance_history.spaceElements, arg1, hdxCreatePanel(0, 0, 736, 44, tocolor(20, 20, 24, 255), tGUI.balance_history.space))
end

local state_5 = nil

local function var_6()
    if tGUI.balance_history.spaceElements then
        if next(tGUI.balance_history.spaceElements) then
            for k, v in pairs(tGUI.balance_history.spaceElements) do
                if isElement(v) then
                    destroyElement(v)
                end
            end
        end
    end
    tGUI.balance_history.spaceElements = {}
end

local function var_7(arg1, arg2)
    tripClient(arg1, arg2)
    state_5 = state_5 + 48
    if arg1 % 8 ~= 0 then
        return
    end
    hdxSetElementContentHeight(tGUI.balance_history.space, state_5 - 4)
end

local function var_8(arg1, arg2, arg3)
    hdxSetElementContentHeight(tGUI.balance_history.space, state_5 - 4)
end

tInterface.balance_history = {
    pressFunc =     function(arg1, arg2)
        if arg1 ~= "left" or arg2 then
        end
        if source ~= tGUI.balance_history.openBalance then
            return
        end
        openInterface("contract_balance")
    end,
    create =     function()
        if isElement(tGUI.balance_history.window) then
            return
        end
        hdxSetElementRelativePosition(nil.window, tGUI.contract.window, "left", "top", false, 42, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("Значение", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 276, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("Баланс", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 438, 104)
        hdxSetElementRelativePosition(hdxCreateLabel("Дата", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), nil.window), tGUI.contract.window, "left", "top", false, 600, 104)
        hdxSetElementRelativePosition(nil.space, tGUI.contract.window, "left", "top", false, 32, 151)
        hdxSetElementScrollWidth(nil.space, 6)
        hdxSetElementColor(nil.space, STATE_ALL, tocolor(0, 0, 0, 0))
        hdxSetElementScrollColor(nil.space, STATE_IDLE, tocolor(30, 31, 38))
        hdxSetElementScrollColor(nil.space, STATE_HOVERED, tocolor(30, 31, 38, 200))
        hdxSetElementScrollColor(nil.space, STATE_PRESSED, tocolor(30, 31, 38, 200))
        hdxSetElementRelativePosition(nil.openBalance, tGUI.contract.window, "right", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.openBalance, 5)
        hdxSetElementColor(nil.openBalance, STATE_HOVERED, tocolor(30, 30, 38, 200))
        hdxSetElementColor(nil.openBalance, STATE_PRESSED, tocolor(30, 30, 38, 200))
        hdxSetElementFont(nil.openBalance, "FuturaBook", convertFigmaFontSize(18))
        tGUI.balance_history = { window = hdxCreateLabel("Тип операции", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(20), tGUI.contract.window), space = hdxCreateSpace(0, 0, 755, 345, "", nil.window), openBalance = hdxCreateButton(0, 0, 229, 48, tocolor(30, 30, 38), "Управление балансом", nil.window) }
        tGUI.balance_history.spaceElements = {}
        tGUI.balance_history.notClearSpaceElements = true
    end,
    open =     function(arg1)
        if lockClient then
            if next(lockClient) then
                if tGUI.balance_history.spaceElements then
                    if next(tGUI.balance_history.spaceElements) then
                    end
                end
                tInterface.balance_history.update()
            end
        end
        triggerServerEvent("trucker:getPlayerBalanceHistory", resourceRoot)
        hdxSetEditboxText(tGUI.balance_history.balanceEdit, "")
        hdxSetElementVisible(tGUI.balance_history.window, true)
        hdxSetElementVisible(tGUI.contract.buttonPrev, true)
    end,
    close =     function()
        hdxSetElementVisible(tGUI.balance_history.window, false)
    end,
    update =     function(arg1)
        if not arg1 then
            state_5 = 0
            local var = {
                table = lockClient,
                step = 1,
                delay = 50,
                onIter = var_7,
                callback = var_8,
            }
            forEachAsync(var)
        end
        for k, v in ipairs(tGUI.balance_history.spaceElements) do
            hdxSetElementRelativePosition(v, tGUI.balance_history.space, "left", "top", false, 0, 48 * (k - 1))
        end
        hdxSetElementContentHeight(tGUI.balance_history.space, 0 - 4)
        state = nil
    end,
}

local function onLogout()
    var_6()
    lockClient = {}
    state = nil
end

addEventHandler("onLogout", localPlayer, onLogout)

local function onClientPlayerQuit()
    var_6()
    lockClient = {}
    state = nil
end

addEventHandler("onClientPlayerQuit", localPlayer, onClientPlayerQuit)
addEvent("trucker:updateBalanceHistory", true)

local function sub_1001(arg1)
    lockClient = arg1
    if isInterfaceOpen("balance_history") then
        tInterface.balance_history.update()
    end
    state = true
end

addEventHandler("trucker:updateBalanceHistory", resourceRoot, sub_1001)
addEvent("trucker:addBalanceHistory", true)

local function sub_1002(arg1)
    table.insert(lockClient, 1, arg1)
    if isInterfaceOpen("balance_history") then
        tInterface.balance_history.update(true)
    end
    state = true
end

addEventHandler("trucker:addBalanceHistory", resourceRoot, sub_1002)

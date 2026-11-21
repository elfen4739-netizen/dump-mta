local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}
local state = nil

local function var_1(arg1)
    closeInterface(arg1)
    if not var[arg1] then
        return
    end
    hdxSetElementColor(var[arg1], STATE_ALL, tocolor(23, 24, 31, 200))
    hdxSetElementColor(var[arg1], STATE_IDLE, tocolor(23, 24, 31, 255))
    hdxSetElementTextColor(var[arg1], STATE_ALL, tocolor(255, 255, 255, 128))
end

openContractInterface = function(arg1)
    if state then
        if state ~= arg1 then
            var_1(state)
        end
    end
    if var[arg1] then
        hdxSetElementColor(var[arg1], STATE_ALL, tocolor(32, 33, 41, 200))
        hdxSetElementColor(var[arg1], STATE_IDLE, tocolor(32, 33, 41, 255))
        hdxSetElementTextColor(var[arg1], STATE_ALL, tocolor(255, 255, 255))
    end
    state = arg1
end

local var_2 = {
    pressFunc =     function()
        if source == tGUI.contract.buttonPrev then
            closeInterface()
        end
        if source == tGUI.contract.headButtonBalance then
            openInterface("balance_history")
            openContractInterface("balance_history")
        end
        if source == tGUI.contract.headButtonContract then
            openInterface("contract_list")
            openContractInterface("contract_list")
        end
        if source == tGUI.contract.headButtonRoute then
            openInterface("contract_route")
            openContractInterface("contract_route")
        end
        if source ~= tGUI.contract.balancePanel then
            return
        end
        openInterface("contract_balance")
    end,
    create =     function()
        if tGUI.contract then
            if isElement(tGUI.contract.window) then
                return
            end
            local var = {}
        end
        hdxSetElementRounded(nil.window, 10)
        hdxSetElementRelativePosition(nil.window, "center", "center", false, 0, 0)
        hdxSetElementRelativePosition(nil.buttonPrev, nil.window, "left", "bottom", false, 32, 32)
        hdxSetElementRounded(nil.buttonPrev, 5)
        hdxSetElementColor(nil.buttonPrev, STATE_HOVERED, tocolor(30, 30, 38, 200))
        hdxSetElementColor(nil.buttonPrev, STATE_PRESSED, tocolor(30, 30, 38, 200))
        hdxSetElementFont(nil.buttonPrev, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRelativePosition(nil.headButtonContract, nil.window, "left", "top", false, 32, 32)
        hdxSetElementColor(nil.headButtonContract, STATE_HOVERED, tocolor(32, 33, 41, 200))
        hdxSetElementColor(nil.headButtonContract, STATE_PRESSED, tocolor(32, 33, 41, 200))
        hdxSetElementFont(nil.headButtonContract, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRounded(nil.headButtonContract, 5, 5, 0, 0)
        hdxSetElementRelativePosition(nil.headButtonRoute, nil.window, "left", "top", false, 148, 32)
        hdxSetElementColor(nil.headButtonRoute, STATE_HOVERED, tocolor(23, 24, 31, 200))
        hdxSetElementColor(nil.headButtonRoute, STATE_PRESSED, tocolor(23, 24, 31, 200))
        hdxSetElementFont(nil.headButtonRoute, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementTextColor(nil.headButtonRoute, STATE_ALL, tocolor(255, 255, 255, 128))
        hdxSetElementRelativePosition(nil.headButtonBalance, nil.window, "left", "top", false, 265, 32)
        hdxSetElementColor(nil.headButtonBalance, STATE_HOVERED, tocolor(23, 24, 31, 200))
        hdxSetElementColor(nil.headButtonBalance, STATE_PRESSED, tocolor(23, 24, 31, 200))
        hdxSetElementFont(nil.headButtonBalance, "FuturaBook", convertFigmaFontSize(18))
        hdxSetElementRounded(nil.headButtonBalance, 0, 0, 5, 5)
        hdxSetElementTextColor(nil.headButtonBalance, STATE_ALL, tocolor(255, 255, 255, 128))
        hdxSetElementRelativePosition(nil.balancePanel, nil.window, "right", "top", false, 32, 32)
        hdxSetElementRelativePosition(nil.balanceLabel, nil.balancePanel, "right", "bottom", false, 0, 0)
        hdxSetElementDisabled(nil.balanceLabel, true)
        hdxSetElementRelativePosition(nil.balanceInfo, nil.balanceLabel, "left", "above", false, 0, 0)
        hdxSetElementDisabled(nil.balanceInfo, true)
        var.contract_list = nil.headButtonContract
        var.contract_new = nil.headButtonContract
        var.contract_end = nil.headButtonContract
        var.balance_history = nil.headButtonBalance
        var.contract_route = nil.headButtonRoute
        tGUI.contract = {
            window = hdxCreatePanel(0, 0, 800, 600, tocolor(21, 23, 30)),
            buttonPrev = hdxCreateButton(0, 0, 111, 48, tocolor(30, 30, 38), "Закрыть", nil.window),
            headButtonContract = hdxCreateButton(0, 0, 116, 48, tocolor(32, 33, 41), "Контракты", nil.window),
            headButtonRoute = hdxCreateButton(0, 0, 116, 48, tocolor(23, 24, 31), "Рейсы", nil.window),
            headButtonBalance = hdxCreateButton(0, 0, 116, 48, tocolor(23, 24, 31), "Баланс", nil.window),
            balancePanel = hdxCreatePanel(0, 0, 120, 48, tocolor(255, 0, 0, 0), nil.window),
            balanceLabel = hdxCreateLabel(decode_hex_literal("3939203132362030303020E282BD"), 0, 0, tocolor(242, 242, 242), "FuturaDemi", convertFigmaFontSize(18), nil.window),
            balanceInfo = hdxCreateLabel("Баланс", 0, 0, tocolor(255, 255, 255, 85), "FuturaBook", convertFigmaFontSize(16), nil.window),
            fontScale = value_2,
            font = value_1,
            balanceInfoWidth = dxGetTextWidth("Баланс", value_4, value_3),
        }
    end,
}

var_2.open = function(arg1)
    if tGUI.contract then
    end
    var_2.create()
    tInterface.contract.update(arg1)
    hdxSetElementVisible(tGUI.contract.window, true)
    hdxSetElementVisible(tGUI.contract.buttonPrev, true)
    openInterface("contract_list", arg1)
    openContractInterface("contract_list")
    setElementData(localPlayer, "radialMenuDisable", "showHud", false)
    InterfaceEscClose = "contract"
    InterfacePrevEscClose = nil
end

var_2.close = function()
    hdxSetElementVisible(tGUI.contract.window, false)
    var_1(state)
    tContracts = {}
end

var_2.update = function()
    if not isElement(tGUI.contract.font) then
        tGUI.contract.fontScale = value_2
        tGUI.contract.font = value_1
        local text = string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.balance, " "))
    end
    hdxSetElementText(tGUI.contract.balanceLabel, string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.balance, " ")))
    if tGUI.contract.balanceInfoWidth < dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.balance, " ")), tGUI.contract.fontScale, tGUI.contract.font) then
        hdxSetElementSize(tGUI.contract.balancePanel, dxGetTextWidth(string.format(decode_hex_literal("257320E282BD"), splitWithPoints(tContracts.balance, " ")), tGUI.contract.fontScale, tGUI.contract.font), _y(48))
        hdxSetElementRelativePosition(tGUI.contract.balancePanel, tGUI.contract.window, "right", "top", false, 32, 32)
        hdxSetElementRelativePosition(tGUI.contract.balanceInfo, tGUI.contract.balancePanel, "left", "top", false, 0, 0)
        local var = 0
        local var_1 = 0
    end
    hdxSetElementSize(tGUI.contract.balancePanel, tGUI.contract.balanceInfoWidth, _y(48))
    hdxSetElementRelativePosition(tGUI.contract.balancePanel, tGUI.contract.window, "right", "top", false, 32, 32)
    hdxSetElementRelativePosition(tGUI.contract.balanceInfo, tGUI.contract.balancePanel, "left", "top", false, 0, 0)
end

tInterface.contract = var_2
addEvent("trucker:openContractWindow", true)

local function sub_1001(self)
    if not tBusinessData then
        tBusinessData = exports.province_business:getAllBusiness()
    end
    tContracts.goods = self.goods
    tContracts.salary = self.salary
    tContracts.delivery = self.delivery
    tContracts.delivered = self.delivered
    tContracts.businessId = self.businessId
    tContracts.contractId = (self.contractId or 0)
    tContracts.balance = (self.balance or 0)
    tContracts.time = self.time
    tContracts.bizGoods = self.bizGoods
    tContracts.maxBizGoods = tBusinessData[self.businessId].maxProducts
    if not self.bizGoods then
        local var_1 = 0
    end
    if not self.delivery then
        local var_2 = 0
    end
    tContracts.maxGoods = tContracts.maxBizGoods - self.bizGoods + self.delivery + (self.delivered or 0)
    tContracts.editSalary = CONTRACT_MIN_SALARY
    tContracts.editGoods = CONTRACT_MIN_GOODS
    openInterface("contract", self)
end

addEventHandler("trucker:openContractWindow", resourceRoot, sub_1001)

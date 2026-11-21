-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}

getAuctionContainer = function()
    return var
end

getLotDataFromId = function(arg1)
    if var[arg1] then
        var[arg1].better = var[arg1].history[1]
        if var[arg1].better then
            local var = var[arg1]
        end
        var[arg1].currentBet = var[arg1].startBet
        var[arg1].minBet = math.floor(var[arg1].currentBet + var[arg1].currentBet * tConfig.minBetPercent)
        var[arg1].nameType = tConfig.lotTypeName[tConfig.lotsTypes[var[arg1].type]]
        return var[arg1]
    end
end

local var_1 = {}

checkLotTick = function(self)
    if not var_1[self] then
        var_1[self] = getTickCount()
        return false
    end
    if var_1[self] + 5000 < getTickCount() then
        var_1[self] = getTickCount()
        return false
    end
    return true
end

local var_2 = 0

sendLotBet = function(arg1, arg2)
    if getLotDataFromId(arg1) then
        if getServerTime().timestamp < getLotDataFromId(arg1).timestamp then
            return sendPhoneNotification("Аукцион на этот лот еще не начался.", true)
        end
        if arg2 == "fast" then
            local var = getLotDataFromId(arg1).minBet
            local var_1 = getLotDataFromId(arg1)
        end
        if not tonumber(arg2) then
            return sendPhoneNotification("Сумма ставки введена некорректно.", true)
        end
        if not var_2 then
            return sendPhoneNotification("У вас нет банковского счёта.", true)
        end
        if var_2 < math.floor(math.floor(arg2) + math.floor(arg2) * tConfig.comissionBet) then
            return sendPhoneNotification("Недостаточно средств на банковском счете.", true)
        end
        if math.floor(arg2) < getLotDataFromId(arg1).minBet then
            return sendPhoneNotification("Минимальная сумма ставки " .. getLotDataFromId(arg1).minBet .. " рублей.", true)
        end
        if checkLotTick(arg1) then
            return sendPhoneNotification("Вы можете делать ставку раз в 5 секунд.", true)
        end
        triggerServerEvent("auction:betPlayer", resourceRoot, arg1, math.floor(arg2))
    end
    sendPhoneNotification("Разыгрываемого лота уже не существует.", true)
end

addEvent("auction:sendLotBet")
addEventHandler("auction:sendLotBet", root, sendLotBet)
addEvent("auction:updateContainer", true)

local function sub_1001(arg1)
    var = arg1
    updateAuctionAdminGUI()
    triggerEvent("phone:updateAuctionContaier", root, var)
end

addEventHandler("auction:updateContainer", resourceRoot, sub_1001)
addEvent("auction:updatePlayerData", true)
local state = nil
local tripClient = {}

local function sub_1002(arg1, arg2, arg3)
    if arg1 then
        var_2 = arg1
    end
    if arg2 then
        state = arg2
    end
    tripClient = {}
    triggerEvent("phone:updateAuctionPlayerData", root, var_2, state, tripClient)
end

addEventHandler("auction:updatePlayerData", resourceRoot, sub_1002)
addEvent("auction:showAdminGUI", true)

local function sub_1003(arg1)
    var = {}
    showAuctionAdminGUI(true)
    updateAuctionAdminGUI()
end

addEventHandler("auction:showAdminGUI", resourceRoot, sub_1003)

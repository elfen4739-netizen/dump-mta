-- ByteRevenant
-- LuaQ 5.1 structured decompile

tConfig = {}
tConfig.lotsTypes = {
    "vehicle",
    "plate",
    "house",
    "accessory",
}
tConfig.lotTypeName = {
    plate = "Автомобильный номер",
    house = "Дом",
    accessory = "Аксессуар",
    vehicle = "Авто",
}
tConfig.comissionBet = 0.01
tConfig.minBetPercent = 0.10000000000000001
tConfig.startAuctionTime = 3600
tConfig.waitLastBetSeconds = 15
tConfig.allowedPlateRegions = { [77] = 2, [78] = 3, [63] = 1 }

getConfig = function()
    return tConfig
end

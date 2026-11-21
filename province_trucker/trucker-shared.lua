-- ByteRevenant
-- LuaQ 5.1 structured decompile

END_RELEASE_DATE = 1688850000
CURRENT_SEASON = false
truckDeposit = 10000
truckTrailerDeposit = 10000
VEHICLE_VAN = "van"
VEHICLE_TRUCK = "truck"
tTrucksTypes = {
    [18762] = VEHICLE_VAN,
    [552] = VEHICLE_VAN,
    [18650] = VEHICLE_VAN,
    [18651] = VEHICLE_VAN,
    [18686] = VEHICLE_VAN,
    [18701] = VEHICLE_VAN,
    [18724] = VEHICLE_VAN,
    [18742] = VEHICLE_VAN,
    [403] = VEHICLE_TRUCK,
    [515] = VEHICLE_TRUCK,
    [18654] = VEHICLE_TRUCK,
    [18676] = VEHICLE_TRUCK,
    [18685] = VEHICLE_TRUCK,
    [18705] = VEHICLE_TRUCK,
    [18723] = VEHICLE_TRUCK,
    [18746] = VEHICLE_TRUCK,
    [18760] = VEHICLE_VAN,
    [528] = VEHICLE_VAN,
    [18771] = VEHICLE_VAN,
}
tVehiclesMaxGoods = {
    [528] = {
        [2] = { 60, 0.625 },
        [3] = { 60, 0.625 },
    },
    [552] = {
        [3] = { 330, 0.95999999999999996 },
    },
    [18650] = {
        [1] = { 150, 0.90900000000000003 },
        [2] = { 200, 0.90900000000000003 },
    },
    [18651] = { 300, 0.95999999999999996 },
    [18686] = {
        [1] = { 200, 0.79300000000000004 },
    },
    [18701] = {
        [2] = { 350, 0.98999999999999999 },
        [3] = { 360, 0.98999999999999999 },
    },
    [18742] = {
        [1] = { 120, 0.71199999999999997 },
        [2] = { 120, 0.71199999999999997 },
    },
    [18724] = { 400, 1 },
    [18760] = { 230, 0.90900000000000003 },
    [18762] = { 310, 0.95999999999999996 },
    [18771] = { 90, 0.65000000000000002 },
}

getTruckMaxGoods = function(arg1, arg2)
    if tVehiclesMaxGoods[arg1] then
        if arg2 then
            if type(tVehiclesMaxGoods[arg1][arg2]) == "table" then
                return unpack(tVehiclesMaxGoods[arg1][arg2])
            end
        end
        return unpack(tVehiclesMaxGoods[arg1])
    end
    return false
end

checkVehicleComplectation = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if getElementModel(arg1) then
        local var = getElementModel(arg1)
    end
    return false
        end

        if value_2 then
            if type(value_2) ~= "table" then
                return true
            end
            local var = getElementModel(arg1)
        end
        if getElementData(arg1, "Complectation") then
            if type(tVehiclesMaxGoods[getElementModel(arg1)][getElementData(arg1, "Complectation")]) ~= "table" then
                return false
            end
        end
    end
    return true
end

checkValidTruck = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if tTrucksTypes[getElementModel(arg1)] ~= getGoodsTruckType(arg2) then
    end
    return true
end

getTruckType = function(arg1)
    if not isElement(arg1) then
        return
    end
    return tTrucksTypes[getElementModel(arg1)]
end

CITY_PRV = 1
CITY_MIR = 2
CITY_NEV = 3
tGoodsData = {
    wood = {
        name = "Брус",
        model = 435,
        variant = { 1, 1 },
        sound = "loadingTree",
        truckType = "truck",
    },
    pipes = {
        name = "Трубы",
        model = 435,
        variant = { 0, 0 },
        sound = "loadingMain",
        truckType = "truck",
    },
    details = {
        name = "Детали",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    tank = {
        name = "Цистерна",
        model = 591,
        sound = "loadingGasonline",
        truckType = "truck",
    },
    meat = {
        name = "Мясо",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    clothes = {
        name = "Одежда",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    sand = {
        name = "Песок",
        model = 18725,
        variant = { 0, 0 },
        sound = "loadingSand",
        truckType = "truck",
    },
    rubble = {
        name = "Щебень",
        model = 18725,
        variant = { 1, 1 },
        sound = "loadingSand",
        truckType = "truck",
    },
    container = {
        name = "Контейнер",
        model = 18726,
        variant = { 0, 0 },
        sound = "loadingCartransporter",
        truckType = "truck",
    },
    granules = {
        name = "Гранулы",
        model = 18725,
        variant = { 2, 2 },
        truckType = "truck",
    },
    fertilizer = {
        name = "Удобрение",
        model = 450,
        sound = "loadingMain",
        truckType = "truck",
    },
    seedling = {
        name = "Саженцы",
        model = 450,
        sound = "loadingMain",
        truckType = "truck",
    },
    parcel = {
        name = "Посылки",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    kettle = {
        name = "Чайники",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    engine = {
        name = "Двигатели",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    cigarettes = {
        name = "Блоки сигарет",
        model = 18674,
        sound = "loadingMain",
        truckType = "truck",
    },
    vehicles = {
        name = "Транспорт и запчасти",
        model = 18673,
        variant = { 1, 2 },
        sound = "loadingCartransporter",
        truckType = "truck",
    },
    alcohol = {
        name = "Алкогольная продукция",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    chemistry = {
        name = "Бытовая химия",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    electronics = {
        name = "Бытовая электроника",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    sec_clothes = {
        name = "Вторичная одежда",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    mask = {
        name = "Костюмы и маски",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    battery = { name = "Литиевые батареи", sound = "loadingMain", truckType = "van" },
    metal_detail = {
        name = "Металлические детали",
        model = 18674,
        sound = "loadingCartransporter",
        truckType = "all",
    },
    fur_coat = {
        name = "Норковые шубы",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    clothes_2 = {
        name = "Одежда и обувь",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    papes = { name = "Печатные издания", sound = "loadingMain", truckType = "van" },
    proviant = {
        name = "Провиант",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    products = {
        name = "Продукты и заготовки",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    shaverma = { name = "Мясо и заготовки", sound = "loadingMain", truckType = "van" },
    tobacco = {
        name = "Табак и пергамент",
        model = 18674,
        sound = "loadingMain",
        truckType = "all",
    },
    tobacco2 = { name = "Табачные изделия", sound = "loadingMain", truckType = "van" },
    gasoline = {
        name = "Жидкое топливо",
        model = 591,
        sound = "loadingGasonline",
        truckType = "truck",
    },
    proviant_l = { name = "Провиант", sound = "loadingMain", truckType = "van" },
    alcohol_l = { name = "Алкогольная продукция", sound = "loadingMain", truckType = "van" },
    hunting_item = { name = "Охотничье снаряжение", sound = "loadingMain", truckType = "van" },
    auto_parts = { name = "Автозапчасти", sound = "loadingMain", truckType = "van" },
    wheat_bear = { name = "Пшеничное пиво", sound = "loadingMain", truckType = "van" },
    elite_alcohol = { name = "Элитный алкоголь", sound = "loadingMain", truckType = "van" },
    street_furniture = { name = "Уличная мебель", sound = "loadingMain", truckType = "van" },
    sport_item = { name = "Спортивный инвентарь", sound = "loadingMain", truckType = "van" },
    repair_parts = { name = "Запчасти", sound = "loadingMain", truckType = "van" },
    import_parts = { name = "Импортные запчасти", sound = "loadingMain", truckType = "van" },
    zoo_goods = { name = "Зоотовары", sound = "loadingMain", truckType = "van" },
    office_goods = { name = "Бумага и канцелярия", sound = "loadingMain", truckType = "van" },
    van_furniture = { name = "Мебель", sound = "loadingMain", truckType = "van" },
    van_plastic = { name = "Пластиковые упаковки", sound = "loadingMain", truckType = "van" },
    winter_gifts = {
        name = "Подарки и сувениры",
        model = 450,
        sound = "loadingMain",
        truckType = "truck",
    },
    winter_punch = {
        name = "Горячий шоколад",
        model = 450,
        sound = "loadingMain",
        truckType = "truck",
    },
}

getGoodsName = function(arg1)
    if tGoodsData[arg1] then
        if tGoodsData[arg1].name then
            return tGoodsData[arg1].name
        end
        return "Неизвестно"
    end
    return "Неизвестно"
end

getGoodsTrailer = function(arg1)
    if tGoodsData[arg1] then
        if tGoodsData[arg1].model then
            return tGoodsData[arg1].model
        end
        return false
    end
    return false
end

getGoodsTrailerVariant = function(arg1)
    if tGoodsData[arg1] then
        if tGoodsData[arg1].variant then
            return tGoodsData[arg1].variant
        end
        return false
    end
    return false
end

getGoodsSound = function(arg1)
    if tGoodsData[arg1] then
        if tGoodsData[arg1].sound then
            return tGoodsData[arg1].sound
        end
        return false
    end
    return false
end

getGoodsTruckType = function(arg1)
    if tGoodsData[arg1] then
        if tGoodsData[arg1].truckType then
            return tGoodsData[arg1].truckType
        end
        return "truck"
    end
    return "truck"
end

tRoutes = {
    {
        id = 1,
        city = CITY_PRV,
        goods = "wood",
        load = "jty",
        unload = "nev_port",
        salary = 2832,
        exp = 34,
    },
    {
        id = 2,
        city = CITY_PRV,
        goods = "wood",
        load = "jty",
        unload = "red_store",
        salary = 2316,
        exp = 28,
    },
    {
        id = 3,
        city = CITY_PRV,
        goods = "wood",
        load = "jty",
        unload = "tram_factory",
        salary = 2016,
        exp = 24,
    },
    {
        id = 4,
        city = CITY_PRV,
        goods = "pipes",
        load = "priv_store",
        unload = "nev_port",
        salary = 2016,
        exp = 24,
    },
    {
        id = 5,
        city = CITY_PRV,
        goods = "details",
        load = "priv_store",
        unload = "mir_auto",
        salary = 2016,
        exp = 24,
    },
    {
        id = 6,
        city = CITY_PRV,
        goods = "tank",
        load = "vostok_port",
        unload = "business_38",
        salary = 1666,
        exp = 20,
    },
    {
        id = 7,
        city = CITY_PRV,
        goods = "meat",
        load = "zapad_port",
        unload = "business_53",
        salary = 1832,
        exp = 22,
    },
    {
        id = 8,
        city = CITY_PRV,
        goods = "clothes",
        load = "zapad_port",
        unload = "tandem",
        salary = 1666,
        exp = 20,
    },
    {
        id = 9,
        city = CITY_PRV,
        goods = "pipes",
        load = "jbk_factory",
        unload = "tram_factory",
        salary = 2166,
        exp = 26,
    },
    {
        id = 10,
        city = CITY_PRV,
        goods = "pipes",
        load = "jbk_factory",
        unload = "rjd_priv",
        salary = 1166,
        exp = 14,
    },
    {
        id = 11,
        city = CITY_PRV,
        goods = "sand",
        load = "karier",
        unload = "builder_mir",
        salary = 2308,
        exp = 28,
    },
    {
        id = 12,
        city = CITY_PRV,
        goods = "rubble",
        load = "jbk_factory",
        unload = "transmash",
        salary = 1832,
        exp = 22,
    },
    {
        id = 13,
        city = CITY_PRV,
        goods = "container",
        load = "sea_port",
        unload = "fish_factory",
        salary = 2308,
        exp = 28,
    },
    {
        id = 14,
        city = CITY_PRV,
        goods = "details",
        load = "priv_store2",
        unload = "atp",
        salary = 2016,
        exp = 24,
    },
    {
        id = 15,
        city = CITY_PRV,
        goods = "fertilizer",
        load = "moksadim",
        unload = "vol_store",
        salary = 2070,
        exp = 28,
    },
    {
        id = 16,
        city = CITY_PRV,
        goods = "seedling",
        load = "sea_port_2",
        unload = "ozerki",
        salary = 1850,
        exp = 24,
    },
    {
        id = 42,
        city = CITY_PRV,
        isVan = true,
        goods = "hunting_item",
        load = "priv_port_3",
        unload = "priv_gun_shop",
        salary = 1068,
        exp = 13,
    },
    {
        id = 43,
        city = CITY_PRV,
        isVan = true,
        goods = "auto_parts",
        load = "priv_sto",
        unload = "priv_auto_shop",
        salary = 799,
        exp = 10,
    },
    {
        id = 44,
        city = CITY_PRV,
        isVan = true,
        goods = "wheat_bear",
        load = "priv_bar",
        unload = "priv_kvart",
        salary = 683,
        exp = 8,
    },
    {
        id = 17,
        city = CITY_MIR,
        goods = "wood",
        load = "mir_store",
        unload = "river_station",
        salary = 1666,
        exp = 20,
    },
    {
        id = 18,
        city = CITY_MIR,
        goods = "clothes",
        load = "mir_store",
        unload = "parus_mall",
        salary = 1416,
        exp = 17,
    },
    {
        id = 19,
        city = CITY_MIR,
        goods = "clothes",
        load = "mail_russia",
        unload = "noname_market",
        salary = 1516,
        exp = 18,
    },
    {
        id = 20,
        city = CITY_MIR,
        goods = "parcel",
        load = "mail_russia",
        unload = "river_station_nev",
        salary = 1766,
        exp = 21,
    },
    {
        id = 21,
        city = CITY_MIR,
        goods = "pipes",
        load = "tandem_store",
        unload = "maes",
        salary = 1336,
        exp = 16,
    },
    {
        id = 22,
        city = CITY_MIR,
        goods = "clothes",
        load = "tandem_store",
        unload = "parus_mall",
        salary = 1516,
        exp = 18,
    },
    {
        id = 23,
        city = CITY_MIR,
        goods = "sand",
        load = "gornya",
        unload = "builder_priv",
        salary = 1669,
        exp = 20,
    },
    {
        id = 24,
        city = CITY_MIR,
        goods = "rubble",
        load = "mine",
        unload = "jbk_factory",
        salary = 1516,
        exp = 18,
    },
    {
        id = 25,
        city = CITY_MIR,
        goods = "container",
        load = "fish_factory",
        unload = "sea_port_nev",
        salary = 1516,
        exp = 18,
    },
    {
        id = 26,
        city = CITY_MIR,
        goods = "details",
        load = "mir_store_2",
        unload = "autorepair_mir",
        salary = 1669,
        exp = 20,
    },
    {
        id = 27,
        city = CITY_MIR,
        goods = "fertilizer",
        load = "mir_store_2",
        unload = "noname_market",
        salary = 1510,
        exp = 20,
    },
    {
        id = 28,
        city = CITY_MIR,
        goods = "seedling",
        load = "lerya",
        unload = "priv_arena",
        salary = 1750,
        exp = 24,
    },
    {
        id = 45,
        city = CITY_MIR,
        isVan = true,
        goods = "elite_alcohol",
        load = "mir_bar",
        unload = "casino",
        salary = 996,
        exp = 13,
    },
    {
        id = 46,
        city = CITY_MIR,
        isVan = true,
        goods = "van_furniture",
        load = "van_hoff",
        unload = "easymoll",
        salary = 1555,
        exp = 20,
    },
    {
        id = 47,
        city = CITY_MIR,
        isVan = true,
        goods = "sport_item",
        load = "mir_store_2",
        unload = "mir_gym",
        salary = 1245,
        exp = 15,
    },
    {
        id = 52,
        city = CITY_MIR,
        isVan = true,
        goods = "van_plastic",
        load = "mir_store_2",
        unload = "mir_mcdonalds",
        salary = 987,
        exp = 12,
    },
    {
        id = 29,
        city = CITY_NEV,
        goods = "pipes",
        load = "nev_store",
        unload = "rjd_priv",
        salary = 1832,
        exp = 22,
    },
    {
        id = 30,
        city = CITY_NEV,
        goods = "pipes",
        load = "nev_store",
        unload = "maes",
        salary = 2016,
        exp = 24,
    },
    {
        id = 31,
        city = CITY_NEV,
        goods = "cigarettes",
        load = "tobacco",
        unload = "business_53",
        salary = 1916,
        exp = 23,
    },
    {
        id = 32,
        city = CITY_NEV,
        goods = "cigarettes",
        load = "tobacco",
        unload = "noname_market",
        salary = 1666,
        exp = 32,
    },
    {
        id = 33,
        city = CITY_NEV,
        goods = "clothes",
        load = "nev_port",
        unload = "tandem",
        salary = 1666,
        exp = 20,
    },
    {
        id = 34,
        city = CITY_NEV,
        goods = "kettle",
        load = "redoctober",
        unload = "city_park_grad",
        salary = 1916,
        exp = 23,
    },
    {
        id = 35,
        city = CITY_NEV,
        goods = "engine",
        load = "redoctober",
        unload = "river_station",
        salary = 1666,
        exp = 20,
    },
    {
        id = 36,
        city = CITY_NEV,
        goods = "sand",
        load = "karier",
        unload = "builder_priv",
        salary = 2308,
        exp = 28,
    },
    {
        id = 37,
        city = CITY_NEV,
        goods = "rubble",
        load = "karier",
        unload = "maes_2",
        salary = 2172,
        exp = 26,
    },
    {
        id = 38,
        city = CITY_NEV,
        goods = "container",
        load = "sea_port_nev",
        unload = "fish_factory",
        salary = 2172,
        exp = 26,
    },
    {
        id = 39,
        city = CITY_NEV,
        goods = "details",
        load = "nev_store",
        unload = "hoff",
        salary = 1669,
        exp = 20,
    },
    {
        id = 40,
        city = CITY_NEV,
        goods = "fertilizer",
        load = "nev_store",
        unload = "gold_rain",
        salary = 1200,
        exp = 16,
    },
    {
        id = 41,
        city = CITY_NEV,
        goods = "seedling",
        load = "nev_port_2",
        unload = "flower_shop",
        salary = 2070,
        exp = 28,
    },
    {
        id = 48,
        city = CITY_NEV,
        isVan = true,
        goods = "auto_parts",
        load = "nev_auto_shop",
        unload = "nev_ttu",
        salary = 1006,
        exp = 12,
    },
    {
        id = 49,
        city = CITY_NEV,
        isVan = true,
        goods = "office_goods",
        load = "nev_store_3",
        unload = "nev_slavka",
        salary = 634,
        exp = 8,
    },
    {
        id = 50,
        city = CITY_NEV,
        isVan = true,
        goods = "import_parts",
        load = "nev_port_3",
        unload = "nev_tuning",
        salary = 924,
        exp = 11,
    },
    {
        id = 51,
        city = CITY_NEV,
        isVan = true,
        goods = "zoo_goods",
        load = "nev_port_3",
        unload = "nev_magazin",
        salary = 886,
        exp = 11,
    },
    {
        id = 52,
        city = CITY_PRV,
        ["season"] = "WINTER",
        goods = "winter_gifts",
        load = "jbk_factory",
        unload = "tandem",
        salary = 1791,
        exp = 14,
    },
    {
        id = 53,
        city = CITY_PRV,
        ["season"] = "WINTER",
        goods = "winter_punch",
        load = "priv_bar",
        unload = "business_68",
        salary = 1619,
        exp = 16,
    },
    {
        id = 54,
        city = CITY_MIR,
        ["season"] = "WINTER",
        goods = "winter_gifts",
        load = "goods_mir",
        unload = "viva_lend",
        salary = 772,
        exp = 9,
    },
    {
        id = 55,
        city = CITY_MIR,
        ["season"] = "WINTER",
        goods = "winter_punch",
        load = "goods_mir",
        unload = "priv_bar",
        salary = 1186,
        exp = 14,
    },
    {
        id = 56,
        city = CITY_NEV,
        ["season"] = "WINTER",
        goods = "winter_gifts",
        load = "tram_factory",
        unload = "tandem",
        salary = 2683,
        exp = 15,
    },
    {
        id = 57,
        city = CITY_NEV,
        ["season"] = "WINTER",
        goods = "winter_punch",
        load = "nev_port_3",
        unload = "kosmos",
        salary = 2075,
        exp = 19,
    },
}
tLevelSalaries = {
    1,
    0.69999999999999996,
    0.65333300000000005,
    0.68600000000000005,
    0.71343999999999996,
    0.74316700000000002,
    0.76439999999999997,
    0.782555,
    0.79994500000000002,
    0.80634399999999995,
    0.799014,
    0.78369900000000003,
    0.76681999999999995,
    0.74764900000000001,
    0.72571799999999997,
    0.687164,
    0.65320999999999996,
    0.62309000000000003,
    0.59619900000000003,
    0.57205300000000003,
    0.55025999999999997,
    0.530501,
    0.51251000000000002,
    0.49606699999999998,
    0.480987,
    0.46711200000000003,
    0.45430999999999999,
    0.442465,
    0.43147999999999997,
    0.41918299999999997,
}
tModelRandomColors = {
    [403] = {
        { 255, 255, 255 },
        { 255, 102, 0 },
        { 80, 43, 41 },
        { 0, 42, 182 },
        { 10, 10, 10 },
    },
    [515] = {
        { 255, 255, 255 },
        { 80, 43, 41 },
        { 255, 204, 0 },
        { 163, 163, 163 },
        { 10, 10, 10 },
    },
    [18654] = {
        { 255, 255, 255 },
        { 80, 43, 41 },
        { 255, 204, 0 },
        { 0, 79, 211 },
        { 10, 10, 10 },
    },
    [18676] = {
        { 255, 255, 255 },
        { 80, 43, 41 },
        { 255, 204, 0 },
        { 0, 79, 211 },
        { 10, 10, 10 },
    },
    [18685] = {
        { 255, 255, 255 },
        { 80, 43, 41 },
        { 255, 204, 0 },
        { 0, 79, 211 },
        { 10, 10, 10 },
    },
    [18705] = {
        { 255, 255, 255 },
    },
    [435] = {
        { 15, 76, 129 },
        { 121, 6, 4 },
        { 23, 114, 69 },
        { 255, 186, 0 },
    },
    [18674] = {
        { 153, 147, 43 },
        { 25, 88, 61 },
        { 128, 42, 29 },
        { 24, 67, 118 },
    },
    [18725] = {
        { 224, 81, 28 },
        { 162, 21, 21 },
        { 36, 69, 168 },
        { 56, 133, 46 },
        { 168, 79, 27 },
        { 72, 138, 140 },
        { 206, 185, 34 },
    },
    [18726] = {
        { 50, 24, 22 },
        { 59, 67, 54 },
        { 50, 53, 58 },
        { 53, 46, 36 },
        { 162, 21, 21 },
        { 36, 69, 168 },
        { 56, 133, 46 },
        { 168, 79, 27 },
        { 72, 138, 140 },
        { 206, 185, 34 },
    },
    [18673] = {
        { 254, 254, 254 },
    },
}
tCityTruckers = {
    {
        878.58299999999997,
        2831.6759999999999,
        14.635999999999999,
        0,
        -5,
        0,
        6,
    },
    {
        77.498000000000005,
        520.79200000000003,
        -0.33900000000000002,
        90,
        0,
        6.4000000000000004,
        8,
    },
    {
        2801.8440000000001,
        -1050.451,
        16.800000000000001,
        90,
        0,
        4.5,
        8,
    },
}
tCityTrailers = {
    {
        946.35299999999995,
        2920.8290000000002,
        12.919,
        180,
        -4.5,
        0,
        8,
    },
    {
        119.986,
        489.536,
        -2.3500000000000001,
        180,
        4.5999999999999996,
        0,
        8,
    },
    {
        2784.6669999999999,
        -948.88599999999997,
        14.9,
        90,
        0,
        -5,
        8,
    },
}
tJobMarkersCoords = {
    { 904.947, 2837.9920000000002, 12.946 },
    { 84.183999999999997, 506.32400000000001, -1 },
    { 2765.1219999999998, -1073.2339999999999, 15.074999999999999 },
}
tRentTruckCoords = {
    { 898.19600000000003, 2838.0210000000002, 12.946 },
    { 81.739999999999995, 498.05000000000001, -2.2919999999999998 },
    { 2765.0590000000002, -1069.075, 14.952999999999999 },
}
tTruckModels = {
    403,
    515,
    18654,
    18676,
    18685,
}
tTrailerModels = {
    450,
    435,
    591,
    18674,
    18725,
    18726,
    18673,
    18745,
}
tSeasonTruckModels = {
    ["WINTER"] = { 18705 },
}
tTrucksTuning = {
    [18705] = {
        ["applyTuningFunc"] =         function(arg1)
            setVehiclePaintjob(arg1, 0)
            setElementData(arg1, "VehBody", 1)
        end,
        ["condition"] =         function()
            if CURRENT_SEASON ~= "WINTER" then
            end
            return true
        end,
    },
    [450] = {
        ["applyTuningFunc"] =         function(arg1, arg2)
            if arg2 then
                if CURRENT_SEASON == "WINTER" then
                    setVehicleColor(arg1, 255, 255, 255, 255, 255, 255)
                    setElementData(arg1, "VehBody", 1)
                    local var = "VehBody"
                    local var_1 = 1
                    local var_2 = 255
                    local lockClient = 255
                    local tripClient = 255
                    local var_5 = 255
                end
            end
            math.randomseed(getTickCount())
            setVehicleVariant(arg1, math.random(0, 2), math.random(0, 2))
            setElementData(arg1, "VehTrailerVariant", math.random(0, 2), false)
        end,
        ["condition"] =         function()
            return true
        end,
    },
}

createTextAboveElement = function(arg1, arg2)
    setElementData(createElement("text"), "data", { createElement("text") })
    setElementPosition(createElement("text"), value_5, value_6, value_7 + arg2)
    attachElements(createElement("text"), arg1, 0, 0, arg2)
    setElementInterior(createElement("text"), getElementInterior(arg1))
    setElementDimension(createElement("text"), getElementDimension(arg1))
    return createElement("text")
end

_getRotatedCoordsByOffset = function(arg1, arg2, arg3, arg4, arg5)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or (type(arg5) == "table" and arg5 or nil)))))
    local math = data and data.math
    local rad = data and data.rad
    local cos = data and data.cos
    local sin = data and data.sin
end

isEvent = function(arg1, arg2, arg3)
    if type(arg1) == "string" then
        if isElement(arg2) then
            if type(arg3) == "function" then
                if type(getEventHandlers(arg1, arg2)) == "table" then
                    if 0 < #getEventHandlers(arg1, arg2) then
                        for k, v in ipairs(getEventHandlers(arg1, arg2)) do
                            if v == arg3 then
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

isWorkVehicle = function(arg1)
    if isElement(arg1) then
        if tTrucksTypes[getElementModel(arg1)] then
            return tTrucksTypes[getElementModel(arg1)]
        end
        return false
    end
    return false
end

tBusinessZone = {
    "rent_priv",
    "rent_mir",
    "rent_nev",
    "utill",
}
tGroundZonez = {
    ["rent_priv"] = {
        city = 1,
        ["zoneType"] = "rentTruck",
        ["position"] = {
            764.60000000000002,
            2021.5229999999999,
            12.800000000000001,
            9,
            14,
            0,
        },
    },
    ["rent_mir"] = {
        city = 2,
        ["zoneType"] = "rentTruck",
        ["position"] = {
            373.59399999999999,
            -989.62099999999998,
            2,
            15,
            8,
            0,
        },
    },
    ["rent_nev"] = {
        city = 3,
        ["zoneType"] = "rentTruck",
        ["position"] = {
            2601.9299999999998,
            -732.577,
            14.981,
            14,
            8,
            180,
        },
    },
    ["utill"] = {
        city = -1,
        ["zoneType"] = "utill",
        ["position"] = {
            984.65200000000004,
            -456.43000000000001,
            8.1500000000000004,
            10,
            14,
            90,
        },
    },
    ["parking_prv"] = {
        city = 1,
        ["zoneType"] = "parking",
        ["position"] = {
            846.822,
            2843.3600000000001,
            12.919,
            14,
            8,
            0,
        },
    },
    ["parking_mir"] = {
        city = 2,
        ["zoneType"] = "parking",
        ["position"] = {
            78.284999999999997,
            508,
            -2.2919999999999998,
            17,
            10,
            0,
        },
    },
    ["parking_nev"] = {
        city = 3,
        ["zoneType"] = "parking",
        ["position"] = {
            2766.8699999999999,
            -1054.7249999999999,
            15,
            17,
            9.1999999999999993,
            20,
        },
    },
    ["trailer_prv"] = {
        city = 1,
        ["zoneType"] = "trailer",
        ["position"] = {
            899.04600000000005,
            2857.23,
            12.919,
            9,
            22,
            0,
        },
    },
    ["trailer_mir"] = {
        city = 2,
        ["zoneType"] = "trailer",
        ["position"] = {
            91.180000000000007,
            489.56299999999999,
            -2.2720000000000002,
            9,
            22,
            90,
        },
    },
    ["trailer_nev"] = {
        city = 3,
        ["zoneType"] = "trailer",
        ["position"] = {
            2820.7440000000001,
            -1078.6869999999999,
            14.972999999999999,
            20,
            10,
            270,
        },
    },
    ["goods_prv"] = {
        name = "База Приволжска",
        city = 1,
        ["zoneType"] = "goods",
        ["position"] = {
            1102.423,
            2850.5070000000001,
            12.919,
            17,
            8,
            0,
        },
    },
    ["goods_mir"] = {
        name = "База Мирного",
        city = 2,
        ["zoneType"] = "goods",
        ["position"] = {
            176.09999999999999,
            488.84199999999998,
            -2.2919999999999998,
            25,
            14,
            0,
        },
    },
    ["goods_nev"] = {
        name = "База Невского",
        city = 3,
        ["zoneType"] = "all",
        ["position"] = {
            2789.1210000000001,
            -849.327,
            14.981,
            20,
            12,
            0,
        },
    },
    ["unload_1"] = {
        name = "Тестовая зона",
        city = 1,
        ["zoneType"] = "unload",
        ["position"] = {
            942.75,
            2846.4520000000002,
            13.919,
            17,
            8,
            0,
        },
    },
    ["load_1"] = {
        name = "Тестовая зона загрузки",
        city = 1,
        ["zoneType"] = "goods",
        ["position"] = {
            900.63400000000001,
            2846.547,
            13.919,
            17,
            8,
            0,
        },
    },
    ["business_1"] = {
        ["position"] = {
            2560.8939999999998,
            2564.0239999999999,
            12.800000000000001,
            12.5,
            5,
            120.785,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_2"] = {
        ["position"] = {
            2635.2629999999999,
            2422.9810000000002,
            12.800000000000001,
            10,
            6,
            195.55500000000001,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_3"] = {
        ["position"] = {
            2647.8499999999999,
            2291.8649999999998,
            12.800000000000001,
            10,
            6,
            182.05500000000001,
        },
        name = "Ларек Роспечать",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_4"] = {
        ["position"] = {
            991.20000000000005,
            2776.2809999999999,
            12.800000000000001,
            10,
            6,
            179.42599999999999,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_5"] = {
        ["position"] = {
            1334.105,
            2787.2710000000002,
            12.800000000000001,
            8,
            6,
            269.59899999999999,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_6"] = {
        ["position"] = {
            2031.077,
            2778.9029999999998,
            12.800000000000001,
            10,
            6,
            180.09700000000001,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_7"] = {
        ["position"] = {
            1591.7729999999999,
            2793.4279999999999,
            12.800000000000001,
            10,
            6,
            270.67099999999999,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_8"] = {
        ["position"] = {
            2582.9639999999999,
            2676.877,
            12.9,
            10,
            6,
            90.638000000000005,
        },
        name = "Магазин Магнит",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_9"] = {
        ["position"] = {
            397.76799999999997,
            2755.8209999999999,
            12.9,
            10,
            6,
            90.325000000000003,
        },
        name = "Магазин Магнит",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_10"] = {
        ["position"] = {
            505.18900000000002,
            2127.3739999999998,
            12.9,
            17,
            6,
            268.92700000000002,
        },
        name = "АЗС Магистральная",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_11"] = {
        ["position"] = {
            1621.104,
            2610.3069999999998,
            12.9,
            17,
            6,
            0,
        },
        name = "Автосалон Приволжска",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_12"] = {
        ["position"] = {
            2746.2469999999998,
            1626.7260000000001,
            13,
            17,
            6,
            359.77800000000002,
        },
        name = "Завод ЖБК",
        ["zoneType"] = "all",
        city = -1,
    },
    ["business_13"] = {
        ["position"] = {
            -1744.8499999999999,
            2679.5210000000002,
            1.5,
            17,
            6,
            179.63300000000001,
        },
        name = "АЗС Жуковского",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_14"] = {
        ["position"] = {
            -1766.143,
            2717.6669999999999,
            1.5,
            9,
            5,
            359.90499999999997,
        },
        name = "Ларек Табак",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_15"] = {
        ["position"] = {
            -1899.2180000000001,
            2559.1019999999999,
            1.5,
            12,
            7,
            359.35000000000002,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_16"] = {
        ["position"] = {
            -1794.422,
            436.76999999999998,
            -1.3999999999999999,
            17,
            6,
            359.43200000000002,
        },
        name = "Автосалон Мир",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_17"] = {
        ["position"] = {
            39.700000000000003,
            389.05700000000002,
            -1.8999999999999999,
            10,
            5,
            269.81799999999998,
        },
        name = "Ларек Роспечать",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_18"] = {
        ["position"] = {
            25.454000000000001,
            388.92599999999999,
            -1.8999999999999999,
            10,
            5,
            269.81799999999998,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_19"] = {
        ["position"] = {
            65.337000000000003,
            63.594999999999999,
            -2.1000000000000001,
            17,
            6,
            180,
        },
        name = "АЗС Лукойл",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_20"] = {
        ["position"] = {
            267.27800000000002,
            134.28999999999999,
            -1.8,
            9,
            6,
            179.59100000000001,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_21"] = {
        ["position"] = {
            245.30699999999999,
            223.81299999999999,
            -1.8,
            9,
            6,
            44.229999999999997,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_22"] = {
        ["position"] = {
            268.08699999999999,
            218.86799999999999,
            -1.8,
            9,
            6,
            93.305000000000007,
        },
        name = "Ларек Роспечать",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_23"] = {
        ["position"] = {
            401.99900000000002,
            -108.169,
            -1.8,
            9,
            5,
            359.93099999999998,
        },
        name = "Ларек Печать",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_24"] = {
        ["position"] = {
            402.19,
            -407.46699999999998,
            -1.8,
            9,
            5,
            359.61799999999999,
        },
        name = "Ларек Табак",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_25"] = {
        ["position"] = {
            162.83699999999999,
            -729.63699999999994,
            -1.8,
            9,
            5,
            179.76300000000001,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_26"] = {
        ["position"] = {
            -1772.7170000000001,
            -680.19299999999998,
            -1.5,
            9,
            3.7999999999999998,
            0.245,
        },
        name = "Ларек",
        ["zoneType"] = "unload",
        city = -1,
        "ShaurDonald`s",
    },
    ["business_27"] = {
        ["position"] = {
            -1858.4929999999999,
            -620.87199999999996,
            -1.5,
            9,
            4,
            270.94400000000002,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_28"] = {
        ["position"] = {
            -2001.3710000000001,
            -845.12699999999995,
            -1.5,
            8,
            4,
            1.1850000000000001,
        },
        name = "Ларек",
        ["zoneType"] = "unload",
        city = -1,
        "ShaurDonald`s",
    },
    ["business_29"] = {
        ["position"] = {
            2249.527,
            2288.817,
            12.789999999999999,
            8,
            6,
            133.26900000000001,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_30"] = {
        ["position"] = {
            1285.2570000000001,
            2492,
            12.800000000000001,
            8,
            5,
            269.90300000000002,
        },
        name = "Магазин Дикси",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_31"] = {
        ["position"] = {
            1299.385,
            2442.596,
            12.800000000000001,
            8,
            4,
            179.97499999999999,
        },
        name = "Магазин СпецОдежда",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_32"] = {
        ["position"] = {
            1299.4390000000001,
            2431.73,
            12.800000000000001,
            8,
            4,
            179.685,
        },
        name = "Магазин Меховой",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_33"] = {
        ["position"] = {
            1260.0340000000001,
            2387.1930000000002,
            12.800000000000001,
            8,
            4,
            90.721000000000004,
        },
        name = "Магазин Планета",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_34"] = {
        ["position"] = {
            1234.9929999999999,
            2387.0819999999999,
            12.800000000000001,
            8,
            4,
            89.781000000000006,
        },
        name = "Магазин Чистюля",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_35"] = {
        ["position"] = {
            1062.5630000000001,
            2472.6979999999999,
            12.800000000000001,
            8,
            4,
            0.47999999999999998,
        },
        name = "Магазин Кухонный",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_36"] = {
        ["position"] = {
            1062.479,
            2427.538,
            12.800000000000001,
            8,
            4,
            0.16700000000000001,
        },
        name = "Магазин М. Видео",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_37"] = {
        ["position"] = {
            -2575.4499999999998,
            1591.653,
            1.27,
            17,
            6,
            94,
        },
        name = "АЗС Магистральная",
        ["zoneType"] = "unload",
        city = -1,
    },
    business_38 = {
        ["position"] = {
            773.56100000000004,
            -691.11800000000005,
            -1.8,
            17,
            6,
            0,
        },
        name = "АЗС Магистральная",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_39"] = {
        ["position"] = {
            2443.96,
            -1262.1659999999999,
            15,
            8,
            4,
            225.75,
        },
        name = "Ларек Шаверма по-питерски",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_40"] = {
        ["position"] = {
            2550.3339999999998,
            -1613.1300000000001,
            15,
            8,
            3.5,
            270.24400000000003,
        },
        name = "Ларек Шаверма по-питерски",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_41"] = {
        ["position"] = {
            2382.027,
            -1636.3530000000001,
            14.99,
            17,
            6,
            0.17100000000000001,
        },
        name = "АЗС Соснефть",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_42"] = {
        ["position"] = {
            2191.9679999999998,
            -1601.8440000000001,
            15.050000000000001,
            17,
            6,
            139,
        },
        name = "Завод Табачный",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_43"] = {
        ["position"] = {
            2391.2660000000001,
            -2519.6309999999999,
            15,
            17,
            6,
            145.50999999999999,
        },
        name = "Завод Красный",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_44"] = {
        ["position"] = {
            2678.5189999999998,
            -2280.1900000000001,
            15,
            8,
            4,
            90.412000000000006,
        },
        name = "Ларек Шаверма по-питерски",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_45"] = {
        ["position"] = {
            2213.8000000000002,
            -2812.3919999999998,
            15,
            7,
            5,
            5.8230000000000004,
        },
        name = "Ларек Шаверма по-питерски",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_46"] = {
        ["position"] = {
            2453.9299999999998,
            -2688.9760000000001,
            15,
            8,
            4,
            164.684,
        },
        name = "Магазин Трикотажный",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_47"] = {
        ["position"] = {
            2552.5219999999999,
            -2798.6669999999999,
            15,
            8,
            4,
            113.61,
        },
        name = "Ларек Шаверма по-питерски",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_48"] = {
        ["position"] = {
            -191.59299999999999,
            -130.31399999999999,
            -1.8,
            8,
            4,
            359.67899999999997,
        },
        name = "Ларек Аккумуляторы",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_49"] = {
        ["position"] = {
            -191.667,
            -116.45999999999999,
            -1.8,
            8,
            4,
            359.99299999999999,
        },
        name = "Ларек Жигулевское",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_50"] = {
        ["position"] = {
            -247.93100000000001,
            -93.087999999999994,
            -2.0899999999999999,
            8,
            4,
            268.452,
        },
        name = "Ларек Табак",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_51"] = {
        ["position"] = {
            -262.779,
            -92.772000000000006,
            -2.0899999999999999,
            8,
            4,
            268.452,
        },
        name = "Ларек Аккумуляторы",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_52"] = {
        ["position"] = {
            -262.779,
            -92.772000000000006,
            -2.0899999999999999,
            8,
            4,
            268.452,
        },
        name = "Ларек Жигулевское",
        ["zoneType"] = "unload",
        city = -1,
    },
    business_53 = {
        ["position"] = {
            -1512,
            132.03100000000001,
            -1.575,
            8,
            6,
            180,
        },
        name = "Магазин Я",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_54"] = {
        ["position"] = {
            -1028.673,
            465.04899999999998,
            -1.3999999999999999,
            8,
            6,
            359.82900000000001,
        },
        name = "Магазин Я",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_55"] = {
        ["position"] = {
            2697.7269999999999,
            -2167.9029999999998,
            15,
            17,
            6,
            268.98500000000001,
        },
        name = "Автосалон Рофл",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_56"] = {
        ["position"] = {
            2679.5749999999998,
            -2097.748,
            15,
            17,
            6,
            270,
        },
        name = "Автосалон АвтоМакс",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_57"] = {
        ["position"] = {
            2615.0999999999999,
            -1953,
            15,
            8,
            4,
            269.298,
        },
        name = "Магазин Пивное",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_58"] = {
        ["position"] = {
            2626.1640000000002,
            -1953,
            15,
            8,
            4,
            269.92500000000001,
        },
        name = "Магазин Рубль",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_59"] = {
        ["position"] = {
            2432.5509999999999,
            564.47799999999995,
            15,
            17,
            6,
            9,
        },
        name = "АЗС Пашнефть",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_60"] = {
        ["position"] = {
            2447.0700000000002,
            506.11900000000003,
            15,
            8,
            6,
            281,
        },
        name = "Ларек Продукты",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_61"] = {
        ["position"] = {
            2442.4110000000001,
            470.95299999999997,
            15,
            8,
            6,
            10.66,
        },
        name = "Магазин Деревенские",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_62"] = {
        ["position"] = {
            652.59799999999996,
            -2823.6930000000002,
            13.6,
            17,
            6,
            90,
        },
        name = "АЗС Гамазпромнефть",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_63"] = {
        ["position"] = {
            1149.8,
            2535.8270000000002,
            12.800000000000001,
            8,
            6,
            179.608,
        },
        name = "Магазин Я",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_64"] = {
        ["position"] = {
            431.78399999999999,
            49.344000000000001,
            -1.8999999999999999,
            8,
            4,
            269.65499999999997,
        },
        name = "Ларек Жигулевское",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_65"] = {
        ["position"] = {
            445.90600000000001,
            49.295000000000002,
            -1.8999999999999999,
            8,
            4,
            269.02800000000002,
        },
        name = "Ларек Аккумуляторы",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_66"] = {
        ["position"] = {
            737.56600000000003,
            2498.5799999999999,
            12.9,
            8,
            4,
            359.12900000000002,
        },
        name = "Магазин Магнит",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_67"] = {
        ["position"] = {
            638.69299999999998,
            2583.3780000000002,
            12.9,
            8,
            4,
            89.995999999999995,
        },
        name = "Магазин Магнит",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_68"] = {
        ["position"] = {
            -40.185000000000002,
            -394.85000000000002,
            -1.8999999999999999,
            8,
            4,
            180.23699999999999,
        },
        name = "Магазин Магнит",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_69"] = {
        ["position"] = {
            -10.69,
            -416.75099999999998,
            -1.8999999999999999,
            7,
            3.5,
            359.15199999999999,
        },
        name = "Ларек Роспечать",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_70"] = {
        ["position"] = {
            -1758.269,
            -1002.604,
            -1.5,
            8,
            4,
            359.30700000000002,
        },
        name = "Магазин Магнит",
        ["zoneType"] = "unload",
        city = -1,
    },
    ["business_nev"] = {
        ["position"] = {
            2892.8290000000002,
            -2953.4470000000001,
            15.007999999999999,
            20,
            5,
            90,
        },
        name = "Порт Невского",
        ["zoneType"] = "goods",
        city = 3,
    },
    jty = {
        ["position"] = {
            -1903,
            2746.8229999999999,
            1.4790000000000001,
            20,
            8,
            0,
        },
        name = "ЖТУ",
        ["zoneType"] = "goods",
    },
    nev_port = {
        ["position"] = {
            2919.3530000000001,
            -2193.7310000000002,
            15,
            20,
            10,
            90,
        },
        name = "Порт Невского",
        ["zoneType"] = "all",
    },
    red_store = {
        ["position"] = {
            386,
            -892.27700000000004,
            1.9690000000000001,
            20,
            10,
            0,
        },
        name = "Красные склады",
        ["zoneType"] = "unload",
    },
    tram_factory = {
        ["position"] = {
            -2700.3600000000001,
            -2725.7420000000002,
            3.6369999999999996,
            20,
            10,
            90,
        },
        name = "Трамвайный завод",
        ["zoneType"] = "all",
    },
    priv_store = {
        ["position"] = {
            1372.6220000000001,
            2773.5279999999998,
            12.788,
            20,
            10,
            90,
        },
        name = "Склады Приволжска",
        ["zoneType"] = "goods",
    },
    mir_auto = {
        ["position"] = {
            -2018.1279999999999,
            -1594,
            -1.6000000000000001,
            20,
            10,
            55,
        },
        name = "Автосалоны Мирного",
        ["zoneType"] = "unload",
    },
    vostok_port = {
        ["position"] = {
            1072.146,
            2083.1460000000002,
            12.763999999999999,
            20,
            10,
            90,
        },
        name = "Порт Вост.точка",
        ["zoneType"] = "goods",
    },
    zapad_port = {
        ["position"] = {
            842.779,
            2011.2550000000001,
            12.776999999999999,
            20,
            10,
            90,
        },
        name = "Порт Зап.точка",
        ["zoneType"] = "goods",
    },
    tandem = {
        ["position"] = {
            347.93200000000002,
            158.86600000000001,
            -1.996,
            20,
            10,
            0,
        },
        name = "Тандем",
        ["zoneType"] = "unload",
    },
    jbk_factory = {
        ["position"] = {
            2667.48,
            1607.692,
            12.933,
            14,
            18,
            0,
        },
        name = "Завод ЖБК",
        ["zoneType"] = "all",
    },
    rjd_priv = {
        ["position"] = {
            -632,
            2784.413,
            1.2020000000000002,
            20,
            10,
            90,
        },
        name = "РЖД Приволжск",
        ["zoneType"] = "unload",
    },
    karier = {
        ["position"] = {
            -1374.9459999999999,
            -2360.8229999999999,
            15.657999999999999,
            20,
            8,
            90,
        },
        name = "Карьер",
        ["zoneType"] = "goods",
    },
    transmash = {
        ["position"] = {
            -2619.2159999999999,
            -2753.8029999999999,
            3.6369999999999996,
            20,
            10,
            0,
        },
        name = "ПровинсТрансМаш",
        ["zoneType"] = "unload",
    },
    builder_mir = {
        ["position"] = {
            -834.14300000000003,
            -290.80599999999998,
            -1.7749999999999999,
            20,
            10,
            330,
        },
        name = "Стройплощадка",
        ["zoneType"] = "unload",
    },
    sea_port = {
        ["position"] = {
            1087.9059999999999,
            1947.8630000000001,
            12.815999999999999,
            20,
            7,
            0,
        },
        name = "Морской порт",
        ["zoneType"] = "goods",
    },
    fish_factory = {
        ["position"] = {
            -1667.319,
            -2908.8560000000002,
            3.419,
            20,
            10,
            90,
        },
        name = "РЫБПРОМКОМБИНАТ",
        ["zoneType"] = "all",
    },
    priv_store2 = {
        ["position"] = {
            1821.723,
            2773.4920000000002,
            12.779999999999999,
            20,
            10,
            90,
        },
        name = "Складское помещение",
        ["zoneType"] = "goods",
    },
    atp = {
        ["position"] = {
            -352.33499999999998,
            465.34100000000001,
            -1.931,
            20,
            10,
            90,
        },
        name = "АТП",
        ["zoneType"] = "unload",
    },
    moksadim = {
        ["position"] = {
            253.542,
            1951.4159999999999,
            12.82,
            20,
            10,
            90,
        },
        name = "ТЦ Моксадим",
        ["zoneType"] = "goods",
    },
    vol_store = {
        ["position"] = {
            -2869.9810000000002,
            -2812.75,
            3.7130000000000001,
            20,
            10,
            90,
        },
        name = "Склад Волчанска",
        ["zoneType"] = "all",
    },
    sea_port_2 = {
        ["position"] = {
            1032.346,
            1919.7550000000001,
            12.815999999999999,
            20,
            6,
            90,
        },
        name = "Порт Приволжска",
        ["zoneType"] = "goods",
    },
    ozerki = {
        ["position"] = {
            4.7599999999999998,
            -1332.8409999999999,
            -1.9749999999999999,
            18,
            6,
            0,
        },
        name = "Деревня Озерки",
        ["zoneType"] = "unload",
    },
    ["mir_store"] = {
        ["position"] = {
            386.024,
            -892.21100000000001,
            1.9590000000000001,
            20,
            9,
            0,
        },
        name = "Склады",
        ["zoneType"] = "goods",
    },
    ["river_station"] = {
        ["position"] = {
            1433.5899999999999,
            2165.2559999999999,
            12.785,
            20,
            10,
            90,
        },
        name = "Речной вокзал",
        ["zoneType"] = "unload",
    },
    ["parus_mall"] = {
        ["position"] = {
            1999.704,
            -2854.4920000000002,
            15.029,
            20,
            10,
            6,
        },
        name = "ТЦ Парус",
        ["zoneType"] = "unload",
    },
    ["mail_russia"] = {
        ["position"] = {
            671.09799999999996,
            -478.80500000000001,
            -1.9279999999999999,
            20,
            10,
            90,
        },
        name = "Почта России",
        ["zoneType"] = "goods",
    },
    ["river_station_nev"] = {
        ["position"] = {
            914.49699999999996,
            -2403.8919999999998,
            14.811999999999999,
            20,
            10,
            0,
        },
        name = "Речной вокзал Невского",
        ["zoneType"] = "unload",
    },
    ["tandem_store"] = {
        ["position"] = {
            200.97499999999999,
            487.892,
            -2.2720000000000002,
            23,
            9,
            0,
        },
        name = "Склады у Тандема",
        ["zoneType"] = "goods",
    },
    ["maes"] = {
        ["position"] = {
            -2018.7909999999999,
            1371.3789999999999,
            0.017000000000000015,
            20,
            10,
            0,
        },
        name = "МАЭС",
        ["zoneType"] = "unload",
    },
    ["gornya"] = {
        ["position"] = {
            -411.33800000000002,
            1030.432,
            12.186,
            20,
            7,
            110,
        },
        name = "Деревня Горная",
        ["zoneType"] = "goods",
    },
    ["builder_priv"] = {
        ["position"] = {
            2000.2860000000001,
            2456.4679999999998,
            12.858000000000001,
            20,
            10,
            65,
        },
        name = "Стройплощадка",
        ["zoneType"] = "unload",
    },
    ["mine"] = {
        ["position"] = {
            870.51199999999994,
            -576.38999999999999,
            -1.913,
            20,
            10,
            0,
        },
        name = "Шахта",
        ["zoneType"] = "goods",
    },
    ["sea_port_nev"] = {
        ["position"] = {
            2811.1909999999998,
            -2905.7220000000002,
            15.016999999999999,
            20,
            6,
            0,
        },
        name = "Морской порт",
        ["zoneType"] = "all",
    },
    ["mir_store_2"] = {
        ["position"] = {
            209.53299999999999,
            -970.702,
            1.9630000000000001,
            23,
            9,
            0,
        },
        name = "Склад Мирного",
        ["zoneType"] = "goods",
    },
    ["autorepair_mir"] = {
        ["position"] = {
            2151.5,
            -2828.8760000000002,
            15.032,
            20,
            10,
            96,
        },
        name = "Автомастерская",
        ["zoneType"] = "unload",
    },
    ["noname_market"] = {
        ["position"] = {
            1675.636,
            2326.6080000000002,
            12.798999999999999,
            20,
            5,
            0,
        },
        name = "Безымянский рынок",
        ["zoneType"] = "unload",
    },
    ["lerya"] = {
        ["position"] = {
            -1934.8989999999999,
            -1117.472,
            -1.5920000000000001,
            20,
            8,
            325,
        },
        name = "Леруа Мерлен",
        ["zoneType"] = "goods",
    },
    ["priv_arena"] = {
        ["position"] = {
            2137.9180000000001,
            2120.0720000000001,
            12.792,
            21,
            9,
            310,
        },
        name = "Приволжск Арена",
        ["zoneType"] = "unload",
    },
    ["nev_store"] = {
        ["position"] = {
            2721.165,
            -769.56700000000001,
            14.991,
            20,
            10,
            0,
        },
        name = "База",
        ["zoneType"] = "goods",
    },
    tobacco = {
        ["position"] = {
            2239.6970000000001,
            -1537.886,
            15.003,
            19,
            10,
            229,
        },
        name = "Табачный завод",
        ["zoneType"] = "goods",
    },
    ["redoctober"] = {
        ["position"] = {
            2419.636,
            -2503.9229999999998,
            14.994999999999999,
            20,
            10,
            235,
        },
        name = "Красный Октябрь",
        ["zoneType"] = "goods",
    },
    ["city_park_grad"] = {
        ["position"] = {
            -2201.1170000000002,
            -1348.1759999999999,
            -1.5640000000000001,
            20,
            10,
            166,
        },
        name = "Сити Парк Град",
        ["zoneType"] = "unload",
    },
    ["maes_2"] = {
        ["position"] = {
            -2028.385,
            1774.931,
            0.019000000000000017,
            20,
            10,
            0,
        },
        name = "МАЭС",
        ["zoneType"] = "unload",
    },
    ["hoff"] = {
        ["position"] = {
            -2244.9389999999999,
            -1447.5609999999999,
            -1.5569999999999999,
            20,
            10,
            347,
        },
        name = "Hoff",
        ["zoneType"] = "unload",
    },
    ["gold_rain"] = {
        ["position"] = {
            -1725.51,
            -1985.7439999999999,
            5.5329999999999995,
            20,
            10,
            0,
        },
        name = "База отдыха",
        ["zoneType"] = "unload",
    },
    ["flower_shop"] = {
        ["position"] = {
            281.74700000000001,
            2353.3380000000002,
            12.785,
            20,
            5,
            0,
        },
        name = "Цветочная лавка",
        ["zoneType"] = "unload",
    },
    ["nev_port_2"] = {
        ["position"] = {
            2705.7269999999999,
            -2941.2860000000001,
            15.016999999999999,
            20,
            10,
            0,
        },
        name = "Порт Невского",
        ["zoneType"] = "goods",
    },
    priv_port_3 = {
        ["position"] = {
            936.005,
            1919.7909999999999,
            12.824,
            6,
            12,
            0,
        },
        name = "Порт Приволжска",
        ["zoneType"] = "goods",
    },
    priv_gun_shop = {
        ["position"] = {
            1942.761,
            2826.1680000000001,
            12.863,
            6,
            12,
            0,
        },
        name = "Оружейный магазин",
        ["zoneType"] = "unload",
    },
    priv_auto_shop = {
        ["position"] = {
            450.26999999999998,
            1907.6310000000001,
            12.775,
            6,
            12,
            90,
        },
        name = "Автомагазин",
        ["zoneType"] = "all",
    },
    ["priv_taxi"] = {
        ["position"] = {
            1953.232,
            2768.9090000000001,
            12.801,
            6,
            12,
            90,
        },
        name = "Таксопарк",
        ["zoneType"] = "unload",
    },
    priv_bar = {
        ["position"] = {
            2165.4050000000002,
            2895.4450000000002,
            12.795,
            6,
            12,
            90,
        },
        name = "Бар Приволжска",
        ["zoneType"] = "all",
    },
    priv_kvart = {
        ["position"] = {
            838.59400000000005,
            2330.8699999999999,
            12.772,
            6,
            12,
            90,
        },
        name = "Гостиница «Кварт»",
        ["zoneType"] = "unload",
    },
    priv_sto = {
        ["position"] = {
            2252.748,
            2433.9630000000002,
            12.779999999999999,
            6,
            12,
            40,
        },
        name = "СТО",
        ["zoneType"] = "goods",
    },
    ["mir_bar"] = {
        ["position"] = {
            -1841.992,
            -756.798,
            -1.5720000000000001,
            6,
            12,
            0,
        },
        name = "Бар Мирного",
        ["zoneType"] = "goods",
    },
    ["casino"] = {
        ["position"] = {
            -1877.4280000000001,
            440.47000000000003,
            -1.383,
            6,
            12,
            90,
        },
        name = "Казино",
        ["zoneType"] = "unload",
    },
    ["mir_gym"] = {
        ["position"] = {
            -1639.252,
            -812.27800000000002,
            -1.5880000000000001,
            6,
            12,
            0,
        },
        name = "Спортивный зал",
        ["zoneType"] = "unload",
    },
    ["nev_auto_shop"] = {
        ["position"] = {
            2106.0140000000001,
            -2828.076,
            15.032,
            6,
            12,
            95,
        },
        name = "СТО",
        ["zoneType"] = "goods",
    },
    ["nev_ttu"] = {
        ["position"] = {
            2494.3899999999999,
            -1256.9259999999999,
            14.991,
            6,
            12,
            40,
        },
        name = "ТТУ",
        ["zoneType"] = "unload",
    },
    ["nev_store_3"] = {
        ["position"] = {
            2721.2150000000001,
            -765.61699999999996,
            14.991,
            6,
            12,
            90,
        },
        name = "Склад Невского",
        ["zoneType"] = "goods",
    },
    ["priv_boat_rent"] = {
        ["position"] = {
            1751.5350000000001,
            2077.4319999999998,
            12.808,
            6,
            12,
            90,
        },
        name = "Аренда лодок",
        ["zoneType"] = "unload",
    },
    ["nev_port_3"] = {
        ["position"] = {
            2811.2600000000002,
            -2902.1289999999999,
            15.016999999999999,
            6,
            12,
            90,
        },
        name = "Порт Невского",
        ["zoneType"] = "goods",
    },
    ["nev_tuning"] = {
        ["position"] = {
            2354.2950000000001,
            -1483.99,
            14.994,
            6,
            12,
            130,
        },
        name = "Тюнинг-ателье «Hustle Customs»",
        ["zoneType"] = "unload",
    },
    ["nev_magazin"] = {
        ["position"] = {
            2663.7689999999998,
            -1941.3140000000001,
            14.991999999999999,
            6,
            12,
            0,
        },
        name = "Магазин",
        ["zoneType"] = "unload",
    },
    ["nev_slavka"] = {
        ["position"] = {
            2178.3209999999999,
            -2712.7730000000001,
            14.994999999999999,
            6,
            12,
            118,
        },
        name = "Славка-центр",
        ["zoneType"] = "unload",
    },
    ["van_hoff"] = {
        ["position"] = {
            -2190.6579999999999,
            -1316.713,
            -1.5659999999999998,
            6,
            12,
            78,
        },
        name = "Hoff",
        ["zoneType"] = "goods",
    },
    ["easymoll"] = {
        ["position"] = {
            -901.99300000000005,
            33.341000000000001,
            -1.9449999999999998,
            6,
            12,
            0,
        },
        name = "«Изимол Сити»",
        ["zoneType"] = "unload",
    },
    ["mir_mcdonalds"] = {
        ["position"] = {
            -31.274999999999999,
            151.285,
            -2.0680000000000001,
            6,
            12,
            0,
        },
        name = "Макдональдс",
        ["zoneType"] = "unload",
    },
    ["lenta"] = {
        ["position"] = {
            276.75299999999999,
            1555.7560000000001,
            26.475000000000001,
            20,
            8,
            0,
        },
        name = "Лента",
        ["zoneType"] = "goods",
    },
    ["viva_lend"] = {
        ["position"] = {
            569.92700000000002,
            2402.8290000000002,
            13.282999999999999,
            8,
            20,
            0,
        },
        name = "Вива-Лэнд",
        ["zoneType"] = "unload",
    },
    ["kosmos"] = {
        ["position"] = {
            -1557.269,
            -405.327,
            4.5359999999999996,
            20,
            8,
            0,
        },
        name = "Гостиница «Космос»",
        ["zoneType"] = "unload",
    },
}
for k, v in pairs(tGroundZonez) do
    if v.zoneType then
        tGroundZonez[k].icon = (nil[v.zoneType] or nil.goods)
    end
end

getZoneName = function(arg1)
    if tGroundZonez[arg1] then
        if tGroundZonez[arg1].name then
            return tGroundZonez[arg1].name
        end
        return "Неизвестно"
    end
    return "Неизвестно"
end

findGroundZone = function(arg1, arg2)
    if not arg1 or not arg2 then
        return false
    end
    for k, v in pairs(tGroundZonez) do
        if v.city == arg1 then
            if v.zoneType == arg2 then
                return k
            end
        end
    end
    return false
end

getZonePosition = function(arg1)
    if arg1 then
        if tGroundZonez[arg1] then
        end
    end
    return false
end

getPlayerValidDistanceToZone = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if tGroundZonez[arg2] then
    end
    return false
    end

    return false
    end
    return true, getDistanceBetweenPoints3D(value_1, value_2, value_3, value_4, value_5, value_6)
end

getModelRandomColor = function(arg1)
    if tModelRandomColors[arg1] then
        return unpack(tModelRandomColors[arg1][math.random(1, #tModelRandomColors[arg1])])
    end
    return false
end

getRouteSalary = function(arg1, arg2, arg3, arg4)
    if arg1 and arg3 and arg2 and arg4 then
    end
    return 0
        end

        if getGoodsTruckType(arg2) == "van" then
            return math.floor(arg1 * tLevelSalaries[arg3] * arg3 * arg4.vanCoef)
        end
        return math.floor(arg1 * tLevelSalaries[arg3] * arg3)
    end
    if arg4.isRent then
        return math.floor(arg1 * arg4.maxGoods / 1000 * tLevelSalaries[arg3] * arg3)
    end
    return math.floor(arg1 * arg4.maxGoods / 1000 * tLevelSalaries[arg3] * arg3) + arg1
end

getContractSalary = function(arg1, arg2, arg3, arg4)
    if arg1 and arg2 and arg3 and arg4 then
    end
    return 0
        end

        if arg3 < arg4.maxGoods then
        end
        return math.floor(arg1 * arg4.maxGoods)
        end
        return math.floor(arg1 * 1000)
    end
    if arg3 < arg4.maxGoods then
    end
    return math.floor(arg1 * arg4.maxGoods)
end

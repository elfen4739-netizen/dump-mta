-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function onClientResourceStart()
    if CURRENT_SEASON then
        local onClientResourceStart = {
            [1] = {
                answers = {
                    { showCondition = checkInWork2, "«Хочу трудоустроиться водителем»", inviteJob },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Ты же новенький? Готов крутить баранку?", "Надо посмотреть, что для тебя из рейсов найдётся.", "Ты по вопросам заработка или контракт заказать?" },
            },
            [2] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так ты ещё сопляк, куда тебе такую махину водить? Приходи, как поживёшь ещё в республике (достигните 8 игрового уровня).",
            },
            [3] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так у тебя нет водительских прав категории «С». Бегом получай их в автошколе и возвращайся.",
            },
        }
        local var_1 = {}
    end
    if CURRENT_SEASON then
        local onClientResourceStart = {
            [1] = {
                answers = {
                    { showCondition = checkInWork2, "«Хочу трудоустроиться водителем»", inviteJob },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Ты же новенький? Готов крутить баранку?", "Надо посмотреть, что для тебя из рейсов найдётся.", "Ты по вопросам заработка или контракт заказать?" },
            },
            [2] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так ты ещё сопляк, куда тебе такую махину водить? Приходи, как поживёшь ещё в республике (достигните 8 игрового уровня).",
            },
            [3] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так у тебя нет водительских прав категории «С». Бегом получай их в автошколе и возвращайся.",
            },
        }
        local var_1 = {}
    end
    local onClientResourceStart = {
        pos = Vector3(901.61000000000001, 2837.6100000000001, 13.800000000000001),
        rot = 358.79000000000002,
        skin = 23,
        int = 0,
        dim = 0,
        camera = {
            901.44299999999998,
            2838.3649999999998,
            14.634,
            901.51300000000003,
            2837.3710000000001,
            14.555999999999999,
            0,
            90.227000000000004,
        },
        name = "Начальник базы",
        antiCollision = true,
        dialog = {
            [1] = {
                answers = {
                    { showCondition = checkInWork2, "«Хочу трудоустроиться водителем»", inviteJob },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Ты же новенький? Готов крутить баранку?", "Надо посмотреть, что для тебя из рейсов найдётся.", "Ты по вопросам заработка или контракт заказать?" },
            },
            [2] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так ты ещё сопляк, куда тебе такую махину водить? Приходи, как поживёшь ещё в республике (достигните 8 игрового уровня).",
            },
            [3] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так у тебя нет водительских прав категории «С». Бегом получай их в автошколе и возвращайся.",
            },
            [4] = {
                answers = {
                    { "«Да, я внесу залог [10 000 руб.]»", rentTruckFunc },
                    {
                        showCondition =                         function()
                            if CURRENT_SEASON then
                            end
                            return false
                        end,
                        "«Я внесу залог за праздничный тягач [10 000 руб.]»",
                        rentSeasonTruckFunc,
                    },
                    { "«Нет, в другой раз»", 7 },
                },
                "Начальник базы",
                "Да, но тебе придётся оставить залог в размере 10 000 руб.",
            },
            [5] = {
                answers = {
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                "Поезжай в тот город, где устраивался. Нечего тебе здесь ходить и вынюхивать.",
            },
            [6] = {
                answers = {
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                "Поезжай в тот город, где устраивался. Нечего тебе здесь ходить и вынюхивать.",
            },
            [7] = {
                answers = {
                    { showCondition = checkRentTruck, "«Могу ли я взять рабочий транспорт?»", 4 },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { showCondition = checkInWork, "«Хочу уволиться, на сегодня хватит»", uninviteJob },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Для тебя на выбор любые рейсы: на арендованном или своём тягаче. Теперь можешь даже приступить к работе на личном фургоне." },
            },
        },
    }
    createNPC(1, onClientResourceStart)
    local var_1 = {
        pos = Vector3(84.590000000000003, 506.24000000000001, 0.070000000000000007),
        rot = 131.69,
        skin = 23,
        int = 0,
        dim = 0,
        camera = {
            84.174999999999997,
            505.58300000000003,
            0.80500000000000005,
            84.829999999999998,
            506.339,
            0.80000000000000004,
            0,
            90.227000000000004,
        },
        name = "Начальник базы",
        antiCollision = true,
        dialog = {
            [1] = {
                answers = {
                    { showCondition = checkInWork2, "«Хочу трудоустроиться водителем»", inviteJob },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Ты же новенький? Готов крутить баранку?", "Надо посмотреть, что для тебя из рейсов найдётся.", "Ты по вопросам заработка или контракт заказать?" },
            },
            [2] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так ты ещё сопляк, куда тебе такую махину водить? Приходи, как поживёшь ещё в республике (достигните 8 игрового уровня).",
            },
            [3] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так у тебя нет водительских прав категории «С». Бегом получай их в автошколе и возвращайся.",
            },
            [4] = {
                answers = {
                    { "«Да, я внесу залог [10 000 руб.]»", rentTruckFunc },
                    {
                        showCondition =                         function()
                            if CURRENT_SEASON then
                            end
                            return false
                        end,
                        "«Я внесу залог за праздничный тягач [10 000 руб.]»",
                        rentSeasonTruckFunc,
                    },
                    { "«Нет, в другой раз»", 7 },
                },
                "Начальник базы",
                "Да, но тебе придётся оставить залог в размере 10 000 руб.",
            },
            [5] = {
                answers = {
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                "Поезжай в тот город, где устраивался. Нечего тебе здесь ходить и вынюхивать.",
            },
            [6] = {
                answers = {
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                "Поезжай в тот город, где устраивался. Нечего тебе здесь ходить и вынюхивать.",
            },
            [7] = {
                answers = {
                    { showCondition = checkRentTruck, "«Могу ли я взять рабочий транспорт?»", 4 },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { showCondition = checkInWork, "«Хочу уволиться, на сегодня хватит»", uninviteJob },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Для тебя на выбор любые рейсы: на арендованном или своём тягаче. Теперь можешь даже приступить к работе на личном фургоне." },
            },
        },
    }
    createNPC(2, var_1)
    local var_2 = {
        pos = Vector3(2765.71, -1075.72, 16),
        rot = 320.55000000000001,
        skin = 23,
        int = 0,
        dim = 0,
        camera = {
            2765.9690000000001,
            -1075.047,
            16.731999999999999,
            2765.4850000000001,
            -1075.922,
            16.736999999999998,
            0,
            90.227000000000004,
        },
        name = "Начальник базы",
        antiCollision = true,
        dialog = {
            [1] = {
                answers = {
                    { showCondition = checkInWork2, "«Хочу трудоустроиться водителем»", inviteJob },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Ты же новенький? Готов крутить баранку?", "Надо посмотреть, что для тебя из рейсов найдётся.", "Ты по вопросам заработка или контракт заказать?" },
            },
            [2] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так ты ещё сопляк, куда тебе такую махину водить? Приходи, как поживёшь ещё в республике (достигните 8 игрового уровня).",
            },
            [3] = {
                answers = {
                    { "«Да ну-у-у бли-и-и-н»", 1 },
                },
                "Начальник базы",
                "Так у тебя нет водительских прав категории «С». Бегом получай их в автошколе и возвращайся.",
            },
            [4] = {
                answers = {
                    { "«Да, я внесу залог [10 000 руб.]»", rentTruckFunc },
                    {
                        showCondition =                         function()
                            if CURRENT_SEASON then
                            end
                            return false
                        end,
                        "«Я внесу залог за праздничный тягач [10 000 руб.]»",
                        rentSeasonTruckFunc,
                    },
                    { "«Нет, в другой раз»", 7 },
                },
                "Начальник базы",
                "Да, но тебе придётся оставить залог в размере 10 000 руб.",
            },
            [5] = {
                answers = {
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                "Поезжай в тот город, где устраивался. Нечего тебе здесь ходить и вынюхивать.",
            },
            [6] = {
                answers = {
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                "Поезжай в тот город, где устраивался. Нечего тебе здесь ходить и вынюхивать.",
            },
            [7] = {
                answers = {
                    { showCondition = checkRentTruck, "«Могу ли я взять рабочий транспорт?»", 4 },
                    { showCondition = checkBusiness, "«Давай обсудим бизнес-контракты»", openContract },
                    { showCondition = checkInWork, "«Хочу уволиться, на сегодня хватит»", uninviteJob },
                    { "[Уйти]", endDialog },
                },
                "Начальник базы",
                { "Для тебя на выбор любые рейсы: на арендованном или своём тягаче. Теперь можешь даже приступить к работе на личном фургоне." },
            },
        },
    }
    createNPC(3, var_2)
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
addEvent("trucker:updateJobDialog", true)
local state = nil
local state_1 = nil
local state_2 = nil
local state_3 = nil

local function sub_1001()
    if not activeDialog then
        return
    end
    state = nil
    state_1 = true
    state_2 = (state_3 or false)
    openDialog(7)
end

addEventHandler("trucker:updateJobDialog", resourceRoot, sub_1001)
addEvent("trucker:openDialog", true)
local state_5 = nil
local state_6 = nil
local state_7 = nil

local function sub_1002(arg1)
    if isAnyInterfaceOpen() then
        return
    end
    if value_5 then
        local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
    end
    state_5 = false
    if value_2 then
        local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
    end
    state_1 = false
    if value_3 then
        local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
    end
    state_6 = false
    if value_4 then
        local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
    end
    state_7 = false
    state = nil
    state_3 = false
    state_2 = false
    if activeDialog then
        return
    end
    if state_2 then
        if state_2 ~= state_3 then
            startDialog(value_1, 6)
            local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
        end
        local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
    end
    if not state_1 then
        startDialog(value_1, 1)
        local value_1, value_2, value_3, value_4, value_5, value_6 = unpack(arg1)
    end
    startDialog(value_1, 7)
end

addEventHandler("trucker:openDialog", resourceRoot, sub_1002)

openContract = function()
    triggerServerEvent("trucker:openMyContracts", resourceRoot)
    endDialog()
end

inviteJob = function()
    if not state_6 then
        openDialog(2)
        return
    end
    if not state_7 then
        openDialog(3)
    end
    if state then
        return
    end
    triggerServerEvent("trucker:startPlayerJob", resourceRoot)
    state = true
end

uninviteJob = function()
    if state_3 ~= state_2 then
        openDialog(5)
    end
    triggerServerEvent("trucker:stopPlayerJob", resourceRoot)
    endDialog()
end

rentTruckFunc = function(arg1, arg2)
    if state_3 ~= state_2 then
        openDialog(5)
    end
    triggerServerEvent("trucker:rentTruck", resourceRoot, arg2)
    endDialog()
end

rentSeasonTruckFunc = function(arg1)
    rentTruckFunc(arg1, true)
end

checkBusiness = function()
    return state_5
end

checkInWork = function()
    return state_1
end

checkInWork2 = function()
    return not state_1
end

local state_9 = nil

checkRentTruck = function()
    if not state_1 then
        return state_1
    end
    return not state_9
end

addEvent("trucker:updateRentTruck", true)

local function sub_1003(arg1)
    state_9 = arg1
end

addEventHandler("trucker:updateRentTruck", resourceRoot, sub_1003)

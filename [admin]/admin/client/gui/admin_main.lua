-- ByteRevenant
-- LuaQ 5.1 structured decompile

aAdminForm = r0
aLastCheck = 0
aCurrentVehicle = 429
aCurrentWeapon = 30
aCurrentAmmo = 90
aCurrentSlap = 20
aPlayers = {}
aBans = {}
aLastSync = 0
aResources = {}
aAuthorLabel = nil

guiComboBoxAdjustHeight = function(arg1, arg2)
    if getElementType(arg1) == "gui-combobox" then
    end
    error("Invalid arguments @ 'guiComboBoxAdjustHeight'", 2)
    return guiSetSize(arg1, guiGetSize(arg1, false), arg2 * 20 + 20, false)
end

local function var()
    return tValidVehicles
end

local function var_1()
    return nil[math.random(#nil)]
end

aAdminMenu = function()
    if aAdminForm == nil then
        aAdminForm = guiCreateWindow(screenX / 2 - 310, screenY / 2 - 260, 620, 520, "", false)
        guiWindowSetSizable(aAdminForm, false)
        guiSetText(aAdminForm, "Админ панель")
        aAuthorLabel = guiCreateLabel(0.72499999999999998, 0.025000000000000001, 0.25, 0.080000000000000002, "Admin Panel by lil_Toady", true, aAdminForm)
        guiLabelSetHorizontalAlign(aAuthorLabel, "right", true)
        guiLabelSetVerticalAlign(aAuthorLabel, "center", true)
        aTabPanel = guiCreateTabPanel(0.01, 0.050000000000000003, 0.97999999999999998, 0.94999999999999996, true, aAdminForm)
        aTab1 = {}
        aTab1.Tab = guiCreateTab("Игроки", aTabPanel, "players")
        aTab1.ScreenShots = guiCreateButton(0.70999999999999996, 0.065000000000000002, 0.27000000000000002, 0.040000000000000001, "скриншоты", true, aTab1.Tab)
        aTab1.PlayerListSearch = guiCreateEdit(0.029999999999999999, 0.050000000000000003, 0.16, 0.040000000000000001, "", true, aTab1.Tab)
        guiCreateStaticImage(0.19, 0.050000000000000003, 0.035000000000000003, 0.040000000000000001, "client\\images\\search.png", true, aTab1.Tab)
        aTab1.PlayerList = guiCreateGridList(0.029999999999999999, 0.10000000000000001, 0.20000000000000001, 0.82999999999999996, true, aTab1.Tab)
        guiGridListAddColumn(aTab1.PlayerList, "Имя игрока", 0.84999999999999998)
        for k, v in ipairs(getElementsByType("player")) do
            guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, v, false, false)
            local screenX, screenY = guiGetScreenSize()
        end
        aTab1.Freeze = guiCreateButton(0.70999999999999996, 0.17000000000000001, 0.27000000000000002, 0.040000000000000001, "Заморозить", true, aTab1.Tab, "freeze")
        aTab1.Spectate = guiCreateButton(0.70999999999999996, 0.215, 0.13, 0.040000000000000001, "Наблюдать", true, aTab1.Tab, "spectate")
        aTab1.Slap = guiCreateButton(0.84999999999999998, 0.215, 0.13, 0.040000000000000001, "Пнуть! " .. aCurrentSlap .. " _", true, aTab1.Tab, "slap")
        aTab1.SlapDropDown = guiCreateStaticImage(0.94999999999999996, 0.215, 0.029999999999999999, 0.040000000000000001, "client\\images\\dropdown.png", true, aTab1.Tab)
        aTab1.SlapOptions = guiCreateGridList(0.84999999999999998, 0.215, 0.13, 0.40000000000000002, true, aTab1.Tab)
        guiGridListSetSortingEnabled(aTab1.SlapOptions, false)
        guiGridListAddColumn(aTab1.SlapOptions, "", 0.84999999999999998)
        guiSetVisible(aTab1.SlapOptions, false)
        guiGridListSetItemText(aTab1.SlapOptions, guiGridListAddRow(aTab1.SlapOptions), 1, tostring(0.84999999999999998 * 10), false, false)
        aTab1.Nick = guiCreateButton(0.70999999999999996, 0.26000000000000001, 0.13, 0.040000000000000001, "Сменить ник", true, aTab1.Tab)
        aTab1.Shout = guiCreateButton(0.84999999999999998, 0.26000000000000001, 0.13, 0.040000000000000001, "Накричать!", true, aTab1.Tab, "shout")
        guiCreateHeader(0.25, 0.029999999999999999, 0.20000000000000001, 0.040000000000000001, "Игрок:", true, aTab1.Tab)
        aTab1.Name = guiCreateLabel(0.26000000000000001, 0.029999999999999999 + 0.044999999999999998, 0.29999999999999999, 0.035000000000000003, "Имя: N/A", true, aTab1.Tab)
        aTab1.IP = guiCreateLabel(0.26000000000000001, 0.029999999999999999 + 0.044999999999999998 + 0.044999999999999998, 0.29999999999999999, 0.035000000000000003, "IP: N/A", true, aTab1.Tab)
        aTab1.CountryCode = guiCreateLabel(0.45000000000000001, 0.029999999999999999 + 0.044999999999999998 + 0.044999999999999998, 0.040000000000000001, 0.035000000000000003, "", true, aTab1.Tab)
        aTab1.Flag = guiCreateStaticImage(0.40000000000000002, 0.029999999999999999 + 0.044999999999999998 + 0.044999999999999998, 0.025805999999999999, 0.021153999999999999, "client\\images\\empty.png", true, aTab1.Tab)
        aTab1.Serial = guiCreateLabel(0.26000000000000001, 0.029999999999999999 + 0.044999999999999998 + 0.044999999999999998 + 0.044999999999999998, 0.435, 0.035000000000000003, "Serial: N/A", true, aTab1.Tab)
        aTab1.SetHealth = guiCreateButton(0.70999999999999996, 0.39500000000000002, 0.13, 0.040000000000000001, "Здоровье", true, aTab1.Tab, "sethealth")
        aTab1.SetArmour = guiCreateButton(0.84999999999999998, 0.39500000000000002, 0.13, 0.040000000000000001, "Броня", true, aTab1.Tab, "setarmour")
        aTab1.SetDimension = guiCreateButton(0.70999999999999996, 0.755, 0.13, 0.040000000000000001, "Измерение", true, aTab1.Tab, "setdimension")
        aTab1.SetInterior = guiCreateButton(0.84999999999999998, 0.755, 0.13, 0.040000000000000001, "Интерьер", true, aTab1.Tab, "setinterior")
        aTab1.JetPack = guiCreateButton(0.70999999999999996, 0.57499999999999996, 0.27000000000000002, 0.040000000000000001, "Дать Джетпак", true, aTab1.Tab, "jetpack")
        aTab1.Warp = guiCreateButton(0.70999999999999996, 0.62, 0.27000000000000002, 0.040000000000000001, "ТП к игроку", true, aTab1.Tab, "warp")
        aTab1.WarpTo = guiCreateButton(0.70999999999999996, 0.66500000000000004, 0.27000000000000002, 0.040000000000000001, "ТП игрока к..", true, aTab1.Tab, "warp")
        aTab1.VehicleFix = guiCreateButton(0.70999999999999996, 0.83999999999999997, 0.13, 0.040000000000000001, "Починить", true, aTab1.Tab, "repairadm")
        aTab1.VehicleDestroy = guiCreateButton(0.70999999999999996, 0.89000000000000001, 0.27000000000000002, 0.040000000000000001, "Удалить", true, aTab1.Tab, "destroyvehicle")
        aTab1.VehicleBlow = guiCreateButton(0.84999999999999998, 0.83999999999999997, 0.13, 0.040000000000000001, "Взорвать", true, aTab1.Tab, "blowvehicle")
        aTab1.GiveVehicle = guiCreateButton(0.70999999999999996, 0.70999999999999996, 0.27000000000000002, 0.040000000000000001, "Дать: " .. getVehicleNameFromModel(aCurrentVehicle), true, aTab1.Tab, "givevehicle")
        aTab1.VehicleDropDown = guiCreateStaticImage(0.94999999999999996, 0.70999999999999996, 0.029999999999999999, 0.040000000000000001, "client\\images\\dropdown.png", true, aTab1.Tab)
        aTab1.VehicleOptions = guiCreateGridList(0, 0, value_1, 200, false)
        guiGridListAddColumn(aTab1.VehicleOptions, "", 0.84999999999999998)
        guiSetAlpha(aTab1.VehicleOptions, 0.80000000000000004)
        guiSetVisible(aTab1.VehicleOptions, false)
        for k, v in ipairs(var()) do
            if getVehicleNameFromModel(v) ~= "" and v ~= 411 and v ~= 434 then
                table.insert(var, { model = v, name = getVehicleNameFromModel(v) })
                local screenX, screenY = guiGetScreenSize()
            end
            local screenX, screenY = guiGetScreenSize()
        end
        local function sub_1001(arg1, arg2)
            if arg1.name >= arg2.name then
            end
            return true
        end
        table.sort(var, sub_1001)
        for k, v in ipairs({}) do
            guiGridListSetItemText(aTab1.VehicleOptions, guiGridListAddRow(aTab1.VehicleOptions), 1, v.name, false, false)
            guiGridListSetItemData(aTab1.VehicleOptions, guiGridListAddRow(aTab1.VehicleOptions), 1, tostring(v.model))
            local screenX, screenY = guiGetScreenSize()
        end
        aTab2 = {}
        aTab2.Tab = guiCreateTab("Ресурсы", aTabPanel, "resources")
        aTab2.ManageACL = guiCreateButton(0.75, 0.02, 0.23000000000000001, 0.040000000000000001, "Управление ACL", true, aTab2.Tab)
        aTab2.ResourceListSearch = guiCreateEdit(0.029999999999999999, 0.050000000000000003, 0.31, 0.040000000000000001, "", true, aTab2.Tab)
        guiCreateStaticImage(0.34000000000000002, 0.050000000000000003, 0.035000000000000003, 0.040000000000000001, "client\\images\\search.png", true, aTab2.Tab)
        aTab2.ResourceList = guiCreateGridList(0.029999999999999999, 0.10000000000000001, 0.34999999999999998, 0.80000000000000004, true, aTab2.Tab)
        guiGridListAddColumn(aTab2.ResourceList, "Ресурс", 0.55000000000000004)
        guiGridListAddColumn(aTab2.ResourceList, "", 0.050000000000000003)
        guiGridListAddColumn(aTab2.ResourceList, "Состояние", 0.34999999999999998)
        guiGridListAddColumn(aTab2.ResourceList, "Полное имя", 0.59999999999999998)
        guiGridListAddColumn(aTab2.ResourceList, "Автор", 0.40000000000000002)
        guiGridListAddColumn(aTab2.ResourceList, "Версия", 0.20000000000000001)
        aTab2.ResourceRefresh = guiCreateButton(0.029999999999999999, 0.91500000000000004, 0.34999999999999998, 0.040000000000000001, "Обновить", true, aTab2.Tab, "listresources")
        aTab2.ResourceStart = guiCreateButton(0.40000000000000002, 0.10000000000000001, 0.20000000000000001, 0.040000000000000001, "Запустить", true, aTab2.Tab, "start")
        aTab2.ResourceRestart = guiCreateButton(0.40000000000000002, 0.14999999999999999, 0.20000000000000001, 0.040000000000000001, "Рестарт", true, aTab2.Tab, "restart")
        aTab2.ResourceStop = guiCreateButton(0.40000000000000002, 0.20000000000000001, 0.20000000000000001, 0.040000000000000001, "Остановить", true, aTab2.Tab, "stop")
        aTab2.ResourceFailture = guiCreateButton(0.63, 0.10000000000000001, 0.25, 0.040000000000000001, "Причина неполадки", true, aTab2.Tab)
        guiSetVisible(aTab2.ResourceFailture, false)
        guiCreateLabel(0.40999999999999998, 0.29999999999999999, 0.5, 0.040000000000000001, "Выполнить команду:", true, aTab2.Tab)
        aTab2.Command = guiCreateEdit(0.40999999999999998, 0.34999999999999998, 0.40000000000000002, 0.055, "", true, aTab2.Tab)
        aTab2.ExecuteServer = guiCreateButton(0.81999999999999995, 0.34999999999999998, 0.16, 0.055, "Server", true, aTab2.Tab, "execute")
        aLogLines = 1
        aTab3 = {}
        aTab3.Tab = guiCreateTab("Сервер", aTabPanel, "server")
        aTab3.Server = guiCreateLabel(0.050000000000000003, 0.050000000000000003, 0.69999999999999996, 0.050000000000000003, "Сервер: Неизвестно", true, aTab3.Tab)
        aTab3.Players = guiCreateLabel(0.050000000000000003, 0.10000000000000001, 0.20000000000000001, 0.050000000000000003, "Игроки: 0/0", true, aTab3.Tab)
        aTab3.WeatherDec = guiCreateButton(0.050000000000000003, 0.20000000000000001, 0.035000000000000003, 0.040000000000000001, "<", true, aTab3.Tab)
        aTab3.Weather = guiCreateEdit(0.095000000000000001, 0.20000000000000001, 0.34999999999999998, 0.040000000000000001, getWeather() .. " (" .. getWeatherNameFromID(getWeather()) .. ")", true, aTab3.Tab)
        aTab3.WeatherInc = guiCreateButton(0.45000000000000001, 0.20000000000000001, 0.035000000000000003, 0.040000000000000001, ">", true, aTab3.Tab)
        guiEditSetReadOnly(aTab3.Weather, true)
        aTab3.WeatherSet = guiCreateButton(0.5, 0.20000000000000001, 0.14000000000000001, 0.040000000000000001, "Применить", true, aTab3.Tab, "setweather")
        aTab3.WeatherBlend = guiCreateButton(0.65000000000000002, 0.20000000000000001, 0.20000000000000001, 0.040000000000000001, "Плавный переход", true, aTab3.Tab, "blendweather")
        aTab3.TimeCurrent = guiCreateLabel(0.050000000000000003, 0.25, 0.25, 0.040000000000000001, "Время: " .. value_4 .. ":" .. value_5, true, aTab3.Tab)
        aTab3.TimeH = guiCreateEdit(0.34999999999999998, 0.25, 0.055, 0.040000000000000001, "12", true, aTab3.Tab)
        aTab3.TimeM = guiCreateEdit(0.42499999999999999, 0.25, 0.055, 0.040000000000000001, "00", true, aTab3.Tab)
        guiCreateLabel(0.41499999999999998, 0.25, 0.050000000000000003, 0.040000000000000001, ":", true, aTab3.Tab)
        guiEditSetMaxLength(aTab3.TimeH, 2)
        guiEditSetMaxLength(aTab3.TimeM, 2)
        aTab3.TimeSet = guiCreateButton(0.5, 0.25, 0.14000000000000001, 0.040000000000000001, "Применить", true, aTab3.Tab, "settime")
        guiCreateLabel(0.67000000000000004, 0.25, 0.12, 0.040000000000000001, "( 0-23:0-59 )", true, aTab3.Tab)
        aTab4 = {}
        aTab4.Tab = guiCreateTab("Баны", aTabPanel, "bans")
        aTab4.BansList = guiCreateGridList(0.029999999999999999, 0.12, 0.80000000000000004, 0.80000000000000004, true, aTab4.Tab)
        aTab4.EditBox = guiCreateEdit(0.029999999999999999, 0.050000000000000003, 0.54000000000000004, 0.050000000000000003, "", true, aTab4.Tab)
        aTab4.ComboBox = guiCreateComboBox(0.57999999999999996, 0.050000000000000003, 0.12, 0.050000000000000003, "Select", true, aTab4.Tab)
        aTab4.ExactMatch = guiCreateCheckBox(0.70999999999999996, 0, 0.20000000000000001, 0.050000000000000003, "Точный поиск", false, true, aTab4.Tab)
        aTab4.ProgressBar = guiCreateProgressBar(0.029999999999999999, 0.88, 0.80000000000000004, 0.050000000000000003, true, aTab4.Tab)
        guiSetVisible(aTab4.ProgressBar, false)
        for k, v in ipairs({
        "Serial",
        "IP",
        "Name",
        "By",
        "Reason",
    }) do
            guiComboBoxAddItem(aTab4.ComboBox, v)
            local screenX, screenY = guiGetScreenSize()
            local var_9 = {
                "Serial",
                "IP",
                "Name",
                "By",
                "Reason",
            }
        end
        guiComboBoxAdjustHeight(aTab4.ComboBox, #nil)
        guiComboBoxSetSelected(aTab4.ComboBox, 0)
        searchBans =         function()
            if guiGetText(aTab4.EditBox) == "" then
                triggerServerEvent("aSync", localPlayer, "bans")
                local var = guiGetText(aTab4.EditBox)
            end
            guiGridListClear(aTab4.BansList)
            triggerServerEvent("aSync", localPlayer, "bansearch", { guiComboBoxGetItemText(aTab4.ComboBox, guiComboBoxGetSelected(aTab4.ComboBox)) })
            guiSetEnabled(aTab4.Button, false)
            local function sub_1002()
                guiSetEnabled(aTab4.Button, true)
            end
            setTimer(sub_1002, 2000, 1)
        end
        addEventHandler("onClientGUIClick", aTab4.Button, searchBans, false)
        guiGridListAddColumn(aTab4.BansList, "ID", 0.22)
        guiGridListAddColumn(aTab4.BansList, "Имя", 0.22)
        guiGridListAddColumn(aTab4.BansList, "IP", 0.22)
        guiGridListAddColumn(aTab4.BansList, "Серийник", 0.22)
        guiGridListAddColumn(aTab4.BansList, "Выдал", 0.22)
        guiGridListAddColumn(aTab4.BansList, "Дата", 0.17000000000000001)
        guiGridListAddColumn(aTab4.BansList, "Время", 0.13)
        guiGridListAddColumn(aTab4.BansList, "Unban Date", 0.25)
        guiGridListAddColumn(aTab4.BansList, "Причина", 0.80000000000000004)
        guiGridListSetSortingEnabled(aTab4.BansList, false)
        aTab4.Details = guiCreateButton(0.84999999999999998, 0.10000000000000001, 0.13, 0.040000000000000001, "Подробно", true, aTab4.Tab)
        aTab4.Unban = guiCreateButton(0.84999999999999998, 0.20000000000000001, 0.13, 0.040000000000000001, "Разбан", true, aTab4.Tab, "unban")
        aTab4.UnbanIP = guiCreateButton(0.84999999999999998, 0.25, 0.13, 0.040000000000000001, "Разбан IP", true, aTab4.Tab, "unbanip")
        aTab4.UnbanSerial = guiCreateButton(0.84999999999999998, 0.29999999999999999, 0.13, 0.040000000000000001, "Разбан Serial", true, aTab4.Tab, "unbanserial")
        aTab4.UnbanLogin = guiCreateButton(0.84999999999999998, 0.34999999999999998, 0.13, 0.040000000000000001, "Разбан Login", false, aTab4.Tab, "unbanlogin")
        aTab4.BanIP = guiCreateButton(0.84999999999999998, 0.45000000000000001, 0.13, 0.040000000000000001, "Бан IP", true, aTab4.Tab, "banip")
        aTab4.BanSerial = guiCreateButton(0.84999999999999998, 0.5, 0.13, 0.040000000000000001, "Бан Serial", true, aTab4.Tab, "banserial")
        aTab4.BanLogin = guiCreateButton(0.84999999999999998, 0.55000000000000004, 0.13, 0.040000000000000001, "Бан Login", true, aTab4.Tab, "banlogin")
        aTab4.BansRefresh = guiCreateButton(0.84999999999999998, 0.84999999999999998, 0.13, 0.040000000000000001, "Обновить", true, aTab4.Tab, "listbans")
        aTab4.BansTotal = guiCreateLabel(0.20000000000000001, 0.93999999999999995, 0.31, 0.040000000000000001, "Отображено  0 / 0  банов", true, aTab4.Tab)
        addEventHandler("aClientSync", _root, aClientSync)
        addEventHandler("aClientResourceStart", _root, aClientResourceStart)
        addEventHandler("aClientResourceStop", _root, aClientResourceStop)
        addEventHandler("aClientPlayerJoin", _root, aClientPlayerJoin)
        addEventHandler("onClientPlayerQuit", _root, aClientPlayerQuit)
        addEventHandler("onLoginAdminn", _root, onLogin)
        addEventHandler("onLogoutAdminn", _root, onLogout)
        addEventHandler("onClientGUIClick", aAdminForm, aClientClick)
        addEventHandler("onClientGUIDoubleClick", aAdminForm, aClientDoubleClick)
        addEventHandler("onClientGUIDoubleClick", aTab1.VehicleOptions, aClientDoubleClick)
        addEventHandler("onClientGUIChanged", aAdminForm, aClientGUIChanged)
        addEventHandler("onClientRender", _root, aClientRender)
        addEventHandler("province:onClientPlayerNicknameChanged", _root, aClientPlayerChangeNick)
        addEventHandler("onClientResourceStop", _root, aMainSaveSettings)
        addEventHandler("onClientGUITabSwitched", aTabPanel, aClientGUITabSwitched)
        bindKey("arrow_d", "down", aPlayerListScroll, 1)
        bindKey("arrow_u", "down", aPlayerListScroll, -1)
        triggerServerEvent("aSync", localPlayer, "players")
        if hasPermissionTo("command.listmessages") then
            triggerServerEvent("aSync", localPlayer, "messages")
            local screenX, screenY = guiGetScreenSize()
            local var_10 = "listbans"
        end
        triggerServerEvent("aSync", localPlayer, "server")
        triggerEvent("onAdminInitialize", resourceRoot)
        showCursor(true)
        guiSetText(aAdminForm, "Warning - Admin Panel not compatible with server version")
        guiLabelSetHorizontalAlign(guiCreateLabel(0.29999999999999999, 0.11, 0.40000000000000002, 0.040000000000000001, "Upgrade server or downgrade Admin Panel", true, aAdminForm), "center")
        local var_9 = guiCreateLabel(0.29999999999999999, 0.11, 0.40000000000000002, 0.040000000000000001, "Upgrade server or downgrade Admin Panel", true, aAdminForm)
        local var_10 = "center"
        local var_14 = "Upgrade server or downgrade Admin Panel"
        local var_16 = "listbans"
    end

    if aAuthorLabel then
        guiSetText(aAuthorLabel, var_1())
    end
    if not guiGetEnabled(guiGetSelectedTab(aTabPanel)) then
        guiSetSelectedTab(aTabPanel, aTab1.Tab)
    end
    guiSetVisible(aAdminForm, true)
    showCursor(true)
    if getCameraTarget() then
        if getElementType(getCameraTarget()) == "vehicle" then
            local var = getVehicleController(getCameraTarget())
        end
        local var = getCameraTarget()
    end
    guiSetInputMode("no_binds_when_editing")
end

aAdminMenuClose = function(arg1)
    if arg1 then
        aMainSaveSettings()
        aPlayers = {}
        aWeathers = {}
        aBans = {}
        addEventHandler("aClientSync", _root, aClientSync)
        addEventHandler("aClientResourceStart", _root, aClientResourceStart)
        addEventHandler("aClientResourceStop", _root, aClientResourceStop)
        addEventHandler("aClientPlayerJoin", _root, aClientPlayerJoin)
        addEventHandler("onClientPlayerQuit", _root, aClientPlayerQuit)
        addEventHandler("onLoginAdminn", _root, onLogin)
        addEventHandler("onLogoutAdminn", _root, onLogout)
        addEventHandler("onClientGUIClick", aAdminForm, aClientClick)
        addEventHandler("onClientGUIScroll", aAdminForm, aClientScroll)
        addEventHandler("onClientGUIDoubleClick", aAdminForm, aClientDoubleClick)
        addEventHandler("onClientGUIDoubleClick", aTab1.VehicleOptions, aClientDoubleClick)
        addEventHandler("onClientGUIAccepted", aAdminForm, aClientGUIAccepted)
        addEventHandler("onClientGUIChanged", aAdminForm, aClientGUIChanged)
        addEventHandler("onClientRender", _root, aClientRender)
        addEventHandler("province:onClientPlayerNicknameChanged", _root, aClientPlayerChangeNick)
        addEventHandler("onClientResourceStop", _root, aMainSaveSettings)
        addEventHandler("arrow_d", "down", aPlayerListScroll)
        addEventHandler("arrow_u", "down", aPlayerListScroll)
        destroyElement(aTab1.VehicleOptions)
        destroyElement(aAdminForm)
        aAdminForm = nil
    end
    guiSetVisible(aTab1.VehicleOptions, false)
    guiSetVisible(aAdminForm, false)
    showCursor(false)
    guiSetInputMode("allow_binds")
end

aMainSaveSettings = function()
    aSetSetting("currentWeapon", aCurrentWeapon)
    aSetSetting("currentAmmo", aCurrentAmmo)
    aSetSetting("currentVehicle", aCurrentVehicle)
    aSetSetting("currentSlap", aCurrentSlap)
    aSetSetting("performance", "Auto")
end

aAdminRefresh = function()
    if guiGridListGetSelectedItem(aTab1.PlayerList) ~= -1 then
        if guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1) then
            if aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)] then
                if getElementData(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1), "id") then
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                    local var_1 = "Имя: " .. aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)].name .. " (" .. getElementData(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1), "id") .. ")"
                end
                guiSetText(aTab1.Name, "Имя: " .. aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)].name)
                guiSetText(aTab1.Freeze, iif(aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)].freeze, "Разморозить", "Заморозить"))
                guiSetText(aTab1.Accountname, "Аккаунт: " .. (aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)].accountname or ""))
                guiSetText(aTab1.Groups, "Группы: " .. (aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)].groups or "нет"))
                if isPedDead(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) then
                    guiSetText(aTab1.Health, "Здоровье: труп")
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                end
                guiSetText(aTab1.Health, "Здоровье: " .. math.ceil(getElementHealth(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))) .. "%")
                guiSetText(aTab1.Armour, "Броня: " .. math.ceil(getPedArmor(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))) .. "%")
                guiSetText(aTab1.Skin, "Скин: " .. iif(getElementModel(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)), getElementModel(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)), "N/A"))
                if getPlayerTeam(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) then
                    guiSetText(aTab1.Team, "Команда: " .. getTeamName(getPlayerTeam(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))))
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                    local var_1 = "N/A"
                end
                guiSetText(aTab1.Team, "Команда: нет")
                guiSetText(aTab1.Ping, "Пинг: " .. getPlayerPing(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)))
                guiSetText(aTab1.Money, "Деньги: " .. (aPlayers[guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)].money or "N/A"))
                if getElementDimension(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) then
                    guiSetText(aTab1.Dimension, "Измерение: " .. getElementDimension(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)))
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                    local var_1 = "N/A"
                end
                if getElementInterior(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) then
                    guiSetText(aTab1.Interior, "Интерьер: " .. getElementInterior(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)))
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                    local var_1 = "N/A"
                end
                guiSetText(aTab1.JetPack, iif(doesPedHaveJetPack(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)), "Забрать Джетпак", "Дать Джетпак"))
                if getPedWeapon(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) then
                    guiSetText(aTab1.Weapon, "Оружие: " .. getWeaponNameFromID(getPedWeapon(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))) .. " (ID: " .. getPedWeapon(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) .. ")")
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                end
                guiSetText(aTab1.PositionX, "X: " .. value_1)
                guiSetText(aTab1.PositionY, "Y: " .. value_2)
                guiSetText(aTab1.PositionZ, "Z: " .. value_3)
                if getPedOccupiedVehicle(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)) then
                    guiSetText(aTab1.Vehicle, "Транспорт: " .. getVehicleName(getPedOccupiedVehicle(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))) .. " (ID: " .. getElementModel(getPedOccupiedVehicle(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1))) .. ")")
                    guiSetText(aTab1.VehicleHealth, "Состояние Т/С: " .. math.ceil(getElementHealth(getPedOccupiedVehicle(guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)))) .. "%")
                    local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
                end
                guiSetText(aTab1.Vehicle, "Транспорт: Ноги")
                guiSetText(aTab1.VehicleHealth, "Состояние Т/С: 0%")
                return guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
            end
        end
    end
end

aClientSync = function(arg1, arg2, arg3)
    if arg1 == "player" then
        if aPlayers[source] then
            for k, v in pairs(arg2) do
                aPlayers[source][k] = v
                local var = aPlayers[source]
            end
        end
    end
    if arg1 == "resources" then
        if string.lower(guiGetText(aTab2.ResourceListSearch)) == "" then
            for k, v in ipairs(arg2) do
                if v.type ~= "map" then
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 1, v.name, false, false)
                    if v.numsettings then
                        if 0 < v.numsettings then
                            local var = string.lower(guiGetText(aTab2.ResourceListSearch))
                            local var_1 = guiGridListAddRow(aTab2.ResourceList)
                            local lockClient = guiGridListAddRow(aTab2.ResourceList)
                        end
                        local var = string.lower(guiGetText(aTab2.ResourceListSearch))
                        local var_1 = guiGridListAddRow(aTab2.ResourceList)
                        local lockClient = guiGridListAddRow(aTab2.ResourceList)
                    end
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 2, "", false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 3, v.state, false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 7, v.fullName, false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 8, v.author, false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 9, v.version, false, false)
                    local var = string.lower(guiGetText(aTab2.ResourceListSearch))
                end
                local var = string.lower(guiGetText(aTab2.ResourceListSearch))
            end
            local var = string.lower(guiGetText(aTab2.ResourceListSearch))
        end
        for k, v in ipairs(aResources) do
            if v.type ~= "map" then
                if string.find(string.lower(v.name), string.lower(guiGetText(aTab2.ResourceListSearch)), 1, true) then
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 1, v.name, false, false)
                    if v.numsettings then
                        if 0 < v.numsettings then
                            local var = guiGridListAddRow(aTab2.ResourceList)
                            local onLogout = guiGridListAddRow(aTab2.ResourceList)
                        end
                        local var = guiGridListAddRow(aTab2.ResourceList)
                        local onLogout = guiGridListAddRow(aTab2.ResourceList)
                    end
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 2, "", false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 3, v.state, false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 7, v.fullName, false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 8, v.author, false, false)
                    guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 9, v.version, false, false)
                end
            end
        end
    end
    if arg1 == "loggedout" then
        aAdminDestroy()
    end
    if arg1 == "server" then
        guiSetText(aTab3.Server, "Сервер: " .. arg2.name)
        guiSetText(aTab3.Players, "Игроки: " .. #getElementsByType("player") .. "/" .. arg2.players)
    end
    if arg1 == "bansdirty" then
        g_GotLatestBansList = false
        triggerServerEvent("aSync", localPlayer, "bans")
    end
    if arg1 == "bans" then
        g_GotLatestBansList = true
        guiGridListClear(aTab4.BansList)
        aBans = {}
    end
    guiSetText(aTab4.BansTotal, "Отображено  " .. guiGridListGetRowCount(aTab4.BansList) + #arg2 .. " / " .. tonumber(arg2.total) .. "  банов")
    if arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].seconds then
        local var_1 = arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2]
        local text = string.format("%02d:%02d", getRealTime(arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].seconds).hour, getRealTime(arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].seconds).minute)
    end
    aBans[arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].banID] = arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2]
    if arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].reason then
        if arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].reason ~= "nil" then
            local var_1 = arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2]
            local onLogout = "-"
            local lockClient = "-"
        end
        local var_1 = arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2]
        local onLogout = "-"
        local lockClient = "-"
    end
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 1, (arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].banID or "n/a"), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 2, (arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].nick or "n/a"), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 3, (arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].ip or "n/a"), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 4, (arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].serial or "n/a"), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 5, (arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].banner or "n/a"), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 6, "-", false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 7, "-", false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 9, "", false, false)
    if arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].unban then
        if tonumber(arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].unban) ~= 0 then
            if tonumber(arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].unban) < 0 then
                local var_1 = arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2]
                local onLogout = guiGridListAddRow(aTab4.BansList)
            end
            local var_1 = guiGridListAddRow(aTab4.BansList)
            local onLogout = FormatDate("d/m/y h:i:s", "'", tostring(arg2[guiGridListGetRowCount(aTab4.BansList) + #arg2].unban))
        end
        local var_1 = guiGridListAddRow(aTab4.BansList)
        local onLogout = "Permanent"
    end
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 8, "Permanent", false, false)
    if arg1 == "bansearch" then
        g_GotLatestBansList = true
        guiGridListClear(aTab4.BansList)
        aBans = {}
        if g_GotLatestBansList then
            if arg2[#arg2].banID then
            end
            if getNeededTagType(arg3[1], arg2[#arg2]) then
                if string.find(string.lower(getNeededTagType(arg3[1], arg2[#arg2])), string.lower(arg3[2]), 1, true) then
                    if arg2[#arg2].seconds then
                        local text = string.format("%02d:%02d", getRealTime(arg2[#arg2].seconds).hour, getRealTime(arg2[#arg2].seconds).minute)
                        local text_1 = string.format("%04d-%02d-%02d", getRealTime(arg2[#arg2].seconds).year + 1900, getRealTime(arg2[#arg2].seconds).month + 1, getRealTime(arg2[#arg2].seconds).monthday)
                    end
                    if arg2[#arg2].reason then
                        if arg2[#arg2].reason ~= "nil" then
                            local var_1 = "-"
                            local onLogout = "-"
                        end
                        local var_1 = "-"
                        local onLogout = "-"
                    end
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 1, (arg2[#arg2].banID or false), false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 2, (arg2[#arg2].nick or false), false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 3, (arg2[#arg2].ip or false), false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 4, (arg2[#arg2].serial or false), false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 5, (arg2[#arg2].banner or false), false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 6, "-", false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 7, "-", false, false)
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 9, "", false, false)
                    if arg2[#arg2].unban then
                        if tonumber(arg2[#arg2].unban) ~= 0 then
                            if tonumber(arg2[#arg2].unban) < 0 then
                                local var_1 = guiGridListAddRow(aTab4.BansList)
                            end
                            local var = guiGridListAddRow(aTab4.BansList)
                            local var_1 = FormatDate("d/m/y h:i:s", "'", tostring(arg2[#arg2].unban))
                        end
                        local var = guiGridListAddRow(aTab4.BansList)
                        local var_1 = "Permanent"
                    end
                    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 8, "Permanent", false, false)
                    local var = guiGridListAddRow(aTab4.BansList)
                    local onLogout = "Permanent"
                end
                local var_1 = guiGridListAddRow(aTab4.BansList)
                local lockClient = "Permanent"
            end
            local var_1 = guiGridListAddRow(aTab4.BansList)
            local lockClient = "Permanent"
        end
        if not tonumber(arg2.total) then
            local onLogout = guiGridListAddRow(aTab4.BansList)
            local tripClient = "Permanent"
        end
        guiSetSize(aTab4.BansList, value_1, 0.75, true)
        if guiGridListGetRowCount(aTab4.BansList) < tonumber(arg2.total) then
            guiProgressBarSetProgress(aTab4.ProgressBar, 50 + guiGridListGetRowCount(aTab4.BansList))
            guiSetVisible(aTab4.ProgressBar, true)
            local var = tonumber(arg2.total)
            local lockClient = guiGridListGetRowCount(aTab4.BansList)
            local var_5 = guiGridListAddRow(aTab4.BansList)
            local var_7 = "Permanent"
        end
        guiSetText(aTab4.BansTotal, "Found  " .. guiGridListGetRowCount(aTab4.BansList) .. " / " .. tonumber(arg2.total) .. "  bans")
        local lockClient = guiGridListAddRow(aTab4.BansList)
        local var_5 = "Permanent"
    end
    if arg1 == "banlistend" then
        guiSetVisible(aTab4.ProgressBar, false)
        guiSetSize(aTab4.BansList, value_1, 0.80000000000000004, true)
        local lockClient = guiGridListAddRow(aTab4.BansList)
        local var_5 = "Permanent"
    end
    if arg1 == "message" then
        aMessageBox(arg3[1], arg3[2])
        guiSetVisible(aTab4.ProgressBar, false)
        guiSetSize(aTab4.BansList, value_1, 0.80000000000000004, true)
        local lockClient = guiGridListAddRow(aTab4.BansList)
        local var_5 = "Permanent"
    end
    if arg2.banID then
        local var_1 = guiGridListAddRow(aTab4.BansList)
        local lockClient = "Permanent"
    end
    if arg2.seconds then
        local text = string.format("%02d:%02d", getRealTime(arg2.seconds).hour, getRealTime(arg2.seconds).minute)
        local text_1 = string.format("%04d-%02d-%02d", getRealTime(arg2.seconds).year + 1900, getRealTime(arg2.seconds).month + 1, getRealTime(arg2.seconds).monthday)
        local onLogout = guiGridListAddRow(aTab4.BansList)
        local tripClient = "Permanent"
    end
    if arg2.reason then
        if arg2.reason ~= "nil" then
            local var = "-"
            local var_1 = "-"
            local lockClient = guiGridListAddRow(aTab4.BansList)
            local var_5 = "Permanent"
        end
        local var = "-"
        local var_1 = "-"
        local lockClient = guiGridListAddRow(aTab4.BansList)
        local var_5 = "Permanent"
    end
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 1, (arg2.banID or false), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 2, (arg2.nick or false), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 3, (arg2.ip or false), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 4, (arg2.serial or false), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 5, (arg2.banner or false), false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 6, "-", false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 7, "-", false, false)
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 9, "", false, false)
    if arg2.unban then
        if tonumber(arg2.unban) ~= 0 then
            if tonumber(arg2.unban) < 0 then
                local var = guiGridListAddRow(aTab4.BansList)
                local onLogout = guiGridListAddRow(aTab4.BansList)
                local tripClient = "Permanent"
            end
            local var = guiGridListAddRow(aTab4.BansList)
            local var_1 = FormatDate("d/m/y h:i:s", "'", tostring(arg2.unban))
        end
        local var = guiGridListAddRow(aTab4.BansList)
        local var_1 = "Permanent"
    end
    guiGridListSetItemText(aTab4.BansList, guiGridListAddRow(aTab4.BansList), 8, "Permanent", false, false)
end

getNeededTagType = function(arg1, arg2)
    if type(arg1) == "string" then
    end
    return false
        end

    end
    if arg1 == "Serial" then
        if arg2.serial then
            return arg2.serial
        end
    end
    if arg1 == "Name" then
        if arg2.nick then
            return arg2.nick
        end
    end
    if arg1 == "By" then
        if arg2.banner then
            return arg2.banner
        end
    end
    if arg1 == "Reason" then
        if arg2.reason then
            return arg2.reason
        end
    end
    return false
end

aClientGUITabSwitched = function(arg1)
    if getElementParent(arg1) ~= aTabPanel then
        return
    end
    if arg1 == aTab2.Tab then
        triggerServerEvent("aSync", localPlayer, "resources")
    end
    if arg1 ~= aTab4.Tab then
        return
    end
    if g_GotLatestBansList then
        return
    end
    triggerServerEvent("aSync", localPlayer, "bans")
end

aClientResourceStart = function(arg1)
    if 0 <= guiGridListGetRowCount(aTab2.ResourceList) then
        if guiGridListGetItemText(aTab2.ResourceList, 0, 1) == arg1 then
            guiGridListSetItemText(aTab2.ResourceList, 0, 3, "running", false, false)
        end
    end
    for k, v in ipairs(getElementsByType("player")) do
        if aPlayers[v] then
            aPlayers[v].name = getPlayerNametagText(v)
        end
    end
end

aClientResourceStop = function(arg1)
    if 0 > guiGridListGetRowCount(aTab2.ResourceList) then
        return
    end
    if guiGridListGetItemText(aTab2.ResourceList, 0, 1) == arg1 then
        guiGridListSetItemText(aTab2.ResourceList, 0, 3, "loaded", false, false)
        local var = 0
    end
end

aClientPlayerJoin = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if arg1 == false then
        if arg4 == false then
            if not aPlayers[source] then
                return
            end
            aPlayers[source].country = arg6
        end
    end
    aPlayers[source] = {}
    aPlayers[source].name = "-"
    aPlayers[source].IP = arg1
    aPlayers[source].username = "N/A"
    aPlayers[source].accountname = "N/A"
    aPlayers[source].serial = arg4
    aPlayers[source].admin = arg5
    aPlayers[source].country = arg6
    aPlayers[source].acdetected = "..."
    aPlayers[source].d3d9dll = ""
    aPlayers[source].imgmodsnum = ""
    if aTab1.PlayerList then
        if aTab1.PlayerListSearch then
            local var = guiGetText(aTab1.PlayerListSearch)
        end
        if "" == "" then
            guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, source, false, false)
            local var = ""
        end
        if string.find(string.upper(aPlayers[source].name), string.upper(""), 1, true) then
            guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, source, false, false)
        end
    end
    if not aSpectator.PlayerList then
        return
    end
    guiGridListSetItemPlayer(aSpectator.PlayerList, nil, 1, source, false, false)
end

onLogout = function(arg1)
    if 0 <= guiGridListGetRowCount(aTab1.PlayerList) then
        if guiGridListGetItemPlayer(aTab1.PlayerList, 0, 1) == source then
            guiGridListRemoveRow(aTab1.PlayerList, 0)
        end
    end
    if guiGridListGetItemPlayer(aSpectator.PlayerList, 0, 1) == source then
        guiGridListRemoveRow(aSpectator.PlayerList, 0)
    end
end

addEvent("onLogout", true)

local function onLogout()
    if not aAdminForm then
        return
    end
    for k, v in pairs(_widgets) do
        v.close(false)
    end
    aAdminMenuClose(false)
end

addEventHandler("onLogout", localPlayer, onLogout)

aClientPlayerQuit = function()
    onLogout(getPlayerNametagText(source))
    aPlayers[source] = nil
end

onLogin = function(arg1, arg2)
    if 0 <= guiGridListGetRowCount(aTab1.PlayerList) then
        if guiGridListGetItemPlayer(aTab1.PlayerList, 0, 1) == source then
            guiGridListRemoveRow(aTab1.PlayerList, 0)
        end
    end
    if isElement(aSpectator.PlayerList) then
        if 0 <= guiGridListGetRowCount(aSpectator.PlayerList) then
            if guiGridListGetItemPlayer(aSpectator.PlayerList, 0, 1) == source then
                guiGridListRemoveRow(aSpectator.PlayerList, 0)
            end
        end
    end
    aPlayers[source].name = tostring(arg1)
    if aTab1.PlayerListSearch then
        local var = guiGetText(aTab1.PlayerListSearch)
    end
    if "" == "" then
        guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, source, false, false)
    end
    if string.find(string.upper(arg1), string.upper(""), 1, true) then
        guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, source, false, false)
    end
    guiGridListSetItemPlayer(aSpectator.PlayerList, nil, 1, source, false, false)
end

addEvent("onLoginAdminn", true)
addEvent("onLogoutAdminn", true)

aPlayerListScroll = function(arg1, arg2, arg3)
    if not guiGetVisible(aAdminForm) then
        return
    end
    if guiGridListGetRowCount(aTab1.PlayerList) <= 0 then
        return
    end
    if guiGridListGetSelectedItem(aTab1.PlayerList) == -1 then
        guiGridListSetSelectedItem(aTab1.PlayerList, 0, 1)
        local var = guiGridListGetRowCount(aTab1.PlayerList) - 1
        local var_1 = guiGridListGetSelectedItem(aTab1.PlayerList) + arg3
    end
    if guiGridListGetRowCount(aTab1.PlayerList) - 1 < guiGridListGetSelectedItem(aTab1.PlayerList) + arg3 then
        return
    end
    if guiGridListGetSelectedItem(aTab1.PlayerList) + arg3 < 0 then
        return
    end
    guiGridListSetSelectedItem(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList) + arg3, 1)
    source = aTab1.PlayerList
    aClientClick("left")
    source = source
end

aClientPlayerChangeNick = function(arg1, arg2)
    local var = { aTab1.PlayerList, aSpectator.PlayerList }
end

aClientPlayerChangeNickProvince = function(arg1, arg2, arg3)
    outputChatBox("dsks")
    aClientPlayerChangeNick(arg2, arg3)
end

aSetCurrentAmmo = function(arg1)
    if tonumber(arg1) then
        if 0 < tonumber(arg1) then
            if tonumber(arg1) < 10000 then
                aCurrentAmmo = tonumber(arg1)
            end
        end
    end
    outputChatBox("Invalid ammo value", 255, 0, 0)
end

aClientGUIChanged = function()
    if source == aTab1.PlayerListSearch then
        guiGridListClear(aTab1.PlayerList)
        if guiGetText(source) == "" then
            for k, v in ipairs(getElementsByType("player")) do
                guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, v, false, false)
                local var = guiGetText(source)
            end
            local var = guiGetText(source)
        end
        for k, v in ipairs(getElementsByType("player")) do
            if string.find(string.upper(getPlayerNametagText(v)), string.upper(guiGetText(source)), 1, true) then
                guiGridListSetItemPlayer(aTab1.PlayerList, nil, 1, v, false, false)
                local var = "player"
            end
            local var = "player"
            local var_1 = string.find(string.upper(getPlayerNametagText(v)), string.upper(guiGetText(source)), 1, true)
            local onLogout = string.upper(getPlayerNametagText(v))
            local lockClient = string.upper(guiGetText(source))
        end
        local var = "player"
    end
    guiGridListClear(aTab2.ResourceList)
    if string.lower(guiGetText(source)) == "" then
        for k, v in ipairs(aResources) do
            if v.type ~= "map" then
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 1, v.name, false, false)
                if v.numsettings then
                    if 0 < v.numsettings then
                        local var = string.lower(guiGetText(source))
                        local var_1 = guiGridListAddRow(aTab2.ResourceList)
                        local lockClient = guiGridListAddRow(aTab2.ResourceList)
                    end
                    local var = string.lower(guiGetText(source))
                    local var_1 = guiGridListAddRow(aTab2.ResourceList)
                    local lockClient = guiGridListAddRow(aTab2.ResourceList)
                end
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 2, "", false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 3, v.state, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 4, v.uploader, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 5, v.branch, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 6, v.commit, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 7, v.fullName, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 8, v.author, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 9, v.version, false, false)
                local var = string.lower(guiGetText(source))
            end
            local var = string.lower(guiGetText(source))
        end
        local var = string.lower(guiGetText(source))
    end
    for k, v in ipairs(aResources) do
        if v.type ~= "map" then
            if string.find(string.lower(v.name), string.lower(guiGetText(source)), 1, true) then
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 1, v.name, false, false)
                if v.numsettings then
                    if 0 < v.numsettings then
                        local var = guiGridListAddRow(aTab2.ResourceList)
                        local onLogout = guiGridListAddRow(aTab2.ResourceList)
                    end
                    local var = guiGridListAddRow(aTab2.ResourceList)
                    local onLogout = guiGridListAddRow(aTab2.ResourceList)
                end
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 2, "", false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 3, v.state, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 4, v.uploader, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 5, v.branch, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 6, v.commit, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 7, v.fullName, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 8, v.author, false, false)
                guiGridListSetItemText(aTab2.ResourceList, guiGridListAddRow(aTab2.ResourceList), 9, v.version, false, false)
            end
        end
    end
end

aClientDoubleClick = function(arg1)
    if source == aTab1.VehicleOptions then
        if guiGridListGetSelectedItem(aTab1.VehicleOptions) ~= -1 then
            if guiGridListGetItemText(aTab1.VehicleOptions, guiGridListGetSelectedItem(aTab1.VehicleOptions), 1) ~= "" then
                aCurrentVehicle = tonumber(guiGridListGetItemData(aTab1.VehicleOptions, guiGridListGetSelectedItem(aTab1.VehicleOptions), 1))
                guiSetText(aTab1.GiveVehicle, "Дать: " .. guiGridListGetItemText(aTab1.VehicleOptions, guiGridListGetSelectedItem(aTab1.VehicleOptions), 1) .. " ")
                local var = " "
                local var_1 = guiGridListGetSelectedItem(aTab1.VehicleOptions)
                local onLogout = 1
            end
        end
        guiSetVisible(aTab1.VehicleOptions, false)
    end
    if source == aTab1.SlapOptions then
        if guiGridListGetSelectedItem(aTab1.SlapOptions) ~= -1 then
            aCurrentSlap = guiGridListGetItemText(aTab1.SlapOptions, guiGridListGetSelectedItem(aTab1.SlapOptions), 1)
            guiSetText(aTab1.Slap, "Пнуть! " .. aCurrentSlap .. " _")
            if aSpecSlap then
                guiSetText(aSpecSlap, "Пнуть! " .. aCurrentSlap .. "hp")
                local var = "hp"
            end
            local var = " _"
        end
        guiSetVisible(aTab1.SlapOptions, false)
    end
    if source == aTab4.BansList then
        if guiGridListGetSelectedItem(aTab4.BansList) == -1 then
            aMessageBox("error", "No ban row selected!")
        end
        aBanDetails(tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1)))
    end
    if guiGetVisible(aTab1.VehicleOptions) then
        guiSetVisible(aTab1.VehicleOptions, false)
    end
    if not guiGetVisible(aTab1.SlapOptions) then
        return
    end
    guiSetVisible(aTab1.SlapOptions, false)
end

aClientClick = function(arg1, arg2)
    if source == aTab1.VehicleOptions then
        return
    end
    if source == aTab1.SlapOptions then
        return
    end
    if guiGetVisible(aTab1.VehicleOptions) then
        guiSetVisible(aTab1.VehicleOptions, false)
    end
    if guiGetVisible(aTab1.SlapOptions) then
        guiSetVisible(aTab1.SlapOptions, false)
    end
    if arg1 ~= "left" then
        return
    end
    if getElementParent(source) == aTab1.Tab then
        if source == aTab1.ScreenShots then
            aPlayerScreenShot()
        end
        if getElementType(source) == "gui-button" then
            if source == aTab1.GiveVehicle then
                guiBringToFront(aTab1.VehicleDropDown)
            end
            if source == aTab1.Slap then
                guiBringToFront(aTab1.SlapDropDown)
            end
            if not isElement(arg2) then
                if guiGridListGetSelectedItem(aTab1.PlayerList) == -1 then
                    aMessageBox("error", "Игрок не выбран!")
                end
            end
            if not isElement(arg2) then
                local var = guiGridListGetItemPlayer(aTab1.PlayerList, guiGridListGetSelectedItem(aTab1.PlayerList), 1)
            end
            if source == aTab1.Slap then
                addEventHandler("aPlayer", localPlayer, arg2, "slap", aCurrentSlap)
                local var = getPlayerNametagText(arg2)
            end
            if source == aTab1.Freeze then
                addEventHandler("aPlayer", localPlayer, arg2, "freeze")
                local var = getPlayerNametagText(arg2)
            end
            if source == aTab1.Spectate then
                aSpectate(arg2)
                local var = getPlayerNametagText(arg2)
            end
            if source == aTab1.Nick then
                aInputBox("Сменить ник", "Введите новый ник игрока", getPlayerNametagText(arg2), "setNick", arg2)
            end
            if source == aTab1.Shout then
                aInputBox("Накричать", "Введите текст, который отобразится у игрока", "", "shout", arg2)
            end
            if source == aTab1.SetHealth then
                aInputBox("Здоровье", "Введите новое значение", "100", "setHealth", arg2)
            end
            if source == aTab1.SetArmour then
                aInputBox("Броня", "Введите новое значение", "100", "setArmor", arg2)
            end
            if source == aTab1.SetInterior then
                aPlayerInterior(arg2)
            end
            if source == aTab1.JetPack then
                addEventHandler("aPlayer", localPlayer, arg2, "jetpack")
            end
            if source == aTab1.SetDimension then
                aInputBox("Измерение", "Введите ID измерения от 0 по 65535", "0", "setDimension", arg2)
            end
            if source == aTab1.GiveVehicle then
                addEventHandler("aPlayer", localPlayer, arg2, "givevehicle", aCurrentVehicle)
            end
            if source == aTab1.Warp then
                addEventHandler("aPlayer", localPlayer, arg2, "warp")
            end
            if source == aTab1.WarpTo then
                aPlayerWarp(arg2)
            end
            if source == aTab1.VehicleFix then
                addEventHandler("aVehicle", localPlayer, arg2, "repairadm")
            end
            if source == aTab1.VehicleBlow then
                addEventHandler("aVehicle", localPlayer, arg2, "blowvehicle")
            end
            addEventHandler("aVehicle", localPlayer, arg2, "destroyvehicle")
        end
        if source == aTab1.VehicleDropDown then
            guiSetPosition(aTab1.VehicleOptions, value_1 + value_3 + value_5 + value_7, value_2 + value_4 + value_6 + value_8 + 20, false)
            guiSetVisible(aTab1.VehicleOptions, true)
            guiBringToFront(aTab1.VehicleOptions)
            local var = value_2 + value_4 + value_6 + value_8 + 20
        end
        if source == aTab1.SlapDropDown then
            guiSetVisible(aTab1.SlapOptions, true)
            guiBringToFront(aTab1.SlapOptions)
        end
        if guiGridListGetSelectedItem(aTab1.PlayerList) ~= -1 then
            addEventHandler("aSync", localPlayer, "player", aAdminRefresh())
            guiSetText(aTab1.IP, "IP: " .. aPlayers[aAdminRefresh()].IP)
            guiSetText(aTab1.Serial, "Serial: " .. aPlayers[aAdminRefresh()].serial)
            guiSetText(aTab1.Accountname, "Аккаунт: " .. aPlayers[aAdminRefresh()].accountname)
            if not aPlayers[aAdminRefresh()].country then
                guiSetText(aTab1.CountryCode, "")
                local var = aPlayers[aAdminRefresh()].country
            end
            guiSetPosition(aTab1.Flag, value_1 + guiLabelGetTextExtent(aTab1.IP) + 7, value_2 + 4, false)
            guiSetPosition(aTab1.CountryCode, value_1 + guiLabelGetTextExtent(aTab1.IP) + 30, value_2, false)
            guiSetText(aTab1.CountryCode, tostring(aPlayers[aAdminRefresh()].country))
            local var = tostring(aPlayers[aAdminRefresh()].country)
            local lockClient = aPlayers[aAdminRefresh()].country
        end
        guiSetText(aTab1.Name, "Имя: N/A")
        guiSetText(aTab1.IP, "IP: N/A")
        guiSetText(aTab1.Serial, "Serial: N/A")
        guiSetText(aTab1.Accountname, "Аккаунт: N/A")
        guiSetText(aTab1.Groups, "Группы: N/A")
        guiSetText(aTab1.Freeze, "Заморозить")
        guiSetText(aTab1.Health, "Здоровье: 0%")
        guiSetText(aTab1.Armour, "Броня: 0%")
        guiSetText(aTab1.Skin, "Скин: N/A")
        guiSetText(aTab1.Team, "Команда: нет")
        guiSetText(aTab1.Ping, "Пинг: 0")
        guiSetText(aTab1.Money, "Деньги: 0")
        guiSetText(aTab1.Dimension, "Измерение: 0")
        guiSetText(aTab1.Interior, "Интерьер: 0")
        guiSetText(aTab1.JetPack, "Дать Джетпак")
        guiSetText(aTab1.Weapon, "Оружие: N/A")
        guiSetText(aTab1.PositionX, "X: 0")
        guiSetText(aTab1.PositionY, "Y: 0")
        guiSetText(aTab1.PositionZ, "Z: 0")
        guiSetText(aTab1.Vehicle, "Транспорт: N/A")
        guiSetText(aTab1.VehicleHealth, "Состояние Т/С: 0%")
        guiStaticImageLoadImage(aTab1.Flag, "client\\images\\empty.png")
        guiSetText(aTab1.CountryCode, "")
    end
    if getElementParent(source) == aTab2.Tab then
        if source == aTab2.ResourceListSearch then
        end
        if source ~= aTab2.ResourceStart then
            if source ~= aTab2.ResourceRestart then
            end
        end
        if guiGridListGetSelectedItem(aTab2.ResourceList) == -1 then
            aMessageBox("error", "Ресурс не выбран!")
        end
        if source == aTab2.ResourceStart then
            addEventHandler("aResource", localPlayer, guiGridListGetItemText(aTab2.ResourceList, guiGridListGetSelectedItem(aTab2.ResourceList), 1), "start")
        end
        if source == aTab2.ResourceRestart then
            addEventHandler("aResource", localPlayer, guiGridListGetItemText(aTab2.ResourceList, guiGridListGetSelectedItem(aTab2.ResourceList), 1), "restart")
        end
        addEventHandler("aResource", localPlayer, guiGridListGetItemText(aTab2.ResourceList, guiGridListGetSelectedItem(aTab2.ResourceList), 1), "stop")
        if source == aTab2.ResourceList then
            guiSetVisible(aTab2.ResourceFailture, false)
            guiSetVisible(aTab2.ResourceFailture, true)
            local var = guiGridListGetSelectedItem(aTab2.ResourceList)
            local var_1 = 1
        end
        if source == aTab2.ManageACL then
            aManageACL()
            local var = guiGridListGetSelectedItem(aTab2.ResourceList)
            local var_1 = 1
        end
        if source == aTab2.ResourceRefresh then
            guiGridListClear(aTab2.ResourceList)
            addEventHandler("aSync", localPlayer, "resources")
            local var = guiGridListGetSelectedItem(aTab2.ResourceList)
            local var_1 = 1
        end
        addEventHandler("aExecute", localPlayer, guiGetText(aTab2.Command), true)
        local var = guiGridListGetSelectedItem(aTab2.ResourceList)
        local var_1 = 1
    end
    if getElementParent(source) == aTab3.Tab then
        if source ~= aTab3.WeatherInc then
        end
        if tonumber(gettok(guiGetText(aTab3.Weather), 1, 32)) then
            if source == aTab3.WeatherInc then
                if tonumber(gettok(guiGetText(aTab3.Weather), 1, 32)) < _weathers_max then
                    guiSetText(aTab3.Weather, tonumber(gettok(guiGetText(aTab3.Weather), 1, 32)) + 1 .. " (" .. getWeatherNameFromID(tonumber(gettok(guiGetText(aTab3.Weather), 1, 32)) + 1) .. ")")
                    local var = tonumber(gettok(guiGetText(aTab3.Weather), 1, 32))
                end
                local var = tonumber(gettok(guiGetText(aTab3.Weather), 1, 32))
            end
            guiSetText(aTab3.Weather, tonumber(gettok(guiGetText(aTab3.Weather), 1, 32)) - 1 .. " (" .. getWeatherNameFromID(tonumber(gettok(guiGetText(aTab3.Weather), 1, 32)) - 1) .. ")")
        end
        guiSetText(aTab3.Weather, 14 .. " (" .. getWeatherNameFromID(14) .. ")")
        if source == aTab3.WeatherSet then
            addEventHandler("aServer", localPlayer, "setweather", gettok(guiGetText(aTab3.Weather), 1, 32))
        end
        if source == aTab3.WeatherBlend then
            addEventHandler("aServer", localPlayer, "blendweather", gettok(guiGetText(aTab3.Weather), 1, 32))
            local var = 32
        end
        addEventHandler("aServer", localPlayer, "settime", guiGetText(aTab3.TimeH), guiGetText(aTab3.TimeM))
        local var = guiGetText(aTab3.TimeH)
        local var_1 = guiGetText(aTab3.TimeM)
    end
    if getElementParent(source) ~= aTab4.Tab then
        return
    end
    if source == aTab4.Details then
        if guiGridListGetSelectedItem(aTab4.BansList) == -1 then
            aMessageBox("error", "Бан не выбран!")
        end
        aBanDetails(tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1)))
    end
    if source == aTab4.Unban then
        if guiGridListGetSelectedItem(aTab4.BansList) == -1 then
            aMessageBox("error", "Бан не выбран!")
        end
        if not tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1)) then
            return
        end
        if not aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))] then
            return
        end
        if aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].serial then
            aMessageBox("question", "Unban Serial " .. aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].serial .. "?", "unbanSerial", aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].serial)
            local var = aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].nick
            local var_1 = aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].ip
        end
        if aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].nick then
            aMessageBox("question", "Unban Login " .. aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].nick .. "?", "unbanLogin", aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].nick)
            local var = aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].ip
        end
        aMessageBox("question", "Разбанить IP " .. aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].ip .. "?", "unbanIP", aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].ip)
        local var = "Разбанить IP " .. aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].ip .. "?"
        local var_1 = "unbanIP"
        local onLogout = aBans[tonumber(guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 1))].ip
    end
    if source == aTab4.UnbanLogin then
        if guiGridListGetSelectedItem(aTab4.BansList) == -1 then
            aMessageBox("error", "Бан не выбран!")
        end
        aMessageBox("question", "Разбанить аккаунт " .. guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 3) .. "?", "unbanLogin", guiGridListGetItemText(aTab4.BansList, guiGridListGetSelectedItem(aTab4.BansList), 3))
    end
    if source == aTab4.UnbanIP then
        aInputBox("Разбан IP", "Введите IP, который хотите разбанить", "", "unbanIP")
    end
    if source == aTab4.UnbanSerial then
        aInputBox("Разбан Serial", "Введите Serial , который хотите разбанить", "", "unbanSerial")
    end
    if source == aTab4.BanIP then
        aInputBox("Бан IP", "Введите IP, который хотите забанить", "", "banIP")
    end
    if source == aTab4.BanSerial then
        aInputBox("Бан Serial", "Введите серийник, который хотите забанить", "", "banSerial")
    end
    if source == aTab4.BanLogin then
        aInputBox("Бан Login", "Введите логин, который хотите забанить", "", "banLogin")
    end
    if source == aTab4.BansRefresh then
        guiGridListClear(aTab4.BansList)
        addEventHandler("aSync", localPlayer, "bans")
    end
    if source ~= aTab4.BansMore then
        return
    end
    addEventHandler("aSync", localPlayer, "bansmore", guiGridListGetRowCount(aTab4.BansList))
end

aClientRender = function()
    if not guiGetVisible(aAdminForm) then
        return
    end
    if aLastCheck > getTickCount() then
        return
    end
    aAdminRefresh()
    guiSetText(aTab3.Players, "Игроки: " .. #getElementsByType("player") .. "/" .. gettok(guiGetText(aTab3.Players), 2, 47))
    guiSetText(aTab3.TimeCurrent, string.format("Время: %02d:%02d", value_1, value_2))
    guiSetText(aTab3.WeatherCurrent, "Погода: " .. getWeather() .. " (" .. getWeatherNameFromID(getWeather()) .. ")")
    aLastCheck = getTickCount() + 50
end

updateColorCodes = function()
    for k, v in ipairs({ aTab1.PlayerList, aSpectator.PlayerList }) do
        guiGridListSetItemPlayer(v)
    end
    local var = { aTab1.PlayerList, aSpectator.PlayerList }
    guiGridListSetItemPlayer()
end

guiGridListSetItemPlayerName = function(arg1, arg2, arg3, arg4)
    if arg2 then
        guiGridListSetItemText(arg1, arg2, arg3, removeColorCoding(arg4), false, false)
        local var = removeColorCoding(arg4)
    end
    guiGridListSetItemData(arg1, guiGridListAddRow(arg1, removeColorCoding(arg4)), arg3, arg4)
end

guiGridListGetItemPlayerName = function(arg1, arg2, arg3)
    if guiGridListGetItemData(arg1, arg2, arg3) then
        return guiGridListGetItemData(arg1, arg2, arg3)
    end
    return guiGridListGetItemText(arg1, arg2, arg3)
end

guiGridListSetItemPlayer = function(arg1, arg2, arg3, arg4)
    if arg2 then
        guiGridListSetItemText(arg1, arg2, arg3, removeColorCoding(getPlayerNametagText(arg4)), false, false)
        local var = getPlayerNametagText(arg4)
        local var_1 = removeColorCoding(getPlayerNametagText(arg4))
    end
    guiGridListSetItemData(arg1, guiGridListAddRow(arg1, removeColorCoding(getPlayerNametagText(arg4))), arg3, arg4)
    return guiGridListAddRow(arg1, removeColorCoding(getPlayerNametagText(arg4)))
end

guiGridListGetItemPlayer = function(arg1, arg2, arg3)
    return guiGridListGetItemData(arg1, arg2, arg3)
end

removeColorCoding = function(arg1)
    if type(arg1) == "string" then
    end
    return arg1
end

Check = function(arg1)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "type", "string", "error", "Argument type mismatch at 'Check' ('funcname'). Expected 'string', got '", "Argument number mismatch at 'Check'. Expected #arg % 3 to be 0, but it is ", "table"
    if type(arg1) ~= "string" then
        error("Argument type mismatch at 'Check' ('funcname'). Expected 'string', got '" .. type(arg1) .. "'.", 2)
    end
    if 0 < #nil % 3 then
        local onLogout = "."
    end
    if type(nil[r6 + 2]) ~= "string" then
        local var_1 = "'."
    end
    if type(nil[r6]) == "table" then
        if type(nil[r6 + 1]) == r12 then
        end
    end
end

local lockClient = {
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
}

FormatDate = function(arg1, arg2, arg3)
    Check("FormatDate", "string", arg1, "format", { "nil", "string" }, arg2, "escaper", { "nil", "string" }, arg3, "timestamp")
    getRealTime(arg3).year = getRealTime(arg3).year + 1900
    getRealTime(arg3).month = getRealTime(arg3).month + 1
    for k in arg1:gmatch(".") do
        local onLogout = "" .. k
    end
    return ""
end

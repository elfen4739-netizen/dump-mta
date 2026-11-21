-- ByteRevenant
-- LuaQ 5.1 structured decompile

aSpectator = {
    Offset = 5,
    AngleX = 0,
    AngleZ = 30,
    Spectating = nil,
    dim = -1,
    int = -1,
    sendServer = false,
}

aSpectate = function(arg1)
    if not aAdminForm then
        aAdminMenu()
        guiSetVisible(aAdminForm, false)
    end
    aSpectator.Spectating = arg1
    aSpectator.sendServer = false
    setElementFrozen(getLocalPlayer(), true)
    if aSpectator.Info then
    end
    aSpectator.Initialize()
    aSpectator.playerId = getElementData(arg1, "id")
    if getElementInterior(arg1) ~= getElementInterior(localPlayer) then
        setElementInterior(localPlayer, getElementInterior(arg1))
        local var = getElementDimension(arg1)
        local var_1 = getElementDimension(localPlayer)
    end
    if getElementDimension(arg1) ~= getElementDimension(localPlayer) then
        triggerServerEvent("aSpectateDimention", localPlayer, getElementDimension(arg1))
    end
    triggerServerEvent("aSpecate:GetPlayerData", resourceRoot, aSpectator.Spectating)
end

addEvent("aClientSpectate", true)
addEventHandler("aClientSpectate", root, aSpectate)

local function var(arg1, arg2, arg3, arg4, arg5, arg6)
    guiSetFont(guiCreateLabel(arg1, arg2, arg3, arg4, arg5, true, arg6), "default-bold-small")
    return guiCreateLabel(arg1, arg2, arg3, arg4, arg5, true, arg6)
end

local state = nil

aSpectator.Initialize = function()
    if aSpectator.Info == nil then
        aSpectator.Info = guiCreateWindow(0.87, 0.20999999999999999, 0.12, 0.40000000000000002, "Информация об игроке", true)
        guiWindowSetSizable(aSpectator.Info, true)
        aSpectator.nickNameLabel = var(0.070000000000000007, 0.080000000000000002 * 0.87499999999999989, 0.73999999999999999, 0.050000000000000003 * 0.87499999999999989, "Никнейм (id)", aSpectator.Info)
        aSpectator.gender = var(0.070000000000000007, 0.13 * 0.87499999999999989, 0.73999999999999999, 0.050000000000000003 * 0.87499999999999989, "Пол:", aSpectator.Info)
        aSpectator.accountName = var(0.070000000000000007, 0.17999999999999999 * 0.87499999999999989, 0.73999999999999999, 0.050000000000000003 * 0.87499999999999989, "Логин:", aSpectator.Info)
        aSpectator.serial = var(0.070000000000000007, 0.23000000000000001 * 0.87499999999999989, 0.73999999999999999, 0.050000000000000003 * 0.87499999999999989, "Логин:", aSpectator.Info)
        aSpectator.ip = var(0.070000000000000007, 0.28000000000000003 * 0.87499999999999989, 0.73999999999999999, 0.050000000000000003 * 0.87499999999999989, "Логин:", aSpectator.Info)
        aSpectator.levelLabel = var(0.070000000000000007, 0.34999999999999998 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Уровень:", aSpectator.Info)
        aSpectator.moneyLabel = var(0.070000000000000007, 0.40000000000000002 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Деньги:", aSpectator.Info)
        aSpectator.statsLabel = var(0.070000000000000007, 0.45000000000000001 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "HP", aSpectator.Info)
        aSpectator.pingLabel = var(0.070000000000000007, 0.5 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Пинг:", aSpectator.Info)
        aSpectator.workLabel = var(0.070000000000000007, 0.55000000000000004 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Работа:", aSpectator.Info)
        aSpectator.cityLabel = var(0.070000000000000007, 0.59999999999999998 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Город:", aSpectator.Info)
        aSpectator.fractionsLabel = var(0.070000000000000007, 0.65000000000000002 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Фракция:", aSpectator.Info)
        aSpectator.fractionRangLabel = var(0.070000000000000007, 0.69999999999999996 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Ранг:", aSpectator.Info)
        aSpectator.orgLabel = var(0.070000000000000007, 0.78000000000000003 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Организация:", aSpectator.Info)
        aSpectator.orgRangLabel = var(0.070000000000000007, 0.82999999999999996 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Должность:", aSpectator.Info)
        aSpectator.carLabel = var(0.070000000000000007, 0.91000000000000003 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Транспорт:", aSpectator.Info)
        aSpectator.carHpLabel = var(0.070000000000000007, 0.95999999999999996 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Здоровье транспорта:", aSpectator.Info)
        aSpectator.speedLabel = var(0.070000000000000007, 1.01 * 0.87499999999999989, 0.87, 0.050000000000000003 * 0.87499999999999989, "Скорость:", aSpectator.Info)
        aSpectator.exitButton = guiCreateButton(0.26000000000000001, 1.05 * 0.87499999999999989, 0.48999999999999999, 0.080000000000000002 * 0.87499999999999989, "Выйти из спека", true, aSpectator.Info)
        guiSetProperty(aSpectator.exitButton, "NormalTextColour", "FFFD0000")
        aSpectator.copyName = guiCreateButton(0.81000000000000005, 0.080000000000000002 * 0.87499999999999989, 0.13, 0.050000000000000003 * 0.87499999999999989, "Copy", true, aSpectator.Info)
        aSpectator.copyAccount = guiCreateButton(0.81000000000000005, 0.17999999999999999 * 0.87499999999999989, 0.13, 0.050000000000000003 * 0.87499999999999989, "Copy", true, aSpectator.Info)
        aSpectator.copySerial = guiCreateButton(0.81000000000000005, 0.23000000000000001 * 0.87499999999999989, 0.13, 0.050000000000000003 * 0.87499999999999989, "Copy", true, aSpectator.Info)
        aSpectator.copyIP = guiCreateButton(0.81000000000000005, 0.28000000000000003 * 0.87499999999999989, 0.13, 0.050000000000000003 * 0.87499999999999989, "Copy", true, aSpectator.Info)
        aSpectator.Players = guiCreateWindow(30, screenY / 2 - 200, 160, 400, "Игроки", false)
        guiWindowSetSizable(aSpectator.Players, false)
        aSpectator.PlayerList = guiCreateGridList(0.029999999999999999, 0.070000000000000007, 0.93999999999999995, 0.92000000000000004, true, aSpectator.Players)
        guiGridListAddColumn(aSpectator.PlayerList, "Имя", 0.84999999999999998)
        for k, v in ipairs(getElementsByType("player")) do
            if v == aSpectator.Spectating then
                guiGridListSetSelectedItem(aSpectator.PlayerList, guiGridListSetItemPlayer(aSpectator.PlayerList, nil, 1, v, false, false), 1)
                local screenX, screenY = guiGetScreenSize()
            end
            local screenX, screenY = guiGetScreenSize()
        end
        aSpectator.Prev = guiCreateButton(screenX / 2 - 100, screenY - 50, 70, 30, "< Пред.", false)
        aSpectator.Next = guiCreateButton(screenX / 2 + 30, screenY - 50, 70, 30, "След. >", false)
        addEventHandler("onClientGUIClick", _root, aSpectator.ClientClick)
        aRegister("Spectator", aSpectator.Info, aSpectator.ShowGUI, aSpectator.Close)
    end
    bindKey("arrow_l", "down", aSpectator.SwitchPlayer, -1)
    bindKey("arrow_r", "down", aSpectator.SwitchPlayer, 1)
    bindKey("mouse_wheel_up", "down", aSpectator.MoveOffset, -1)
    bindKey("mouse_wheel_down", "down", aSpectator.MoveOffset, 1)
    bindKey("mouse2", "both", aSpectator.Cursor)
    toggleControl("fire", false)
    toggleControl("aim_weapon", false)
    addEventHandler("onClientPlayerWasted", _root, aSpectator.PlayerCheck)
    addEventHandler("onClientPlayerQuit", _root, aSpectator.PlayerCheck)
    addEventHandler("onClientCursorMove", _root, aSpectator.CursorMove)
    addEventHandler("onClientPreRender", _root, aSpectator.Render)
    addEventHandler("onClientElementInteriorChange", _root, aSpectator.IntChange)
    addEventHandler("onClientElementDimensionChange", _root, aSpectator.DimChange)
    if not state then
        if not isTimer(state) then
            state = setTimer(aSpectator.UpdateInfo, 500, 0)
        end
    end
    guiSetVisible(aSpectator.Info, true)
    guiSetVisible(aSpectator.Players, false)
    guiSetVisible(aSpectator.Next, true)
    guiSetVisible(aSpectator.Prev, true)
    aAdminMenuClose(false)
    aSpectator.dim = getElementDimension(localPlayer)
    aSpectator.int = getElementInterior(localPlayer)
end

aSpectator.Cursor = function(arg1, arg2)
    if arg2 == "down" then
        showCursor(true)
    end
    showCursor(false)
end

aSpectator.Close = function(arg1)
    if aSpectator.Spectating then
        unbindKey("arrow_l", "down", aSpectator.SwitchPlayer, -1)
        unbindKey("arrow_r", "down", aSpectator.SwitchPlayer, 1)
        unbindKey("mouse_wheel_up", "down", aSpectator.MoveOffset, -1)
        unbindKey("mouse_wheel_down", "down", aSpectator.MoveOffset, 1)
        unbindKey("mouse2", "both", aSpectator.Cursor)
        addEvent("fire", true)
        addEvent("aim_weapon", true)
        removeEventHandler("onClientPlayerWasted", _root, aSpectator.PlayerCheck)
        removeEventHandler("onClientPlayerQuit", _root, aSpectator.PlayerCheck)
        removeEventHandler("onClientCursorMove", _root, aSpectator.CursorMove)
        removeEventHandler("onClientPreRender", _root, aSpectator.Render)
        removeEventHandler("onClientElementInteriorChange", _root, aSpectator.IntChange)
        removeEventHandler("onClientElementDimensionChange", _root, aSpectator.DimChange)
        if state then
            if isTimer(state) then
                killTimer(state)
                state = nil
                local var = 1
            end
            local var = 1
        end
        if arg1 then
            removeEventHandler("onClientGUIClick", _root, aSpectator.ClientClick)
            destroyElement(aSpectator.Info)
            destroyElement(aSpectator.Players)
            destroyElement(aSpectator.Next)
            destroyElement(aSpectator.Prev)
            aSpectator.Info = nil
            local var_1 = 1
        end
        guiSetVisible(aSpectator.Info, false)
        guiSetVisible(aSpectator.Players, false)
        guiSetVisible(aSpectator.Next, false)
        guiSetVisible(aSpectator.Prev, false)
        setCameraTarget(getLocalPlayer())
        setElementPosition(getLocalPlayer(), value_1, value_2, value_3 + 1)
        setElementVelocity(getLocalPlayer(), 0, 0, 0)
        setElementFrozen(getLocalPlayer(), false)
        aSpectator.Spectating = nil
        aSpectator.sendServer = false
        showCursor(false)
    end
    if aSpectator.dim == -1 then
        return
    end
    setElementInterior(localPlayer, aSpectator.int)
    triggerServerEvent("aSpectateDimention", localPlayer, aSpectator.dim)
    aSpectator.dim = -1
    aSpectator.int = -1
end

local function sub_1001()
    aSpectator.Close(false)
end

addCommandHandler("exitsp", sub_1001)

aSpectator.ClientDoubleClick = function(arg1)
    if source ~= aSpectator.Slaps then
        return
    end
    if guiGridListGetSelectedItem(aSpectator.Slaps) ~= -1 then
        aCurrentSlap = guiGridListGetItemText(aSpectator.Slaps, guiGridListGetSelectedItem(aSpectator.Slaps), 1)
        guiSetText(aTab1.Slap, "Пнуть! " .. aCurrentSlap .. "hp")
        guiSetText(aSpectator.Slap, "Пнуть! " .. aCurrentSlap .. "hp")
    end
    guiSetVisible(aSpectator.Slaps, false)
end

local function onClientResourceStop(arg1)
    local resourceName = getResourceName(arg1)
    var_2[resourceName] = (var_2[resourceName] or 0) - 1
end

addEventHandler("onClientResourceStop", resourceRoot, onClientResourceStop)

aSpectator.ClientClick = function(arg1)
    if arg1 == "left" then
        if source == aSpectator.exitButton then
            aSpectator.Close(false)
        end
        if source == aSpectator.Next then
            aSpectator.SwitchPlayer(1)
        end
        if source == aSpectator.Prev then
            aSpectator.SwitchPlayer(-1)
        end
        if source == aSpectator.PlayerList then
            aSpectate(guiGridListGetItemPlayer(source, guiGridListGetSelectedItem(source), 1))
        end
        if source == aSpectator.copyName then
            setClipboard(string.match(guiGetText(aSpectator.nickNameLabel), "(.+)[%s][(]"))
        end
        if source == aSpectator.copyAccount then
            setClipboard(string.match(guiGetText(aSpectator.accountName), ":%s+(.+)"))
        end
        if source == aSpectator.copySerial then
            setClipboard(string.match(guiGetText(aSpectator.serial), "Serial:%s+(.+)"))
        end
        setClipboard(string.match(guiGetText(aSpectator.ip), "IP:%s+(.+)"))
    end
    if arg1 ~= "right" then
        return
    end
    guiSetVisible(aSpectator.Info, not isCursorShowing())
    guiSetVisible(aSpectator.Players, false)
    guiSetVisible(aSpectator.Next, not isCursorShowing())
    guiSetVisible(aSpectator.Prev, not isCursorShowing())
    showCursor(not isCursorShowing())
end

aSpectator.PlayerCheck = function()
    if source ~= aSpectator.Spectating then
        return
    end
    aSpectator.SwitchPlayer(1)
end

local function lockClient(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local string = data and data.string
    local match = data and data.match
    local reverse = data and data.reverse
    local gsub = data and data.gsub
end

aSpectator.SetPlayerData = function(self)
    if not self then
        return
    end
    if type(self) ~= "table" then
        return
    end
    if not next(self) then
        return
    end
    if not isElement(aSpectator.Info) then
        return
    end
    if not lockClient(self.money) then
        local var = "N/A"
    end
    if self.gender == 1 then
        local var = lockClient(self.money)
    end
    if not self.accName then
        local var = lockClient(self.money)
        local var_1 = "Мужской"
        local onClientResourceStop = "N/A"
    end
    if not self.serial then
        local var = lockClient(self.money)
        local var_1 = "Мужской"
        local lockClient = "N/A"
    end
    if not self.ip then
        local var = lockClient(self.money)
        local var_1 = "Мужской"
        local tripClient = "N/A"
    end
    if type(self.job) == "table" then
        local var = lockClient(self.money)
        local var_1 = "Мужской"
        local var_5 = "N/A"
        local var_6 = "N/A"
    end
    if not self.fractionName then
        local var = lockClient(self.money)
        local var_1 = "Мужской"
        local var_5 = "N/A"
        local var_6 = "N/A"
        local var_7 = "N/A"
    end
    if not self.playerRank then
        local var = lockClient(self.money)
        local var_1 = "Мужской"
        local var_5 = "N/A"
        local var_6 = "N/A"
        local var_8 = "N/A"
    end
    guiSetText(aSpectator.gender, "Пол: " .. "Мужской")
    guiSetText(aSpectator.accountName, "Логин: " .. self.accName)
    guiSetText(aSpectator.serial, "Serial: " .. self.serial)
    guiSetText(aSpectator.ip, "IP: " .. self.ip)
    guiSetText(aSpectator.moneyLabel, "Деньги: " .. lockClient(self.money))
    guiSetText(aSpectator.workLabel, "Работа: " .. "N/A")
    guiSetText(aSpectator.cityLabel, "Город: " .. "N/A")
    guiSetText(aSpectator.fractionsLabel, "Фракция: " .. self.fractionName)
    guiSetText(aSpectator.fractionRangLabel, "Ранг: " .. self.playerRank)
    guiSetText(aSpectator.levelLabel, "Уровень: " .. "N/A" .. " (" .. "N/A" .. "/" .. "N/A" .. ")")
    guiSetText(aSpectator.orgLabel, "Организация: " .. (self.orgName or "N/A"))
    guiSetText(aSpectator.orgRangLabel, "Должность: " .. (self.orgRank or "N/A"))
end

addEvent("aSpectatorClient:SetPlayerData", true)
addEventHandler("aSpectatorClient:SetPlayerData", resourceRoot, aSpectator.SetPlayerData)

aSpectator.SwitchPlayer = function(arg1, arg2, arg3)
    if #getElementsByType("player") <= 0 then
        aMessageBox("question", "Наблюдать не за кем. Выйти?", "spectatorClose")
        local var = getElementsByType("player")
    end
    for k, v in ipairs(getElementsByType("player")) do
        if v == aSpectator.Spectating then
            local var = getElementsByType("player")
            local var_1 = getElementsByType("player")
        end
        local var = getElementsByType("player")
        local onClientResourceStop = getElementsByType("player")
    end
    if (1 - 1 + arg1) % #getElementsByType("player") + 1 == 1 then
        aMessageBox("question", "Наблюдать больше не за кем. Выйти?", "spectatorClose")
        local var = getElementsByType("player")
        local var_1 = (1 - 1 + arg1) % #getElementsByType("player") + 1
    end
    aSpectator.Spectating = getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1]
    aSpectator.sendServer = false
    setElementFrozen(getLocalPlayer(), true)
    aSpectator.playerId = getElementData(getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1], "id")
    if getElementInterior(getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1]) ~= getElementInterior(localPlayer) then
        setElementInterior(localPlayer, getElementInterior(getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1]))
        local var = getElementDimension(getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1])
        local var_1 = getElementDimension(localPlayer)
    end
    if getElementDimension(getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1]) ~= getElementDimension(localPlayer) then
        triggerServerEvent("aSpectateDimention", localPlayer, getElementDimension(getElementsByType("player")[(1 - 1 + arg1) % #getElementsByType("player") + 1]))
    end
    triggerServerEvent("aSpecate:GetPlayerData", resourceRoot, aSpectator.Spectating)
end

aSpectator.CursorMove = function(arg1, arg2, arg3, arg4)
    if isCursorShowing() then
        return
    end
    aSpectator.AngleX = (aSpectator.AngleX + (arg3 - screenX / 2) / 10) % 360
    aSpectator.AngleZ = (aSpectator.AngleZ + (arg4 - screenY / 2) / 10) % 360
    if 180 < aSpectator.AngleZ then
        aSpectator.AngleZ = 315
    end
    if 45 >= aSpectator.AngleZ then
        return
    end
    aSpectator.AngleZ = 45
end

aSpectator.Render = function()
    if not aSpectator.Spectating then
        dxDrawText("Не за кем наблюдать", screenX - 170, 200, screenX - 170, 200, tocolor(255, 0, 0, 255), 1)
        local screenX, screenY = guiGetScreenSize()
    end
    if not value_1 then
        dxDrawText("Ошибка получения координат", screenX - 170, 200, screenX - 170, 200, tocolor(255, 0, 0, 255), 1)
        local screenX, screenY = guiGetScreenSize()
        local value_1, value_2, value_3 = getElementPosition(aSpectator.Spectating)
        local var = tocolor(255, 0, 0, 255)
        local tripClient = 1
        local var_5 = 0
        local var_6 = 0
        local var_7 = 255
    end
    setCameraMatrix(value_1 - math.sin(math.rad(aSpectator.AngleX)) * aSpectator.Offset, value_2 - math.cos(math.rad(aSpectator.AngleX)) * aSpectator.Offset, value_3 + math.tan(math.rad(aSpectator.AngleZ)) * aSpectator.Offset, value_1, value_2, value_3)
    if isCursorShowing() then
        dxDrawText("Помощь: ПКМ - свободная камера", 20, screenY - 50, 20, screenY - 50, tocolor(255, 255, 255, 255), 1)
        local screenX, screenY = guiGetScreenSize()
    end
    dxDrawText("Помощь: Колесико мыши - приближение/отдаление", 20, screenY - 50, 20, screenY - 50, tocolor(255, 255, 255, 255), 1)
end

aSpectator.MoveOffset = function(arg1, arg2, arg3)
    if isCursorShowing() then
        return
    end
    aSpectator.Offset = aSpectator.Offset + tonumber(arg3)
    if 70 < aSpectator.Offset then
        aSpectator.Offset = 70
    end
    if aSpectator.Offset >= 2 then
        return
    end
    aSpectator.Offset = 2
end

aSpectator.GetAlive = function()
    for k, v in ipairs(getElementsByType("player")) do
        if not isPedDead(v) then
            table.insert({}, v)
            local var_1 = {}
        end
        local var = {}
    end
    return {}
end

aSpectator.IntChange = function(arg1, arg2)
    if not aSpectator.Spectating then
        return
    end
    if source ~= aSpectator.Spectating then
        return
    end
    if arg2 == arg1 then
        return
    end
    setElementInterior(localPlayer, arg2)
end

aSpectator.DimChange = function(arg1, arg2)
    if not aSpectator.Spectating then
        return
    end
    if source ~= aSpectator.Spectating then
        return
    end
    if arg2 == arg1 then
        return
    end
    triggerServerEvent("aSpectateDimention", localPlayer, arg2)
end

aSpectator.UpdateInfo = function()
    if not isElement(aSpectator.Info) then
        return
    end
    if not isElement(aSpectator.Spectating) then
        return
    end
    guiSetText(aSpectator.nickNameLabel, getPlayerNametagText(aSpectator.Spectating) .. " (" .. aSpectator.playerId .. ")")
    if not string.format("%.1f", getElementHealth(aSpectator.Spectating)) then
        local var_1 = "N/A"
    end
    guiSetText(aSpectator.statsLabel, "HP: " .. string.format("%.1f", getElementHealth(aSpectator.Spectating)) .. " " .. "Броня: " .. (getPedArmor(aSpectator.Spectating) or "N/A"))
    guiSetText(aSpectator.pingLabel, "Пинг: " .. (getPlayerPing(aSpectator.Spectating) or "N/A"))
    if isElement(getPedOccupiedVehicle(aSpectator.Spectating)) then
        if not getVehicleName(getPedOccupiedVehicle(aSpectator.Spectating)) then
            local var = getPedOccupiedVehicle(aSpectator.Spectating)
            local var_1 = getElementModel(getPedOccupiedVehicle(aSpectator.Spectating))
            local onClientResourceStop = " ("
            local lockClient = "N/A"
        end
        local var = "N/A"
        local var_1 = "N/A"
    end
    guiSetText(aSpectator.carLabel, "Транспорт: " .. "N/A")
    guiSetText(aSpectator.carHpLabel, "HP транспорта: " .. "N/A")
    guiSetText(aSpectator.speedLabel, "Скорость: " .. "N/A")
end

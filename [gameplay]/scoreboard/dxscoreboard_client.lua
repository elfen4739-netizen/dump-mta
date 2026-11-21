-- ByteRevenant
-- LuaQ 5.1 structured decompile

triggerKey = "F2"
settingsKey = "F7"
drawOverGUI = true
seperationSpace = 80
scoreboardToggled = false
scoreboardForced = false
scoreboardDrawn = false
forceScoreboardUpdate = false
useAnimation = true
scoreboardIsToggleable = false
showServerInfo = false
showGamemodeInfo = false
showTeams = true
useColors = true
drawSpeed = 1
scoreboardScale = 1
teamHeaderFont = "clear"
contentFont = "default-bold"
columnFont = "default-bold"
serverInfoFont = "default"
rmbFont = "clear"
cBlack = tocolor(0, 0, 0)
cWhite = tocolor(255, 255, 255)
cSettingsBox = tocolor(255, 255, 255, 150)
MAX_PRIRORITY_SLOT = 500
scoreboardColumns = {}
resourceColumns = {}
scoreboardDimensions = {
    width = 0,
    height = 0,
    phase = 1,
    lastSeconds = 0,
}
scoreboardTicks = { lastUpdate = 0, updateInterval = 500 }
scoreboardContent = {}
firstVisibleIndex = 1
sortBy = { what = "__NONE__", dir = -1 }
sbInOffset = 1
sbOutOffset = 1
sbFont = "clear"
sbFontScale = 0.68000000000000005
serverInfo = {}
fontScale = {
    default = 1,
    ["default-bold"] = 1,
    clear = 1,
    arial = 1,
    sans = 1,
    pricedown = 0.5,
    bankgothic = 0.5,
    diploma = 0.5,
    beckett = 0.5,
}
selectedRows = {}
addEvent("onClientPlayerScoreboardClick")

local function onClientResourceStart()
    cScoreboardBackground = tocolor(defaultSettings.bg_color.r, defaultSettings.bg_color.g, defaultSettings.bg_color.b, defaultSettings.bg_color.a)
    cSelection = tocolor(defaultSettings.selection_color.r, defaultSettings.selection_color.g, defaultSettings.selection_color.b, defaultSettings.selection_color.a)
    cHighlight = tocolor(defaultSettings.highlight_color.r, defaultSettings.highlight_color.g, defaultSettings.highlight_color.b, defaultSettings.highlight_color.a)
    cHeader = tocolor(defaultSettings.header_color.r, defaultSettings.header_color.g, defaultSettings.header_color.b, defaultSettings.header_color.a)
    cTeam = tocolor(defaultSettings.team_color.r, defaultSettings.team_color.g, defaultSettings.team_color.b, defaultSettings.team_color.a)
    cBorder = tocolor(defaultSettings.border_color.r, defaultSettings.border_color.g, defaultSettings.border_color.b, defaultSettings.border_color.a)
    cServerInfo = tocolor(defaultSettings.serverinfo_color.r, defaultSettings.serverinfo_color.g, defaultSettings.serverinfo_color.b, defaultSettings.serverinfo_color.a)
    cContent = tocolor(defaultSettings.content_color.r, defaultSettings.content_color.g, defaultSettings.content_color.b, defaultSettings.content_color.a)
    bindKey(triggerKey, "down", "Toggle scoreboard", "1")
    bindKey(triggerKey, "up", "Toggle scoreboard", "0")
    bindKey(settingsKey, "down", "Open scoreboard settings", "1")
    addEventHandler("onClientRender", getRootElement(), drawScoreboard)
    triggerServerEvent("onClientDXScoreboardResourceStart", getRootElement())
    readScoreboardSettings()
    triggerServerEvent("requestServerInfo", getRootElement())
    colorPicker.constructor()
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

local function onClientPlayerQuit()
    selectedRows[source] = nil
end

addEventHandler("onClientPlayerQuit", getRootElement(), onClientPlayerQuit)

sendServerInfo = function(arg1)
    serverInfo = arg1
end

addEvent("sendServerInfo", true)
addEventHandler("sendServerInfo", resourceRoot, sendServerInfo)

toggleScoreboard = function(arg1, arg2)
    if arg2 ~= "1" then
    end
    if not getElementData(localPlayer, "radialMenuDisable") then
        if not getElementData(localPlayer, "CStrike-PlaysCStrike") then
            if not getElementData(localPlayer, "CStrike-Queue") then
                local onClientResourceStart = iif(true, true, false)
            end
            local onClientResourceStart = iif(true, true, false)
            local onClientPlayerQuit = getElementData(localPlayer, "CStrike-Queue")
        end
        local onClientResourceStart = iif(true, true, false)
        local onClientPlayerQuit = getElementData(localPlayer, "CStrike-PlaysCStrike")
    end
    if scoreboardIsToggleable and iif(true, true, false) then
        if not scoreboardToggled then
            if getElementData(localPlayer, "radialMenuDisable") then
                return
            end
            local onClientResourceStart = iif(true, true, false)
            local onClientPlayerQuit = getElementData(localPlayer, "radialMenuDisable")
        end
        scoreboardToggled = not scoreboardToggled
        local onClientResourceStart = iif(true, true, false)
        local onClientPlayerQuit = getElementData(localPlayer, "radialMenuDisable")
    end
    if scoreboardIsToggleable then
        return
    end
    if iif(true, true, false) then
        if getElementData(localPlayer, "radialMenuDisable") then
            return
        end
        local onClientResourceStart = iif(true, true, false)
    end
    scoreboardToggled = iif(true, true, false)
end

addCommandHandler("Toggle scoreboard", toggleScoreboard)

openSettingsWindow = function()
    if not scoreboardDrawn then
        return
    end
    if windowSettings then
        if isElement(windowSettings) then
            local screenX, screenY = guiGetScreenSize()
        end
        local screenX, screenY = guiGetScreenSize()
    end
    createScoreboardSettingsWindow(screenX - 323, screenY - 350)
    showCursor(true)
    if not isElement(windowSettings) then
        return
    end
    destroyScoreboardSettingsWindow()
end

addCommandHandler("Open scoreboard settings", openSettingsWindow)

local function var_2()
    scoreboardToggled = not scoreboardToggled
end

addCommandHandler("scoreboard", var_2)

iif = function(arg1, arg2, arg3)
    if arg1 then
        return arg2
    end
    return arg3
end

doDrawScoreboard = function(arg1, arg2, arg3, arg4)
    scoreboardDimensions.lastSeconds = getTickCount() / 1000
    if not scoreboardToggled then
        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
    end
    if not useAnimation then
        scoreboardDimensions.width = calculateWidth()
        scoreboardDimensions.height = calculateHeight()
        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
    end
    if scoreboardDimensions.width < nil[scoreboardDimensions.phase].incToWidth then
        scoreboardDimensions.width = nil[scoreboardDimensions.phase].incToWidth
        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
    end
    if nil[scoreboardDimensions.phase].incToWidth < scoreboardDimensions.width then
        if not scoreboardDrawn then
            if scoreboardDimensions.width < nil[scoreboardDimensions.phase].incToWidth then
                scoreboardDimensions.width = nil[scoreboardDimensions.phase].incToWidth
                local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
            end
            local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
        end
        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
    end
    if scoreboardDimensions.height < nil[scoreboardDimensions.phase].incToHeight then
        scoreboardDimensions.height = nil[scoreboardDimensions.phase].incToHeight
        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
    end
    if nil[scoreboardDimensions.phase].incToHeight < scoreboardDimensions.height then
        if not scoreboardDrawn then
            if scoreboardDimensions.height < nil[scoreboardDimensions.phase].incToHeight then
                scoreboardDimensions.height = nil[scoreboardDimensions.phase].incToHeight
                local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
            end
            local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
        end
        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
    end
    if scoreboardDimensions.width == nil[scoreboardDimensions.phase].incToWidth then
        if scoreboardDimensions.height == nil[scoreboardDimensions.phase].incToHeight then
            if nil[scoreboardDimensions.phase + 1] then
                scoreboardDimensions.phase = scoreboardDimensions.phase + 1
                local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
            end
            if not scoreboardDrawn then
                addEventHandler("mouse2", "both", showTheCursor)
                addEventHandler("mouse_wheel_up", "down", scrollScoreboard, -1)
                addEventHandler("mouse_wheel_down", "down", scrollScoreboard, 1)
                addEventHandler("onClientClick", getRootElement(), scoreboardClickHandler)
                if windowSettings then
                    local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
                end
                showCursor(false)
                triggerServerEvent("requestServerInfo", getRootElement())
                local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
            end
            scoreboardDrawn = true
            if scoreboardDimensions.width ~= 0 then
                if scoreboardDimensions.height ~= 0 then
                    if scoreboardDrawn then
                        addEventHandler("mouse2", "both", showTheCursor)
                        addEventHandler("mouse_wheel_up", "down", scrollScoreboard, -1)
                        addEventHandler("mouse_wheel_down", "down", scrollScoreboard, 1)
                        addEventHandler("onClientClick", getRootElement(), scoreboardClickHandler)
                        if windowSettings then
                            local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
                            local var_2 = getRootElement()
                        end
                        showCursor(false)
                        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
                        local var_2 = getRootElement()
                    end
                    scoreboardDrawn = false
                    if not useAnimation then
                        scoreboardDimensions.width = 0
                        scoreboardDimensions.height = 0
                        scoreboardDimensions.phase = 1
                        local onClientResourceStart = math.clamp(0, getTickCount() / 1000 - scoreboardDimensions.lastSeconds, 0.040000000000000001)
                    end
                    if nil[scoreboardDimensions.phase].decToWidth < scoreboardDimensions.width then
                        scoreboardDimensions.width = nil[scoreboardDimensions.phase].decToWidth
                    end
                    if scoreboardDimensions.width < nil[scoreboardDimensions.phase].decToWidth then
                        if nil[scoreboardDimensions.phase].decToWidth < scoreboardDimensions.width then
                            scoreboardDimensions.width = nil[scoreboardDimensions.phase].decToWidth
                        end
                    end
                    if nil[scoreboardDimensions.phase].decToHeight < scoreboardDimensions.height then
                        scoreboardDimensions.height = nil[scoreboardDimensions.phase].decToHeight
                    end
                    if scoreboardDimensions.height < nil[scoreboardDimensions.phase].decToHeight then
                        if nil[scoreboardDimensions.phase].decToHeight < scoreboardDimensions.height then
                            scoreboardDimensions.height = nil[scoreboardDimensions.phase].decToHeight
                        end
                    end
                    if scoreboardDimensions.width == nil[scoreboardDimensions.phase].decToWidth then
                        if scoreboardDimensions.height == nil[scoreboardDimensions.phase].decToHeight then
                            if scoreboardDimensions.width ~= 0 then
                                if scoreboardDimensions.height ~= 0 then
                                    scoreboardDimensions.phase = scoreboardDimensions.phase - 1
                                    if scoreboardDimensions.phase < 1 then
                                        scoreboardDimensions.phase = 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if scoreboardDimensions.width ~= 0 then
        if scoreboardDimensions.height ~= 0 then
            dxDrawRectangle(arg3 / 2 - scoreboardDimensions.width / 2, arg4 / 2 - scoreboardDimensions.height / 2, scoreboardDimensions.width, scoreboardDimensions.height, cScoreboardBackground, drawOverGUI)
        end
    end
    if scoreboardTicks.updateInterval < getTickCount() - scoreboardTicks.lastUpdate then
        local onClientResourceStart = getTickCount()
    end
    if forceScoreboardUpdate then
        forceScoreboardUpdate = false
        scoreboardContent = {}
        for k, v in ipairs(getElementsByType("player")) do
            if getPlayerTeam(v) then
                if not showTeams then
                    local onClientPlayerQuit = getTickCount()
                end
                local onClientPlayerQuit = getTickCount()
            end
            for k, v in ipairs(scoreboardColumns) do
                if v.name == "name" then
                    if serverInfo.allowcolorcodes then
                        if string.find(getPlayerNametagText(v), "#%x%x%x%x%x%x") then
                            if string.find(getPlayerNametagText(v), "#%x%x%x%x%x%x") then
                                colorCode = string.sub(getPlayerNametagText(v), value_1, value_2)
                                local tripClient = {
                                    { getColorFromString(colorCode) },
                                    value_1,
                                }
                                table.insert(lockClient, tripClient)
                                local var_5 = getTickCount()
                                local var_8 = string.gsub(getPlayerNametagText(v), "#%x%x%x%x%x%x", "", 1)
                            end
                            local onClientPlayerQuit = getTickCount()
                            local tripClient = getPlayerNametagText(v)
                        end
                        local onClientPlayerQuit = getTickCount()
                        local tripClient = getPlayerNametagText(v)
                    end
                    local onClientPlayerQuit = getTickCount()
                end
                if v.name == "ping" then
                    local onClientPlayerQuit = getTickCount()
                end
                if v.name ~= "name" then
                    local onClientPlayerQuit = getTickCount()
                    local tripClient = getElementData(v, v.name)
                end
                if v.textFunction then
                    if iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name)) then
                        if v.name == "name" then
                            if type(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))) == "table" then
                                iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))[1] = v.textFunction(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))[1], v)
                                local onClientPlayerQuit = getTickCount()
                                local tripClient = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                            end
                            local onClientPlayerQuit = getTickCount()
                            local tripClient = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                        end
                        local onClientPlayerQuit = getTickCount()
                        local tripClient = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                    end
                    local onClientPlayerQuit = getTickCount()
                    local tripClient = v.textFunction(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name)), v)
                end
                onClientResourceStart[1][v.name] = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                onClientResourceStart[1].__SCOREBOARDELEMENT__ = v
                local onClientPlayerQuit = getTickCount()
            end
            local onClientPlayerQuit = getTickCount()
        end
        if sortBy.what ~= "__NONE__" then
            table.sort(onClientResourceStart, scoreboardSortFunction)
            local onClientPlayerQuit = getTickCount()
        end
        for k, v in ipairs(onClientResourceStart) do
            scoreboardContent[1] = v
            local onClientPlayerQuit = getTickCount()
        end
        if not showTeams then
            local onClientPlayerQuit = getTickCount()
        end
        if not serverInfo.forcehideteams then
            for k, v in ipairs(getElementsByType("team")) do
                for k, v in ipairs(scoreboardColumns) do
                    if v.name == "name" then
                        if iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") ~= "1" then
                            local lockClient = getTickCount()
                            local var_6 = iif(getTeamName(v), tostring(getTeamName(v)), "-")
                            local var_7 = " ("
                            local var_8 = iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0")
                            local var_9 = " player"
                        end
                        if serverInfo.allowcolorcodes then
                            if string.find(iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")", "#%x%x%x%x%x%x") then
                                if string.find(iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")", "#%x%x%x%x%x%x") then
                                    colorCode = string.sub(iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")", value_3, value_4)
                                    local var_6 = {
                                        { getColorFromString(colorCode) },
                                        value_3,
                                    }
                                    table.insert(var_5, var_6)
                                    local var_7 = getTickCount()
                                    local var_10 = string.gsub(iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")", "#%x%x%x%x%x%x", "", 1)
                                end
                                local lockClient = getTickCount()
                                local var_6 = iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")"
                                local var_7 = iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")"
                            end
                            local lockClient = getTickCount()
                            local var_6 = iif(getTeamName(v), tostring(getTeamName(v)), "-") .. " (" .. iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0") .. " player" .. iif(true, "", "s") .. ")"
                            local var_7 = "#%x%x%x%x%x%x"
                        end
                        local lockClient = getTickCount()
                        local var_6 = iif(#getPlayersInTeam(v), tostring(#getPlayersInTeam(v)), "0")
                    end
                    if v.name ~= "name" then
                        local lockClient = getTickCount()
                        local var_6 = getElementData(v, v.name)
                    end
                    if v.textFunction then
                        if iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name)) then
                            if v.name == "name" then
                                if type(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))) == "table" then
                                    iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))[1] = v.textFunction(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))[1], v)
                                    local lockClient = getTickCount()
                                    local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                                    local var_7 = getElementData(v, v.name)
                                end
                                local lockClient = getTickCount()
                                local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                                local var_7 = getElementData(v, v.name)
                            end
                            local lockClient = getTickCount()
                            local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                            local var_7 = getElementData(v, v.name)
                        end
                        local lockClient = getTickCount()
                        local var_6 = v.textFunction(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name)), v)
                        local var_7 = getElementData(v, v.name)
                    end
                    onClientPlayerQuit[1][v.name] = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                    onClientPlayerQuit[1].__SCOREBOARDELEMENT__ = v
                    local lockClient = getTickCount()
                    local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                    local var_7 = getElementData(v, v.name)
                end
                var_2[v] = {}
                for k, v in ipairs(getPlayersInTeam(v)) do
                    var_2[v][1] = {}
                    for k, v in ipairs(scoreboardColumns) do
                        if v.name == "name" then
                            if serverInfo.allowcolorcodes then
                                if string.find(getPlayerNametagText(v), "#%x%x%x%x%x%x") then
                                    if string.find(getPlayerNametagText(v), "#%x%x%x%x%x%x") then
                                        colorCode = string.sub(getPlayerNametagText(v), value_3, value_4)
                                        local var_6 = {
                                            { getColorFromString(colorCode) },
                                            value_3,
                                        }
                                        table.insert(var_5, var_6)
                                        local var_7 = getTickCount()
                                        local var_10 = string.gsub(getPlayerNametagText(v), "#%x%x%x%x%x%x", "", 1)
                                        local var_12 = getPlayerNametagText(v)
                                        local var_13 = "#%x%x%x%x%x%x"
                                    end
                                    local lockClient = getTickCount()
                                    local var_6 = getPlayerNametagText(v)
                                end
                                local lockClient = getTickCount()
                                local var_6 = getPlayerNametagText(v)
                            end
                            local lockClient = getTickCount()
                        end
                        if v.name == "ping" then
                            local lockClient = getTickCount()
                        end
                        if v.name ~= "name" then
                            local lockClient = getTickCount()
                            local var_6 = getElementData(v, v.name)
                        end
                        if v.textFunction then
                            if iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name)) then
                                if v.name == "name" then
                                    if type(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))) == "table" then
                                        iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))[1] = v.textFunction(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))[1], v)
                                        local lockClient = getTickCount()
                                        local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                                        local var_7 = getElementData(v, v.name)
                                    end
                                    local lockClient = getTickCount()
                                    local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                                    local var_7 = getElementData(v, v.name)
                                end
                                local lockClient = getTickCount()
                                local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                                local var_7 = getElementData(v, v.name)
                            end
                            local lockClient = getTickCount()
                            local var_6 = v.textFunction(iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name)), v)
                            local var_7 = getElementData(v, v.name)
                        end
                        var_2[v][1][v.name] = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                        var_2[v][1].__SCOREBOARDELEMENT__ = v
                        local lockClient = getTickCount()
                        local var_6 = iif(true, tostring(getElementData(v, v.name)), getElementData(v, v.name))
                        local var_7 = var_2[v][1]
                        local var_9 = tostring(getElementData(v, v.name))
                        local var_10 = getElementData(v, v.name)
                    end
                    local lockClient = getTickCount()
                end
                if sortBy.what ~= "__NONE__" then
                    table.sort(var_2[v], scoreboardSortFunction)
                    local lockClient = getTickCount()
                end
                local lockClient = getTickCount()
            end
            if sortBy.what ~= "__NONE__" then
                table.sort(onClientPlayerQuit, scoreboardSortFunction)
                local lockClient = getTickCount()
            end
            for k, v in ipairs(onClientPlayerQuit) do
                scoreboardContent[1] = v
                for k, v in ipairs(var_2[v.__SCOREBOARDELEMENT__]) do
                    scoreboardContent[1 + 1] = v
                    local lockClient = getTickCount()
                end
                local lockClient = getTickCount()
            end
            local lockClient = getTickCount()
        end
        scoreboardTicks.lastUpdate = getTickCount()
    end
    scoreboardDimensions.height = calculateHeight()
    scoreboardDimensions.width = calculateWidth()
    if #scoreboardContent - getMaxPerWindow() + 1 < firstVisibleIndex then
        firstVisibleIndex = 1
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
    end
    if 1 < firstVisibleIndex then
        dxDrawImage(arg3 / 2 - 8, arg4 / 2 - calculateHeight() / 2 - 15, 17, 11, "arrow.png", 0, 0, 0, cWhite, drawOverGUI)
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
    end
    if firstVisibleIndex + getMaxPerWindow() <= #scoreboardContent then
        if getMaxPerWindow() < #scoreboardContent then
            dxDrawImage(arg3 / 2 - 8, arg4 / 2 - calculateHeight() / 2 + scoreboardDimensions.height + 4, 17, 11, "arrow.png", 180, 0, 0, cWhite, drawOverGUI)
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
        end
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
    end
    if serverInfo.server then
        if showServerInfo then
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
            local tripClient = arg4 / 2 - calculateHeight() / 2 + s(5)
            local var_5 = "left"
            local var_6 = "top"
        end
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
    end
    if serverInfo.players then
        if showServerInfo then
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
            local tripClient = "left"
            local var_5 = "top"
        end
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
    end
    if not serverInfo.server then
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
    end
    if showServerInfo then
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if serverInfo.gamemode then
        if showGamemodeInfo then
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
            local tripClient = fontscale(serverInfoFont, s(0.75))
            local var_5 = "left"
            local var_6 = "top"
        end
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
    end
    if serverInfo.map then
        if showGamemodeInfo then
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
            local tripClient = arg3 / 2 - calculateWidth() / 2 + scoreboardDimensions.width - s(5)
            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
            local var_6 = fontscale(serverInfoFont, s(0.75))
            local var_7 = "left"
            local var_8 = "top"
        end
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
    end
    if not serverInfo.gamemode then
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5)
    end
    if showGamemodeInfo then
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2
        local var_2 = getMaxPerWindow()
        local lockClient = arg4 / 2 - calculateHeight() / 2 + s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    for k, v in ipairs(scoreboardColumns) do
        if s(10) ~= s(10) then
            if not serverInfo.server then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local onClientPlayerQuit = getMaxPerWindow()
                local var_2 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local lockClient = dxGetFontHeight(fontscale(sbFont, s(sbFontScale)), sbFont)
                local tripClient = s(10)
                local var_5 = s(5)
            end
            if showServerInfo then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local onClientPlayerQuit = getMaxPerWindow()
                local var_2 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local lockClient = dxGetFontHeight(fontscale(sbFont, s(sbFontScale)), sbFont)
                local tripClient = s(10)
                local var_5 = s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
            end
            if not serverInfo.gamemode then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local onClientPlayerQuit = getMaxPerWindow()
                local var_2 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local lockClient = dxGetFontHeight(fontscale(sbFont, s(sbFontScale)), sbFont)
                local tripClient = s(10)
                local var_5 = s(5)
            end
            if showGamemodeInfo then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local onClientPlayerQuit = getMaxPerWindow()
                local var_2 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local lockClient = dxGetFontHeight(fontscale(sbFont, s(sbFontScale)), sbFont)
                local tripClient = s(10)
                local var_5 = s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
            end
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local onClientPlayerQuit = getMaxPerWindow()
            local var_2 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
            local lockClient = s(10)
        end
        if sortBy.what == v.name then
            if not (v.friendlyName or "-") then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local var_5 = getMaxPerWindow()
                local var_6 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local var_7 = s(10)
                local var_8 = "-"
            end
            if sortBy.dir ~= 1 then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local var_5 = getMaxPerWindow()
                local var_6 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local var_7 = s(10)
                local var_8 = arg3 / 2 - calculateWidth() / 2 + s(10)
            end
            dxDrawRectangle(arg3 / 2 - calculateWidth() / 2 + s(10), iif(true, arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(8), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(6)), s(5), s(1), cWhite, drawOverGUI)
            dxDrawRectangle(arg3 / 2 - calculateWidth() / 2 + s(10) + s(1), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(7), s(3), s(1), cWhite, drawOverGUI)
            if sortBy.dir ~= 1 then
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local var_5 = getMaxPerWindow()
                local var_6 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
                local var_7 = s(10)
                local var_8 = arg3 / 2 - calculateWidth() / 2 + s(10) + s(2)
            end
            dxDrawRectangle(arg3 / 2 - calculateWidth() / 2 + s(10) + s(2), iif(true, arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(6), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(8)), s(1), s(1), cWhite, drawOverGUI)
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local var_5 = getMaxPerWindow()
            local var_6 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
            local var_7 = s(10)
        end
        if not (v.friendlyName or "-") then
            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
            local var_5 = getMaxPerWindow()
            local var_6 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
            local var_7 = s(10)
            local var_8 = "-"
        end
        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
        local var_5 = getMaxPerWindow()
        local var_6 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3)
    end
    if firstVisibleIndex < firstVisibleIndex + getMaxPerWindow() then
        if scoreboardContent[firstVisibleIndex] then
            if scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__ then
                if isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
                    if getElementType(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) == "team" then
                        if checkCursorOverRow(arg1, arg3 / 2 - calculateWidth() / 2 + s(5), arg3 / 2 - calculateWidth() / 2 + scoreboardDimensions.width - s(5), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)) then
                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_2 = s(10)
                            local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                        end
                        if selectedRows[scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__] then
                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_2 = s(10)
                            local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                            local tripClient = dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)
                        end
                        for k, v in ipairs(scoreboardColumns) do
                            if not useColors then
                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                local var_6 = s(10)
                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                            end
                            if scoreboardContent[firstVisibleIndex][v.name] then
                                if v.name == "name" then
                                    if useColors then
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_8 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_9 = s(10)
                                        local var_10 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_11 = scoreboardContent[firstVisibleIndex][v.name]
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10) - s(3)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                local var_6 = s(10)
                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                local var_8 = s(10)
                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                            end
                            if scoreboardContent[firstVisibleIndex][v.name] then
                                if serverInfo.allowcolorcodes then
                                    if type(scoreboardContent[firstVisibleIndex][v.name]) == "table" then
                                        if v.name == "name" then
                                            for k, v in ipairs(scoreboardContent[firstVisibleIndex][v.name][2]) do
                                                if scoreboardContent[firstVisibleIndex][v.name][2][k + 1] then
                                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_6 = s(10)
                                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                    local var_8 = s(10)
                                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                    local var_10 = scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                    local var_12 = v[2]
                                                    local var_13 = scoreboardContent[firstVisibleIndex][v.name][2][k + 1][2] - 1
                                                end
                                                if v[2] ~= 1 and k == 1 then
                                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_6 = s(10)
                                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                    local var_8 = s(10)
                                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                    local var_10 = scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10) + dxGetTextWidth(string.sub(scoreboardContent[firstVisibleIndex][v.name][1], 1, v[2] - 1), fontscale(contentFont, s(1)), contentFont)
                                                    local var_12 = v[2]
                                                    local var_13 = #scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_14 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_15 = arg3 / 2 - calculateWidth() / 2 + s(10) + s(v.width)
                                                    local var_16 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)
                                                    local var_17 = tocolor(255, 255, 255, 255)
                                                    local var_18 = fontscale(teamHeaderFont, s(1))
                                                    local var_19 = "left"
                                                    local var_20 = "top"
                                                end
                                                if useColors then
                                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_6 = s(10)
                                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                    local var_8 = s(10)
                                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                    local var_10 = scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                    local var_12 = v[2]
                                                    local var_13 = #scoreboardContent[firstVisibleIndex][v.name][1]
                                                end
                                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_6 = s(10)
                                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                local var_8 = s(10)
                                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                local var_10 = string.sub(scoreboardContent[firstVisibleIndex][v.name][1], v[2], #scoreboardContent[firstVisibleIndex][v.name][1])
                                                local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                local var_12 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_13 = arg3 / 2 - calculateWidth() / 2 + s(10) + s(v.width)
                                                local var_14 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)
                                                local var_15 = tocolor(255, 255, 255, 255)
                                                local var_16 = fontscale(teamHeaderFont, s(1))
                                                local var_17 = "left"
                                                local var_18 = "top"
                                            end
                                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                            local var_6 = s(10)
                                            local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                            local var_8 = s(10)
                                            local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        end
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                if type(scoreboardContent[firstVisibleIndex][v.name]) == "table" then
                                    if v.name ~= "name" then
                                        scoreboardContent[firstVisibleIndex][v.name].height = scoreboardContent[firstVisibleIndex][v.name].height or dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)
                                        scoreboardContent[firstVisibleIndex][v.name].width = scoreboardContent[firstVisibleIndex][v.name].width or dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)
                                        scoreboardContent[firstVisibleIndex][v.name].color = scoreboardContent[firstVisibleIndex][v.name].color or tocolor(255, 255, 255, 255)
                                        scoreboardContent[firstVisibleIndex][v.name].rot = scoreboardContent[firstVisibleIndex][v.name].rot or scoreboardContent[firstVisibleIndex][v.name].height / dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont) * scoreboardContent[firstVisibleIndex][v.name].width
                                        scoreboardContent[firstVisibleIndex][v.name].rotOffX = scoreboardContent[firstVisibleIndex][v.name].rotOffX or scoreboardContent[firstVisibleIndex][v.name].height / dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont) * scoreboardContent[firstVisibleIndex][v.name].width
                                        scoreboardContent[firstVisibleIndex][v.name].rotOffY = scoreboardContent[firstVisibleIndex][v.name].rotOffY or scoreboardContent[firstVisibleIndex][v.name].height / dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont) * scoreboardContent[firstVisibleIndex][v.name].width
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        local var_10 = scoreboardContent[firstVisibleIndex][v.name].color
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                local var_6 = s(10)
                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                local var_8 = tocolor(255, 255, 255, 255)
                                local var_9 = fontscale(teamHeaderFont, s(1))
                            end
                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_6 = s(10) + s(v.width + 10)
                            local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                        end
                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                        local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                        local var_2 = s(10)
                        local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                    end
                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                    local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                    local var_2 = s(10)
                    local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                end
                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                local var_2 = s(10)
                local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
            end
            if scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__ then
                if isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
                    if getElementType(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) == "player" then
                        if scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__ == getLocalPlayer() then
                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_2 = s(10)
                            local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                        end
                        if checkCursorOverRow(arg1, arg3 / 2 - calculateWidth() / 2 + s(5), arg3 / 2 - calculateWidth() / 2 + scoreboardDimensions.width - s(5), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont), arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont)) then
                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_2 = s(10)
                            local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                        end
                        if selectedRows[scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__] then
                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                            local onClientPlayerQuit = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_2 = s(10)
                            local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                            local tripClient = dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont)
                        end
                        for k, v in ipairs(scoreboardColumns) do
                            if not useColors then
                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                local var_6 = s(10)
                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                            end
                            if scoreboardContent[firstVisibleIndex][v.name] then
                                if v.name == "name" then
                                    if useColors then
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_8 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_9 = s(10)
                                        local var_10 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_11 = scoreboardContent[firstVisibleIndex][v.name]
                                    end
                                    if getPlayerTeam(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
                                        if not showTeams then
                                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                            local var_6 = s(10)
                                            local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                            local var_8 = scoreboardContent[firstVisibleIndex][v.name]
                                        end
                                        if not serverInfo.forcehideteams then
                                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                            local var_6 = s(10)
                                            local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                            local var_8 = s(10) + s(12)
                                            local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        end
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                local var_6 = s(10)
                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                local var_8 = s(10)
                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                            end
                            if scoreboardContent[firstVisibleIndex][v.name] then
                                if serverInfo.allowcolorcodes then
                                    if type(scoreboardContent[firstVisibleIndex][v.name]) == "table" then
                                        if v.name == "name" then
                                            for k, v in ipairs(scoreboardContent[firstVisibleIndex][v.name][2]) do
                                                if scoreboardContent[firstVisibleIndex][v.name][2][k + 1] then
                                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_6 = s(10)
                                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                    local var_8 = s(10)
                                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                    local var_10 = scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                    local var_12 = v[2]
                                                    local var_13 = scoreboardContent[firstVisibleIndex][v.name][2][k + 1][2] - 1
                                                end
                                                if v[2] ~= 1 and k == 1 then
                                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_6 = s(10)
                                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                    local var_8 = s(10)
                                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                    local var_10 = scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10) + dxGetTextWidth(string.sub(scoreboardContent[firstVisibleIndex][v.name][1], 1, v[2] - 1), fontscale(contentFont, s(1)), contentFont)
                                                    local var_12 = v[2]
                                                    local var_13 = #scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_14 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_15 = arg3 / 2 - calculateWidth() / 2 + s(10) + s(v.width)
                                                    local var_16 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont)
                                                    local var_17 = tocolor(255, 255, 255, 255)
                                                    local var_18 = fontscale(contentFont, s(1))
                                                    local var_19 = "left"
                                                    local var_20 = "top"
                                                end
                                                if useColors then
                                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                    local var_6 = s(10)
                                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                    local var_8 = s(10)
                                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                    local var_10 = scoreboardContent[firstVisibleIndex][v.name][1]
                                                    local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                    local var_12 = v[2]
                                                    local var_13 = #scoreboardContent[firstVisibleIndex][v.name][1]
                                                end
                                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_6 = s(10)
                                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                local var_8 = s(10)
                                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                local var_10 = dxGetTextWidth(string.sub(scoreboardContent[firstVisibleIndex][v.name][1], v[2], #scoreboardContent[firstVisibleIndex][v.name][1]), fontscale(contentFont, s(1)), contentFont)
                                                local var_11 = string.sub(scoreboardContent[firstVisibleIndex][v.name][1], v[2], #scoreboardContent[firstVisibleIndex][v.name][1])
                                                local var_12 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                local var_13 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_14 = arg3 / 2 - calculateWidth() / 2 + s(10) + s(v.width)
                                                local var_15 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont)
                                                local var_16 = tocolor(255, 255, 255, 255)
                                                local var_17 = fontscale(contentFont, s(1))
                                                local var_18 = "left"
                                                local var_19 = "top"
                                            end
                                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                            local var_6 = s(10)
                                            local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                            local var_8 = s(10)
                                            local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        end
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                if v.isImage then
                                    if type(scoreboardContent[firstVisibleIndex][v.name]) == "table" then
                                        if fileExists(scoreboardContent[firstVisibleIndex][v.name][1]) then
                                            if not v.imageW then
                                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_6 = s(10)
                                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                local var_8 = s(10)
                                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                local var_10 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                local var_11 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + s(1)
                                            end
                                            if not v.imageH then
                                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_6 = s(10)
                                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                local var_8 = s(10)
                                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                local var_10 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                                local var_11 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + s(1)
                                                local var_12 = v.imageW * scoreboardScale
                                            end
                                            if not (v.imageW or arg3 / 2 - calculateWidth() / 2 + s(10) + s(1)) then
                                                local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                                local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                                local var_6 = s(10)
                                                local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                                local var_8 = s(10)
                                                local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                                local var_10 = scoreboardContent[firstVisibleIndex][v.name][2]
                                                local var_11 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                            end
                                            local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                            local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                            local var_6 = s(10)
                                            local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                            local var_8 = s(10)
                                            local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        end
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                    end
                                    if not v.imageW then
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        local var_10 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                        local var_11 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + s(1)
                                    end
                                    if not v.imageH then
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        local var_10 = arg3 / 2 - calculateWidth() / 2 + s(10)
                                        local var_11 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + s(1)
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                if type(scoreboardContent[firstVisibleIndex][v.name]) == "table" then
                                    if v.name ~= "name" then
                                        scoreboardContent[firstVisibleIndex][v.name].height = scoreboardContent[firstVisibleIndex][v.name].height or dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont)
                                        scoreboardContent[firstVisibleIndex][v.name].width = scoreboardContent[firstVisibleIndex][v.name].width or dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont)
                                        scoreboardContent[firstVisibleIndex][v.name].color = scoreboardContent[firstVisibleIndex][v.name].color or tocolor(255, 255, 255, 255)
                                        scoreboardContent[firstVisibleIndex][v.name].rot = scoreboardContent[firstVisibleIndex][v.name].rot or dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont) / scoreboardContent[firstVisibleIndex][v.name].height * scoreboardContent[firstVisibleIndex][v.name].width
                                        scoreboardContent[firstVisibleIndex][v.name].rotOffX = scoreboardContent[firstVisibleIndex][v.name].rotOffX or dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont) / scoreboardContent[firstVisibleIndex][v.name].height * scoreboardContent[firstVisibleIndex][v.name].width
                                        scoreboardContent[firstVisibleIndex][v.name].rotOffY = scoreboardContent[firstVisibleIndex][v.name].rotOffY or dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont) / scoreboardContent[firstVisibleIndex][v.name].height * scoreboardContent[firstVisibleIndex][v.name].width
                                        local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                        local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                        local var_6 = s(10)
                                        local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                        local var_8 = s(10)
                                        local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                        local var_10 = scoreboardContent[firstVisibleIndex][v.name].color
                                    end
                                    local onClientResourceStart = arg3 / 2 - calculateWidth() / 2
                                    local var_5 = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                    local var_6 = s(10)
                                    local var_7 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                                    local var_8 = s(10)
                                    local var_9 = scoreboardContent[firstVisibleIndex][v.name]
                                end
                                local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                                local var_5 = s(10)
                                local var_6 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                            end
                            local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                            local var_5 = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                        end
                        local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                        local onClientPlayerQuit = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                    end
                    local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                    local onClientPlayerQuit = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                end
                local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                local onClientPlayerQuit = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
            end
            if isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
                if getElementType(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) ~= "team" then
                    local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                end
                local onClientResourceStart = arg4 / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
            end
        end
    end
end

scoreboardAddColumn = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    if type(arg1) == "string" then
        fixPrioritySlot(getNextFreePrioritySlot(scoreboardGetColumnPriority("name")))
        if not arg5 then
            local onClientResourceStart = getNextFreePrioritySlot(scoreboardGetColumnPriority("name"))
        end
        if not arg6 then
            local onClientResourceStart = getNextFreePrioritySlot(scoreboardGetColumnPriority("name"))
        end
        if MAX_PRIRORITY_SLOT >= getNextFreePrioritySlot(scoreboardGetColumnPriority("name")) then
            if getNextFreePrioritySlot(scoreboardGetColumnPriority("name")) >= 1 then
                for k, v in ipairs(scoreboardColumns) do
                    if arg1 == v.name then
                        local onClientResourceStart = getNextFreePrioritySlot(scoreboardGetColumnPriority("name"))
                    end
                    local onClientResourceStart = getNextFreePrioritySlot(scoreboardGetColumnPriority("name"))
                end
                table.insert(scoreboardColumns, onClientResourceStart)
                local function onClientPlayerQuit(arg1, arg2)
                    if arg1.priority >= arg2.priority then
                    end
                    return true
                end
                table.sort(scoreboardColumns, onClientPlayerQuit)
                if arg6 then
                    if not resourceColumns[arg6] then
                        resourceColumns[arg6] = {}
                    end
                    table.insert(resourceColumns[arg6], arg1)
                end
            end
        end
    end
    return false
end

addEvent("doScoreboardAddColumn", true)

local function sub_1001(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    scoreboardAddColumn(arg1, arg2, arg3, arg4, nil, arg5, arg6, arg7, arg8)
end

addEventHandler("doScoreboardAddColumn", getResourceRootElement(), sub_1001)

scoreboardRemoveColumn = function(arg1)
    if type(arg1) == "string" then
        for k, v in ipairs(scoreboardColumns) do
            if arg1 == v.name then
                table.remove(scoreboardColumns, k)
                for k, v in pairs(resourceColumns) do
                    table.removevalue(v, arg1)
                end
            end
        end
    end
    return false
end

addEvent("doScoreboardRemoveColumn", true)

local function sub_1002(arg1)
    scoreboardRemoveColumn(arg1)
end

addEventHandler("doScoreboardRemoveColumn", getResourceRootElement(), sub_1002)

scoreboardClearColumns = function()
    if scoreboardColumns[1] then
        table.remove(scoreboardColumns, 1)
        resourceColumns = {}
    end
    return true
end

addEvent("doScoreboardClearColumns", true)

local function sub_1003()
    scoreboardClearColumns()
end

addEventHandler("doScoreboardClearColumns", getResourceRootElement(), sub_1003)

scoreboardResetColumns = function(arg1)
    if scoreboardColumns[1] then
        table.remove(scoreboardColumns, 1)
        resourceColumns = {}
    end
    if not arg1 then
        scoreboardAddColumn("name", 200, "Имя")
        scoreboardAddColumn("ping", 40, "Пинг")
    end
    return true
end

addEvent("doScoreboardResetColumns", true)

local function sub_1004(arg1)
    if arg1 ~= nil then
    end
    scoreboardResetColumns(iif(true, true, arg1))
end

addEventHandler("doScoreboardResetColumns", getResourceRootElement(), sub_1004)

scoreboardSetForced = function(arg1)
    scoreboardForced = arg1
end

addEvent("doScoreboardSetForced", true)

local function sub_1005(arg1)
    scoreboardSetForced(arg1)
end

addEventHandler("doScoreboardSetForced", getResourceRootElement(), sub_1005)
setScoreboardForced = scoreboardSetForced

scoreboardSetSortBy = function(arg1, arg2)
    if arg1 then
        if type(arg1) == "string" then
            for k, v in ipairs(scoreboardColumns) do
                if arg1 == v.name then
                end
            end
            if false then
                sortBy.dir = iif(true, 1, -1)
            end
        end
    end
    sortBy.what = "__NONE__"
    sortBy.dir = -1
    return true
end

addEvent("doScoreboardSetSortBy", true)

local function sub_1006(arg1, arg2)
    scoreboardSetSortBy(arg1, arg2)
end

addEventHandler("doScoreboardSetSortBy", getResourceRootElement(), sub_1006)

scoreboardGetColumnPriority = function(arg1)
    if type(arg1) == "string" then
        for k, v in ipairs(scoreboardColumns) do
            if arg1 == v.name then
                return v.priority
            end
        end
    end
    return false
end

scoreboardSetColumnPriority = function(arg1, arg2)
    if type(arg1) == "string" then
        if type(arg2) == "number" then
            if MAX_PRIRORITY_SLOT >= arg2 then
                if arg2 >= 1 then
                    for k, v in ipairs(scoreboardColumns) do
                    end
                    if false then
                        scoreboardColumns[false].priority = -1
                        fixPrioritySlot(arg2)
                        local function onClientResourceStart(arg1, arg2)
                            if arg1.priority >= arg2.priority then
                            end
                            return true
                        end
                        table.sort(scoreboardColumns, onClientResourceStart)
                    end
                end
            end
        end
    end
    return false
end

addEvent("doScoreboardSetColumnPriority", true)

local function sub_1007(arg1, arg2)
    scoreboardSetColumnPriority(arg1, arg2)
end

addEventHandler("doScoreboardSetColumnPriority", getResourceRootElement(), sub_1007)

scoreboardGetColumnCount = function()
    return #scoreboardColumns
end

scoreboardSetColumnTextFunction = function(arg1, arg2)
    if type(arg1) == "string" then
        for k, v in ipairs(scoreboardColumns) do
            if arg1 == v.name then
                scoreboardColumns[k].textFunction = arg2
                return true
            end
        end
    end
    return false
end

scoreboardGetTopCornerPosition = function()
    if scoreboardDrawn then
        return math.floor(screenX / 2 - calculateWidth() / 2), math.floor(screenY / 2 - calculateHeight() / 2 - 15 + 1)
    end
    return false
end

scoreboardGetSize = function()
    if scoreboardDrawn then
        return calculateWidth(), calculateHeight()
    end
    return false
end

scoreboardGetSelectedRows = function()
    for k, v in pairs(selectedRows) do
        table.insert({}, k)
        local onClientPlayerQuit = {}
    end
    return {}
end

calculateWidth = function()
    for k, v in ipairs(scoreboardColumns) do
        local onClientResourceStart = 0 + s(v.width + 10)
    end
    return 0 + s(10)
end

calculateHeight = function()
    if not serverInfo.server then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = getMaxPerWindow()
        local onClientPlayerQuit = s(5)
    end
    if showServerInfo then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = getMaxPerWindow()
        local onClientPlayerQuit = s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if not serverInfo.gamemode then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = getMaxPerWindow()
        local onClientPlayerQuit = s(5)
    end
    if showGamemodeInfo then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = getMaxPerWindow()
        local onClientPlayerQuit = s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if firstVisibleIndex >= firstVisibleIndex + getMaxPerWindow() then
    end
    if not scoreboardContent[firstVisibleIndex] then
    end
    if scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__ then
        if isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
            local onClientResourceStart = s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + s(5) + dxGetFontHeight(fontscale(rmbFont, s(0.75)), rmbFont) + s(2)
        end
        local onClientResourceStart = s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + s(5) + dxGetFontHeight(fontscale(rmbFont, s(0.75)), rmbFont) + s(2)
    end
end

showTheCursor = function(arg1, arg2)
    if arg2 == "down" then
        showCursor(true)
    end
    if windowSettings then
    end
    showCursor(false)
end

scrollScoreboard = function(arg1, arg2, arg3)
    if not isCursorShowing() then
        return
    end
    if 1 > firstVisibleIndex then
        return
    end
    if firstVisibleIndex > #scoreboardContent - getMaxPerWindow() + 1 then
        return
    end
    if firstVisibleIndex == math.max(1, math.min(firstVisibleIndex + arg3 * serverInfo.scrollStep, #scoreboardContent - getMaxPerWindow() + 1)) then
        return
    end
    firstVisibleIndex = math.max(1, math.min(firstVisibleIndex + arg3 * serverInfo.scrollStep, #scoreboardContent - getMaxPerWindow() + 1))
    bForceUpdate = true
end

math.clamp = function(arg1, arg2, arg3)
    return math.max(arg1, math.min(arg2, arg3))
end

fromcolor = function(arg1)
    if not string.sub(string.format("%x", arg1), 1, 2) then
        local text = string.format("%x", arg1)
        local onClientResourceStart = "FF"
    end
    if not string.sub(string.format("%x", arg1), 3, 4) then
        local text = string.format("%x", arg1)
        local onClientResourceStart = string.sub(string.format("%x", arg1), 1, 2)
        local onClientPlayerQuit = "FF"
    end
    if not string.sub(string.format("%x", arg1), 5, 6) then
        local text = string.format("%x", arg1)
        local onClientResourceStart = string.sub(string.format("%x", arg1), 1, 2)
        local onClientPlayerQuit = string.sub(string.format("%x", arg1), 3, 4)
        local var_2 = "FF"
    end
    return tonumber("0x" .. string.sub(string.format("%x", arg1), 3, 4)), tonumber("0x" .. string.sub(string.format("%x", arg1), 5, 6)), tonumber("0x" .. (string.sub(string.format("%x", arg1), 7, 8) or "FF")), tonumber("0x" .. string.sub(string.format("%x", arg1), 1, 2))
end

scale = function(arg1)
    return arg1 * scoreboardScale
end

s = scale

fontscale = function(arg1, arg2)
    return arg2 * fontScale[arg1]
end

scoreboardSortFunction = function(self, arg2)
    if self[sortBy.what] then
        if type(self[sortBy.what]) == "table" then
            if sortBy.what == "name" then
            end
        end
    end
    if arg2[sortBy.what] then
        if type(arg2[sortBy.what]) == "table" then
            if sortBy.what == "name" then
                local onClientResourceStart = self[sortBy.what]
            end
            local onClientResourceStart = self[sortBy.what]
        end
        local onClientResourceStart = self[sortBy.what]
    end
    if tonumber(self[sortBy.what]) then
        local onClientResourceStart = self[sortBy.what]
        local onClientPlayerQuit = arg2[sortBy.what]
    end
    if self[sortBy.what] then
        local onClientResourceStart = arg2[sortBy.what]
    end
    if tonumber(arg2[sortBy.what]) then
        local onClientResourceStart = ""
        local onClientPlayerQuit = arg2[sortBy.what]
    end
    if arg2[sortBy.what] then
        local onClientResourceStart = ""
    end
    if type(sortBy.dir) == "number" then
        if type("") == type("") then
            local onClientResourceStart = ""
            local onClientPlayerQuit = ""
        end
        if sortBy.dir ~= 1 then
            local onClientResourceStart = string.lower(tostring(""))
            local onClientPlayerQuit = string.lower(tostring(""))
        end
        if string.lower(tostring("")) >= string.lower(tostring("")) then
            local onClientResourceStart = string.lower(tostring(""))
            local onClientPlayerQuit = string.lower(tostring(""))
        end
        if string.lower(tostring("")) >= string.lower(tostring("")) then
        end
        return iif(true, true, true)
    end
    return false
end

getMaxPerWindow = function()
    if not serverInfo.server then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY - seperationSpace * 2 - s(5)
    end
    if showServerInfo then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY - seperationSpace * 2 - s(5) - dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if not serverInfo.gamemode then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY - seperationSpace * 2 - s(5)
    end
    if showGamemodeInfo then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY - seperationSpace * 2 - s(5) - dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if not scoreboardContent[firstVisibleIndex] then
    end
    if scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__ then
        if isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
            if getElementType(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) == "team" then
                local onClientResourceStart = screenY - seperationSpace * 2 - s(5) - s(3) - s(5) - dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) - s(5) - dxGetFontHeight(fontscale(rmbFont, s(0.75)), rmbFont) - s(2)
                local var_2 = 0 + dxGetFontHeight(fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont)
            end
            local onClientResourceStart = screenY - seperationSpace * 2 - s(5) - s(3) - s(5) - dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) - s(5) - dxGetFontHeight(fontscale(rmbFont, s(0.75)), rmbFont) - s(2)
        end
        local onClientResourceStart = screenY - seperationSpace * 2 - s(5) - s(3) - s(5) - dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) - s(5) - dxGetFontHeight(fontscale(rmbFont, s(0.75)), rmbFont) - s(2)
    end
    if screenY - seperationSpace * 2 - s(5) - s(3) - s(5) - dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) - s(5) - dxGetFontHeight(fontscale(rmbFont, s(0.75)), rmbFont) - s(2) <= 0 + dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont) then
    end
    return 0 + 1
end

scoreboardClickHandler = function(arg1, arg2, arg3, arg4)
    if screenX / 2 - calculateWidth() / 2 <= arg3 and arg3 <= screenX / 2 - calculateWidth() / 2 + calculateWidth() and screenY / 2 - calculateHeight() / 2 <= arg4 and arg4 <= screenY / 2 - calculateHeight() / 2 + calculateHeight() then
        if not serverInfo.server then
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = s(10)
            local tripClient = s(5) + s(3)
        end
        if showServerInfo then
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = s(10)
            local tripClient = s(5) + s(3) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
        end
        if not serverInfo.gamemode then
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = s(10)
            local tripClient = s(5) + s(3)
        end
        if showGamemodeInfo then
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
            local lockClient = s(10)
            local tripClient = s(5) + s(3) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
        end
        for k, v in ipairs(scoreboardColumns) do
            if screenX / 2 - calculateWidth() / 2 + s(10) <= arg3 then
                if arg3 <= screenX / 2 - calculateWidth() / 2 + s(10) + s(v.width) then
                    if screenY / 2 - calculateHeight() / 2 + s(5) + s(3) <= arg4 then
                        if arg4 <= screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + dxGetFontHeight(fontscale(contentFont, scoreboardScale), contentFont) then
                            local screenX, screenY = guiGetScreenSize()
                            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
                            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
                            local var_2 = getMaxPerWindow()
                            local var_5 = s(10)
                        end
                        local screenX, screenY = guiGetScreenSize()
                        local onClientResourceStart = screenX / 2 - calculateWidth() / 2
                        local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
                        local var_2 = getMaxPerWindow()
                        local tripClient = s(10)
                    end
                    local screenX, screenY = guiGetScreenSize()
                    local onClientResourceStart = screenX / 2 - calculateWidth() / 2
                    local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
                    local var_2 = getMaxPerWindow()
                    local tripClient = s(10)
                end
                local screenX, screenY = guiGetScreenSize()
                local onClientResourceStart = screenX / 2 - calculateWidth() / 2
                local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
                local var_2 = getMaxPerWindow()
                local tripClient = s(10)
            end
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
        end
        if false then
            if sortBy.what == false then
                sortBy.dir = sortBy.dir + 2
                sortBy.what = "__NONE__"
                sortBy.dir = -1
                local screenX, screenY = guiGetScreenSize()
                local onClientResourceStart = screenX / 2 - calculateWidth() / 2
                local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
                local var_2 = getMaxPerWindow()
            end
            sortBy.what = false
            sortBy.dir = -1
            forceScoreboardUpdate = true
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenX / 2 - calculateWidth() / 2
            local onClientPlayerQuit = screenY / 2 - calculateHeight() / 2
            local var_2 = getMaxPerWindow()
        end
        textHeight = dxGetFontHeight(fontscale(sbFont, s(sbFontScale)), sbFont)
        if screenX / 2 - calculateWidth() / 2 + calculateWidth() - s(sbOutOffset + 2 * sbInOffset + 2) - textLength <= arg3 then
            if arg3 <= screenX / 2 - calculateWidth() / 2 + calculateWidth() - s(sbOutOffset + 1) then
                if screenY / 2 - calculateHeight() / 2 + calculateHeight() - s(sbOutOffset + 2 * sbInOffset + 1) - textHeight <= arg4 then
                    if arg4 <= screenY / 2 - calculateHeight() / 2 + calculateHeight() - s(sbOutOffset + 1) then
                        if windowSettings then
                            if isElement(windowSettings) then
                                local screenX, screenY = guiGetScreenSize()
                                local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                                local onClientPlayerQuit = getMaxPerWindow()
                            end
                            local screenX, screenY = guiGetScreenSize()
                            local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                            local onClientPlayerQuit = getMaxPerWindow()
                        end
                        createScoreboardSettingsWindow(screenX - 323, screenY - 350)
                        if isElement(windowSettings) then
                            destroyScoreboardSettingsWindow()
                            local screenX, screenY = guiGetScreenSize()
                            local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                            local onClientPlayerQuit = getMaxPerWindow()
                        end
                        local screenX, screenY = guiGetScreenSize()
                        local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                        local onClientPlayerQuit = getMaxPerWindow()
                    end
                    local screenX, screenY = guiGetScreenSize()
                    local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                    local onClientPlayerQuit = getMaxPerWindow()
                end
                local screenX, screenY = guiGetScreenSize()
                local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                local onClientPlayerQuit = getMaxPerWindow()
            end
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenY / 2 - calculateHeight() / 2
            local onClientPlayerQuit = getMaxPerWindow()
        end
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2
        local onClientPlayerQuit = getMaxPerWindow()
    end
    if 1 < firstVisibleIndex then
        if screenX / 2 - 8 <= arg3 then
            if arg3 <= screenX / 2 - 8 + 17 then
                if screenY / 2 - calculateHeight() / 2 - 15 <= arg4 then
                    if arg4 <= screenY / 2 - calculateHeight() / 2 - 15 + 11 then
                        scrollScoreboard(nil, nil, -1)
                        local screenX, screenY = guiGetScreenSize()
                        local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                        local onClientPlayerQuit = getMaxPerWindow()
                    end
                    local screenX, screenY = guiGetScreenSize()
                    local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                    local onClientPlayerQuit = getMaxPerWindow()
                end
                local screenX, screenY = guiGetScreenSize()
                local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                local onClientPlayerQuit = getMaxPerWindow()
            end
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenY / 2 - calculateHeight() / 2
            local onClientPlayerQuit = getMaxPerWindow()
        end
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2
        local onClientPlayerQuit = getMaxPerWindow()
    end
    if firstVisibleIndex + getMaxPerWindow() <= #scoreboardContent then
        if getMaxPerWindow() < #scoreboardContent then
            if screenX / 2 - 8 <= arg3 then
                if arg3 <= screenX / 2 - 8 + 17 then
                    if screenY / 2 - calculateHeight() / 2 + calculateHeight() + 4 <= arg4 then
                        if arg4 <= screenY / 2 - calculateHeight() / 2 + calculateHeight() + 4 + 11 then
                            scrollScoreboard(nil, nil, 1)
                            local screenX, screenY = guiGetScreenSize()
                            local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                        end
                        local screenX, screenY = guiGetScreenSize()
                        local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                    end
                    local screenX, screenY = guiGetScreenSize()
                    local onClientResourceStart = screenY / 2 - calculateHeight() / 2
                end
                local screenX, screenY = guiGetScreenSize()
                local onClientResourceStart = screenY / 2 - calculateHeight() / 2
            end
            local screenX, screenY = guiGetScreenSize()
            local onClientResourceStart = screenY / 2 - calculateHeight() / 2
        end
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2
    end
    if not serverInfo.server then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5)
    end
    if showServerInfo then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if not serverInfo.gamemode then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5)
    end
    if showGamemodeInfo then
        local screenX, screenY = guiGetScreenSize()
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + dxGetFontHeight(fontscale(serverInfoFont, scoreboardScale), serverInfoFont)
    end
    if isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) then
        if getElementType(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__) ~= "team" then
            local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
            local onClientPlayerQuit = screenX / 2 - calculateWidth() / 2
            local var_2 = calculateWidth()
            local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
        end
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
        local onClientPlayerQuit = screenX / 2 - calculateWidth() / 2
        local var_2 = calculateWidth()
        local lockClient = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
    end
    if screenX / 2 - calculateWidth() / 2 + s(5) <= arg3 then
        if arg3 <= screenX / 2 - calculateWidth() / 2 + calculateWidth() - s(5) and screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) <= arg4 then
            if arg4 <= screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont) + dxGetFontHeight(fontscale(iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont), scoreboardScale), iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont)) then
                if not selectedRows[scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__] ~= true then
                    local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                    local onClientPlayerQuit = scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__
                    local var_2 = iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont)
                end
                if triggerEvent("onClientPlayerScoreboardClick", scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__, true, arg3, arg4, false) then
                    selectedRows[scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__] = not selectedRows[scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__]
                    local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                    local onClientPlayerQuit = iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont)
                end
                local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
                local onClientPlayerQuit = iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont)
            end
            local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
            local onClientPlayerQuit = iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont)
        end
        local onClientResourceStart = screenY / 2 - calculateHeight() / 2 + s(5) + s(3) + s(5) + dxGetFontHeight(fontscale(columnFont, scoreboardScale), columnFont)
        local onClientPlayerQuit = iif(isElement(scoreboardContent[firstVisibleIndex].__SCOREBOARDELEMENT__), teamHeaderFont, contentFont)
    end
end

removeResourceScoreboardColumns = function(arg1)
    if not resourceColumns[arg1] then
        return
    end
    if resourceColumns[arg1][1] then
    end
    resourceColumns[arg1] = nil
end

addEventHandler("onClientResourceStop", getRootElement(), removeResourceScoreboardColumns)

scoreboardForceUpdate = function()
    bForceUpdate = true
    return true
end

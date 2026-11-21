-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = 0

drawScoreboard = function()
    cursorCache = {}
    if 0 < #savedRowsNext then
        savedRows = savedRowsNext
        savedRowsNext = {}
    end
    if not scoreboardDrawn then
        doDrawScoreboard(false, true, guiGetScreenSize())
        bForceUpdate = true
    end
    if 1000 >= getTickCount() - var then
    end
    bForceUpdate = false
    var = getTickCount()
    if r0 then
        if value_1 == value_3 then
            local value_1, value_2 = getRequiredRtSize()
        end
        destroyElement(r0)
        r0 = nil
        local value_1, value_2 = getRequiredRtSize()
    end
    if not r0 then
        r0 = dxCreateRenderTarget(value_1, value_2, true)
        local value_1, value_2 = getRequiredRtSize()
    end
    if r0 then
        local value_1, value_2 = getRequiredRtSize()
    end
    doDrawScoreboard(false, false, guiGetScreenSize())
    return
    end

    doDrawScoreboard(true, true, guiGetScreenSize())
    if true then
        dxSetRenderTarget(r0, true)
        drawOverGUI = false
        dxSetBlendMode("modulate_add")
        doDrawScoreboard(true, false, getRequiredRtSize())
        dxSetBlendMode("blend")
        drawOverGUI = drawOverGUI
        dxSetRenderTarget()
        local value_1, value_2 = getRequiredRtSize()
    end
    if not scoreboardDrawn then
        return
    end
    dxSetBlendMode("add")
    dxDrawImage(value_3, value_4, value_1, value_2, r0, 0, 0, 0, tocolor(255, 255, 255), drawOverGUI)
    dxSetBlendMode("blend")
end

getRequiredRtSize = function()
    return math.floor(calculateWidth()), math.floor(calculateHeight() + 30)
end

cursorCache = {}

getCursorScoreboardPosition = function(arg1)
    if #cursorCache == 0 then
        if arg1 then
            local value_1, value_2 = getCursorPosition()
            local screenX, screenY = guiGetScreenSize()
        end
        cursorCache = { value_1 * screenX, value_2 * screenY }
        local screenX, screenY = guiGetScreenSize()
        local var = { value_1 * screenX, value_2 * screenY }
        local lockClient = value_1 * screenX
        local tripClient = value_2 * screenY
    end
    return unpack(cursorCache)
end

savedRowsNext = {}
savedRows = {}

checkCursorOverRow = function(arg1, arg2, arg3, arg4, arg5)
    if isCursorShowing() then
        savedRowsNext[#savedRowsNext + 1] = {
            arg2,
            arg3,
            arg4,
            arg5,
        }
        if arg2 <= value_1 then
            if value_1 <= arg3 then
                if arg4 <= value_2 then
                    if value_2 <= arg5 then
                        return true
                    end
                end
            end
        end
    end
    return false
end

getCursorOverRow = function(arg1)
    if isCursorShowing() then
        for k, v in ipairs(savedRows) do
            if v[1] <= value_1 then
                if value_1 <= v[2] then
                    if v[3] <= value_2 then
                        if value_2 <= v[4] then
                            return k
                        end
                    end
                end
            end
        end
    end
    return false
end

if not false then
    return
end
_getElementsByType = getElementsByType
local var_1 = 4
local var_2 = 6

getElementsByType = function(arg1)
    if arg1 ~= "team" then
        return _getElementsByType(arg1)
    end
end

_getLocalPlayer = getLocalPlayer

getLocalPlayer = function(arg1)
end

_getPlayerTeam = getPlayerTeam

getPlayerTeam = function(arg1)
end

_getPlayerName = getPlayerName

getPlayerName = function(arg1)
    return tostring(arg1)
end

_getPlayerPing = getPlayerPing

getPlayerPing = function(arg1)
    return math.random(10, 100)
end

_getElementData = getElementData

getElementData = function(arg1, arg2)
    return _getElementData(localPlayer, arg2)
end

_isElement = isElement

isElement = function(arg1)
    if _isElement(arg1) then
        return _isElement(arg1)
    end
    if type(arg1) ~= "string" then
    end
    return true
end

_getElementType = getElementType

getElementType = function(arg1)
    if type(arg1) == "string" then
        if split(arg1, string.byte(" "))[1] == "player" then
            return "player"
        end
        if split(arg1, string.byte(" "))[1] == "team" then
            return "team"
        end
        local var = string.byte(" ")
        local var_1 = " "
    end
    return _getElementType(arg1)
end

_getPlayerNametagColor = getPlayerNametagColor

getPlayerNametagColor = function(arg1)
    if type(arg1) == "string" then
        if split(arg1, string.byte(" "))[2] == "1" then
            return 255, 0, 0, 255
        end
        if split(arg1, string.byte(" "))[2] == "2" then
            return 0, 255, 0, 255
        end
        if split(arg1, string.byte(" "))[2] == "3" then
            return 0, 0, 255, 255
        end
        return 255, 0, 255, 255
    end
    return _getPlayerNametagColor(arg1)
end

_getTeamColor = getTeamColor

getTeamColor = function(arg1)
    if type(arg1) == "string" then
        if split(arg1, string.byte(" "))[2] == "1" then
            return 255, 90, 90, 255
        end
        if split(arg1, string.byte(" "))[2] == "2" then
            return 90, 255, 90, 255
        end
        if split(arg1, string.byte(" "))[2] == "3" then
            return 90, 90, 255, 255
        end
        return 255, 90, 255, 255
    end
    return _getTeamColor(arg1)
end

_getTeamName = getTeamName

getTeamName = function(arg1)
    return tostring(arg1)
end

_getPlayersInTeam = getPlayersInTeam

getPlayersInTeam = function(arg1)
    if type(arg1) == "string" then
        results = {}
        local var_2 = "player %d %d"
        local lockClient = tonumber(split(arg1, string.byte(" "))[2])
    end
    return _getPlayersInTeam(arg1)
end

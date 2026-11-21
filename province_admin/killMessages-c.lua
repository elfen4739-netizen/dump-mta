-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {
    [19] = "Rocket",
    [37] = "Burnt",
    [49] = "Rammed",
    [50] = "Ranover/Helicopter Blades",
    [51] = "Explosion",
    [52] = "Driveby",
    [53] = "Drowned",
    [54] = "Fall",
    [55] = "Unknown",
    [56] = "Melee",
    [57] = "Weapon",
    [59] = "Tank Grenade",
    [63] = "Blown",
}
local var_1 = {}
local var_2 = 5
addEvent("admin:onPlayerWasted", true)

local function lockClient(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) then
        return
    end
    if getPlayerNametagText(arg1) == "-" then
        return
    end
    if not getElementData(arg1, "id") then
        return
    end
    if getPlayerTeam(arg1) then
        if value_1 and value_2 and value_3 then
            local var = getPlayerNametagText(arg1)
            local tripClient = getElementData(arg1, "id")
            local text = string.format("#%.2X%.2X%.2X", value_1, value_2, value_3)
        end
        local var = getPlayerNametagText(arg1)
        local tripClient = getElementData(arg1, "id")
        local onClientResourceStart = "#ffffff"
    end
    if isElement(arg2) then
        if getElementType(arg2) == "vehicle" then
            if isElement(getVehicleController(arg2)) then
                if getElementType(getVehicleController(arg2)) == "player" then
                    local var = getVehicleController(arg2)
                    local var_1 = getPlayerNametagText(arg1)
                    local var_2 = getElementData(arg1, "id")
                    local lockClient = "#ffffff"
                end
                local var = getPlayerNametagText(arg1)
                local var_1 = getElementData(arg1, "id")
                local var_2 = "#ffffff"
            end
            local var = getPlayerNametagText(arg1)
            local var_1 = getElementData(arg1, "id")
            local var_2 = "#ffffff"
        end
        local var = getPlayerNametagText(arg1)
        local var_1 = getElementData(arg1, "id")
        local var_2 = "#ffffff"
    end
    if isElement(arg2) then
        if getElementType(arg2) == "player" then
            if getPlayerNametagText(arg2) == "-" then
                return
            end
            if not getElementData(arg1, "id") then
                return
            end
            if getPlayerTeam(arg2) then
                if value_1 and value_2 and value_3 then
                    local var = getPlayerNametagText(arg1)
                    local tripClient = getElementData(arg1, "id")
                    local onClientResourceStart = "#ffffff"
                    local var_6 = getPlayerNametagText(arg2)
                    local var_7 = getElementData(arg2, "id")
                    local text = string.format("#%.2X%.2X%.2X", value_1, value_2, value_3)
                end
                local var = getPlayerNametagText(arg1)
                local tripClient = getElementData(arg1, "id")
                local onClientResourceStart = "#ffffff"
                local var_6 = getPlayerNametagText(arg2)
                local var_7 = getElementData(arg2, "id")
                local var_8 = "#ffffff"
            end
            local var = getPlayerNametagText(arg1)
            local var_1 = getElementData(arg1, "id")
            local var_2 = "#ffffff"
            local lockClient = getPlayerNametagText(arg2)
            local tripClient = getElementData(arg2, "id")
            local onClientResourceStart = "#ffffff"
        end
        local var = getPlayerNametagText(arg1)
        local var_1 = getElementData(arg1, "id")
        local var_2 = "#ffffff"
    end
    if not getWeaponNameFromID(arg3) and arg3 then
        local var = getPlayerNametagText(arg1)
        local var_1 = getElementData(arg1, "id")
        local var_2 = "#ffffff"
        local onClientResourceStart = var[arg3]
    end
    if not nil then
        if arg4 then
            local var = getPlayerNametagText(arg1)
            local var_1 = getElementData(arg1, "id")
            local var_2 = "#ffffff"
            local onClientResourceStart = getWeaponNameFromID(arg3)
            local var_6 = getRealTime(arg5 + 10800, false)
            local var_8 = "#a8a8a8[%02d:%02d:%02d]#ffffff %s%s (%s) #ffffff%s #a8a8a8{REASON: %s}"
            local var_9 = getRealTime(arg5 + 10800, false).hour
            local var_10 = getRealTime(arg5 + 10800, false).minute
            local var_11 = getRealTime(arg5 + 10800, false).second
            local var_12 = tostring("#ffffff")
            local var_13 = tostring(getPlayerNametagText(arg1))
            local var_14 = tostring(getElementData(arg1, "id"))
        end
        local var = getPlayerNametagText(arg1)
        local var_1 = getElementData(arg1, "id")
        local var_2 = "#ffffff"
        local onClientResourceStart = getWeaponNameFromID(arg3)
        local var_6 = getRealTime(arg5 + 10800, false)
    end
    if arg4 then
        local var = getWeaponNameFromID(arg3)
        local tripClient = "#a8a8a8[%02d:%02d:%02d]#ffffff %s%s (%s) #ffffff%s игроком %s%s (%s) #a8a8a8{REASON: %s}"
        local onClientResourceStart = getRealTime(arg5 + 10800, false).hour
        local var_6 = getRealTime(arg5 + 10800, false).minute
        local var_7 = getRealTime(arg5 + 10800, false).second
        local var_8 = tostring("#ffffff")
        local var_9 = tostring(getPlayerNametagText(arg1))
        local var_10 = tostring(getElementData(arg1, "id"))
    end
    if var_2 <= hdxGetListRowCount(var_1.list) then
        hdxRemoveListRow(var_1.list, 1, true)
        local text = string.format("#a8a8a8[%02d:%02d:%02d]#ffffff %s%s (%s) #ffffff%s игроком %s%s (%s) #a8a8a8{REASON: %s}", getRealTime(arg5 + 10800, false).hour, getRealTime(arg5 + 10800, false).minute, getRealTime(arg5 + 10800, false).second, tostring("#ffffff"), tostring(getPlayerNametagText(arg1)), tostring(getElementData(arg1, "id")), "оставлен без сознания", tostring(nil), tostring(nil), tostring(nil), tostring(getWeaponNameFromID(arg3)))
    end
    hdxAddListRow(var_1.list, string.format("#a8a8a8[%02d:%02d:%02d]#ffffff %s%s (%s) #ffffff%s игроком %s%s (%s) #a8a8a8{REASON: %s}", getRealTime(arg5 + 10800, false).hour, getRealTime(arg5 + 10800, false).minute, getRealTime(arg5 + 10800, false).second, tostring("#ffffff"), tostring(getPlayerNametagText(arg1)), tostring(getElementData(arg1, "id")), "оставлен без сознания", tostring(nil), tostring(nil), tostring(nil), tostring(getWeaponNameFromID(arg3))))
end

local function sub_1001(arg1, arg2, arg3, arg4)
    if not isElement(var_1.list) then
        return
    end
    lockClient(source, arg1, arg2, arg3, arg4)
end

addEventHandler("admin:onPlayerWasted", root, sub_1001)

local function onClientResourceStart()
    hdxSetElementRelativePosition(hdxCreateList(0, 0, 1000, 150, 0), "right", "bottom", false, 0, 200)
    hdxSetElementDisabled(hdxCreateList(0, 0, 1000, 150, 0), true)
    hdxSetElementColor(hdxCreateList(0, 0, 1000, 150, 0), STATE_ALL, tocolor(0, 0, 0, 0))
    hdxSetElementTextColor(hdxCreateList(0, 0, 1000, 150, 0), STATE_ALL, tColor.white)
    hdxSetListRowColor(hdxCreateList(0, 0, 1000, 150, 0), STATE_ALL, tocolor(0, 0, 0, 0))
    hdxSetListRowColor(hdxCreateList(0, 0, 1000, 150, 0), STATE_HOVERED, tocolor(255, 255, 255, 25))
    hdxSetElementFont(hdxCreateList(0, 0, 1000, 150, 0), "FuturaBook", 10)
    hdxSetElementTextAlign(hdxCreateList(0, 0, 1000, 150, 0), "right", "center")
    var_1.list = hdxCreateList(0, 0, 1000, 150, 0)
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

local function sub_1002()
    if not isElement(var_1.list) then
        return
    end
    hdxSetElementVisible(var_1.list, not hdxIsElementVisible(var_1.list))
end

addCommandHandler("showkillist", sub_1002)

local function sub_1003()
    if not isElement(var_1.list) then
        return
    end
    hdxClearList(var_1.list)
end

addCommandHandler("clearkilllist", sub_1003)

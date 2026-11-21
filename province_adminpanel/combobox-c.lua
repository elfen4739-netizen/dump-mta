-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}
local var_1 = {}
local var_2 = {}
addEvent("onComboboxSelect", true)

local function lockClient(arg1, arg2)
    hdxSetListSelectedRow(arg1, 0)
    var_1[arg1] = false
    if not arg2 then
        return
    end
    if not var_2[arg1] then
        return
    end
    hdxSetElementText(value_1, value_2)
end

local function tripClient(arg1)
    closeCombo()
    if not arg1 then
        return
    end
    if not var[arg1] then
        return
    end
    hdxSetElementVisible(value_3, true)
    hdxSetElementTopRenderOrder(value_3, true)
    hdxSetElementRounded(arg1, 10, 0, 10, 0)
    hdxSetElementRotation(value_2, 0)
    r0 = arg1
    if not var_1[value_3] then
        return
    end
    hdxSetListSelectedRow(value_3, var_1[value_3])
end

local var_5 = {}

local function var_6(arg1, arg2, arg3)
    lockClient(arg1)
    hdxSetListSelectedRow(arg1, arg2)
    var_1[arg1] = arg2
    if not arg3 then
        return
    end
    if not var_2[arg1] then
        return
    end
    if hdxGetListRowText(arg1, arg2) ~= "none" then
        local value_1, value_2, value_3 = unpack(var_2[arg1])
    end
    hdxSetElementText(value_1, value_2)
    if hdxGetListRowText(arg1, arg2) ~= "none" then
        local value_1, value_2, value_3 = unpack(var_2[arg1])
        local var = "onComboboxSelect"
    end
    triggerEvent("onComboboxSelect", value_3, value_2)
end

setComboboxRow = function(arg1, arg2)
    if arg2 == 0 then
        return tripClient(var_5[arg1])
    end
    if isElement(var_5[arg1]) then
        return var_6(var_5[arg1], arg2, true)
    end
    return false
end

setComboboxDeselect = function(arg1)
    if not isElement(var_5[arg1]) then
        return
    end
    lockClient(var_5[arg1], "Выбор")
end

local function onHdxElementPressed(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 then
        return
    end
    if not isElement(r0) then
        return
    end
    if value_1 == source then
        return
    end
    if value_2 == source then
        return
    end
    if value_3 == source then
        return
    end
    if source == r0 then
        return
    end
    closeCombo()
end

addEventHandler("onHdxElementPressed", root, onHdxElementPressed)

updatePositionComboBox = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(arg1) then
        return
    end
    if not var[arg1] then
        return
    end
    hdxSetElementRelativePosition(arg1, arg2, arg3, arg4, false, arg5, arg6)
    hdxSetElementRelativePosition(value_4, arg1, "left", "above", false, 0, 10)
    hdxSetElementRelativePosition(value_1, arg1, "left", "center", false, 20, 0)
    hdxSetElementRelativePosition(value_2, arg1, "right", "center", false, 13, 0)
    hdxSetElementRelativePosition(value_3, arg1, "center", "under", false, 0, 0)
end

local function var_8(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 then
        return
    end
    if source ~= this then
        if source ~= value_1 then
            local value_1, value_2, value_3 = unpack(var[this])
        end
        local value_1, value_2, value_3 = unpack(var[this])
    end
    if this == r0 then
        closeCombo()
        local value_1, value_2, value_3 = unpack(var[this])
    end
    tripClient(this)
    if source == value_3 then
        if hdxGetListSelectedRow(source) < 0 then
            lockClient(source, true)
            local var = hdxGetListSelectedRow(source)
        end
        var_6(source, hdxGetListSelectedRow(source), true)
        closeCombo()
    end
    if not r0 then
        return
    end
    if hdxGetElementData(source).scrollType then
        return
    end
    closeCombo()
end

createCombobox = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), arg8, "left", "top", false, arg1, arg2)
    hdxSetElementColor(hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), STATE_HOVERED, 3142405453)
    hdxSetElementColor(hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), STATE_PRESSED, 3142405453)
    hdxSetElementRounded(hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), 10)
    hdxSetElementRelativePosition(hdxCreateLabel(arg5, 0, 0, 4294967295, "FuturaDemi", convertFigmaFontSize(18), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel(arg5, 0, 0, 4294967295, "FuturaDemi", convertFigmaFontSize(18), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), false)
    hdxSetElementRelativePosition(hdxCreateLabel(arg6, 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(16), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), "left", "center", false, 10, 0)
    hdxSetElementDisabled(hdxCreateLabel(arg6, 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(16), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), false)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 13, 8, "assets/shape.dds", 4294967295, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), "right", "center", false, 13, 0)
    hdxSetElementColor(hdxCreateImage(0, 0, 13, 8, "assets/shape.dds", 4294967295, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_HOVERED, tocolor(255, 255, 255, 180))
    hdxSetElementColor(hdxCreateImage(0, 0, 13, 8, "assets/shape.dds", 4294967295, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_PRESSED, tocolor(255, 255, 255, 180))
    hdxSetElementRotation(hdxCreateImage(0, 0, 13, 8, "assets/shape.dds", 4294967295, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), 180)
    hdxSetElementRelativePosition(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), "center", "under", false, 0, 0)
    hdxSetElementColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_ALL, 4283256141)
    hdxSetListRowColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_HOVERED, 4282269246)
    hdxSetListRowColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_PRESSED, 3427496359)
    hdxSetListRowHeight(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), 40)
    hdxSetElementTextColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_ALL, 4290756543)
    hdxSetElementTextColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_PRESSED, 4294967295)
    hdxSetElementScrollColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_IDLE, 4283134375)
    hdxSetElementScrollColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_HOVERED, 3712709031)
    hdxSetElementScrollColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), STATE_PRESSED, 3712709031)
    hdxSetElementScrollBackVisible(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), true)
    hdxSetElementScrollBackgroundColor(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), 0)
    hdxSetElementScrollWidth(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), 5)
    hdxSetElementFont(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), "FuturaDemi", convertFigmaFontSize(16))
    hdxSetElementVisible(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), false)
    hdxSetElementScrollTabWidth(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), -4)
    hdxSetElementRounded(hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), 0, 10, 0, 10)
    var[hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)] = {
        hdxCreateLabel(arg6, 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(16), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)),
        hdxCreateImage(0, 0, 13, 8, "assets/shape.dds", 4294967295, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)),
        hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)),
        hdxCreateLabel(arg5, 0, 0, 4294967295, "FuturaDemi", convertFigmaFontSize(18), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)),
    }
    var_2[hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8))] = { hdxCreateLabel(arg6, 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(16), hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)), arg6, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8) }
    var_1[hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8))] = false
    var_5[arg7] = hdxCreateList(0, 0, arg3, 225, 10, hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8))
    addEventHandler("onHdxElementPressed", hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8), var_8)
    return hdxCreatePanel(0, 0, arg3, arg4, 4283256141, arg8)
end

updateList = function(arg1, arg2)
    if not var_5[arg1] then
        return
    end
    if not arg2 then
        return
    end
    if not next(arg2) then
        return
    end
    hdxChangeListContent(var_5[arg1], arg2)
    lockClient(var_5[arg1], true)
    if 1 < #arg2 then
        if #arg2 < 5 then
            hdxSetElementSize(var_5[arg1], value_6, hdxGetListRowHeight(var_5[arg1]) * #arg2)
            local value_1, value_2, value_3 = unpack(var_2[var_5[arg1]])
            local value_4, value_5 = unpack(var[value_3])
            local value_6, value_7 = hdxGetElementSize(var_5[arg1])
            local var = var_5[arg1]
            local var_8 = hdxGetListRowHeight(var_5[arg1])
        end
        hdxSetElementSize(var_5[arg1], value_6, hdxGetListRowHeight(var_5[arg1]) * 5)
        hdxSetElementContentHeight(var_5[arg1], hdxGetListRowHeight(var_5[arg1]) * #arg2, true)
        hdxSetElementColor(value_1, STATE_ALL, tocolor(255, 255, 255))
        hdxSetElementColor(value_3, STATE_IDLE, 4283256141)
        hdxSetElementColor(value_3, STATE_HOVERED, tocolor(64, 64, 64, 220))
        hdxSetElementColor(value_3, STATE_PRESSED, tocolor(64, 64, 64, 220))
        hdxSetElementDisabled(value_3, false)
        hdxSetElementDisabled(value_1, false)
        hdxSetElementVisible(value_5, true)
        local value_1, value_2, value_3 = unpack(var_2[var_5[arg1]])
        local value_4, value_5 = unpack(var[value_3])
        local var = var_5[arg1]
        local var_8 = 64
        local var_9 = 64
        local var_10 = 64
        local var_11 = 220
    end
    var_1[var_5[arg1]] = 1
    hdxSetListSelectedRow(var_5[arg1], 1)
    hdxSetElementText(value_1, arg2[1])
    hdxSetElementColor(value_1, STATE_ALL, tocolor(100, 100, 100))
    hdxSetElementColor(value_3, STATE_ALL, tocolor(56, 56, 56))
    hdxSetElementDisabled(value_3, true)
    hdxSetElementDisabled(value_1, true)
    hdxSetElementVisible(value_5, false)
end

closeCombo = function()
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "unpack", "hdxSetElementVisible", "hdxSetElementRounded", "hdxSetElementRotation"
    if r0 then
        if var[r0] then
            hdxSetElementVisible(value_3, false)
            hdxSetElementRotation(value_2, 180)
        end
    end
end

getComboboxName = function(arg1)
    if arg1 then
    end
    return false
        end

    end
end

getComboboxSelect = function(arg1)
    if not arg1 then
        return false
    end
    if var_5[arg1] then
        if var_1[var_5[arg1]] ~= 0 then
        end
        return false
    end
    return false
end

getComboboxElement = function(arg1)
    if not arg1 then
        return false
    end
    if var_5[arg1] then
        return var_5[arg1]
    end
    return false
end

getComboboxValue = function(arg1)
    if var_5[arg1] then
        return hdxGetListRowText(var_5[arg1], var_1[var_5[arg1]]), hdxGetListSelectedRow(var_5[arg1])
    end
    return false
end

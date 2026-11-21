-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}
local state = nil
local state_1 = nil

local function sub_1001(arg1, arg2, arg3, arg4)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), 5)
    hdxSetElementColor(hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), STATE_HOVERED, tocolor(31, 101, 114))
    hdxSetElementColor(hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), STATE_PRESSED, tocolor(31, 101, 114))
    if arg3 then
        local var = hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)
        local var_1 = hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)
    end
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), arg4, "left", "bottom", false, 32, 32)
    hdxSetElementDisabled(hdxCreateLabel(arg1, 0, 0, tocolor(255, 255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)), true)
    if not isElement(state) then
        state_1 = value_2
        state = value_1
        local var = hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)
        local lockClient = hdxCreateLabel(arg1, 0, 0, tocolor(255, 255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4))
    end
    hdxSetElementDisabled(hdxCreateImage(0, 0, 20, 20, arg2, tocolor(255, 255, 255), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 20, 20, arg2, tocolor(255, 255, 255), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), "left", "center", false, math.floor((194 - xFHD(dxGetTextWidth(arg1, state_1, state)) + 20 + 10) / 2), 0)
    hdxSetElementRelativePosition(hdxCreateLabel(arg1, 0, 0, tocolor(255, 255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), "right", "center", false, math.floor((194 - xFHD(dxGetTextWidth(arg1, state_1, state)) + 20 + 10) / 2), 0)
    return hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4), hdxCreateLabel(arg1, 0, 0, tocolor(255, 255, 255, 255), "FuturaBook", convertFigmaFontSize(18), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4)), hdxCreateImage(0, 0, 20, 20, arg2, tocolor(255, 255, 255), hdxCreatePanel(0, 0, 194, 48, tocolor(33, 35, 42), arg4))
end

local lockClient = {
    pressFunc =     function()
        if source ~= tGUI.route_end.buttonTrailer then
        end
        closeInterface()
        triggerServerEvent("trucker:cancelRoute", resourceRoot, false, false)
        if source ~= tGUI.route_end.buttonTruck then
        end
        closeInterface()
        triggerServerEvent("trucker:cancelRoute", resourceRoot, true, false)
        if source ~= tGUI.route_end.buttonClose then
            return
        end
        closeInterface()
    end,
    create =     function()
        if tGUI.route_end then
            if isElement(tGUI.route_end.window) then
                return
            end
            local var = {}
        end
        state_1 = value_2
        state = value_1
        hdxSetElementRounded(nil.window, 10)
        hdxSetElementRelativePosition(nil.window, "center", "center", false, 0, 0)
        hdxSetElementVisible(nil.window, false)
        hdxSetElementGradientColor(nil.window, tocolor(18, 18, 23, 255), tocolor(25, 25, 33, 255), true, false)
        hdxSetElementGradientColor(hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), tocolor(30, 30, 38, 255), tocolor(30, 30, 38, 0), false, false)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), 0)
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), nil.window, "left", "top", false, 0, 22)
        hdxSetElementColor(nil.buttonClose, STATE_HOVERED, tocolor(191, 32, 32))
        hdxSetElementColor(nil.buttonClose, STATE_PRESSED, tocolor(191, 32, 32))
        hdxSetElementRelativePosition(nil.buttonClose, hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), "right", "center", false, 32, 0)
        hdxSetElementRounded(nil.buttonClose, 5)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 14, 14, "images/close.dds", tocolor(255, 255, 255), nil.window), nil.buttonClose, "center", "center", false, 0, 0)
        hdxSetElementDisabled(hdxCreateImage(0, 0, 14, 14, "images/close.dds", tocolor(255, 255, 255), nil.window), true)
        hdxSetElementRelativePosition(nil.headerLabel, hdxCreatePanel(0, 0, 460, 48, tocolor(25, 25, 33, 255), nil.window), "left", "center", false, 43, 0)
        hdxSetElementDisabled(nil.headerLabel, true)
        hdxSetElementRelativePosition(nil.labelText, nil.window, "center", "top", false, 0, 88)
        hdxSetLabelWordwrapped(nil.labelText, true, 420)
        hdxSetElementTextAlign(nil.labelText, "center", "center")
        hdxSetElementDisabled(nil.labelText, true)
        var[nil.buttonTrailer] = { value_4, value_5 }
        var[nil.buttonRoute] = { value_7, value_8 }
        var[nil.buttonTruck] = { value_10, value_11 }
        var[nil.buttonAll] = { value_13, value_14 }
        tGUI.route_end = {
            window = hdxCreatePanel(0, 0, 460, 225, tocolor(21, 21, 28, 255)),
            buttonClose = hdxCreatePanel(0, 0, 32, 32, tocolor(32, 33, 40), nil.window),
            headerLabel = hdxCreateLabel("Рабочий транспорт", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(24), nil.window),
            labelText = hdxCreateLabel("Выберите, какое действие Вы хотите совершить со своим рабочим транспортом, чтобы вернуть залог.", 0, 0, tocolor(255, 255, 255, 128), "FuturaBook", convertFigmaFontSize(18), nil.window),
            buttonTrailer = value_3,
            buttonRoute = value_6,
            buttonTruck = value_9,
            buttonAll = value_12,
        }
    end,
}

lockClient.open = function(arg1)
    if tGUI.route_end then
    end
    lockClient.create()
    tInterface.route_end.update(arg1)
    hdxSetElementVisible(tGUI.route_end.window, true)
    setElementData(localPlayer, "radialMenuDisable", "showHud", false)
end

lockClient.close = function()
    hdxSetElementVisible(tGUI.route_end.window, false)
end

local function tripClient(arg1, arg2)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or nil))
    local hdxSetElementColor = data and data.hdxSetElementColor
    local tocolor = data and data.tocolor
    local hdxSetElementDisabled = data and data.hdxSetElementDisabled
    local pairs = data and data.pairs
end

lockClient.update = function(self)
    if self.rentTruck then
        if self.trailer then
            hdxSetElementVisible(tGUI.route_end.buttonRoute, false)
            hdxSetElementVisible(tGUI.route_end.buttonTruck, false)
            hdxSetElementVisible(tGUI.route_end.buttonAll, true)
            hdxSetElementVisible(tGUI.route_end.buttonTrailer, true)
            tripClient(tGUI.route_end.buttonTrailer, true)
            tripClient(tGUI.route_end.buttonTruck, true)
        end
    end
    if self.rentTruck then
        if self.rentTrailer then
            hdxSetElementVisible(tGUI.route_end.buttonRoute, true)
            hdxSetElementVisible(tGUI.route_end.buttonTruck, true)
            hdxSetElementVisible(tGUI.route_end.buttonAll, false)
            hdxSetElementVisible(tGUI.route_end.buttonTrailer, false)
            tripClient(tGUI.route_end.buttonTrailer, false)
            tripClient(tGUI.route_end.buttonTruck, true)
        end
    end
    if not self.rentTruck then
        if self.trailer then
            hdxSetElementVisible(tGUI.route_end.buttonRoute, false)
            hdxSetElementVisible(tGUI.route_end.buttonTruck, true)
            hdxSetElementVisible(tGUI.route_end.buttonAll, false)
            hdxSetElementVisible(tGUI.route_end.buttonTrailer, true)
            tripClient(tGUI.route_end.buttonTrailer, true)
            tripClient(tGUI.route_end.buttonTruck, false)
        end
    end
    if not self.rentTruck then
        if self.rentTrailer then
            hdxSetElementVisible(tGUI.route_end.buttonRoute, true)
            hdxSetElementVisible(tGUI.route_end.buttonTruck, true)
            hdxSetElementVisible(tGUI.route_end.buttonAll, false)
            hdxSetElementVisible(tGUI.route_end.buttonTrailer, false)
            tripClient(tGUI.route_end.buttonTrailer, false)
            tripClient(tGUI.route_end.buttonTruck, false)
        end
    end
    if self.rentTruck then
        if not self.rentTrailer then
            hdxSetElementVisible(tGUI.route_end.buttonRoute, false)
            hdxSetElementVisible(tGUI.route_end.buttonTruck, true)
            hdxSetElementVisible(tGUI.route_end.buttonAll, false)
            hdxSetElementVisible(tGUI.route_end.buttonTrailer, true)
            tripClient(tGUI.route_end.buttonTrailer, false)
            tripClient(tGUI.route_end.buttonTruck, true)
        end
    end
    if self.rentTruck then
        return
    end
    if self.rentTrailer then
        return
    end
    hdxSetElementVisible(tGUI.route_end.buttonRoute, false)
    hdxSetElementVisible(tGUI.route_end.buttonTruck, true)
    hdxSetElementVisible(tGUI.route_end.buttonAll, false)
    hdxSetElementVisible(tGUI.route_end.buttonTrailer, true)
    tripClient(tGUI.route_end.buttonTrailer, false)
    tripClient(tGUI.route_end.buttonTruck, false)
end

tInterface.route_end = lockClient
addEvent("trucker:clientEndRoute", true)

local function sub_1002(arg1, arg2)
    if arg1 then
        openInterface("route_end", arg2)
    end
    closeInterface("route_end")
end

addEventHandler("trucker:clientEndRoute", resourceRoot, sub_1002)

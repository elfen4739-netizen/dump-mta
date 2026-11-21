-- ByteRevenant
-- LuaQ 5.1 structured decompile

table.copy = function(arg1)
    local var = {}
    for k, v in pairs(arg1) do
        if type(v) == "table" then
            var[k] = table.copy(arg1)
        end
        var[k] = v
    end
    return var
end

colorPicker = {
    default = {
        x = 0,
        y = 0,
        width = 200,
        height = 20,
        buttonWidth = 0.38,
        testWidth = 0.59999999999999998,
        testHeight = 1,
        relative = false,
        value = "#ff0000ff",
        selectWindow = {
            width = 350,
            height = 400,
            paletteX = 18,
            paletteY = 30,
            luminanceOffset = 10,
            luminanceWidth = 15,
            alphaOffset = 42,
            alphaWidth = 15,
            rgbX = 265,
            rgbY = 300,
            rgbWidth = 50,
            rgbHeight = 21,
            hslX = 190,
            hslY = 300,
            hslWidth = 50,
            hslHeight = 21,
            historyX = 18,
            historyY = 300,
            historyWidth = 140,
            historyHeight = 80,
            noteX = 18,
            noteY = 378,
        },
    },
    constructor =     function(self)
        colorPicker.value = colorPicker.convertColorToTable((self or colorPicker.default).value)
        colorPicker.buttonWidth = self.width * colorPicker.default.buttonWidth
        colorPicker.GUI = {}
        colorPicker.children = {}
        colorPicker.selectWindow = self.selectWindow
        colorPicker.GUI.selectWindow = guiCreateWindow(screenX - self.selectWindow.width, (screenY - self.selectWindow.height) / 2, self.selectWindow.width, self.selectWindow.height, "Выбор цвета", false)
        guiSetVisible(colorPicker.GUI.selectWindow, false)
        guiWindowSetSizable(colorPicker.GUI.selectWindow, false)
        colorPicker.GUI.palette = guiCreateStaticImage(colorPicker.selectWindow.paletteX, colorPicker.selectWindow.paletteY, 256, 256, "colorpicker/palette.png", false, colorPicker.GUI.selectWindow)
        colorPicker.isSelectOpen = false
        colorPicker.children.R = guiCreateEdit(self.selectWindow.rgbX + 10, self.selectWindow.rgbY, self.selectWindow.rgbWidth, self.selectWindow.rgbHeight, tostring(colorPicker.value[1]), false, colorPicker.GUI.selectWindow)
        guiEditSetMaxLength(colorPicker.children.R, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.R, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.R, colorPicker.selectionManualInputRGB)
        colorPicker.GUI.labelR = guiCreateLabel(self.selectWindow.rgbX, self.selectWindow.rgbY + 3, 10, 20, "R", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelR, "default-bold-small")
        guiEditSetMaxLength(colorPicker.children.G, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.G, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.G, colorPicker.selectionManualInputRGB)
        colorPicker.GUI.labelG = guiCreateLabel(self.selectWindow.rgbX, self.selectWindow.rgbY + 3 + self.selectWindow.rgbHeight, 10, 20, "G", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelG, "default-bold-small")
        guiEditSetMaxLength(colorPicker.children.B, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.B, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.B, colorPicker.selectionManualInputRGB)
        colorPicker.GUI.labelB = guiCreateLabel(self.selectWindow.rgbX, self.selectWindow.rgbY + 3 + self.selectWindow.rgbHeight * 2, 10, 20, "B", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelB, "default-bold-small")
        guiEditSetMaxLength(colorPicker.children.A, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.A, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.A, colorPicker.selectionManualInputRGB)
        colorPicker.GUI.labelA = guiCreateLabel(self.selectWindow.rgbX - 30, self.selectWindow.rgbY + 3 + self.selectWindow.rgbHeight * 3, 50, 20, "Альфа", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelA, "default-bold-small")
        guiEditSetMaxLength(colorPicker.children.H, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.H, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.H, colorPicker.selectionManualInputHSL)
        colorPicker.GUI.labelH = guiCreateLabel(self.selectWindow.hslX, self.selectWindow.hslY + 3, 10, 20, "H", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelH, "default-bold-small")
        guiEditSetMaxLength(colorPicker.children.S, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.S, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.S, colorPicker.selectionManualInputHSL)
        colorPicker.GUI.labelS = guiCreateLabel(self.selectWindow.hslX, self.selectWindow.hslY + 3 + self.selectWindow.hslHeight, 10, 20, "S", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelS, "default-bold-small")
        guiEditSetMaxLength(colorPicker.children.L, 3)
        addEventHandler("onClientGUIChanged", colorPicker.children.L, colorPicker.forceNaturalAndRange)
        addEventHandler("onClientGUIChanged", colorPicker.children.L, colorPicker.selectionManualInputHSL)
        colorPicker.GUI.labelL = guiCreateLabel(self.selectWindow.hslX, self.selectWindow.hslY + 3 + self.selectWindow.hslHeight * 2, 10, 20, "L", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.labelL, "default-bold-small")
        if not colorHistory then
            colorHistory = {}
        end
        colorPicker.GUI.historyLabel = guiCreateLabel(self.selectWindow.historyX, self.selectWindow.historyY, 150, 15, "Недавно использованные:", false, colorPicker.GUI.selectWindow)
        colorPicker.GUI.noteLabel = guiCreateLabel(self.selectWindow.noteX, self.selectWindow.noteY, 200, 15, "Кликните за пределами окна, чтобы закрыть.", false, colorPicker.GUI.selectWindow)
        guiSetFont(colorPicker.GUI.noteLabel, "default-small")
        colorPicker.avoidRecursion = false
    end,
    forceNaturalAndRange =     function()
        if not tonumber(guiGetText(source)) then
            if string.gsub(guiGetText(source), "[^%d]", "") ~= guiGetText(source) then
                guiSetText(source, string.gsub(guiGetText(source), "[^%d]", ""))
                local var = guiGetText(source)
                local var_1 = string.gsub(guiGetText(source), "[^%d]", "")
            end
            local var = guiGetText(source)
            local var_1 = ""
        end
        if not tonumber(guiGetText(source)) then
            return
        end
        if math.min(math.max(tonumber(guiGetText(source)), 0), 255) == tonumber(guiGetText(source)) then
            return
        end
        guiSetText(source, tostring(math.min(math.max(tonumber(guiGetText(source)), 0), 255)))
    end,
    setValue =     function(arg1)
        colorPicker.value = colorPicker.convertColorToTable(arg1)
        colorPicker.updateTempColors()
        colorPicker.avoidRecursion = true
        colorPicker.updateSelectionWindowEdits()
        colorPicker.avoidRecursion = colorPicker.avoidRecursion
        return true
    end,
    selectionManualInputRGB =     function()
        if colorPicker.avoidRecursion then
            return
        end
        colorPicker.avoidRecursion = true
        if tonumber(guiGetText(colorPicker.children.R)) and tonumber(guiGetText(colorPicker.children.G)) and tonumber(guiGetText(colorPicker.children.B)) then
            local var = tonumber(guiGetText(colorPicker.children.R))
            local var_1 = tonumber(guiGetText(colorPicker.children.G))
            local var_2 = tonumber(guiGetText(colorPicker.children.B))
            local lockClient = tonumber(guiGetText(colorPicker.children.A))
        end
        colorPicker.avoidRecursion = false
        return
    end,
    selectionManualInputHSL =     function()
        if colorPicker.avoidRecursion then
            return
        end
        colorPicker.avoidRecursion = true
        if tonumber(guiGetText(colorPicker.children.H)) and tonumber(guiGetText(colorPicker.children.S)) then
            local var = tonumber(guiGetText(colorPicker.children.H))
            local var_1 = tonumber(guiGetText(colorPicker.children.S))
            local var_2 = tonumber(guiGetText(colorPicker.children.L))
        end
        colorPicker.avoidRecursion = false
        return
    end,
    updateSelectionWindowEdits =     function()
        guiSetText(colorPicker.children.R, tostring(colorPicker.value[1]))
        guiSetText(colorPicker.children.G, tostring(colorPicker.value[2]))
        guiSetText(colorPicker.children.B, tostring(colorPicker.value[3]))
        guiSetText(colorPicker.children.A, tostring(colorPicker.value[4]))
        guiSetText(colorPicker.children.H, tostring(math.floor(colorPicker.h * 255)))
        guiSetText(colorPicker.children.S, tostring(math.floor(colorPicker.s * 255)))
        guiSetText(colorPicker.children.L, tostring(math.floor(colorPicker.l * 256)))
    end,
    updateTempColors =     function()
        tempColors[colorPicker.currentColor].r = colorPicker.value[1]
        tempColors[colorPicker.currentColor].g = colorPicker.value[2]
        tempColors[colorPicker.currentColor].b = colorPicker.value[3]
        tempColors[colorPicker.currentColor].a = colorPicker.value[4]
    end,
    openSelect =     function(arg1)
        if colorPicker.isSelectOpen then
            return
        end
        colorPicker.currentColor = arg1
        local var = {
            tempColors[arg1].r,
            tempColors[arg1].g,
            tempColors[arg1].b,
            tempColors[arg1].a,
        }
        colorPicker.setValue(var)
        guiSetVisible(colorPicker.GUI.selectWindow, true)
        guiBringToFront(colorPicker.GUI.selectWindow)
        addEventHandler("onClientRender", getRootElement(), colorPicker.updateSelectedValue)
        addEventHandler("onClientClick", getRootElement(), colorPicker.pickColor)
        colorPicker.isSelectOpen = true
        colorPicker.pickingColor = false
        colorPicker.pickingLuminance = false
        colorPicker.pickingAlpha = false
        colorPicker.l = value_3
        colorPicker.s = value_2
        colorPicker.h = value_1
    end,
    closeSelect =     function()
        if not colorPicker.isSelectOpen then
            return
        end
        colorPicker.currentColor = nil
        guiSetVisible(colorPicker.GUI.selectWindow, false)
        removeEventHandler("onClientRender", getRootElement(), colorPicker.updateSelectedValue)
        removeEventHandler("onClientClick", getRootElement(), colorPicker.pickColor)
        colorPicker.isSelectOpen = false
        colorPicker.addCurrentColorToHistory()
    end,
    addCurrentColorToHistory =     function()
        -- ByteRevenant: synthetic fallback, structured recovery was partial
        -- recovered strings: "colorHistory", "colorPicker", "value", "table", "remove", "insert"
        if colorHistory[r3][1] == colorPicker.value[1] then
            if colorHistory[r3][2] == colorPicker.value[2] then
                if colorHistory[r3][3] == colorPicker.value[3] then
                    local var_1 = colorPicker.value[4]
                end
                local var_1 = colorPicker.value[3]
            end
            local var_1 = colorPicker.value[2]
        end
        table.remove(colorHistory)
        table.insert(colorHistory, 1, table.copy(colorPicker.value))
    end,
    updateSelectedValue =     function()
        if colorPicker.pickingColor then
            if value_3 * screenX < value_1 + colorPicker.selectWindow.paletteX then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            if value_1 + colorPicker.selectWindow.paletteX + 255 < value_3 * screenX then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            if value_4 * screenY < value_2 + colorPicker.selectWindow.paletteY then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            if value_2 + colorPicker.selectWindow.paletteY + 255 < value_4 * screenY then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            setCursorPosition(value_3 * screenX, value_4 * screenY)
            colorPicker.s = (255 - value_4 * screenY + value_2 + colorPicker.selectWindow.paletteY) / 255
            colorPicker.h = (value_3 * screenX - value_1 + colorPicker.selectWindow.paletteX) / 255
            colorPicker.avoidRecursion = true
            local var = {
                value_5 * 255,
                value_6 * 255,
                value_7 * 255,
                colorPicker.value[4],
            }
            colorPicker.setValue(var)
            colorPicker.avoidRecursion = false
            local var_8 = value_1 + colorPicker.selectWindow.paletteX
            local var_9 = value_2 + colorPicker.selectWindow.paletteY
            local var_10 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
            local var_11 = value_2 + colorPicker.selectWindow.paletteY
            local var_12 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
            local var_13 = value_2 + colorPicker.selectWindow.paletteY
        end
        if colorPicker.pickingLuminance then
            if value_4 * screenY < value_2 + colorPicker.selectWindow.paletteY then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            if value_2 + colorPicker.selectWindow.paletteY + 256 < value_4 * screenY then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            setCursorPosition(value_3 * screenX, value_4 * screenY)
            colorPicker.l = (256 - value_4 * screenY + value_2 + colorPicker.selectWindow.paletteY) / 256
            colorPicker.avoidRecursion = true
            local var = {
                value_5 * 255,
                value_6 * 255,
                value_7 * 255,
                colorPicker.value[4],
            }
            colorPicker.setValue(var)
            colorPicker.avoidRecursion = false
            local var_8 = value_1 + colorPicker.selectWindow.paletteX
            local var_9 = value_2 + colorPicker.selectWindow.paletteY
            local var_10 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
            local var_11 = value_2 + colorPicker.selectWindow.paletteY
            local var_12 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
            local var_13 = value_2 + colorPicker.selectWindow.paletteY
        end
        if colorPicker.pickingAlpha then
            if value_4 * screenY < value_2 + colorPicker.selectWindow.paletteY then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            if value_2 + colorPicker.selectWindow.paletteY + 255 < value_4 * screenY then
                local var = value_1 + colorPicker.selectWindow.paletteX
                local var_5 = value_2 + colorPicker.selectWindow.paletteY
                local var_6 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
                local var_7 = value_2 + colorPicker.selectWindow.paletteY
                local var_8 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
                local var_9 = value_2 + colorPicker.selectWindow.paletteY
            end
            setCursorPosition(value_3 * screenX, value_4 * screenY)
            colorPicker.avoidRecursion = true
            colorPicker.setValue(var)
            colorPicker.avoidRecursion = false
            local var_5 = value_1 + colorPicker.selectWindow.paletteX
            local var_6 = value_2 + colorPicker.selectWindow.paletteY
            local var_7 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset
            local var_8 = value_2 + colorPicker.selectWindow.paletteY
            local var_9 = value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset - 1
            local var_10 = value_2 + colorPicker.selectWindow.paletteY
        end
    end,
    isCursorInArea =     function(arg1, arg2, arg3, arg4, arg5, arg6)
        return true
    end,
    pickColor =     function(arg1, arg2, arg3, arg4)
        if arg1 ~= "left" then
            return
        end
        if arg2 == "down" then
            if not colorPicker.isCursorInArea(arg3, arg4, value_1, value_2, value_1 + value_3, value_2 + value_4) then
                colorPicker.closeSelect()
                local var = value_1 + colorPicker.selectWindow.historyX
                local var_5 = value_2 + colorPicker.selectWindow.historyY
                local var_6 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255, value_2 + colorPicker.selectWindow.paletteY + 255)
                local var_7 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset + colorPicker.selectWindow.luminanceWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1)
                local var_8 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset + colorPicker.selectWindow.alphaWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1 - 1)
                local var_9 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.historyX, value_2 + colorPicker.selectWindow.historyY, value_1 + colorPicker.selectWindow.historyX + colorPicker.selectWindow.historyWidth, value_2 + colorPicker.selectWindow.historyY + colorPicker.selectWindow.historyHeight)
            end
            if colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255, value_2 + colorPicker.selectWindow.paletteY + 255) then
                colorPicker.pickingColor = true
                local var = value_1 + colorPicker.selectWindow.historyX
                local var_5 = value_2 + colorPicker.selectWindow.historyY
                local var_6 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset + colorPicker.selectWindow.luminanceWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1)
                local var_7 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset + colorPicker.selectWindow.alphaWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1 - 1)
                local var_8 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.historyX, value_2 + colorPicker.selectWindow.historyY, value_1 + colorPicker.selectWindow.historyX + colorPicker.selectWindow.historyWidth, value_2 + colorPicker.selectWindow.historyY + colorPicker.selectWindow.historyHeight)
            end
            if colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.luminanceOffset + colorPicker.selectWindow.luminanceWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1) then
                colorPicker.pickingLuminance = true
                local var = value_1 + colorPicker.selectWindow.historyX
                local var_5 = value_2 + colorPicker.selectWindow.historyY
                local var_6 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset + colorPicker.selectWindow.alphaWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1 - 1)
                local var_7 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.historyX, value_2 + colorPicker.selectWindow.historyY, value_1 + colorPicker.selectWindow.historyX + colorPicker.selectWindow.historyWidth, value_2 + colorPicker.selectWindow.historyY + colorPicker.selectWindow.historyHeight)
            end
            if colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset, value_2 + colorPicker.selectWindow.paletteY, value_1 + colorPicker.selectWindow.paletteX + 255 + colorPicker.selectWindow.alphaOffset + colorPicker.selectWindow.alphaWidth + 12, value_2 + colorPicker.selectWindow.paletteY + 255 + 1 - 1) then
                colorPicker.pickingAlpha = true
                local var = value_1 + colorPicker.selectWindow.historyX
                local var_5 = value_2 + colorPicker.selectWindow.historyY
                local var_6 = colorPicker.isCursorInArea(arg3, arg4, value_1 + colorPicker.selectWindow.historyX, value_2 + colorPicker.selectWindow.historyY, value_1 + colorPicker.selectWindow.historyX + colorPicker.selectWindow.historyWidth, value_2 + colorPicker.selectWindow.historyY + colorPicker.selectWindow.historyHeight)
            end
            colorPicker.pickHistory(arg3 - value_1 + colorPicker.selectWindow.historyX, arg4 - value_2 + colorPicker.selectWindow.historyY)
        end
        if arg2 ~= "up" then
            return
        end
        if colorPicker.pickingColor then
            colorPicker.pickingColor = false
        end
        if colorPicker.pickingLuminance then
            colorPicker.pickingLuminance = false
        end
        if not colorPicker.pickingAlpha then
            return
        end
        colorPicker.pickingAlpha = false
    end,
    pickHistory =     function(arg1, arg2)
        if arg1 < 0 or arg2 - 25 < 0 then
            local var = arg2 - 25
        end
        if (colorPicker.selectWindow.historyWidth - 15) / 3 < arg1 % ((colorPicker.selectWindow.historyWidth - 15) / 3 + 5) or (colorPicker.selectWindow.historyHeight - 45) / 3 < (arg2 - 25) % ((colorPicker.selectWindow.historyHeight - 45) / 3 + 5) then
            local var = arg2 - 25
            local var_1 = (colorPicker.selectWindow.historyWidth - 15) / 3
            local var_2 = (colorPicker.selectWindow.historyHeight - 45) / 3
        end
        if math.floor(arg1 / ((colorPicker.selectWindow.historyWidth - 15) / 3 + 5)) + 1 + math.floor((arg2 - 25) / ((colorPicker.selectWindow.historyHeight - 45) / 3 + 5)) * 3 < 1 then
            return
        end
        if #colorHistory < math.floor(arg1 / ((colorPicker.selectWindow.historyWidth - 15) / 3 + 5)) + 1 + math.floor((arg2 - 25) / ((colorPicker.selectWindow.historyHeight - 45) / 3 + 5)) * 3 then
            return
        end
        colorPicker.l = value_3
        colorPicker.s = value_2
        colorPicker.h = value_1
        colorPicker.avoidRecursion = true
        colorPicker.setValue(colorHistory[math.floor(arg1 / ((colorPicker.selectWindow.historyWidth - 15) / 3 + 5)) + 1 + math.floor((arg2 - 25) / ((colorPicker.selectWindow.historyHeight - 45) / 3 + 5)) * 3])
        colorPicker.avoidRecursion = false
    end,
    convertColorToTable =     function(arg1)
        if type(arg1) == "string" then
        end
        if type(arg1) == "number" then
            if 16777215 < arg1 then
            end
        end
        if type(arg1) == "table" then
        end
        return {
        end
        if math.floor(tonumber(arg1)) < 0 then
            return 0
        end
        if 255 >= math.floor(tonumber(arg1)) then
            return math.floor(tonumber(arg1))
        end
        return 255
    end(nil[1]),
        [2] =     function(arg1)
        if not arg1 then
            return 255
        end
        if math.floor(tonumber(arg1)) < 0 then
            return 0
        end
        if 255 >= math.floor(tonumber(arg1)) then
            return math.floor(tonumber(arg1))
        end
        return 255
    end(nil[2]),
        [3] =     function(arg1)
        if not arg1 then
            return 255
        end
        if math.floor(tonumber(arg1)) < 0 then
            return 0
        end
        if 255 >= math.floor(tonumber(arg1)) then
            return math.floor(tonumber(arg1))
        end
        return 255
    end(nil[3]),
        [4] =     function(arg1)
        if not arg1 then
            return 255
        end
        if math.floor(tonumber(arg1)) < 0 then
            return 0
        end
        if 255 >= math.floor(tonumber(arg1)) then
            return math.floor(tonumber(arg1))
        end
        return 255
    end(nil[4]),
    }
    end,
    hsl2rgb =     function(arg1, arg2, arg3)
        -- ByteRevenant: synthetic fallback, structured recovery was partial
    end,
    rgb2hsl =     function(arg1, arg2, arg3)
        if math.max(arg1, arg2, arg3) == math.min(arg1, arg2, arg3) then
            local var = math.max(arg1, arg2, arg3)
            local var_1 = math.min(arg1, arg2, arg3)
            local var_2 = (math.min(arg1, arg2, arg3) + math.max(arg1, arg2, arg3)) / 2
        end
        if (math.min(arg1, arg2, arg3) + math.max(arg1, arg2, arg3)) / 2 < 0.5 then
            local var = math.max(arg1, arg2, arg3)
            local var_1 = math.min(arg1, arg2, arg3)
            local var_2 = (math.min(arg1, arg2, arg3) + math.max(arg1, arg2, arg3)) / 2
            local lockClient = math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)
        end
        if math.max(arg1, arg2, arg3) == arg1 then
            local var = math.max(arg1, arg2, arg3)
            local var_1 = (math.min(arg1, arg2, arg3) + math.max(arg1, arg2, arg3)) / 2
            local var_2 = (math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)) / (2 - math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3))
            local lockClient = math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)
        end
        if math.max(arg1, arg2, arg3) == arg2 then
            local var = (math.min(arg1, arg2, arg3) + math.max(arg1, arg2, arg3)) / 2
            local var_1 = (math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)) / (2 - math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3))
            local var_2 = math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)
        end
        return ((arg1 - arg2) / (math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)) + 4) / 6, (math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)) / (2 - math.max(arg1, arg2, arg3) - math.min(arg1, arg2, arg3)), (math.min(arg1, arg2, arg3) + math.max(arg1, arg2, arg3)) / 2
    end,
}

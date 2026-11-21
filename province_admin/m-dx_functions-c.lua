local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

roundValue = function(arg1)
    if 0.5 <= value_2 then
        local value_1, value_2 = math.modf(arg1)
    end
    return value_1
end

_x = function(arg1)
    if not arg1 then
        return false
    end
    if isFullHDHeight() then
        return arg1
    end
    if isUltraWideRatio() then
        if screenW == 3440 then
            if screenH == 1440 then
                return tonumber(getFormattedFloat(arg1 * 1.3999999999999999, 2))
            end
        end
        if arg1 < myResolutionX then
            return arg1
        end
        return arg1
    end
    return tonumber(getFormattedFloat(arg1 / myResolutionX * screenW, 2))
end

_y = function(arg1)
    if not arg1 then
        return false
    end
    if isFullHDHeight() then
        return arg1
    end
    if isUltraWideRatio() then
        if screenW ~= 3440 then
            return arg1
        end
        if screenH ~= 1440 then
            return arg1
        end
        return tonumber(getFormattedFloat(arg1 * 1.3999999999999999, 2))
    end
    if arg1 == myResolutionY then
        return screenH
    end
    return tonumber(getFormattedFloat(arg1 / myResolutionY * screenH * ratio_mul, 2))
end

xFHD = function(arg1)
    return arg1 * 1920 / screenW
end

yFHD = function(arg1)
    return arg1 * 1080 / screenH * ratio_mul
end

isCursorOnHdxElement = function(arg1)
    if not isElement(arg1) then
        return
    end
    if not isCursorShowing() then
        return
    end
    if not value_3 or not value_4 then
        local value_1, value_2 = hdxGetElementPosition(arg1)
        local value_3, value_4 = hdxGetElementSize(arg1)
    end
    if value_1 <= value_5 * screenW then
        if value_5 * screenW <= value_1 + value_3 and value_2 <= value_6 * screenH then
            if value_6 * screenH <= value_2 + value_4 then
                return true
            end
        end
    end
    return false
end

isFullHDHeight = function()
    if screenH ~= 1080 then
    end
    return true
end

isHdxRunning = function()
    if getResourceFromName("province_dx") then
    end
    return false
end

isLowVideoMemory = function()
    if dxGetStatus().VideoMemoryFreeForMTA >= 2 then
    end
    return true
end

isUltraWideRatio = function()
    if 1.3 > ratio_mul then
    end
    return true
end

hdxSetData = function(arg1, arg2, arg3)
    triggerEvent("hdxSetData", arg1, arg2, arg3)
end

hdxGetData = function(arg1, arg2)
    return exports.province_dx:hdxGetData(arg1, arg2)
end

hdxSizeTo = function(arg1, arg2, arg3, arg4, arg5)
    triggerEvent("hdxSizeTo", arg1, arg2, arg3, arg4, arg5)
end

hdxMoveTo = function(arg1, arg2, arg3, arg4, arg5)
    triggerEvent("hdxMoveTo", arg1, arg2, arg3, arg4, arg5)
end

hdxInterpolate = function(arg1, arg2, arg3, arg4, arg5)
    addEventHandler("onClientElementDestroy", function() end, function() end, false)
    addEventHandler("onClientRender", root, nil.update)
end

convertFigmaFontSize = function(arg1)
    if 1 then
    end
    return -1
end

convertToPngSprite = function(arg1, arg2, arg3)
    fileWrite(fileCreate((arg3 or "sprite") .. "." .. FORMATNAME), "PNGS")
    fileWriteInt8(fileCreate(arg3 .. "." .. FORMATNAME), FILEVERSION)
    fileWriteInt8(fileCreate(arg3 .. "." .. FORMATNAME), #fromJSON("[" .. arg2 .. "]"))
    fileClose(fileOpen(arg1))
    fileWriteInt32(fileCreate(arg3 .. "." .. FORMATNAME), #fileRead(fileOpen(arg1), fileGetSize(fileOpen(arg1))))
    for k, v in ipairs(fromJSON("[" .. arg2 .. "]")) do
        fileSetPos(fileCreate(arg3 .. "." .. FORMATNAME), 10)
        fileWriteInt16(fileCreate(arg3 .. "." .. FORMATNAME), v.x)
        fileWriteInt16(fileCreate(arg3 .. "." .. FORMATNAME), v.y)
        fileWriteInt16(fileCreate(arg3 .. "." .. FORMATNAME), v.width)
        fileWriteInt16(fileCreate(arg3 .. "." .. FORMATNAME), v.height)
        fileWriteInt16(fileCreate(arg3 .. "." .. FORMATNAME), k)
        local var = fileCreate(arg3 .. "." .. FORMATNAME)
        local var_1 = fileRead(fileOpen(arg1), fileGetSize(fileOpen(arg1)))
    end
    fileWrite(fileCreate(arg3 .. "." .. FORMATNAME), fileRead(fileOpen(arg1), fileGetSize(fileOpen(arg1))))
    fileClose(fileCreate(arg3 .. "." .. FORMATNAME))
end

getFormattedFloat = function(arg1, arg2)
    if type(arg1) == "number" then
        return string.format("%." .. 2 .. "f", arg1)
    end
    return arg1
end

getFormattedColor = function(arg1, arg2)
    if type(arg1) == "string" then
        return tocolor(value_1, value_2, value_3, 255)
    end
    if tonumber(arg1) then
        return arg1
    end
    return tColor.white
end

getFontByName = function(arg1, arg2)
    if not isHdxRunning() then
        return "default", 1
    end
    return exports.province_dx:getFontByName(arg1, arg2)
end

getFullTexturePath = function(self)
    if not isElement(self) then
        if type(self) == "string" then
            if self:sub(1, 1) == "/" then
                local var = self:sub(2)
                local var_1 = self:sub(1, 1)
            end
            if self:sub(1, 1) ~= ":" then
                return string.format(":%s/%s", getResourceName(getThisResource()), self)
            end
        end
    end
    return self
end

getColorRGBA = function(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local bitExtract = data and data.bitExtract
end

isTextValid = function(arg1, arg2, arg3)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "utf8", "len", "sub", "byte", "0-9", "float"
    if not arg1 then
    end
    if arg3 then
        if arg3 < utf8.len(arg1) then
            local var = utf8.sub(arg1, 1, arg3)
        end
    end
    if arg2 == "0-9" then
    end
    if arg2 == "float" then
    end
    if arg2 == "floatWithMinus" then
    end
    if arg2 == "a-zA-Z" then
    end
    if arg2 == "a-zA-Z0-9" then
    end
    if arg2 == "keyboardEN" then
    end
    if arg2 == "keyboardENSpace" then
    end
    if arg2 == "Nickname" then
    end
    if arg2 == "Tag" then
    end
    if arg2 == decode_hex_literal("612D7A412D5AD0B02DD0AF302D39") then
    end
    if arg2 == "KeyboardENRU+" then
    end
    if arg2 == "KeyboardENRUSpace+" then
        if 32 > utf8.byte(utf8.sub(arg1, r9, r6 + 1)) or utf8.byte(utf8.sub(arg1, r9, r6 + 1)) > 126 then
            if 1040 > utf8.byte(utf8.sub(arg1, r9, r6 + 1)) or utf8.byte(utf8.sub(arg1, r9, r6 + 1)) > 1103 then
                return false
            end
        end
    end
end

local var = "PNGS"
local var_1 = 1

readPngSprite = function(arg1)
    if fileOpen(arg1) then
        fileSetPos(fileOpen(arg1), 0)
        if fileRead(fileOpen(arg1), 4) then
            local var = fileOpen(arg1)
        end
        if fileReadInt8(fileOpen(arg1)) then
            local var = fileOpen(arg1)
        end
        fileSetPos(fileOpen(arg1), 10)
        table.insert(var, nil.frame, var_1)
        if not isElement(dxCreateTexture(fileRead(fileOpen(arg1), fileReadInt32(fileOpen(arg1))), "dxt5", true, "wrap")) then
            local var_2 = fileOpen(arg1)
            local tripClient = dxCreateTexture(fileRead(fileOpen(arg1), fileReadInt32(fileOpen(arg1))), "dxt5", true, "wrap")
        end
        fileClose(fileOpen(arg1))
        return dxCreateTexture(fileRead(fileOpen(arg1), fileReadInt32(fileOpen(arg1))), "dxt5", true, "wrap"), {}
    end
end

replaceColorAlpha = function(arg1, arg2)
    return bitReplace(arg1, arg2, 24, 8)
end

wordwrapText = function(arg1, arg2, arg3, arg4, arg5)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "arial", "dxGetTextWidth", "dxGetFontHeight", "split", "utf8", "find"
    if not arg2 then
        local var = "arial"
    end
    if value_1 then
        if 0 ~= 0 then
            local var = _x(150)
            local tripClient = dxGetTextWidth(" ", arg3, arg2)
            local var_5 = dxGetFontHeight(arg3, arg2)
            local var_10 = split("Вот\n\n\nтак", "\n")
        end
        if _x(150) < 0 + 0 + dxGetTextWidth(value_3, arg3, arg2) then
            if _x(150) < dxGetTextWidth(utf8.sub(value_3, 1, r32), arg3, arg2) then
                if 0 ~= 0 then
                    local var = _x(150)
                    local tripClient = dxGetTextWidth(" ", arg3, arg2)
                    local var_5 = dxGetFontHeight(arg3, arg2)
                    local var_9 = split("Вот\n\n\nтак", "\n")
                end
                local var = _x(150)
                local tripClient = dxGetTextWidth(" ", arg3, arg2)
                local var_5 = dxGetFontHeight(arg3, arg2)
                local var_9 = split("Вот\n\n\nтак", "\n")
            end
            local var = dxGetTextWidth(" ", arg3, arg2)
            local tripClient = dxGetFontHeight(arg3, arg2)
            local var_6 = dxGetTextWidth(value_3, arg3, arg2)
            local var_8 = "" .. "\n" .. value_3
            local var_9 = split("Вот\n\n\nтак", "\n")
        end
        if 0 ~= 0 then
            local var = dxGetFontHeight(arg3, arg2)
            local var_5 = 0 + dxGetTextWidth(" ", arg3, arg2) + dxGetTextWidth(value_3, arg3, arg2)
            local var_7 = "" .. " " .. value_3
            local var_8 = split("Вот\n\n\nтак", "\n")
        end
        local var = dxGetFontHeight(arg3, arg2)
        local var_7 = split("Вот\n\n\nтак", "\n")
    end
    if r19 < #split("Вот\n\n\nтак", "\n") then
        local var = dxGetFontHeight(arg3, arg2)
        local var_5 = "" .. "\n"
    end
    return "", dxGetFontHeight(arg3, arg2) * 1, dxGetFontHeight(arg3, arg2), 1
end

hdxGetElementData = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if hdxGetData(arg1, "data", false) then
        return hdxGetData(arg1, "data", false)
    end
    return {}
end

hdxGetElementDebugName = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "debugName", false)
end

hdxGetElementPosition = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if not arg2 then
    end
    if type(hdxGetData(arg1, "position", false)) == "table" then
        return hdxGetData(arg1, "position", false).x, hdxGetData(arg1, "position", false).y
            end
        end

    end

    return false
end

hdxGetElementRenderTarget = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "renderTarget", false)
end

hdxGetElementSize = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if type(hdxGetData(arg1, "size", false)) == "table" then
        return hdxGetData(arg1, "size", false).w, hdxGetData(arg1, "size", false).h
    end
    return false
end

hdxGetElementSnapMode = function(arg1)
    if isElement(arg1) then
    end
    return false
end

hdxGetElementState = function(arg1)
    if isElement(arg1) then
    end
    return false
end

hdxGetElementText = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "data", false).text
end

hdxGetElementWebBrowser = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "browser", false)
end

hdxIsElementCached = function(arg1)
    if not isElement(arg1) then
        return
    end
    if not isHdxRunning() then
        return
    end
    return exports.province_dx:hdxIsElementCached(arg1)
end

hdxIsElementDisabled = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "disabled", false)
end

hdxIsElementDragable = function(arg1)
    if isElement(arg1) then
        return hdxGetData(arg1, "dragable", false)
    end
    return false
end

hdxIsElementVisible = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "visible", false)
end

hdxSetElementBezierMiddlePoint = function(arg1, arg2, arg3)
    if arg1 then
    end
    return false
end

hdxSetElementColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    hdxGetData(arg1, "color", false)[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "color", hdxGetData(arg1, "color", false), false)
end

hdxAutoHeightContents = function(arg1)
    triggerEvent("dx:autoHeightToContents", arg1)
    return
end

hdxSetElementContentHeight = function(arg1, arg2, arg3)
    if isElement(arg1) then
    end
    return false
    end

    hdxGetData(arg1, "data", false).contentH = _y(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementContentWidth = function(arg1, arg2)
    if isElement(arg1) then
    end
    return false
end

hdxSetElementDebugName = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxSetData(arg1, "debugName", arg2, false)
end

hdxSetElementDisabled = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxSetData(arg1, "disabled", arg2, false)
end

hdxSetElementDragable = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxSetData(arg1, "dragable", arg2, false)
end

hdxSetElementFont = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).fontName = arg2
    hdxGetData(arg1, "data", false).fontSize = arg3
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementAdditionalFont = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).addFontName = arg2
    hdxGetData(arg1, "data", false).addFontSize = arg3
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementGaps = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    hdxGetElementData(arg1).gapW = 0
    hdxGetElementData(arg1).gapH = 0
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    if getElementType(arg1) ~= "hdxGridlist" then
        return
    end
    hdxCountGridlistContentWidth(arg1)
end

hdxSetElementGradientColor = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        hdxGetData(arg1, "color", false)[STATE_IDLE] = getFormattedColor(arg2)
        hdxGetData(arg1, "color", false)[STATE_HOVERED] = getFormattedColor(arg2)
        hdxGetData(arg1, "color", false)[STATE_PRESSED] = getFormattedColor(arg2)
        hdxSetData(arg1, "color", hdxGetData(arg1, "color", false), false)
    end
    if not arg3 then
        return
    end
    if arg4 then
        local var = "gradientColor"
    end
    if arg5 then
        local var = "gradientColor"
    end
    hdxSetData(arg1, "gradientColor", { getFormattedColor(arg3), false, false }, false)
end

hdxSetElementHoverAnim = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(arg1) then
        return false
    end
    if not hdxGetData(arg1, "data", false) then
        local var = {}
    end
    if arg2 then
        hdxGetData(arg1, "data", false).hoverAnim = true
        hdxGetData(arg1, "data", false).hoverAnimForcedW = 1.2
        hdxGetData(arg1, "data", false).hoverAnimForcedH = 1.2
        hdxGetData(arg1, "data", false).hoverAnimTime = 200
        hdxGetData(arg1, "data", false).hoverAnimAngle = arg6
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).hoverAnim = nil
    hdxGetData(arg1, "data", false).hoverAnimForcedW = nil
    hdxGetData(arg1, "data", false).hoverAnimForcedH = nil
    hdxGetData(arg1, "data", false).hoverAnimTime = nil
    hdxGetData(arg1, "data", false).hoverAnimAngle = nil
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementImage = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if hdxGetElementData(arg1).image then
        if isElement(hdxGetElementData(arg1).image) then
            if not hdxGetElementData(arg1).keepImage then
                destroyElement(hdxGetElementData(arg1).image)
                local var = hdxGetElementData(arg1)
            end
            local var = hdxGetElementData(arg1)
        end
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).image = arg2
    if arg3 and arg4 then
        hdxGetElementData(arg1).imageW = _x(arg3)
        hdxGetElementData(arg1).imageH = _y(arg4)
        local var = hdxGetElementData(arg1)
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxGetElementTexture = function(arg1)
    if isElement(arg1) then
    end
    return false
end

local var_2 = {
    "Linear",
    "Bezier",
    "InQuad",
    "OutQuad",
    "InOutQuad",
    "OutInQuad",
    "InElastic",
    "OutElastic",
    "InOutElastic",
    "OutInElastic",
    "InBack",
    "OutBack",
    "InOutBack",
    "OutInBack",
    "InBounce",
    "OutBounce",
    "InOutBounce",
    "OutInBounce",
    "SineCurve",
    "CosineCurve",
    [nil.OutQuad] = true,
    ["OutQuad"] = nil,
}

hdxSetElementMotionData = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    if not arg1 then
        return false
    end
    if not var_2[arg7] then
        local var = "Linear"
    end
    if not hdxGetData(arg1, "data", false).motion then
        hdxGetData(arg1, "data", false).motion = {}
        local value_1, value_2 = hdxGetElementPosition(arg1)
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).motion = {
        looped = false,
        startpoint = { x = _x(value_1), y = _y(value_2) },
        endpoint = { x = _x(arg4), y = _y(arg5) },
        durationMs = 1000,
        easingType = "Linear",
    }
    if arg7 == "Bezier" then
        hdxGetData(arg1, "data", false).motion.midPoint = { x = _x((tonumber(arg8) or hdxGetData(arg1, "data", false))), y = _y(arg3) }
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).motionEnabled = true
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementMotionEnabled = function(arg1, arg2)
    if isElement(arg1) then
    end
    return false
    end

    exports.province_dx:hdxSetElementMotionEnabled(arg1, false)
end

hdxSetElementPosition = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
end

local function sub_1001()
    if isElement(nil[2]) then
        local var = { r2 }
        local var_1 = nil[1]
        local var_2 = nil[2]
    end
    if not isElement(nil[1]) then
        return false
    end
    if hdxIsElementCached(nil[1]) then
        if isElement(nil[2]) == hdxIsElementCached(nil[2]) then
            exports.province_dx:hdxSetElementRelativePosition(nil[1], nil[2], nil[2], nil[2 + 1], nil[2 + 2], nil[2 + 3], nil[2 + 4])
            local var = nil[1]
            local var_1 = nil[2]
            local var_2 = nil[2]
            local lockClient = nil[2 + 1]
            local tripClient = nil[2 + 2]
            local var_5 = nil[2 + 3]
            local var_6 = nil[2 + 4]
        end
        local var = nil[1]
        local var_1 = nil[2]
        local var_2 = nil[2]
        local lockClient = nil[2 + 1]
        local tripClient = nil[2 + 2]
        local var_5 = nil[2 + 3]
        local var_6 = nil[2 + 4]
    end
    if getElementType(nil[1]) ~= "hdxLabel" then
        local var = nil[1]
        local var_1 = nil[2]
        local var_2 = nil[2]
        local lockClient = nil[2 + 1]
        local tripClient = nil[2 + 2]
        local var_5 = nil[2 + 3]
        local var_6 = nil[2 + 4]
    end
    local var = {
        nil[2],
        nil[2],
        nil[2 + 1],
        nil[2 + 2],
        nil[2 + 3],
        nil[2 + 4],
    }
    hdxSetData(nil[1], "relativeAlign", var, false)
    if isElement(nil[2]) then
        if getElementType(nil[2]) == "hdxSpace" then
            if getElementParent(nil[1]) == nil[2] then
                local value_3, value_4 = hdxGetElementSize(nil[1])
                local var_9 = nil[1]
                local var_10 = nil[2]
                local var_11 = nil[2 + 1]
                local var_12 = nil[2 + 2]
                local var_13 = nil[2 + 3]
                local var_14 = nil[2 + 4]
            end
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_9 = nil[1]
            local var_10 = nil[2]
            local var_11 = nil[2 + 1]
            local var_12 = nil[2 + 2]
            local var_13 = nil[2 + 3]
            local var_14 = nil[2 + 4]
        end
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_9 = nil[1]
        local var_10 = nil[2]
        local var_11 = nil[2 + 1]
        local var_12 = nil[2 + 2]
        local var_13 = nil[2 + 3]
        local var_14 = nil[2 + 4]
    end
    if nil[2 + 3] == "self" then
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_5 = nil[1]
        local var_6 = nil[2]
        local var_7 = nil[2 + 1]
        local var_8 = nil[2 + 2]
        local var_9 = nil[2 + 4]
    end
    if nil[2 + 4] == "self" then
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_5 = nil[1]
        local var_6 = nil[2]
        local var_7 = nil[2 + 1]
        local var_8 = nil[2 + 2]
        local var_9 = 0
    end
    if not screenH then
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_5 = nil[1]
        local var_6 = nil[2]
        local var_7 = nil[2 + 1]
        local var_8 = nil[2 + 2]
        local var_9 = 0
        local var_10 = 0
        local var_11 = 0
        local var_12 = 0
        local var_13 = 0
        local var_14 = 0
    end
    if type(nil[2]) == "number" then
        if nil[2 + 2] then
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2]
            local var_7 = nil[2 + 1]
            local var_8 = nil[2 + 2]
            local var_9 = 0
            local var_10 = 0
            local var_11 = 0
            local var_12 = 0
            local var_13 = 0
        end
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_5 = nil[1]
        local var_6 = _x(nil[2])
        local var_7 = nil[2 + 1]
        local var_8 = nil[2 + 2]
        local var_9 = 0
        local var_10 = 0
        local var_11 = 0
        local var_12 = 0
        local var_13 = 0
    end
    if type(nil[2]) == "string" then
        if nil[2] == "center" then
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2]
            local var_7 = nil[2 + 1]
            local var_8 = nil[2 + 2]
            local var_9 = 0
            local var_10 = 0
            local var_11 = 0
            local var_12 = 0
            local var_13 = 0
        end
        if nil[2] == "left" then
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2]
            local var_7 = nil[2 + 1]
            local var_8 = nil[2 + 2]
            local var_9 = 0
            local var_10 = 0
            local var_11 = 0
            local var_12 = 0
            local var_13 = 0
        end
        if nil[2] == "right" then
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2]
            local var_7 = nil[2 + 1]
            local var_8 = nil[2 + 2]
            local var_9 = 0
            local var_10 = 0
            local var_11 = 0
            local var_12 = 0
            local var_13 = 0
        end
        if nil[2] == "atright" then
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2]
            local var_7 = nil[2 + 1]
            local var_8 = nil[2 + 2]
            local var_9 = 0
            local var_10 = 0
            local var_11 = 0
            local var_12 = 0
        end
        if nil[2] == "atleft" then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2 + 1]
            local var_7 = nil[2 + 2]
            local var_8 = 0
            local var_9 = 0
        end
        local value_1, value_2 = hdxGetElementPosition(nil[1])
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_5 = nil[1]
        local var_6 = nil[2 + 1]
        local var_7 = nil[2 + 2]
        local var_8 = 0
        local var_9 = 0
    end
    if type(nil[2 + 1]) == "number" then
        if nil[2 + 1] < 0 then
            if nil[2 + 2] then
                local value_1, value_2 = hdxGetElementPosition(nil[1])
                local value_3, value_4 = hdxGetElementSize(nil[1])
                local var_5 = nil[1]
                local var_6 = nil[2 + 1]
                local var_7 = nil[2 + 2]
                local var_8 = 0
                local var_9 = 0
            end
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = _y(nil[2 + 1])
            local var_7 = nil[2 + 2]
            local var_8 = 0
            local var_9 = 0
        end
        if nil[2 + 2] then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2 + 1]
            local var_7 = 0
            local var_8 = 0
        end
        local value_1, value_2 = hdxGetElementPosition(nil[1])
        local value_3, value_4 = hdxGetElementSize(nil[1])
        local var_5 = nil[1]
        local var_6 = _y(nil[2 + 1])
        local var_7 = 0
        local var_8 = 0
    end
    if type(nil[2 + 1]) == "string" then
        if nil[2 + 1] == "center" then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2 + 1]
            local var_7 = 0
            local var_8 = 0
        end
        if nil[2 + 1] == "top" then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2 + 1]
            local var_7 = 0
            local var_8 = 0
        end
        if nil[2 + 1] == "bottom" then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2 + 1]
            local var_7 = 0
            local var_8 = 0
        end
        if nil[2 + 1] == "under" then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local value_3, value_4 = hdxGetElementSize(nil[1])
            local var_5 = nil[1]
            local var_6 = nil[2 + 1]
            local var_7 = 0
            local var_8 = 0
        end
        if nil[2 + 1] == "above" then
            local value_1, value_2 = hdxGetElementPosition(nil[1])
            local var_5 = nil[1]
        end
        local value_1, value_2 = hdxGetElementPosition(nil[1])
        local var_5 = nil[1]
    end
    hdxSetElementPosition(nil[1], roundValue(value_1), roundValue(value_2))
    if getElementType(nil[1]) == "hdxScroll" then
        return
    end
    if getElementType(getElementParent(nil[1])) == "hdxRoot" then
        return
    end
    if getElementType(getElementParent(nil[1])) ~= "hdxSpace" then
        local var_7 = nil[1]
        local var_8 = roundValue(value_1) - value_5
        local var_9 = roundValue(value_2) - value_6
    end
    hdxSetData(nil[1], "offsets", { x = math.floor(roundValue(value_1)), y = math.floor(roundValue(value_2)) }, false)
end

hdxSetElementRelativePosition = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end

hdxSetElementRenderOrder = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not isHdxRunning() then
        return
    end
    exports.province_dx:hdxSetElementRenderOrder(arg1, arg2)
end

hdxSetElementRotation = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if not tonumber(arg2) then
        return false
    end
    (hdxGetData(arg1, "data", false) or {}).rotation = tonumber(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementAutoRotation = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).bAutoRotation = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementRounded = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if not arg3 then
    end
    hdxSetData(arg1, "roundedCorners", { _x(arg2) }, false)
end

hdxSetElementRowSelectingDisabled = function(arg1, arg2)
    if arg1 then
    end
    return false
end

hdxSetElementShowingWithHud = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if not hdxGetData(arg1, "data", false) then
        local var = {}
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).showingWithHud = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementSize = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
end

hdxSetElementSlotRounded = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if not arg3 then
        local var = 10
        local var_1 = 10
        local var_2 = 10
        local lockClient = 10
    end
    hdxGetData(arg1, "data", false).innerRadius = { _x(10) }
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementSnapMode = function(arg1, arg2, arg3, arg4)
    if isElement(arg1) then
        if isHdxRunning() then
        end
    end
    return false
end

hdxSetElementSortEnabled = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if arg2 then
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).sortEnabled = false
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetElementState = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxSetData(arg1, "state", arg2, false)
end

hdxSetElementTabs = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        hdxGetElementData(arg1).tabW = 0
        local var = hdxGetElementData(arg1)
    end
    if arg3 then
        hdxGetElementData(arg1).tabH = 0
        local var = hdxGetElementData(arg1)
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    if getElementType(arg1) ~= "hdxGridlist" then
        return
    end
    hdxCountGridlistContentWidth(arg1)
end

hdxSetElementText = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxGetData(arg1, "data", false).text = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementTextAlign = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    if arg2 ~= "center" and arg2 ~= "left" then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).textHorizontalAlign = arg2
    if arg3 ~= "center" and arg3 ~= "bottom" then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).textVerticalAlign = arg3
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementTextColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    if arg2 == STATE_ALL then
        hdxGetData(arg1, "data", false).textColor[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).textColor[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).textColor[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).textColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementTextTabWidth = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
    end
    hdxGetData(arg1, "data", false).textTabW = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementTextTabHeight = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
    end
    hdxGetData(arg1, "data", false).textTabH = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementTopRenderOrder = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    (hdxGetData(arg1, "data", false) or {}).topOrder = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementVisible = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxSetData(arg1, "visible", arg2, false)
end

hdxGetAnimationFrame = function(arg1)
    if isElement(arg1) then
    end
    return false
    end

    return exports.province_dx:hdxGetAnimationFrame(arg1)
end

hdxGetSpritesheetFromFile = function(arg1)
    if not fileExists(arg1) then
        return
    end
    if fileOpen(arg1, true) then
        fileClose(fileOpen(arg1, true))
        return fileRead(fileOpen(arg1, true), fileGetSize(fileOpen(arg1, true)))
    end
    return false
end

hdxResetAnimation = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if getElementType(arg1) ~= "hdxAnimSprite" then
        return false
    end
    hdxGetData(arg1, "data").currentFrame = 1
    hdxGetData(arg1, "data").frameTime = 0
    hdxSetData(arg1, "data", hdxGetData(arg1, "data"), false)
end

hdxSetAnimationFrame = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    if getElementType(arg1) ~= "hdxAnimSprite" then
        return false
    end
    if not tonumber(arg2) or tonumber(arg2) < 0 then
        return false
    end
    if #hdxGetData(arg1, "data").spritesheet < tonumber(arg2) then
        return false
    end
    if arg3 then
        local var = tonumber(arg2)
        local var_1 = hdxGetData(arg1, "data")
    end
    hdxGetData(arg1, "data").paused = false
    hdxGetData(arg1, "data").currentFrame = tonumber(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data"), false)
end

local tripClient = { "loop", "once", "once_paused" }

hdxSetAnimationMode = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if getElementType(arg1) ~= "hdxAnimSprite" then
        return false
    end
    if tonumber(arg2) then
        local var = tonumber(arg2)
    end
    return false
    end

    hdxGetData(arg1, "data").animMode = tonumber(arg2)
    hdxGetData(arg1, "data").currentFrame = 1
    hdxGetData(arg1, "data").frameTime = 0
    hdxSetData(arg1, "data", hdxGetData(arg1, "data"), false)
end

hdxSetAnimationPaused = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if getElementType(arg1) ~= "hdxAnimSprite" then
        return false
    end
    if hdxGetData(arg1, "data").paused == arg2 then
        return false
    end
    hdxGetData(arg1, "data").paused = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data"), false)
end

hdxBrowserLoadURL = function(arg1, arg2, arg3, arg4)
    if isElement(arg1) then
    end
    return false
end

hdxAddChatMessage = function(arg1, arg2, arg3, arg4, arg5)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    exports.province_dx:hdxAddChatMessage(arg1, arg2, false, arg4, arg5)
end

hdxSetChatCloudColor = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return false
    end
    if getElementType(arg1) ~= "hdxChat" then
        return false
    end
    if not (hdxGetData(arg1, "data") or {}).cloudColors then
        hdxGetData(arg1, "data").cloudColors = { tocolor(230, 230, 230, 255) }
        local var = hdxGetData(arg1, "data")
    end
    if arg2 then
        hdxGetData(arg1, "data").cloudColors[1] = getFormattedColor(arg2)
        local var = hdxGetData(arg1, "data")
    end
    if arg3 then
        hdxGetData(arg1, "data").cloudColors[2] = getFormattedColor(arg3)
        local var = hdxGetData(arg1, "data")
    end
    if arg4 then
        hdxGetData(arg1, "data").cloudColors[3] = getFormattedColor(arg4)
        local var = hdxGetData(arg1, "data")
    end
    hdxSetData(arg1, "data", hdxGetData(arg1, "data"), false)
end

hdxSetChatTextColor = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return false
    end
    if getElementType(arg1) ~= "hdxChat" then
        return false
    end
    if not (hdxGetData(arg1, "data") or {}).chatColors then
        hdxGetData(arg1, "data").chatColors = { tocolor(34, 34, 34) }
        local var = hdxGetData(arg1, "data")
    end
    if arg2 then
        hdxGetData(arg1, "data").chatColors[1] = getFormattedColor(arg2)
        local var = hdxGetData(arg1, "data")
    end
    if arg3 then
        hdxGetData(arg1, "data").chatColors[2] = getFormattedColor(arg3)
        local var = hdxGetData(arg1, "data")
    end
    if arg4 then
        hdxGetData(arg1, "data").chatColors[3] = getFormattedColor(arg4)
        local var = hdxGetData(arg1, "data")
    end
    hdxSetData(arg1, "data", hdxGetData(arg1, "data"), false)
end

hdxIsCheckboxChecked = function(arg1)
    if isElement(arg1) then
    end
    return false
end

hdxSetCheckboxAlwaysShowCheck = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).bAlwaysShowCheck = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetCheckboxCheckColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    if arg2 == STATE_ALL then
        hdxGetData(arg1, "data", false).checkColor[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).checkColor[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).checkColor[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).checkColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetCheckboxCheckCheckedColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    if arg2 == STATE_ALL then
        hdxGetData(arg1, "data", false).checkColorChecked[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).checkColorChecked[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).checkColorChecked[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).checkColorChecked[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetCheckboxCheckedColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    if arg2 == STATE_ALL then
        hdxGetData(arg1, "data", false).checkedColors[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).checkedColors[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).checkedColors[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).checkedColors[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetCheckboxChecked = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).checked = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxDeactivateActiveEditbox = function()
    if not isHdxRunning() then
        return false
    end
    return exports.province_dx:hdxDeactivateActiveEditbox()
end

hdxGetEditboxText = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if not isHdxRunning() then
        return ""
    end
    return exports.province_dx:hdxGetEditboxText(arg1)
end

hdxIsEditboxActive = function()
    if not isHdxRunning() then
        return false
    end
    return exports.province_dx:hdxIsEditboxActive()
end

hdxIsEditboxMasked = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if not isHdxRunning() then
        return ""
    end
    return exports.province_dx:hdxIsEditboxMasked(arg1)
end

hdxSetEditboxAllowedChars = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if getElementType(arg1) ~= "hdxEditbox" then
        return
    end
    hdxGetData(arg1, "data", false).allowedChars = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetEditboxMasked = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if not isHdxRunning() then
        return ""
    end
    if arg2 then
    end
    return exports.province_dx:hdxSetEditboxMasked(arg1, false)
end

hdxSetEditboxMultistring = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).multiString = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetEditboxPlaceholderColor = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    if not hdxGetElementData(arg1).placeholderColor then
        hdxGetElementData(arg1).placeholderColor = {}
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetElementData(arg1)
    end
    if arg2 == STATE_ALL then
        hdxGetElementData(arg1).placeholderColor[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetElementData(arg1).placeholderColor[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetElementData(arg1).placeholderColor[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).placeholderColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetEditboxText = function(arg1, arg2)
    if isElement(arg1) then
    end
    return false
end

hdxSetEditboxTextAlign = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 ~= "left" then
        if arg2 ~= "center" then
            if arg2 ~= "right" then
                return false
            end
        end
    end
    hdxGetData(arg1, "data", false).textAlign = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxClearGridFantomSlot = function(arg1)
    if not isElement(arg1) then
        return
    end
    if not isHdxRunning() then
        return
    end
    exports.province_dx:hdxClearGridFantomSlot(arg1)
end

hdxGetGridColumnCount = function(arg1)
    if isElement(arg1) then
        if isHdxRunning() then
            return exports.province_dx:hdxGetGridColumnCount(arg1)
        end
    end
end

hdxGetGridRowCount = function(arg1)
    if isElement(arg1) then
        if isHdxRunning() then
            return exports.province_dx:hdxGetGridRowCount(arg1)
        end
    end
end

hdxGetGridSlotData = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if not hdxGetElementData(arg1).slotW then
        local value_1, value_2 = hdxGetElementPosition(arg1)
        local value_3, value_4 = hdxGetElementSize(arg1)
        local var = hdxGetElementData(arg1)
        local var_5 = hdxGetElementData(arg1).tabW
        local var_6 = hdxGetElementData(arg1).tabH
        local var_7 = hdxGetElementData(arg1).gapW
        local var_8 = hdxGetElementData(arg1).gapH
        local var_9 = hdxGetElementData(arg1).rows
        local var_10 = hdxGetElementData(arg1).columns
        local var_11 = (value_3 - hdxGetElementData(arg1).tabW * 2 - hdxGetElementData(arg1).gapW * (hdxGetElementData(arg1).columns - 1)) / hdxGetElementData(arg1).columns
    end
    return value_1 + hdxGetElementData(arg1).tabW + (hdxGetElementData(arg1).slotW + hdxGetElementData(arg1).gapW) * ((arg2 - 1) % hdxGetElementData(arg1).columns + 1 - 1), value_2 + hdxGetElementData(arg1).tabH + ((hdxGetElementData(arg1).slotH or (value_4 - hdxGetElementData(arg1).tabH * 2 - hdxGetElementData(arg1).gapH * (hdxGetElementData(arg1).rows - 1)) / hdxGetElementData(arg1).rows) + hdxGetElementData(arg1).gapH) * (math.ceil(arg2 / hdxGetElementData(arg1).columns) - 1), hdxGetElementData(arg1).slotW, hdxGetElementData(arg1).slotH
end

hdxSetGridChessColorMode = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).bChessFillColor = false
    hdxGetData(arg1, "data", false).chessColor1 = getFormattedColor(arg3, tColor.black)
    hdxGetData(arg1, "data", false).chessColor2 = getFormattedColor(arg4)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridColumnCount = function(arg1, arg2)
    if not isElement(arg1) or not tonumber(arg2) then
        return false
    end
    hdxGetElementData(arg1).columns = tonumber(arg2)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridCustomSlotColors = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxSetData(arg1, "customColors", arg2, false)
end

hdxSetGridFantomSlotSize = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
end

hdxSetGridRowCount = function(arg1, arg2)
    if not isElement(arg1) or not tonumber(arg2) then
        return false
    end
    hdxGetElementData(arg1).rows = tonumber(arg2)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridSlotColor = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    if arg2 == STATE_ALL then
        hdxGetElementData(arg1).slotColor[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetElementData(arg1).slotColor[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetElementData(arg1).slotColor[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).slotColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSnapElementToGridSlot = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return
    end
    if not isHdxRunning() then
        return
    end
    exports.province_dx:hdxSnapElementToGridSlot(arg1, arg2, arg3, arg4)
end

hdxSetGridSize = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    hdxGetElementData(arg1).rows = (tonumber(arg2) or 2)
    hdxGetElementData(arg1).columns = (tonumber(arg3) or 2)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridSlotSize = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
end

hdxClearGridlist = function(arg1)
    if not isElement(arg1) then
        return
    end
    hdxGetElementData(arg1).tRowContent = {}
    hdxGetElementData(arg1).rows = 0
    hdxGetElementData(arg1).contentH = 0
    hdxGetElementData(arg1).selectedRow = 0
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxCountGridlistContentWidth = function(arg1)
    hdxGetElementData(arg1).contentW = hdxGetElementData(arg1).tabW + hdxGetElementData(arg1).tColumnW[hdxGetElementData(arg1)] + hdxGetElementData(arg1).tGapW[hdxGetElementData(arg1)]
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxGetGridlistRowKey = function(arg1, arg2)
    if isElement(arg1) then
    end
    return false
end

hdxGetGridlistSelectedRow = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if not isHdxRunning() then
        return 0
    end
    return exports.province_dx:hdxGetListSelectedRow(arg1)
end

hdxInsertGridlistColumn = function(arg1, arg2, arg3, arg4, arg5)
    if not tonumber(arg2) then
        local var = hdxGetElementData(arg1).columns + 1
        local var_1 = hdxGetElementData(arg1)
    end
    table.insert(hdxGetElementData(arg1).tColumnW, arg2, (_x(tonumber(arg4)) or false))
    table.insert(hdxGetElementData(arg1).tGapW, arg2, (_x(tonumber(arg5)) or hdxGetElementData(arg1).gapW))
    hdxGetElementData(arg1).columns = hdxGetElementData(arg1).columns + 1
    if _x(tonumber(arg5)) == arg2 then
        local var = hdxGetElementData(arg1)
        local var_1 = _x(tonumber(arg5))
    end
    if hdxGetElementData(arg1).tColumnContent[_x(tonumber(arg5)) - 1] then
        hdxGetElementData(arg1).tColumnContent[_x(tonumber(arg5))] = hdxGetElementData(arg1).tColumnContent[_x(tonumber(arg5)) - 1]
        local var = hdxGetElementData(arg1)
        local var_1 = _x(tonumber(arg5))
    end
    hdxGetElementData(arg1).tColumnContent[_x(tonumber(arg5))] = nil
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    hdxCountGridlistContentWidth(arg1)
end

hdxInsertGridlistRow = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    if type(arg3) ~= "table" then
        return
    end
    if next(arg3) == nil then
        return
    end
    if not tonumber(arg2) then
        local var = hdxGetElementData(arg1).rows + 1
        local var_1 = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).tRowContent then
        return
    end
    table.insert(hdxGetElementData(arg1).tRowContent, arg2, arg3)
    hdxGetElementData(arg1).rows = hdxGetElementData(arg1).rows + 1
    hdxGetElementData(arg1).contentH = hdxGetElementData(arg1).rowH * hdxGetElementData(arg1).rows + hdxGetElementData(arg1).gapH * (hdxGetElementData(arg1).rows - 1)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxInsertGridlistRows = function(arg1, arg2, arg3)
    hdxGetElementData(arg1).rows = hdxGetElementData(arg1).rows + 1
    hdxGetElementData(arg1).contentH = hdxGetElementData(arg1).rowH * hdxGetElementData(arg1).rows + hdxGetElementData(arg1).gapH * (hdxGetElementData(arg1).rows - 1)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxRemoveGridlistRow = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if not tonumber(arg2) then
        local var = hdxGetElementData(arg1).rows
        local var_1 = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).tRowContent then
        return
    end
    if 0 >= hdxGetElementData(arg1).rows then
        return
    end
    table.remove(hdxGetElementData(arg1).tRowContent, arg2)
    hdxGetElementData(arg1).rows = hdxGetElementData(arg1).rows - 1
    hdxGetElementData(arg1).contentH = hdxGetElementData(arg1).rowH * hdxGetElementData(arg1).rows + hdxGetElementData(arg1).gapH * (hdxGetElementData(arg1).rows - 1)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnHeaderText = function(arg1, arg2, arg3)
    if type(arg3) == "table" then
        for k, v in pairs(arg3) do
            if k <= hdxGetElementData(arg1).columns then
                hdxGetElementData(arg1).tColumnContent[k] = v
                local var = hdxGetElementData(arg1)
            end
            local var = hdxGetElementData(arg1)
        end
        local var = hdxGetElementData(arg1)
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnHeaderTextAlign = function(arg1)
    if not isElement(arg1) then
        return
    end
    if select(3, ...) then
        local var_1 = select(2, ...)
        local var_2 = tonumber(arg1)
    end
    if nil then
        if not hdxGetElementData(arg1).headerColumnTextAlign then
            hdxGetElementData(arg1).headerColumnTextAlign = {}
            local var = hdxGetElementData(arg1)
        end
        if not hdxGetElementData(arg1).headerColumnTextAlign[nil] then
            hdxGetElementData(arg1).headerColumnTextAlign[nil] = {}
            local var = hdxGetElementData(arg1)
        end
        hdxGetElementData(arg1).headerColumnTextAlign[nil].x = "left"
        hdxGetElementData(arg1).headerColumnTextAlign[nil].y = "left"
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).headerTextAlignX = "left"
    hdxGetElementData(arg1).headerTextAlignY = "top"
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnHeaderTextColor = function(arg1, arg2, arg3)
    if not tonumber(arg2) then
        local var = hdxGetElementData(arg1)
        local var_2 = hdxGetElementData(arg1).columns
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnHeaderTextTab = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return
    end
    if not tonumber(arg2) then
        return
    end
    if not arg3 then
        if not arg4 then
            return
        end
        local var = tonumber(arg2)
    end
    if not hdxGetElementData(arg1).headerColumnTextTab then
        hdxGetElementData(arg1).headerColumnTextTab = {}
        local var = tonumber(arg2)
        local var_1 = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).headerColumnTextTab[tonumber(arg2)] then
        hdxGetElementData(arg1).headerColumnTextTab[tonumber(arg2)] = {}
        local var = tonumber(arg2)
        local var_1 = hdxGetElementData(arg1)
    end
    if arg3 then
        hdxGetElementData(arg1).headerColumnTextTab[tonumber(arg2)].w = _x(arg3)
        local var = tonumber(arg2)
        local var_1 = hdxGetElementData(arg1)
    end
    if arg4 then
        hdxGetElementData(arg1).headerColumnTextTab[tonumber(arg2)].h = _y(arg4)
        local var = hdxGetElementData(arg1)
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnImageTab = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    if tonumber(arg2) then
        hdxGetElementData(arg1).imageTabW = (_x(tonumber(arg2)) or 0)
        local var = hdxGetElementData(arg1)
    end
    if tonumber(arg3) then
        hdxGetElementData(arg1).imageTabH = (_y(tonumber(arg3)) or 0)
        local var = hdxGetElementData(arg1)
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnTabWidth = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return
    end
    if not arg2 or not arg3 then
    end
    if not hdxGetElementData(arg1).tColumnContent then
        hdxGetElementData(arg1).tColumnContent = {}
        local var = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).tColumnContent.textTabW then
        hdxGetElementData(arg1).tColumnContent.textTabW = {}
        local var = hdxGetElementData(arg1)
    end
    if arg4 then
        local var = hdxGetElementData(arg1)
        local var_1 = hdxGetElementData(arg1).tColumnContent.textTabW
    end
    hdxGetElementData(arg1).tColumnContent.textTabW[arg2] = _x(arg3)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnTailGap = function(arg1, arg2, arg3)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "isElement", "hdxGetElementData", "tGapW", "tonumber", "columns", "type"
    if not hdxGetElementData(arg1).tGapW then
        hdxGetElementData(arg1).tGapW = {}
        local var = hdxGetElementData(arg1)
    end
    if hdxGetElementData(arg1).columns < 1 then
        local var = hdxGetElementData(arg1).columns
        local var_1 = hdxGetElementData(arg1)
    end
    if type(arg3) == "table" then
        if not _x(arg3[r7]) then
            local var_1 = hdxGetElementData(arg1)
            local var_2 = hdxGetElementData(arg1).tGapW
            local lockClient = hdxGetElementData(arg1).gapW
        end
        local var_1 = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).tGapW[1] = hdxGetElementData(arg1).gapW
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    hdxCountGridlistContentWidth(arg1)
end

hdxSetGridlistColumnTextColor = function(arg1, arg2, arg3)
    if not tonumber(arg2) then
        local var = hdxGetElementData(arg1)
        local var_2 = hdxGetElementData(arg1).columns
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistColumnTextHorizontalAlign = function(arg1, arg2, arg3)
    if not isElement(arg1) or not tonumber(arg2) then
        return false
    end
    if arg3 ~= "center" and arg3 ~= "left" then
        local var = tonumber(arg2)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    if not hdxGetData(arg1, "data", false).tColumnContent then
        return
    end
    if not hdxGetData(arg1, "data", false).tColumnContent.align then
        hdxGetData(arg1, "data", false).tColumnContent.align = {}
        local var = tonumber(arg2)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).tColumnContent.align[tonumber(arg2)] = arg3
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistColumnWidth = function(arg1, arg2, arg3)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "isElement", "hdxGetElementData", "tColumnW", "tonumber", "columns", "type"
    if not hdxGetElementData(arg1).tColumnW then
        hdxGetElementData(arg1).tColumnW = {}
        local var = hdxGetElementData(arg1)
    end
    if hdxGetElementData(arg1).columns < 1 then
        local var = hdxGetElementData(arg1).columns
        local var_1 = hdxGetElementData(arg1)
    end
    if type(arg3) == "table" then
        if not _x(arg3[r7]) then
            local var_1 = hdxGetElementData(arg1)
            local var_2 = hdxGetElementData(arg1).tColumnW
            local lockClient = hdxGetElementData(arg1).defaultSlotW
        end
        local var_1 = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).tColumnW[1] = hdxGetElementData(arg1).defaultSlotW
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    hdxCountGridlistContentWidth(arg1)
end

hdxSetGridlistContent = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    hdxGetElementData(arg1).tRowContent = {}
    hdxGetElementData(arg1).rows = #hdxGetElementData(arg1).tRowContent
    hdxGetElementData(arg1).contentH = hdxGetElementData(arg1).rowH * hdxGetElementData(arg1).rows + hdxGetElementData(arg1).gapH * (hdxGetElementData(arg1).rows - 1)
    hdxGetElementData(arg1).contentH = tonumber(getFormattedFloat(hdxGetElementData(arg1).contentH))
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistContentBackgroundColor = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    hdxGetElementData(arg1).colorBackground = getFormattedColor(arg2)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistFadeGradientEnabled = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if arg2 then
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).fadeGradient = false
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistRowColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    hdxGetData(arg1, "data", false).rowColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistRowContent = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    if type(arg3) ~= "table" then
        return
    end
    if next(arg3) == nil then
        return
    end
    if not tonumber(arg2) then
        return
    end
    if not hdxGetElementData(arg1).tRowContent then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        return
    end
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)] = arg3
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    hdxCountGridlistContentWidth(arg1)
end

hdxSetGridlistRowKey = function(arg1, arg2, arg3)
    if not isElement(arg1) or not tonumber(arg2) then
        local var = tonumber(arg2)
    end
    if hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)].key = arg3
        local var = hdxGetElementData(arg1)
    end
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistRowSelected = function(arg1, arg2)
    if not isElement(arg1) or not tonumber(arg2) then
        return false
    end
    hdxGetData(arg1, "data", false).selectedRow = tonumber(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistRowSolidMode = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).bSolidRow = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistRowNumberVisible = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).bDrawRowNumber = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistSelectionMode = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if arg2 ~= "slot" then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).selectionMode = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistSingleRowColor = function(arg1, arg2, arg3)
    if not isElement(arg1) or not arg3 then
        return false
    end
    if not tonumber(arg2) then
        return
    end
    if not hdxGetData(arg1, "data", false).tRowContent then
        return
    end
    if not hdxGetData(arg1, "data", false).tRowContent[tonumber(arg2)] then
        return
    end
    hdxGetData(arg1, "data", false).tRowContent[tonumber(arg2)].rowColor = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistSingleRowTextColor = function(arg1, arg2, arg3)
    if not isElement(arg1) or not arg3 then
        return false
    end
    if not tonumber(arg2) then
        return
    end
    if not hdxGetData(arg1, "data", false).tRowContent then
        return
    end
    if not hdxGetData(arg1, "data", false).tRowContent[tonumber(arg2)] then
        return
    end
    hdxGetData(arg1, "data", false).tRowContent[tonumber(arg2)].rowTextColor = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetGridlistSlotColor = function(arg1, arg2, arg3)
    hdxSetGridSlotColor(arg1, arg2, arg3)
end

hdxSetGridlistSlotContent = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] then
        return
    end
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] = arg4
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    hdxCountGridlistContentWidth(arg1)
end

hdxSetGridlistSlotImagesCount = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] then
        return
    end
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].count = tonumber(arg4)
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].gapW = (_x(tonumber(arg5)) or 0)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistSlotGradientColor = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return
    end
    if arg2 then
        hdxGetElementData(arg1).gradientColor = true
        hdxGetElementData(arg1).colorTop = { value_1, value_2, value_3 }
        hdxGetElementData(arg1).colorBottom = { value_4, value_5, value_6 }
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).gradientColor = nil
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistSlotImage = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(arg1) then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] then
        return
    end
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)][1] = arg4
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)][2] = _x(arg5)
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)][3] = _y(arg6)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistSlotImageColor = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) then
        return
    end
    if not tonumber(arg2) or not tonumber(arg3) then
        local var = tonumber(arg2)
        local var_1 = tonumber(arg3)
        local var_2 = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)] = {}
        local var = tonumber(arg2)
        local var_1 = tonumber(arg3)
        local var_2 = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] then
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] = {}
        local var = tonumber(arg2)
        local var_1 = tonumber(arg3)
        local var_2 = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)] then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)] then
        return
    end
    if not hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].color then
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].color = {}
        local var = tonumber(arg2)
        local var_1 = tonumber(arg3)
        local var_2 = hdxGetElementData(arg1)
    end
    if arg4 == STATE_ALL then
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].color[STATE_IDLE] = getFormattedColor(arg5)
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].color[STATE_HOVERED] = getFormattedColor(arg5)
        hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].color[STATE_PRESSED] = getFormattedColor(arg5)
        local var = tonumber(arg2)
        local var_1 = tonumber(arg3)
        local var_2 = getFormattedColor(arg5)
        local lockClient = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).tRowContent[tonumber(arg2)][tonumber(arg3)].color[arg4] = getFormattedColor(arg5)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetGridlistSlotTextHorizontalAlign = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 ~= "center" then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).tColumnContent.alignX = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSortElementContent = function(arg1, arg2, arg3)
    if not isElement(arg1) or not tonumber(arg2) then
        local var = tonumber(arg2)
    end
    if arg3 ~= "desc" then
        local var = tonumber(arg2)
        local var_1 = "asc"
    end
    if arg3 == "desc" then
        local var = tonumber(arg2)
    end
    if not hdxGetElementData(arg1).columnSortMode then
        hdxGetElementData(arg1).columnSortMode = {}
        local var = tonumber(arg2)
        local var_1 = 0
        local var_2 = hdxGetElementData(arg1)
    end
    if 0 == "desc" then
        local var = tonumber(arg2)
        local var_1 = 0
        local var_2 = hdxGetElementData(arg1)
        local lockClient = hdxGetElementData(arg1).columnSortMode
    end
    hdxGetElementData(arg1).columnSortMode[tonumber(arg2)] = 0
    local var = 0
    local var_1 = tonumber(arg2)
    local function sub_1002(self, arg2)
        if var == 1 then
            if tonumber(self[var_1]) then
                if tonumber(arg2[var_1]) then
                    if tonumber(arg2[var_1]) >= tonumber(self[var_1]) then
                    end
                    return true
                end
            end
            if not self[var_1] then
                local var_1 = ""
            end
            if string.upper((arg2[var_1] or "")) >= string.upper(self[var_1]) then
            end
            return true
        end
        if tonumber(self[var_1]) then
            if tonumber(arg2[var_1]) then
                if tonumber(self[var_1]) >= tonumber(arg2[var_1]) then
                end
                return true
            end
        end
        if not self[var_1] then
            local var_1 = ""
        end
        if string.upper(self[var_1]) >= string.upper((arg2[var_1] or "")) then
        end
        return true
    end
    table.sort(hdxGetElementData(arg1).tRowContent, sub_1002)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSwapGridlistColumns = function(arg1, arg2, arg3, arg4)
    hdxGetElementData(arg1).tColumnContent[arg3] = hdxGetElementData(arg1).tColumnContent[arg2]
    hdxGetElementData(arg1).tColumnContent[arg2] = hdxGetElementData(arg1).tColumnContent[arg3]
    hdxGetElementData(arg1).tColumnW[arg3] = hdxGetElementData(arg1).tColumnW[arg2]
    hdxGetElementData(arg1).tColumnW[arg2] = hdxGetElementData(arg1).tColumnW[arg3]
    if arg4 then
        hdxGetElementData(arg1).tGapW[arg3] = hdxGetElementData(arg1).tGapW[arg2]
        hdxGetElementData(arg1).tGapW[arg2] = hdxGetElementData(arg1).tGapW[arg3]
        local var = hdxGetElementData(arg1)
        local var_1 = hdxGetElementData(arg1).tGapW[arg2]
    end
    hdxGetElementData(arg1).tRowContent[hdxGetElementData(arg1).tColumnW[arg2]][arg3] = hdxGetElementData(arg1).tRowContent[hdxGetElementData(arg1).tColumnW[arg2]][arg2]
    hdxGetElementData(arg1).tRowContent[hdxGetElementData(arg1).tColumnW[arg2]][arg2] = hdxGetElementData(arg1).tRowContent[hdxGetElementData(arg1).tColumnW[arg2]][arg3]
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxGetLabelWidth = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if isHdxRunning() then
        return exports.province_dx:hdxGetLabelWidth(arg1)
    end
    if hdxGetElementSize(arg1) then
        return hdxGetElementSize(arg1)
    end
end

hdxIsLabelMarked = function(arg1)
    if not isElement(arg1) then
        return false
    end
    return hdxGetData(arg1, "data", false).marked
end

hdxFlashLabel = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return false
    end
    if not isHdxRunning() then
        return 0
    end
    exports.province_dx:hdxFlashLabel(arg1, arg2, arg3, arg4)
end

hdxSetLabelCustomSized = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).customSize = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetLabelMarked = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).marked = arg2
    hdxGetData(arg1, "data", false).markerColor = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetLabelShadowed = function(arg1, arg2, arg3, arg4, arg5)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).shadow = false
    if arg3 then
        hdxGetData(arg1, "data", false).shadowColor = getFormattedColor(arg3, tColor.black)
        local var = hdxGetData(arg1, "data", false)
    end
    if not tonumber(arg4) then
        local var = hdxGetData(arg1, "data", false)
    end
    (hdxGetData(arg1, "data", false).shadowOffset or {}) = {}
    if not tonumber(arg4) then
        if not hdxGetData(arg1, "data", false).shadowOffset[1] then
            local var = hdxGetData(arg1, "data", false)
            local var_1 = hdxGetData(arg1, "data", false).shadowOffset
            local var_2 = hdxGetData(arg1, "data", false).shadowOffset
            local lockClient = 0
        end
        local var = hdxGetData(arg1, "data", false)
        local var_1 = hdxGetData(arg1, "data", false).shadowOffset
        local var_2 = hdxGetData(arg1, "data", false).shadowOffset
        local lockClient = hdxGetData(arg1, "data", false).shadowOffset[1]
    end
    hdxGetData(arg1, "data", false).shadowOffset[1] = tonumber(arg4)
    if not tonumber(arg5) then
        if not hdxGetData(arg1, "data", false).shadowOffset[2] then
            local var = hdxGetData(arg1, "data", false)
            local var_1 = hdxGetData(arg1, "data", false).shadowOffset
            local var_2 = 0
        end
        local var = hdxGetData(arg1, "data", false)
        local var_1 = hdxGetData(arg1, "data", false).shadowOffset
        local var_2 = hdxGetData(arg1, "data", false).shadowOffset[2]
    end
    hdxGetData(arg1, "data", false).shadowOffset[2] = tonumber(arg5)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetLabelWordwrapped = function(arg1, arg2, arg3)
    if isElement(arg1) then
    end
    return false
    end

    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxAddListRow = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return false
    end
    if not hdxGetData(arg1, "data", false).listText then
        hdxGetData(arg1, "data", false).listText = {}
        local var = hdxGetData(arg1, "data", false)
    end
    if tonumber(arg4) then
        if tonumber(arg4) <= #hdxGetData(arg1, "data", false).listText then
            table.insert(hdxGetData(arg1, "data", false).listText, tonumber(arg4), arg2)
            local var = hdxGetData(arg1, "data", false)
        end
        local var = hdxGetData(arg1, "data", false)
    end
    table.insert(hdxGetData(arg1, "data", false).listText, arg2)
    hdxGetData(arg1, "data", false).rows = #hdxGetData(arg1, "data", false).listText
    if not hdxGetData(arg1, "data", false).gapH then
        local var = hdxGetData(arg1, "data", false)
        local var_1 = 0
    end
    if arg3 then
        hdxSetElementSize(arg1, value_1, hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + hdxGetData(arg1, "data", false).gapH * (hdxGetData(arg1, "data", false).rows - 1))
        local value_1, value_2 = hdxGetElementSize(arg1)
        local var = hdxGetData(arg1, "data", false)
        local lockClient = hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + hdxGetData(arg1, "data", false).gapH * (hdxGetData(arg1, "data", false).rows - 1)
    end
    if hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + hdxGetData(arg1, "data", false).gapH * (hdxGetData(arg1, "data", false).rows - 1) < value_2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).contentH = hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + hdxGetData(arg1, "data", false).gapH * (hdxGetData(arg1, "data", false).rows - 1)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
    return hdxGetData(arg1, "data", false).rows
end

hdxChangeListContent = function(arg1, arg2, arg3)
    hdxGetData(arg1, "data", false).selectedRow = 0
    hdxGetData(arg1, "data", false).listText = arg2
    hdxGetData(arg1, "data", false).rows = #hdxGetData(arg1, "data", false).listText
    hdxGetData(arg1, "data", false).scrolledPercentY = 0
    if hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + (hdxGetData(arg1, "data", false).gapH or 0) * (hdxGetData(arg1, "data", false).rows - 1) < value_2 then
        local value_1, value_2 = hdxGetElementSize(arg1)
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).contentH = hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + hdxGetData(arg1, "data", false).gapH * (hdxGetData(arg1, "data", false).rows - 1)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
    if not arg3 then
        return
    end
    hdxSetElementSize(arg1, value_1, hdxGetData(arg1, "data", false).contentH)
end

hdxChangeListSecondaryContentData = function(arg1, arg2)
    for k, v in pairs(arg2) do
        hdxGetData(arg1, "data", false)[k] = v
        local var = hdxGetData(arg1, "data", false)
    end
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxClearList = function(arg1)
    if not isElement(arg1) then
        return
    end
    hdxGetElementData(arg1).listText = {}
    hdxGetElementData(arg1).rows = 0
    hdxGetElementData(arg1).contentH = 0
    hdxGetElementData(arg1).selectedRow = 0
    hdxGetElementData(arg1).customRowColor = nil
    hdxGetElementData(arg1).customTextRowColor = nil
    hdxGetElementData(arg1).rowImageColor = nil
    hdxGetElementData(arg1).rowState = nil
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxClearListCustomRowColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
            end

            hdxGetData(arg1, "data", false).customRowColor[arg2][arg3] = nil
            local var = hdxGetData(arg1, "data", false)
        end
        local var = hdxGetData(arg1, "data", false)
    end
    if not hdxGetData(arg1, "data", false).customTextRowColor then
        return
    end
    if not hdxGetData(arg1, "data", false).customTextRowColor[arg2] then
        return
    end
    if arg3 == STATE_ALL then
        hdxGetData(arg1, "data", false).customTextRowColor[arg2] = nil
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).customTextRowColor[arg2][arg3] = nil
end

hdxGetListRowCount = function(arg1)
    return hdxGetData(arg1, "data", false).rows
end

hdxGetListRowHeight = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if hdxGetData(arg1, "data", false).rowH then
        return hdxGetData(arg1, "data", false).rowH
    end
    return false
end

hdxGetListRowText = function(arg1, arg2)
    if hdxGetData(arg1, "data", false).listText[arg2] then
        return hdxGetData(arg1, "data", false).listText[arg2]
    end
    return "none"
end

hdxGetListSelectedRow = function(arg1)
    if not arg1 then
        return false
    end
    if not isHdxRunning() then
        return 0
    end
    return exports.province_dx:hdxGetListSelectedRow(arg1)
end

hdxRemoveListRow = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return false
    end
    if not tonumber(arg2) then
        return
    end
    if not hdxGetData(arg1, "data", false).listText then
        return
    end
    if type(hdxGetData(arg1, "data", false).listText) ~= "table" then
        return
    end
    if not hdxGetData(arg1, "data", false).listText[tonumber(arg2)] then
        return
    end
    table.remove(hdxGetData(arg1, "data", false).listText, tonumber(arg2))
    hdxGetData(arg1, "data", false).rows = #hdxGetData(arg1, "data", false).listText
    if hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + (hdxGetData(arg1, "data", false).gapH or 0) * (hdxGetData(arg1, "data", false).rows - 1) < value_2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).contentH = hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + hdxGetData(arg1, "data", false).gapH * (hdxGetData(arg1, "data", false).rows - 1)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
    if arg3 then
        hdxSetElementSize(arg1, value_3, hdxGetData(arg1, "data", false).contentH)
        local var = hdxGetData(arg1, "data", false)
    end
    return hdxGetData(arg1, "data", false).rows
end

hdxSetListDivider = function(arg1, arg2)
    if isElement(arg1) then
    end
    return false
end

hdxSetListDividerColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    if arg2 == STATE_ALL then
        hdxGetData(arg1, "data", false).dividerColor[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).dividerColor[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).dividerColor[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).dividerColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListGapHeight = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).gapH = 0
    if hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + 0 * (hdxGetData(arg1, "data", false).rows - 1) < value_2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).contentH = hdxGetData(arg1, "data", false).rowH * hdxGetData(arg1, "data", false).rows + 0 * (hdxGetData(arg1, "data", false).rows - 1)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListImageSize = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxGetData(arg1, "data", false).imagesSize = tonumber(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListCustomRowColor = function(arg1, arg2, arg3, arg4)
    if isElement(arg1) and arg2 then
    end
    return false
        end

        local var = hdxGetData(arg1, "data", false)
    end
    if not hdxGetData(arg1, "data", false).customRowColor then
        hdxGetData(arg1, "data", false).customRowColor = {}
        local var = hdxGetData(arg1, "data", false)
    end
    if not hdxGetData(arg1, "data", false).customRowColor[arg2] then
        hdxGetData(arg1, "data", false).customRowColor[arg2] = {}
        local var = hdxGetData(arg1, "data", false)
    end
    if arg3 == STATE_ALL then
        hdxGetData(arg1, "data", false).customRowColor[arg2][STATE_IDLE] = getFormattedColor(arg4)
        hdxGetData(arg1, "data", false).customRowColor[arg2][STATE_HOVERED] = getFormattedColor(arg4)
        hdxGetData(arg1, "data", false).customRowColor[arg2][STATE_PRESSED] = getFormattedColor(arg4)
        local var = getFormattedColor(arg4)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).customRowColor[arg2][arg3] = getFormattedColor(arg4)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListCustomTextRowColor = function(arg1, arg2, arg3, arg4)
    if isElement(arg1) and arg2 then
    end
    return false
        end

        local var = hdxGetData(arg1, "data", false)
    end
    if not hdxGetData(arg1, "data", false).customTextRowColor then
        hdxGetData(arg1, "data", false).customTextRowColor = {}
        local var = hdxGetData(arg1, "data", false)
    end
    if not hdxGetData(arg1, "data", false).customTextRowColor[arg2] then
        hdxGetData(arg1, "data", false).customTextRowColor[arg2] = {}
        local var = hdxGetData(arg1, "data", false)
    end
    if arg3 == STATE_ALL then
        hdxGetData(arg1, "data", false).customTextRowColor[arg2][STATE_IDLE] = getFormattedColor(arg4)
        hdxGetData(arg1, "data", false).customTextRowColor[arg2][STATE_HOVERED] = getFormattedColor(arg4)
        hdxGetData(arg1, "data", false).customTextRowColor[arg2][STATE_PRESSED] = getFormattedColor(arg4)
        local var = getFormattedColor(arg4)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).customTextRowColor[arg2][arg3] = getFormattedColor(arg4)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListRowColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
    end

    if arg2 == STATE_ALL then
        hdxGetData(arg1, "data", false).rowColor[STATE_IDLE] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).rowColor[STATE_HOVERED] = getFormattedColor(arg3)
        hdxGetData(arg1, "data", false).rowColor[STATE_PRESSED] = getFormattedColor(arg3)
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).rowColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListRowHeight = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxGetData(arg1, "data", false).rowH = _y(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxGetListRowHeight = function(arg1)
    if not isElement(arg1) then
        return false
    end
    if hdxGetData(arg1, "data", false).rowH then
        return hdxGetData(arg1, "data", false).rowH
    end
    return false
end

hdxSetListRowIcon = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxGetData(arg1, "data", false).hasIcons = getFullTexturePath(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListRowKeepSelected = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).keepRowSelected = false
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListRowText = function(arg1, arg2, arg3)
    if not arg1 then
        return
    end
    if not arg2 or not arg3 then
    end
    hdxGetData(arg1, "data", false).listText[arg2] = arg3
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListSecondaryContent = function(arg1, arg2)
    hdxGetData(arg1, "data", false).listTextSecondary = arg2
    hdxGetData(arg1, "data", false).rows = #hdxGetData(arg1, "data", false).listTextSecondary
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListSelectedRow = function(arg1, arg2)
    if not arg1 or not arg2 then
        return false
    end
    if not isHdxRunning() then
        return 0
    end
    return exports.province_dx:hdxSetListSelectedRow(arg1, arg2)
end

hdxSetListStateImages = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    for k, v in pairs(arg2) do
        arg2[k] = getFullTexturePath(v)
    end
    hdxSetData(arg1, "images", false, false)
end

hdxSetListStateImageHorizontalAlign = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if arg2 ~= "left" and arg2 ~= "right" then
    end
    hdxGetData(arg1, "data", false).rowImagesAlign = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetListStateImageColor = function(arg1, arg2, arg3)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if not arg3 then
        return
    end
    if not hdxGetElementData(arg1).rowImageColor then
        hdxGetElementData(arg1).rowImageColor = {}
        local var = getFormattedColor(arg3)
        local var_1 = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).rowImageColor[arg2] = getFormattedColor(arg3)
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetListStatements = function(arg1, arg2, arg3)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if arg3 then
        local var = hdxGetElementData(arg1)
    end
    if not hdxGetElementData(arg1).rowState then
        hdxGetElementData(arg1).rowState = {}
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).rowState[arg2] = nil
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetListTabWidth = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxGetData(arg1, "data", false).tabW = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxGetElementBarProgress = function(arg1)
    if not arg1 then
        return
    end
    if hdxGetData(arg1, "data", false).progress then
        return hdxGetData(arg1, "data", false).progress
    end
    return 0
end

hdxSetElementBarProgress = function(arg1, arg2)
    if not arg1 or not arg2 then
    end
    if arg2 < 0 then
        local var = 0
    end
    if 100 < arg2 then
        local var = 100
    end
    hdxGetData(arg1, "data", false).progress = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementBarProgressColor = function(arg1, arg2)
    if not arg1 or not arg2 then
    end
    hdxGetData(arg1, "data", false).colorProgress = getFormattedColor(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetRoundbarBlur = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    hdxGetElementData(arg1).blur = arg2
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetRoundbarBorderWidth = function(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    hdxGetElementData(arg1).borderWidth = arg2
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxGetScrollBarPos = function(arg1)
    if isElement(arg1) then
    end
    return false
end

hdxSetScrollBarClickSetupEnabled = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).bSetByClick = false
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetScrollBarPos = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if 1 < 0 then
        local var = 1
    end
    if 0 < 0 then
        local var = 0
    end
    if isHdxRunning() then
        if hdxIsElementCached(arg1) then
            exports.province_dx:hdxSetScrollBarPos(arg1, 0)
            local var = 0
        end
        local var = 0
    end
    if hdxGetData(arg1, "data", false).scrollType == "horizontal" then
        hdxGetData(arg1, "data", false).scrolledPercentX = 0
        local var = 0
        local var_1 = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).scrolledPercentY = 0
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementHorizontallScrollTabH = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).scrollHorizontalTabH = _y(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementScrollBackroundSize = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).scrollVerticalWidth = _x(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementScrollAutoSize = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
        local var = hdxGetElementData(arg1)
    end
    hdxGetElementData(arg1).scrollAutoSize = false
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetElementScrollBackgroundColor = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    hdxGetData(arg1, "data", false).scrollBColor = getFormattedColor(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementScrollBackVisible = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    hdxGetData(arg1, "data", false).scrollBackVisible = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementScrollColor = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
end

hdxSetElementScrollDown = function(arg1)
    hdxSetElementScrolledValue(arg1, 1)
end

hdxSetElementScrollSize = function(arg1, arg2, arg3, arg4)
    if not isElement(arg1) then
        return false
    end
    if arg2 then
    end
    if "vertical" == "vertical" then
    end
    if not arg3 then
        local value_1, value_2 = hdxGetElementSize(hdxGetData(arg1, "scrollHorizontal", false))
        local var = hdxGetData(arg1, "scrollHorizontal", false)
    end
    hdxSetElementSize(hdxGetData(arg1, "scrollHorizontal", false), arg3, (arg4 or hdxGetData(arg1, "scrollHorizontal", false)))
end

hdxSetElementScrollRounded = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(arg1) then
    end
    if "vertical" == "vertical" then
        local var = "vertical"
    end
    if "vertical" == "vertical" then
        local var = hdxGetData(arg1, "scrollHorizontal", false)
        local lockClient = hdxGetData(hdxGetData(arg1, "scrollHorizontal", false), "roundedCorners")
    end
    hdxSetData(hdxGetData(arg1, "scrollHorizontal", false), "roundedCorners", hdxGetData(hdxGetData(arg1, "scrollHorizontal", false), "roundedCorners"), false)
end

hdxSetElementScrolledValue = function(arg1, arg2, arg3)
    if not isElement(arg1) then
        return
    end
    if not arg3 then
        local var = "vertical"
    end
    if isHdxRunning() then
        if hdxIsElementCached(arg1) then
            exports.province_dx:hdxSetElementScrolledValue(arg1, arg2, arg3)
        end
    end
    if hdxGetData(arg1, "data", false).scrollType == "horizontal" then
        hdxGetData(arg1, "data", false).scrolledPercentX = arg2
        local var = hdxGetData(arg1, "data", false)
    end
    hdxGetData(arg1, "data", false).scrolledPercentY = arg2
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementScrollStepCount = function(arg1, arg2)
    if isElement(arg1) then
    end
    return false
end

hdxSetElementScrollTabWidth = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    (hdxGetData(arg1, "data", false) or {}).scrollTabW = _x(arg2)
    hdxSetData(arg1, "data", hdxGetData(arg1, "data", false), false)
end

hdxSetElementScrollWidth = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    if not isElement(hdxGetData(arg1, "scroll", false)) then
        return false
    end
    hdxSetElementSize(hdxGetData(arg1, "scroll", false), _x(arg2), value_2)
    if hdxGetElementData(hdxGetData(arg1, "scroll", false)).scrollType == "vertical" then
        local var = hdxGetData(arg1, "scroll", false)
        local lockClient = arg2 * 0.5
    end
    hdxSetElementRounded(hdxGetData(arg1, "scroll", false), value_2 * 0.5, value_2 * 0.5, value_2 * 0.5, value_2 * 0.5)
end

hdxKeepElementImage = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    (hdxGetElementData(arg1) or {}).keepImage = nil
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetElementTextureParams = function(arg1)
    if not isElement(arg1) then
        return false
    end
    (hdxGetElementData(arg1) or {}).textureArgs = { r4 }
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
    if not hdxGetElementData(arg1).texturePath then
        return
    end
    hdxSetElementImage(arg1, hdxGetElementData(arg1).texturePath)
end

hdxSetElementTextLineSpacing = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    (hdxGetElementData(arg1) or {}).lineSpacing = arg2
    hdxSetData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxSetElementTextSubPixelPositioning = function(arg1, arg2)
    if not isElement(arg1) then
        return false
    end
    (hdxGetElementData(arg1) or {}).subPixelPositioning = arg2
    setElementData(arg1, "data", hdxGetElementData(arg1), false)
end

hdxScrollElementTo = function(arg1, arg2, arg3)
    return exports.province_dx:hdxScrollElementTo(arg1, arg2, arg3)
end

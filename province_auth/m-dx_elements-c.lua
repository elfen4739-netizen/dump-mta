-- ByteRevenant
-- LuaQ 5.1 structured decompile

hdxRoot = createElement("hdxRoot")

local function onClientResourceStart()
    hdxSetData(hdxRoot, "position", { x = 0, y = 0 })
    hdxSetData(hdxRoot, "size", { w = screenW, h = screenH })
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
addEvent("onHdxElementPressed")
addEvent("onHdxElementScrolledBar")
addEvent("onHdxElementHovered")
addEvent("onHdxEditboxChanged")
addEvent("hdxCreateDxElement")
addEvent("onHdxResourceStop")
local state = nil

local function onHdxResourceStop(arg1)
    state = {}
    if not arg1 then
        return
    end
    if type(arg1) ~= "table" then
        return
    end
    if not next(arg1) then
        return
    end
    local onClientResourceStart = next(arg1)
    function(arg1)
    state[arg1] = arg1[arg1]
    if not getElementChildren(arg1) then
        return
    end
    if 0 >= #getElementChildren(arg1) then
        return
    end
    for k, v in ipairs(getElementChildren(arg1)) do
        onClientResourceStart(v)
    end
end(hdxRoot)
end
addEventHandler("onHdxResourceStop", root, onHdxResourceStop)
addEvent("onHdxResourceStart")

local function onHdxResourceStart()
    if state then
        if type(state) == "table" then
            if next(state) then
                for k, v in pairs(state) do
                    if isElement(k) then
                        for k, v in pairs(v) do
                            hdxSetData(k, k, v)
                        end
                    end
                end
            end
        end
    end
    state = nil
    collectgarbage("collect")
end

addEventHandler("onHdxResourceStart", root, onHdxResourceStart)

local function lockClient(arg1, arg2, arg3, arg4, arg5, arg6)
    if not arg6 then
    end
    if not isElement(createElement(arg5)) then
        return false
    end
    if arg6 == hdxRoot then
        hdxSetData(createElement(arg5), "granparent", createElement(arg5), false)
        local onClientResourceStart = createElement(arg5)
    end
    setElementParent(createElement(arg5), arg6)
    hdxSetData(createElement(arg5), "position", { x = _x(arg1), y = _y(arg2) }, false)
    hdxSetData(createElement(arg5), "size", { w = _x(arg3), h = _y(arg4) }, false)
    hdxSetData(createElement(arg5), "state", STATE_IDLE, false)
    hdxSetData(createElement(arg5), "visible", true, false)
    if arg6 ~= hdxRoot then
        if getElementType(arg6) == "hdxSpace" then
            if getElementType(createElement(arg5)) ~= "hdxScroll" then
                hdxSetData(createElement(arg5), "offsets", { x = _x(arg1), y = _y(arg2) }, false)
                local lockClient = createElement(arg5)
                local tripClient = hdxGetData(arg6, "position")
            end
            local onHdxResourceStart = createElement(arg5)
            local lockClient = hdxGetData(arg6, "position")
        end
        hdxSetData(createElement(arg5), "offsets", { x = _x(arg1) - hdxGetData(arg6, "position").x, y = _y(arg2) - hdxGetData(arg6, "position").y }, false)
        local lockClient = createElement(arg5)
    end
    if arg6 ~= hdxRoot then
        return createElement(arg5)
    end
    triggerEvent("hdxCreateDxElement", createElement(arg5))
    return createElement(arg5)
end

hdxCreateAnimSprite = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    if not arg8 then
    end
    if type(arg8) == "string" then
        local onClientResourceStart = fromJSON("[" .. arg8 .. "]")
    end
    if type(arg8) == "table" then
    end
    return false
    end

    if isElement(arg7) then
        if getElementType(arg7) == "texture" then
            local onClientResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxAnimSprite", arg9)
        end
        local onClientResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxAnimSprite", arg9)
    end
    local onClientResourceStart = {
        image = dxCreateTexture(arg7, "dxt5", true, "wrap"),
        spritesheet = arg8,
        fps = 30,
        currentFrame = 1,
        frameTime = 0,
        paused = false,
        animMode = 1,
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxAnimSprite", arg9), "data", onClientResourceStart, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxAnimSprite", arg9)
end

hdxCreateBrowser = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if arg5 then
    end
    if arg6 then
    end
    if not isElement(createBrowser(arg3, arg4, false, false)) then
        return false
    end
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxBrowser", arg7)) then
        destroyElement(createBrowser(arg3, arg4, false, false))
        return false
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxBrowser", arg7), "browser", createBrowser(arg3, arg4, false, false), false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxBrowser", arg7)
end

hdxCreateButton = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxButton", arg7)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg5, tColor.darkgrey), [STATE_HOVERED] = getFormattedColor(arg5, tColor.darkgrey), [STATE_PRESSED] = getFormattedColor(arg5, tColor.darkgrey) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxButton", arg7), "color", onClientResourceStart, false)
    local onHdxResourceStop = {
        text = "",
        font = "default",
        scale = 1 * font_mul,
        textColor = { [STATE_IDLE] = tColor.white, [STATE_HOVERED] = tColor.white, [STATE_PRESSED] = tColor.white },
        textHorizontalAlign = "center",
        textVerticalAlign = "center",
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxButton", arg7), "data", onHdxResourceStop, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxButton", arg7)
end

hdxCreateChat = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6)) then
        return false
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6), "renderTarget", true, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6), "color", { [STATE_IDLE] = tColor.white, [STATE_HOVERED] = tColor.white }, false)
    local onHdxResourceStop = {
        contentType = "",
        scrolledPercentY = 0,
        contentH = _y(arg4),
        fontName = "open-sans",
        fontSize = 11,
        font = "open-sans",
        scale = 11,
        cloudColors = { tocolor(230, 230, 230, 255) },
        chatColors = { tocolor(34, 34, 34) },
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6), "data", onHdxResourceStop, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6), "scroll", hdxCreateScroll(arg1 + arg3 - 15, arg2, 15, 100, tocolor(71, 75, 81, 180), lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6)), false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxChat", arg6)
end

hdxCreateCheckbox = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    if not isElement(lockClient(arg1, arg2, arg3, arg3, "hdxCheckbox", arg8)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg4, tColor.darkgrey), [STATE_HOVERED] = getFormattedColor(arg4, tColor.darkgrey), [STATE_PRESSED] = getFormattedColor(arg4, tColor.darkgrey) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg3, "hdxCheckbox", arg8), "color", onClientResourceStart, false)
    local onHdxResourceStop = {
        text = "",
        font = "default",
        scale = 1 * font_mul,
        textWidth = dxGetTextWidth("", scale, "default", true),
        textHeight = dxGetFontHeight(scale, "default"),
        border = false,
        checked = false,
        checkColor = { [STATE_IDLE] = tocolor(75, 124, 9, 255), [STATE_HOVERED] = tocolor(75, 124, 9, 255), [STATE_PRESSED] = tocolor(75, 124, 9, 255) },
        textColor = { [STATE_IDLE] = tColor.white, [STATE_HOVERED] = tColor.white, [STATE_PRESSED] = tColor.white },
        textHorizontalAlign = "left",
        textVerticalAlign = "center",
        type = "default",
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg3, "hdxCheckbox", arg8), "data", onHdxResourceStop, false)
    if arg9 ~= "switch" then
        return lockClient(arg1, arg2, arg3, arg3, "hdxCheckbox", arg8)
    end
    hdxSetElementSize(lockClient(arg1, arg2, arg3, arg3, "hdxCheckbox", arg8), _x(arg3 * 2), _y(arg3))
    return lockClient(arg1, arg2, arg3, arg3, "hdxCheckbox", arg8)
end

hdxCreateEditbox = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg5), [STATE_HOVERED] = getFormattedColor(arg5), [STATE_PRESSED] = getFormattedColor(arg5) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9), "color", onClientResourceStart, false)
    if (arg10 or lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9)) == "default" then
        local onHdxResourceStop = lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9)
    end
    if not arg11 then
        local onHdxResourceStop = 1
        local onHdxResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9)
    end
    local lockClient = {
        stringTable = { headCutter = 0, "" },
        text = "",
        placeholder = "",
        fontName = arg10,
        fontSize = arg11,
        font = value_1,
        scale = value_2,
        rowH = _y(arg4),
        tabW = _x(10),
        textTabW = 0,
        multiString = false,
        carriagePlace = 0,
        rowCount = 1,
        currentRow = 1,
        textWidth = 0,
        textHeight = 0,
        masked = false,
        maxLength = 150,
        textColor = { [STATE_IDLE] = tocolor(43, 43, 43, 255), [STATE_HOVERED] = tocolor(43, 43, 43, 255), [STATE_PRESSED] = tocolor(43, 43, 43, 255) },
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9), "data", lockClient, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxEditbox", arg9)
end

hdxCreateGrid = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxGrid", arg8)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg7, tColor.darkgrey), [STATE_HOVERED] = getFormattedColor(arg7, tColor.darkgrey), [STATE_PRESSED] = getFormattedColor(arg7, tColor.darkgrey) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxGrid", arg8), "color", onClientResourceStart, false)
    local onHdxResourceStop = {
        rows = 2,
        columns = 2,
        innerRadius = { _x(10) },
        tabW = 20,
        tabH = 20,
        gapW = 10,
        gapH = 10,
        slotW = 40,
        slotH = 40,
        slotColor = { [STATE_IDLE] = tocolor(59, 62, 80, 255), [STATE_HOVERED] = tocolor(45, 50, 70, 255), [STATE_PRESSED] = tocolor(59, 62, 80, 255) },
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxGrid", arg8), "data", onHdxResourceStop, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxGrid", arg8)
end

hdxCreateGridlist = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8)) then
        local onClientResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8)
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8), "renderTarget", true, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8), "color", onClientResourceStart, false)
    if not arg5 then
        local onHdxResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8)
    end
    if not arg6 then
        local onHdxResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8)
    end
    nil.tColumnW[15] = nil.defaultSlotW
    nil.tGapW[15] = nil.gapW
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8), "data", onHdxResourceStop, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxGridlist", arg8)
end

hdxCreateImage = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if not arg5 then
        return
    end
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxImage", arg7)) then
        return false
    end
    if type(arg5) == "string" then
        if dxGetPixelsFormat(arg5) then
            local onClientResourceStart = dxCreateTexture(arg5, "dxt1", false, "clamp")
            local onHdxResourceStop = lockClient(arg1, arg2, arg3, arg4, "hdxImage", arg7)
        end
        local onClientResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxImage", arg7)
    end
    if not getFullTexturePath(arg5) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg6, tColor.white), [STATE_HOVERED] = getFormattedColor(arg6, tColor.white), [STATE_PRESSED] = getFormattedColor(arg6, tColor.white) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxImage", arg7), "color", onClientResourceStart, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxImage", arg7), "data", { image = getFullTexturePath(arg5) }, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxImage", arg7)
end

hdxCreateLabel = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if not isElement(lockClient(arg2, arg3, nil, nil, "hdxLabel", arg7)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg4, tColor.white), [STATE_HOVERED] = getFormattedColor(arg4, tColor.white), [STATE_PRESSED] = getFormattedColor(arg4, tColor.white) }
    hdxSetData(lockClient(arg2, arg3, nil, nil, "hdxLabel", arg7), "color", onClientResourceStart, false)
    if (arg5 or lockClient(arg2, arg3, nil, nil, "hdxLabel", arg7)) == "default" then
        local onHdxResourceStop = lockClient(arg2, arg3, nil, nil, "hdxLabel", arg7)
    end
    if not arg6 then
        local onHdxResourceStop = 1
        local onHdxResourceStart = lockClient(arg2, arg3, nil, nil, "hdxLabel", arg7)
    end
    local lockClient = { w = dxGetTextWidth("", value_2, value_1, true), h = dxGetFontHeight(value_2, value_1) }
    hdxSetData(lockClient(arg2, arg3, nil, nil, "hdxLabel", arg7), "size", lockClient, false)
    local tripClient = {
        text = tostring(arg1),
        fontName = arg5,
        fontSize = arg6,
        font = value_1,
        scale = value_2,
        textWidth = 0,
        textHeight = 0,
        textHorizontalAlign = "left",
        textVerticalAlign = "top",
        wordwrap = nil,
    }
    hdxSetData({ w = dxGetTextWidth("", value_2, value_1, true), h = dxGetFontHeight(value_2, value_1) }(arg2, arg3, nil, nil, "hdxLabel", arg7), "data", tripClient, false)
    return { w = dxGetTextWidth("", value_2, value_1, true), h = dxGetFontHeight(value_2, value_1) }(arg2, arg3, nil, nil, "hdxLabel", arg7)
end

hdxCreateList = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6)) then
        return false
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6), "renderTarget", true, false)
    local onClientResourceStart = { [STATE_IDLE] = tColor.white, [STATE_HOVERED] = tColor.white, [STATE_PRESSED] = tColor.white }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6), "color", onClientResourceStart, false)
    local onHdxResourceStop = {
        scrollAutoSize = true,
        selectedRow = 0,
        rows = 0,
        rowH = _y(25),
        gapH = _y(0),
        tabW = _x(15),
        textTabW = _x(0),
        secTabRight = _x(5),
        secTabDown = _y(5),
        scrolledPercentY = 0,
        scrollTabW = 0,
        font = "default",
        scale = 1 * font_mul,
        hasDivider = false,
        dividerColor = { [STATE_IDLE] = tocolor(240, 240, 240, 255), [STATE_HOVERED] = tocolor(0, 184, 223, 255), [STATE_PRESSED] = tocolor(0, 164, 203, 255) },
        textHorizontalAlign = "left",
        textVerticalAlign = "center",
        contentH = nil.rows * nil.rowH,
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6), "data", onHdxResourceStop, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6), "scroll", hdxCreateScroll(arg1 + arg3 - 15, arg2, 15, 30, tocolor(71, 75, 81, 180), lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6)), false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxList", arg6)
end

hdxCreatePanel = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxPanel", arg6)) then
        return false
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxPanel", arg6), "color", { [STATE_IDLE] = getFormattedColor(arg5, tColor.darkgrey) }, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxPanel", arg6)
end

hdxCreateProgressbar = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxProgressbar", arg8)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg5, tColor.white), [STATE_HOVERED] = getFormattedColor(arg5, tColor.white), [STATE_PRESSED] = getFormattedColor(arg5, tColor.white) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxProgressbar", arg8), "color", onClientResourceStart, false)
    local onHdxResourceStop = { colorProgress = tColor.white, scrollType = "horizontal", progress = 0 }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxProgressbar", arg8), "data", onHdxResourceStop, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxProgressbar", arg8)
end

hdxCreateRoundBar = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxRoundBar", arg9)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg5, tColor.darkgrey), [STATE_HOVERED] = getFormattedColor(arg5, tColor.darkgrey), [STATE_PRESSED] = getFormattedColor(arg5, tColor.darkgrey) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxRoundBar", arg9), "color", onClientResourceStart, false)
    local onHdxResourceStop = { colorProgress = getFormattedColor(arg6, tColor.white), progress = 0, borderWidth = (_x(arg8) or _x(5)) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxRoundBar", arg9), "data", onHdxResourceStop, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxRoundBar", arg9)
end

hdxCreateScroll = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg5, tocolor(81, 87, 99, 255)), [STATE_HOVERED] = getFormattedColor(arg5, tocolor(81, 87, 99, 255)), [STATE_PRESSED] = getFormattedColor(arg5, tocolor(81, 87, 99, 255)) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6), "color", onClientResourceStart, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6), "data", { scrollType = (arg7 or lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6)) })
    if arg7 == "vertical" then
        local onHdxResourceStart = lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6)
        local lockClient = _x(arg3 * 0.5)
    end
    local onHdxResourceStart = {
        _y(arg4 * 0.5),
        _y(arg4 * 0.5),
        _y(arg4 * 0.5),
        _y(arg4 * 0.5),
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6), "roundedCorners", onHdxResourceStart, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxScroll", arg6)
end

hdxCreateScrollBar = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)) then
        return false
    end
    local onClientResourceStart = { [STATE_IDLE] = getFormattedColor(arg5, tColor.white), [STATE_HOVERED] = getFormattedColor(arg5, tColor.white), [STATE_PRESSED] = getFormattedColor(arg5, tColor.white) }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8), "color", onClientResourceStart, false)
    if arg7 ~= "vertical" then
        local onHdxResourceStop = getFormattedColor(arg6, tColor.darkgrey)
        local onHdxResourceStart = "horizontal"
        local lockClient = lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)
    end
    if arg7 == "horizontal" then
        if 15 < arg4 then
            local onHdxResourceStop = lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)
            local onHdxResourceStart = {
                bColor = getFormattedColor(arg6, tColor.darkgrey),
                bShowSteps = true,
                bSetByClick = false,
                scrollType = arg7,
            }
        end
        hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8), "scrollHorizontal", hdxCreateScroll(arg1 - 15 * 0.5, arg2 - (15 - arg4) * 0.5, 15, 15, tColor.white, lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8), "horizontal"), false)
        local onHdxResourceStop = arg1 - 15 * 0.5
        local onHdxResourceStart = arg2 - (15 - arg4) * 0.5
        local lockClient = lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)
        local tripClient = {
            bColor = getFormattedColor(arg6, tColor.darkgrey),
            bShowSteps = true,
            bSetByClick = false,
            scrollType = arg7,
            scrolledPercentX = 0,
        }
        local var_5 = 15
    end
    if 15 < arg3 then
        local onHdxResourceStop = lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)
        local onHdxResourceStart = {
            bColor = getFormattedColor(arg6, tColor.darkgrey),
            bShowSteps = true,
            bSetByClick = false,
            scrollType = arg7,
            scrolledPercentX = 0,
        }
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8), "scroll", hdxCreateScroll(arg1 - (15 - arg3) * 0.5, arg2 + arg4 - 15 * 0.5, 15, 15, tColor.white, lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)), false)
    local onHdxResourceStop = {
        bColor = getFormattedColor(arg6, tColor.darkgrey),
        bShowSteps = true,
        bSetByClick = false,
        scrollType = arg7,
        scrolledPercentX = 0,
        scrolledPercentY = 0,
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8), "data", onHdxResourceStop, false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxScrollBar", arg8)
end

hdxCreateSpace = function(arg1, arg2, arg3, arg4, arg5, arg6)
    if not isElement(lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6)) then
        return false
    end
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "renderTarget", true, false)
    local onClientResourceStart = { [STATE_IDLE] = tColor.darkgrey, [STATE_HOVERED] = tColor.darkgrey, [STATE_PRESSED] = tColor.darkgrey }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "color", onClientResourceStart, false)
    local onHdxResourceStop = {
        contentType = nil,
        scrolledPercentX = 0,
        scrolledPercentY = 0,
        contentW = _x(arg3),
        contentH = _y(arg4),
        font = "open-sans",
        scale = 11,
    }
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "data", onHdxResourceStop, false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "scroll", hdxCreateScroll(arg1 + arg3 - 15, arg2, 15, 100, tocolor(71, 75, 81, 180), lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6)), false)
    hdxSetData(lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "scrollHorizontal", hdxCreateScroll(arg1, arg2 + arg4 - 15, 100, 15, tocolor(71, 75, 81, 180), lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "horizontal"), false)
    hdxSetElementVisible(hdxCreateScroll(arg1, arg2 + arg4 - 15, 100, 15, tocolor(71, 75, 81, 180), lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6), "horizontal"), false)
    return lockClient(arg1, arg2, arg3, arg4, "hdxSpace", arg6)
end

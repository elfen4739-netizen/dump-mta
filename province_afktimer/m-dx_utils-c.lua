-- ByteRevenant
-- LuaQ 5.1 structured decompile

myResolutionY = 1080
myResolutionX = 1920
screenH = screenY
screenW = screenX
ratio_mul = screenW / screenH / myResolutionX / myResolutionY
font_mul = screenW / myResolutionX
STATE_ALL = -1
STATE_IDLE = 0
STATE_HOVERED = 1
STATE_PRESSED = 2
tColor = {
    white = tocolor(255, 255, 255, 255),
    black = tocolor(0, 0, 0, 255),
    red = tocolor(180, 0, 0, 255),
    yellow = tocolor(180, 180, 0, 255),
    green = tocolor(0, 180, 0, 255),
    darkgrey = tocolor(35, 35, 35, 255),
    lightgrey = tocolor(230, 230, 230, 255),
    lightgrey2 = tocolor(200, 200, 200, 255),
    greyBack = tocolor(34, 34, 34),
    greyPanel = tocolor(56, 56, 56),
    greyBlock = tocolor(44, 44, 44),
    greyInteractive = tocolor(71, 71, 71),
    greyInteractiveHovered = tocolor(63, 63, 63),
    grey = tocolor(80, 80, 80, 255),
    Grey5 = tocolor(204, 204, 204),
    Grey4 = tocolor(141, 141, 141),
    Grey3 = tocolor(94, 94, 94),
    Grey2 = tocolor(75, 75, 75),
    Grey1 = tocolor(45, 45, 45),
    LightGreen = tocolor(40, 200, 140),
    Green = tocolor(30, 160, 120),
    DarkGreen = tocolor(20, 120, 100),
    ghost = tocolor(0, 0, 0, 0),
    redError = tocolor(212, 76, 76),
    greenSuccess = tocolor(71, 185, 125),
    purple = tocolor(100, 51, 128),
    pink = tocolor(166, 41, 116),
    grey45 = tocolor(45, 45, 45),
    grey59 = tocolor(59, 59, 59),
    grey75 = tocolor(75, 75, 75),
    grey204 = tocolor(204, 204, 204),
    grey207 = tocolor(207, 207, 207),
    random =     function()
        return tocolor, math.random(0, 255), math.random(0, 255), math.random(0, 255), 255, 255
    end,
}

isEvent = function(arg1, arg2, arg3)
    if type(arg1) == "string" then
        if isElement(arg2) then
            if type(arg3) == "function" then
                if type(getEventHandlers(arg1, arg2)) == "table" then
                    if 0 < #getEventHandlers(arg1, arg2) then
                        for k, v in ipairs(getEventHandlers(arg1, arg2)) do
                            if v == arg3 then
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

isCustomHudRunning = function()
    if getResourceFromName("province_hud") then
    end
    return false
    return true
end

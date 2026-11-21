-- ByteRevenant
-- LuaQ 5.1 structured decompile

GR_TITLE = 1
GR_DESC = 2
GR_ROUNDBAR = 3
GR_PROGRESSBAR = 4
GR_TIMER = 5

createStaticMessage = function(arg1, arg2, arg3, arg4)
    if not arg1 or not arg2 then
        return false
    end
    if arg3 and arg4 then
        local var = createElement("notifications:Static")
    end
    local var = {
        header = "",
        text = "",
        min = false,
        sec = false,
        timer = false,
    }
    setElementData(createElement("notifications:Static"), "data", var, false)
    return createElement("notifications:Static")
end

setStaticMessageTimerValue = function(arg1, arg2, arg3)
    if isElement(arg1) and arg2 then
    end
    return false
end

setStaticMessageHeader = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    getElementData(arg1, "data").header = arg2
    setElementData(arg1, "data", getElementData(arg1, "data"), false)
end

setStaticMessageText = function(arg1, arg2)
    if not isElement(arg1) or not arg2 then
        return false
    end
    getElementData(arg1, "data").text = arg2
    setElementData(arg1, "data", getElementData(arg1, "data"), false)
end

clearStaticMessage = function(arg1)
    if not isElement(arg1) then
        return false
    end
    destroyElement(arg1)
end

sendNotification = function(arg1, arg2, arg3, arg4, arg5)
    exports.province_notifications:sendNotification(arg1, arg2, arg3, arg4, arg5)
end

createStatusMessage = function(arg1, arg2)
    exports.province_notifications:createStatusMessage(arg1, arg2)
end

clearStatusMessage = function()
    exports.province_notifications:clearStatusMessage(text, frame)
end

createQuickButtons = function(arg1)
    exports.province_notifications:createQuickButtons(arg1)
end

destroyQuickButtons = function()
    exports.province_notifications:destroyQuickButtons()
end

setQuickButtonActive = function(arg1, arg2)
    exports.province_notifications:setQuickButtonActive(arg1, arg2)
end

setVisibleButtonHelp = function(arg1, arg2)
    exports.province_notifications:setVisibleButtonHelp(arg1, arg2)
end

hideAllButtonHelp = function()
    exports.province_notifications:hideAllButtonHelp()
end

createProgress = function(arg1, arg2, arg3)
    exports.province_notifications:createProgress(arg1, arg2, arg3)
end

setProgressValue = function(arg1, arg2)
    exports.province_notifications:setProgressValue(arg1, arg2)
end

clearProgress = function(arg1)
    exports.province_notifications:clearProgress(arg1)
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}
local var_1 = 0
local var_2 = 0

local function lockClient()
    if not isElement(var.eUnloadingImage) then
        return
    end
    if var_1 >= getTickCount() then
        return
    end
    var_2 = var_2 + 1
    if 359 < var_2 then
        var_2 = 0
    end
    hdxSetElementRotation(var.eUnloadingImage, var_2)
    var_1 = getTickCount() + 20
end

local state = nil

local function tripClient(arg1)
    model = model or -1
    if isElement(state) then
        return
    end
    if not ("audio/" .. (getGoodsSound(arg1) or "loadingMain") .. ".mp3") then
        return
    end
    state = playSound("audio/" .. getGoodsSound(arg1) .. ".mp3", true)
end

local function var_5(arg1)
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)), "center", "center")
    hdxSetElementRounded(hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)), 155)
    hdxSetElementDisabled(hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)), true)
    hdxSetElementRelativePosition(hdxCreateLabel("Разгрузка", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(24), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20))), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)), "center", "top", false, 0, 198)
    hdxSetElementDisabled(hdxCreateLabel("Разгрузка", 0, 0, tocolor(255, 255, 255, 255), "FuturaDemi", convertFigmaFontSize(24), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20))), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 258, 258, "/images/unloadingImage.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20))), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)), "center", "center", false, 0, 0)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 94, 94, ":province_gui/images/box_icon.png", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20))), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)), "center", "top", false, 0, 87)
    var.eUnloadingPanel = hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20))
    var.eUnloadingImage = hdxCreateImage(0, 0, 258, 258, "/images/unloadingImage.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 310, 310, tocolor(41, 135, 245, 20)))
end

local function var_6(arg1)
    if arg1 then
        addEventHandler("onClientPreRender", root, lockClient)
    end
    if isEvent("onClientPreRender", root, lockClient) then
        removeEventHandler("onClientPreRender", root, lockClient)
    end
    var_2 = 0
    hdxSetElementRotation(var.eUnloadingImage, 0)
end

setLoadingGoodsVisible = function(arg1, arg2, arg3)
    if arg1 then
        if isElement(var.eUnloadingPanel) then
            return
        end
        tripClient(arg3)
        var_5(arg2)
    end
    if isElement(var.eUnloadingPanel) then
        destroyElement(var.eUnloadingPanel)
    end
    if isElement(state) then
        destroyElement(state)
    end
    var_6(arg1)
end

addEvent("trucker:setLoadingGoodsVisible", true)
addEventHandler("trucker:setLoadingGoodsVisible", resourceRoot, setLoadingGoodsVisible)

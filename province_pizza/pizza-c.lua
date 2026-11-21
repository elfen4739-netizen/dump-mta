-- ByteRevenant
-- LuaQ 5.1 structured decompile

local state = nil

destroyInterfaceTimer = function()
    if state then
        if isTimer(state) then
            killTimer(state)
        end
    end
    state = nil
end

local var = {}
local flag = false

local function var_1(arg1)
    if addEventHandler("onHdxElementPressed", var.panel, funcPress) then
        addEventHandler("onHdxElementPressed", var.panel, funcPress)
    end
    if isElement(var.panel) then
        destroyElement(var.panel)
    end
    if isElement(flag) then
        destroyElement(flag)
        flag = false
    end
    var = {}
    destroyInterfaceTimer()
end

local function var_2(arg1)
    if not isElement(var.panel) then
        return
    end
    if type(arg1) == "boolean" then
    end
    if false then
        destroyInterfaceTimer()
    end
    hdxSetElementVisible(var.panel, false)
    showCursor(false)
end

local function lockClient(arg1)
    destroyInterfaceTimer()
    state = setTimer(var_1, 300000, 1, arg1)
end

local state_4 = nil

local function var_5(arg1)
    if type(arg1) == "boolean" then
    end
    if false then
        if not isElement(flag) then
            createScorePizza()
        end
    end
    if not isElement(flag) then
        return
    end
    destroyElement(flag)
end

local function var_6(arg1)
    for k, v in pairs(var) do
        if type(v) == "table" then
            if v.actived then
                hdxSetElementVisible(var[k].obj, false)
                var[k].actived = false
            end
        end
    end
    var[arg1].actived = false
    hdxSetElementVisible(var[arg1].obj, false)
end

local var_7 = 0.70999999999999996

local function var_8(arg1, arg2)
    if arg1 ~= "left" then
        return
    end
    if arg2 then
        return
    end
    if var.close ~= source then
        if var.invite.btnClose ~= source then
        end
    end
    var_2(false)
    if var.invite then
        if var.invite.btnAccept == source then
            var_2(false)
            triggerServerEvent("pizza:onJobAccepted", resourceRoot, state_4)
            var_2(false)
            var_5(true)
        end
    end
    if var.uninvite.leave == source then
        var_2(false)
        triggerServerEvent("pizza:onJobCanceled", resourceRoot, state_4)
        var_5(false)
        lockClient()
    end
    if var.refresh.leave == source then
        var_6("uninvite")
    end
    if var.refresh.btnUpPizza == source then
        triggerServerEvent("pizza:refilPizza", resourceRoot)
    end
    if var.refresh.btnTakeOrder ~= source then
        return
    end
    triggerServerEvent("pizza:newOrders", resourceRoot)
end

createScorePizza = function()
    if isElement(flag) then
        return
    end
    flag = createStaticMessage("Доставка пиццы", "У вас осталось 5 пицц")
end

local var_9 = {}
local var_10 = {}
for k, v in ipairs({
    {
        -505.77499999999998,
        29.195,
        599.35900000000004,
        6,
        18,
    },
    {
        -30.989000000000001,
        143.23099999999999,
        -1.0509999999999999,
        0,
        0,
    },
}) do
    setElementInterior(createPickup(v[1], v[2], v[3], 3, 1275), v[4])
    setElementDimension(createPickup(v[1], v[2], v[3], 3, 1275), v[5])
    var_9[createPickup(v[1], v[2], v[3], 3, 1275)] = k
    var_10[k] =     function(arg1, arg2)
        setElementData(createElement("text"), "data", { createElement("text") })
        setElementPosition(createElement("text"), value_5, value_6, value_7 + arg2)
        attachElements(createElement("text"), arg1, 0, 0, arg2)
        setElementInterior(createElement("text"), getElementInterior(arg1))
        setElementDimension(createElement("text"), getElementDimension(arg1))
        return createElement("text")
    end(createPickup(v[1], v[2], v[3], 3, 1275), 0.40000000000000002, "Доставка пиццы", 15, tocolor(239, 228, 176, 255), 2, nil, nil, false, false)
    if v[4] == 0 then
        if v[5] == 0 then
            createBlipAttachedTo(createPickup(v[1], v[2], v[3], 3, 1275), 29, 2, 255, 0, 0, 255, 0, 300)
            local screenX, screenY = guiGetScreenSize()
            local function sub_1001()
                if isElement(var.panel) then
                    if hdxIsElementVisible(var.panel) then
                        var_2(false)
                        lockClient()
                    end
                end
                if not isElement(flag) then
                    return
                end
                destroyElement(flag)
                flag = false
            end
            local function sub_1002(arg1, arg2)
                if not isElement(arg1) then
                    return
                end
                if type(arg2) ~= "boolean" then
                    return
                end
                if arg2 then
                end
                hdxSetElementColor(arg1, STATE_ALL, tocolor(77, 77, 77, 122))
                if arg2 then
                end
                hdxSetElementColor(arg1, STATE_HOVERED, tocolor(77, 77, 77, 122))
                if arg2 then
                end
                hdxSetElementColor(arg1, STATE_PRESSED, tocolor(77, 77, 77, 122))
                if arg2 then
                end
                hdxSetElementTextColor(arg1, STATE_ALL, 2147483647)
                hdxSetElementDisabled(arg1, not arg2)
            end
            local function sub_1003()
                if isElement(var.panel) then
                    return
                end
                hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 600, 450, 4280690214), "center", "center")
                hdxSetElementRounded(hdxCreatePanel(0, 0, 600, 450, 4280690214), 30)
                hdxSetElementVisible(hdxCreatePanel(0, 0, 600, 450, 4280690214), false)
                hdxSetElementDisabled(hdxCreatePanel(0, 0, 600, 450, 4280690214), true)
                hdxSetElementRelativePosition(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 31)
                hdxSetElementDisabled(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
                hdxSetElementRelativePosition(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "top", false, 24, 24)
                hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_HOVERED, tocolor(200, 200, 200, 123))
                hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_PRESSED, tocolor(200, 200, 200, 123))
                var.close = hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214))
                hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
                hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
                hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
                hdxSetElementRelativePosition(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
                hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
                hdxSetLabelWordwrapped(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 265)
                hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
                hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
                hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
                hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "atright", "center", false, 15, 0)
                hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(71, 178, 125, 200))
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(71, 178, 125, 200))
                hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
                hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
                hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
                var.invite = {
                    obj = hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
                    btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    btnAccept = hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    actived = false,
                }
                hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 93)
                hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
                hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
                hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
                hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "top", false, 0, 20)
                hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
                hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
                hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "bottom", false, 0, 20)
                hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
                hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
                hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
                hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
                hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
                var.refresh = {
                    obj = hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
                    btnTakeOrder = hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    btnUpPizza = hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    actived = false,
                }
                hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
                hdxSetElementRounded(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
                hdxSetElementDisabled(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
                hdxSetElementRelativePosition(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
                hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
                hdxSetLabelWordwrapped(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 251)
                hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
                hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
                hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
                hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 200, 35)
                hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
                hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
                var.uninvite = {
                    obj = hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
                    btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                    actived = false,
                }
                hdxSetElementVisible(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
                hdxSetElementRelativePosition(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "bottom", false, 0, 0)
                hdxSetElementDisabled(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
                var.panel = hdxCreatePanel(0, 0, 600, 450, 4280690214)
                addEventHandler("onHdxElementPressed", hdxCreatePanel(0, 0, 600, 450, 4280690214), var_8)
            end
            local var_17 = createPickup(v[1], v[2], v[3], 3, 1275)
        end
        local screenX, screenY = guiGetScreenSize()
        local function sub_1004()
            if isElement(var.panel) then
                if hdxIsElementVisible(var.panel) then
                    var_2(false)
                    lockClient()
                end
            end
            if not isElement(flag) then
                return
            end
            destroyElement(flag)
            flag = false
        end
        local function sub_1005(arg1, arg2)
            if not isElement(arg1) then
                return
            end
            if type(arg2) ~= "boolean" then
                return
            end
            if arg2 then
            end
            hdxSetElementColor(arg1, STATE_ALL, tocolor(77, 77, 77, 122))
            if arg2 then
            end
            hdxSetElementColor(arg1, STATE_HOVERED, tocolor(77, 77, 77, 122))
            if arg2 then
            end
            hdxSetElementColor(arg1, STATE_PRESSED, tocolor(77, 77, 77, 122))
            if arg2 then
            end
            hdxSetElementTextColor(arg1, STATE_ALL, 2147483647)
            hdxSetElementDisabled(arg1, not arg2)
        end
        local function sub_1006()
            if isElement(var.panel) then
                return
            end
            hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 600, 450, 4280690214), "center", "center")
            hdxSetElementRounded(hdxCreatePanel(0, 0, 600, 450, 4280690214), 30)
            hdxSetElementVisible(hdxCreatePanel(0, 0, 600, 450, 4280690214), false)
            hdxSetElementDisabled(hdxCreatePanel(0, 0, 600, 450, 4280690214), true)
            hdxSetElementRelativePosition(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 31)
            hdxSetElementDisabled(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
            hdxSetElementRelativePosition(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "top", false, 24, 24)
            hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_HOVERED, tocolor(200, 200, 200, 123))
            hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_PRESSED, tocolor(200, 200, 200, 123))
            var.close = hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214))
            hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
            hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
            hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
            hdxSetElementRelativePosition(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
            hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
            hdxSetLabelWordwrapped(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 265)
            hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
            hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
            hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
            hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "atright", "center", false, 15, 0)
            hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(71, 178, 125, 200))
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(71, 178, 125, 200))
            hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
            hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
            hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
            var.invite = {
                obj = hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
                btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                btnAccept = hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                actived = false,
            }
            hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 93)
            hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
            hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
            hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
            hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "top", false, 0, 20)
            hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
            hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
            hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "bottom", false, 0, 20)
            hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
            hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
            hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
            hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
            hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
            var.refresh = {
                obj = hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
                btnTakeOrder = hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                btnUpPizza = hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                actived = false,
            }
            hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
            hdxSetElementRounded(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
            hdxSetElementDisabled(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
            hdxSetElementRelativePosition(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
            hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
            hdxSetLabelWordwrapped(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 251)
            hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
            hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
            hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
            hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 200, 35)
            hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
            hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
            var.uninvite = {
                obj = hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
                btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
                actived = false,
            }
            hdxSetElementVisible(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
            hdxSetElementRelativePosition(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "bottom", false, 0, 0)
            hdxSetElementDisabled(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
            var.panel = hdxCreatePanel(0, 0, 600, 450, 4280690214)
            addEventHandler("onHdxElementPressed", hdxCreatePanel(0, 0, 600, 450, 4280690214), var_8)
        end
        local var_17 = createPickup(v[1], v[2], v[3], 3, 1275)
    end
    local screenX, screenY = guiGetScreenSize()
    local function sub_1007()
        if isElement(var.panel) then
            if hdxIsElementVisible(var.panel) then
                var_2(false)
                lockClient()
            end
        end
        if not isElement(flag) then
            return
        end
        destroyElement(flag)
        flag = false
    end
    local function sub_1008(arg1, arg2)
        if not isElement(arg1) then
            return
        end
        if type(arg2) ~= "boolean" then
            return
        end
        if arg2 then
        end
        hdxSetElementColor(arg1, STATE_ALL, tocolor(77, 77, 77, 122))
        if arg2 then
        end
        hdxSetElementColor(arg1, STATE_HOVERED, tocolor(77, 77, 77, 122))
        if arg2 then
        end
        hdxSetElementColor(arg1, STATE_PRESSED, tocolor(77, 77, 77, 122))
        if arg2 then
        end
        hdxSetElementTextColor(arg1, STATE_ALL, 2147483647)
        hdxSetElementDisabled(arg1, not arg2)
    end
    local function sub_1009()
        if isElement(var.panel) then
            return
        end
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 600, 450, 4280690214), "center", "center")
        hdxSetElementRounded(hdxCreatePanel(0, 0, 600, 450, 4280690214), 30)
        hdxSetElementVisible(hdxCreatePanel(0, 0, 600, 450, 4280690214), false)
        hdxSetElementDisabled(hdxCreatePanel(0, 0, 600, 450, 4280690214), true)
        hdxSetElementRelativePosition(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 31)
        hdxSetElementDisabled(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "top", false, 24, 24)
        hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_HOVERED, tocolor(200, 200, 200, 123))
        hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_PRESSED, tocolor(200, 200, 200, 123))
        var.close = hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214))
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
        hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
        hdxSetElementRelativePosition(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
        hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
        hdxSetLabelWordwrapped(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 265)
        hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
        hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
        hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
        hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "atright", "center", false, 15, 0)
        hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(71, 178, 125, 200))
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(71, 178, 125, 200))
        hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
        hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
        hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
        var.invite = {
            obj = hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
            btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            btnAccept = hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            actived = false,
        }
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 93)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
        hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
        hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
        hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "top", false, 0, 20)
        hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
        hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
        hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "bottom", false, 0, 20)
        hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
        hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
        hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
        hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
        hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
        var.refresh = {
            obj = hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
            btnTakeOrder = hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            btnUpPizza = hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            actived = false,
        }
        hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
        hdxSetElementRounded(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
        hdxSetElementDisabled(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
        hdxSetElementRelativePosition(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
        hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
        hdxSetLabelWordwrapped(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 251)
        hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
        hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
        hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
        hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 200, 35)
        hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
        hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
        var.uninvite = {
            obj = hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
            btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
            actived = false,
        }
        hdxSetElementVisible(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
        hdxSetElementRelativePosition(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "bottom", false, 0, 0)
        hdxSetElementDisabled(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
        var.panel = hdxCreatePanel(0, 0, 600, 450, 4280690214)
        addEventHandler("onHdxElementPressed", hdxCreatePanel(0, 0, 600, 450, 4280690214), var_8)
    end
    local var_17 = createPickup(v[1], v[2], v[3], 3, 1275)
end
local state_11 = nil

local function onClientRestore()
    state_11 = getTickCount()
end

addEventHandler("onClientRestore", root, onClientRestore)
local flag_13 = false
local state_14 = nil

local function var_15()
    if not isMTAWindowFocused() then
        return
    end
    if state_11 then
        if getTickCount() - state_11 < 1000 then
            return
        end
    end
    if not isElement((getPedOccupiedVehicle(localPlayer) or false)) then
        return
    end
    if isChatBoxInputActive() then
        return
    end
    if isCursorShowing() then
        return
    end
    if hdxIsEditboxActive() then
        return
    end
    if isConsoleActive() then
        return
    end
    if isMainMenuActive() then
        return
    end
    if getElementData(localPlayer, "battlePass:isVisible") then
        return
    end
    if not flag_13 then
        return
    end
    if not tonumber(state_14) then
        return
    end
    if state_14 < 1 then
        outputNotification("У вас закончились пиццы. Возвращайтесь на базу и пополните запасы.", 255, 164, 74)
        local var = getPedOccupiedVehicle(localPlayer)
    end
    if isElement(flag) then
        if state_14 then
            setStaticMessageText(flag, string.format("У вас осталось %s пицц", state_14))
        end
    end
    triggerServerEvent("pizza:throwPizza_serv", resourceRoot)
end

local state_16 = nil
addEvent("pizza:OpenWorkGui", true)

local function var_17()
    if isElement(var.panel) then
        return
    end
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 600, 450, 4280690214), "center", "center")
    hdxSetElementRounded(hdxCreatePanel(0, 0, 600, 450, 4280690214), 30)
    hdxSetElementVisible(hdxCreatePanel(0, 0, 600, 450, 4280690214), false)
    hdxSetElementDisabled(hdxCreatePanel(0, 0, 600, 450, 4280690214), true)
    hdxSetElementRelativePosition(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 31)
    hdxSetElementDisabled(hdxCreateLabel("Пиццерия", 0, 0, 4294967295, "FuturaDemi", 30 * var_7, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "top", false, 24, 24)
    hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_HOVERED, tocolor(200, 200, 200, 123))
    hdxSetElementColor(hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), STATE_PRESSED, tocolor(200, 200, 200, 123))
    var.close = hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", tocolor(207, 207, 207, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214))
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
    hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
    hdxSetElementRelativePosition(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
    hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
    hdxSetLabelWordwrapped(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 265)
    hdxSetElementDisabled(hdxCreateLabel("Работая курьером, вы будете\n\tразвозить горячую пиццу\n\tна скутере и обслуживать VIP-клиентов.\n\t\n\tЗарплата зависит от вашего\n\tуровня. Работайте аккуратно и соблюдайте ПДД!", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
    hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
    hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
    hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "atright", "center", false, 15, 0)
    hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(71, 178, 125, 200))
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(71, 178, 125, 200))
    hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(255, 255, 255, 200))
    hdxSetElementTextColor(hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(255, 255, 255, 200))
    hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
    var.invite = {
        obj = hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
        btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        btnAccept = hdxCreateButton(0, 0, 150, 45, 4282888829, "Работать", hdxCreatePanel(0, 0, 315, 216, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        actived = false,
    }
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 93)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
    hdxSetElementDisabled(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
    hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
    hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "top", false, 0, 20)
    hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
    hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
    hdxSetElementRounded(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "bottom", false, 0, 20)
    hdxSetElementFont(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 4283256141)
    hdxSetElementColor(hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 4283256141)
    hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
    hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
    hdxSetElementVisible(hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
    var.refresh = {
        obj = hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
        btnTakeOrder = hdxCreateButton(0, 0, 265, 45, 4282400832, "Взять новые заказы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        btnUpPizza = hdxCreateButton(0, 0, 265, 45, 4282400832, "Пополнить запасы пиццы", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 315, 145, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        actived = false,
    }
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "top", false, 35, 97)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), 15)
    hdxSetElementDisabled(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
    hdxSetElementRelativePosition(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), "center", "center", false, 0, 0)
    hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
    hdxSetLabelWordwrapped(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true, 251)
    hdxSetElementDisabled(hdxCreateLabel("Вы действительно хотите\n\tзавершить смену и уволиться\n\tс работы?", 0, 0, 4294967295, "FuturaBook", 20 * var_7, hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), true)
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 35, 35)
    hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, tocolor(77, 77, 77, 200))
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, tocolor(77, 77, 77, 200))
    hdxSetElementRounded(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), 15)
    hdxSetElementRelativePosition(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), hdxCreatePanel(0, 0, 600, 450, 4280690214), "left", "bottom", false, 200, 35)
    hdxSetElementFont(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), "FuturaDemi", 18 * var_7)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_HOVERED, 2144947276)
    hdxSetElementColor(hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))), STATE_PRESSED, 2144947276)
    var.uninvite = {
        obj = hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)),
        btnClose = hdxCreateButton(0, 0, 150, 45, 4283256141, "Закрыть", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        leave = hdxCreateButton(0, 0, 150, 45, 4292430924, "Уволиться", hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214))),
        actived = false,
    }
    hdxSetElementVisible(hdxCreatePanel(0, 0, 301, 106, 4281545523, hdxCreatePanel(0, 0, 600, 450, 4280690214)), false)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), hdxCreatePanel(0, 0, 600, 450, 4280690214), "right", "bottom", false, 0, 0)
    hdxSetElementDisabled(hdxCreateImage(0, 0, 250, 350, "assets/job.dds", tocolor(255, 255, 255), hdxCreatePanel(0, 0, 600, 450, 4280690214)), true)
    var.panel = hdxCreatePanel(0, 0, 600, 450, 4280690214)
    addEventHandler("onHdxElementPressed", hdxCreatePanel(0, 0, 600, 450, 4280690214), var_8)
end

local function sub_1010()
    if not isElement(var.panel) then
        var_17()
        var_6("invite")
    end
    destroyInterfaceTimer()
    var_2(true)
end

addEventHandler("pizza:OpenWorkGui", localPlayer, sub_1010)
addEvent("pizza:CloseGUIWork", true)

local function sub_1011()
    var_2(false)
end

addEventHandler("pizza:CloseGUIWork", localPlayer, sub_1011)
for k in pairs(var_9) do
    local function onClientPickupLeave(arg1)
        if arg1 ~= localPlayer then
            return
        end
        if isPedInVehicle(arg1) then
            return
        end
        if isPedDead(arg1) then
            return
        end
        if not var_9[source] then
            return
        end
        state_4 = var_9[source]
        if flag_13 then
        end
        triggerServerEvent("pizza:AfterPickup", resourceRoot, state_4)
        var_6("uninvite")
        var_2(true)
    end
    addEventHandler("onClientPickupHit", k, onClientPickupLeave)
    local screenX, screenY = guiGetScreenSize()
    local function sub_1012()
        if isElement(var.panel) then
            if hdxIsElementVisible(var.panel) then
                var_2(false)
                lockClient()
            end
        end
        if not isElement(flag) then
            return
        end
        destroyElement(flag)
        flag = false
    end
    local function sub_1013(arg1, arg2)
        if not isElement(arg1) then
            return
        end
        if type(arg2) ~= "boolean" then
            return
        end
        if arg2 then
        end
        hdxSetElementColor(arg1, STATE_ALL, tocolor(77, 77, 77, 122))
        if arg2 then
        end
        hdxSetElementColor(arg1, STATE_HOVERED, tocolor(77, 77, 77, 122))
        if arg2 then
        end
        hdxSetElementColor(arg1, STATE_PRESSED, tocolor(77, 77, 77, 122))
        if arg2 then
        end
        hdxSetElementTextColor(arg1, STATE_ALL, 2147483647)
        hdxSetElementDisabled(arg1, not arg2)
    end
    local function sub_1014(arg1, arg2)
        if flag_13 == arg1 then
            return
        end
        if arg1 then
            bindKey("mouse1", "up", var_15)
            bindKey("lalt", "up", var_15)
            var_6("uninvite")
            local var = {
                "Закончить работу",
                15,
                tocolor(255, 0, 0, 255),
                2,
                nil,
                nil,
                false,
                false,
            }
            setElementData(var_10[state_16], "data", var)
        end
        state_14 = nil
        lockClient(true)
        var_6("invite")
        var_2(false)
        var_5(false)
        unbindKey("mouse1", "up", var_15)
        unbindKey("lalt", "up", var_15)
        local var = {
            "Доставка пиццы",
            15,
            tocolor(239, 228, 176, 255),
            2,
            nil,
            nil,
            false,
            false,
        }
        setElementData(var_10[state_16], "data", var)
        flag_13 = arg1
        state_16 = arg2
    end
end

local function onClientPickupLeave(arg1, arg2)
    if not isElement(var.panel) then
        return
    end
    if not hdxIsElementVisible(var.panel) then
        return
    end
    var_2(false)
    if flag_13 then
        return
    end
    lockClient()
end

addEventHandler("onClientPickupLeave", resourceRoot, onClientPickupLeave)
addEvent("pizza:getNumber", true)

local function sub_1015(arg1)
    if not isElement(flag) then
        createScorePizza()
    end
    state_14 = arg1
    if not isElement(flag) then
        return
    end
    setStaticMessageText(flag, string.format("У вас осталось %s пицц", state_14))
end

addEventHandler("pizza:getNumber", localPlayer, sub_1015)
addEvent("pizza:setWorkStarted", true)

local function var_22(arg1, arg2)
    if flag_13 == arg1 then
        return
    end
    if arg1 then
        bindKey("mouse1", "up", var_15)
        bindKey("lalt", "up", var_15)
        var_6("uninvite")
        local var = {
            "Закончить работу",
            15,
            tocolor(255, 0, 0, 255),
            2,
            nil,
            nil,
            false,
            false,
        }
        setElementData(var_10[state_16], "data", var)
    end
    state_14 = nil
    lockClient(true)
    var_6("invite")
    var_2(false)
    var_5(false)
    unbindKey("mouse1", "up", var_15)
    unbindKey("lalt", "up", var_15)
    local var = {
        "Доставка пиццы",
        15,
        tocolor(239, 228, 176, 255),
        2,
        nil,
        nil,
        false,
        false,
    }
    setElementData(var_10[state_16], "data", var)
    flag_13 = arg1
    state_16 = arg2
end

local function sub_1016(arg1, arg2)
    if not isElement(var.panel) and arg1 then
        var_17()
        var_6("invite")
    end
    var_22(arg1, arg2)
end

addEventHandler("pizza:setWorkStarted", resourceRoot, sub_1016)
local var_24 = 0.10000000000000001
addEvent("throwPizza", true)

local function sub_1017()
    if not isElement(getPedOccupiedVehicle(source)) then
        return
    end
    setElementCollidableWith(createObject(1582, value_1, value_2, value_3 + 1), getPedOccupiedVehicle(source), false)
    setElementCollidableWith(createObject(1582, value_1, value_2, value_3 + 1), localPlayer, false)
    setTimer(setElementVelocity, 100, 1, createObject(1582, value_1, value_2, value_3 + 1), math.cos(math.rad(value_6)) * var_24, math.sin(math.rad(value_6)) * var_24, -0.10000000000000001)
    setTimer(destroyElement, 5000, 1, createObject(1582, value_1, value_2, value_3 + 1))
end

addEventHandler("throwPizza", root, sub_1017)
addEvent("pizza:baseMenu", true)

local function var_26(arg1, arg2)
    if not isElement(arg1) then
        return
    end
    if type(arg2) ~= "boolean" then
        return
    end
    if arg2 then
    end
    hdxSetElementColor(arg1, STATE_ALL, tocolor(77, 77, 77, 122))
    if arg2 then
    end
    hdxSetElementColor(arg1, STATE_HOVERED, tocolor(77, 77, 77, 122))
    if arg2 then
    end
    hdxSetElementColor(arg1, STATE_PRESSED, tocolor(77, 77, 77, 122))
    if arg2 then
    end
    hdxSetElementTextColor(arg1, STATE_ALL, 2147483647)
    hdxSetElementDisabled(arg1, not arg2)
end

local function sub_1018(arg1, arg2)
    if isElement(var.refresh.btnUpPizza) then
        if isElement(var.refresh.btnTakeOrder) then
            if arg1 then
            end
            var_26(var.refresh.btnUpPizza, false)
            if arg2 then
            end
            var_26(var.refresh.btnTakeOrder, false)
        end
    end
    var_6("refresh")
    var_2(true)
end

addEventHandler("pizza:baseMenu", resourceRoot, sub_1018)

local function onClientPlayerWasted()
    if isElement(var.panel) then
        if hdxIsElementVisible(var.panel) then
            var_2(false)
            lockClient()
        end
    end
    if not isElement(flag) then
        return
    end
    destroyElement(flag)
    flag = false
end

addEventHandler("onClientPlayerWasted", localPlayer, onClientPlayerWasted)

local function onClientPlayerBusted()
    if isElement(var.panel) then
        if hdxIsElementVisible(var.panel) then
            var_2(false)
            lockClient()
        end
    end
    if not isElement(flag) then
        return
    end
    destroyElement(flag)
    flag = false
end

addEventHandler("onClientPlayerBusted", localPlayer, onClientPlayerBusted)

local function onLogout()
    if isElement(var.panel) then
        if hdxIsElementVisible(var.panel) then
            var_2(false)
            lockClient()
        end
    end
    if not isElement(flag) then
        return
    end
    destroyElement(flag)
    flag = false
end

addEventHandler("onLogout", localPlayer, onLogout)
local state_31 = nil
local var_32 = {}

local function onClientResourceStart()
    state_31 = guiCreateWindow((screenX - 410) / 2, (screenY - 111) / 2, 410, 111, "Пицца", false)
    guiSetProperty(state_31, "CaptionColour", "FFFFFF00")
    guiWindowSetSizable(state_31, false)
    guiSetFont(guiCreateLabel(30, 28, 355, 30, "Вы хотите заказать пиццу за 750 рублей?\nВ случае неудачной доставки деньги будут возвращены.", false, state_31), "default-bold-small")
    guiLabelSetHorizontalAlign(guiCreateLabel(30, 28, 355, 30, "Вы хотите заказать пиццу за 750 рублей?\nВ случае неудачной доставки деньги будут возвращены.", false, state_31), "center")
    var_32[1] = guiCreateButton(15, 68, 170, 23, "Да", false, state_31)
    var_32[2] = guiCreateButton(214, 68, 170, 23, "Нет", false, state_31)
    guiSetVisible(state_31, false)
end

addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

local function onClientGUIClick()
    if source == var_32[2] then
        guiSetVisible(state_31, false)
        showCursor(false)
    end
    if source ~= var_32[1] then
        return
    end
    guiSetVisible(state_31, false)
    showCursor(false)
    triggerServerEvent("pizza:orderPizza", resourceRoot)
end

addEventHandler("onClientGUIClick", resourceRoot, onClientGUIClick)

local function sub_1019()
    if getElementData(localPlayer, "CStrike-PlaysCStrike") then
        return
    end
    if flag_13 then
        outputNotification("Вы не можете закать пиццу во время работы на доставке.", 255, 0, 0)
    end
    guiSetVisible(state_31, true)
    showCursor(true)
end

addCommandHandler("pizza", sub_1019)
local var_36 = {}
addEvent("pizza:addPizzaBlip", true)

local function var_37()
    if not var_36[source] then
        return
    end
    destroyElement(var_36[source])
    var_36[source] = nil
end

local function sub_1020()
    var_36[source] = createBlipAttachedTo(source, 0, 2, 255, 127, 39)
    addEventHandler("onClientElementDestroy", source, var_37)
end

addEventHandler("pizza:addPizzaBlip", resourceRoot, sub_1020)

table.size = function(arg1)
    for k in pairs(arg1) do
        local var = 0 + 1
    end
    return 0
end

addEvent("pizza:instruction", true)

local function sub_1021()
    outputNotification("Развезите пиццу по пунктам доставки.", 255, 255, 255)
    outputNotification(string.format("Чтобы выполнить доставку, остановитесь внутри желтого маркера и нажмите %s или %s", "ЛКМ", "LALT"))
    outputNotification("Не тратьте пиццу зря! Вас уволят если вы испортите слишком много продукта!", 255, 255, 255)
end

addEventHandler("pizza:instruction", resourceRoot, sub_1021)

local function onClientKey(arg1, arg2)
    if arg1 ~= "escape" then
        return
    end
    if not arg2 then
        return
    end
    if not isElement(var.panel) then
        return
    end
    if not hdxIsElementVisible(var.panel) then
        return
    end
    cancelEvent()
    var_2(false)
end

addEventHandler("onClientKey", root, onClientKey)

isElementMoving = function(arg1)
    if isElement(arg1) then
        if Vector3(getElementVelocity(arg1)).length == 0 then
        end
        return true
    end
    return false
end

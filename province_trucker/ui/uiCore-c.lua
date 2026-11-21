-- ByteRevenant
-- LuaQ 5.1 structured decompile

tGUI = {
    main = {},
    contract = {},
    contract_lk = {},
    contract_new = {},
    contract_salary = {},
    contract_end = {},
    contract_list = {},
    contract_edit = {},
    route_detail = {},
    contract_balance = {},
    route_end = {},
    contract_continue = {},
    contract_modal = {},
    balance_history = {},
    contract_route = {},
}
tInterface = {}
InterfaceEscClose = nil
InterfacePrevEscClose = nil
tPlayerData = {}
tOpenInterface = {}
tBusinessData = {}
tContracts = {
    balance = 0,
    maxGoods = 0,
    goods = 0,
    salary = 0,
    editGoods = 0,
    editSalary = 0,
}

local function sub_1001(arg1, arg2)
    for k in pairs(copyTable(tOpenInterface)) do
        if k then
            if tInterface[k] then
                if tInterface[k].pressFunc then
                    tInterface[k].pressFunc(arg1, arg2)
                end
            end
        end
    end
end

addEventHandler("onHdxElementPressed", resourceRoot, sub_1001, true, "high")

isInterfaceOpen = function(arg1)
    if tOpenInterface[arg1] then
        return tOpenInterface[arg1]
    end
    return false
end

isAnyInterfaceOpen = function()
    if tOpenInterface then
        if next(tOpenInterface) then
            return true
        end
    end
    return false
end

openInterface = function(arg1, arg2)
    if not arg1 then
        return
    end
    if tGUI[arg1] then
    end
    tInterface[arg1].create()
    if tInterface[arg1].open then
        tInterface[arg1].open(arg2)
        tOpenInterface[arg1] = true
    end
    if isCursorShowing() then
        return
    end
    showCursor(true)
end

closeInterface = function(arg1)
    if arg1 then
        if tInterface[arg1] then
            if tInterface[arg1].close then
                tInterface[arg1].close()
            end
        end
        if tGUI[arg1] then
            if isElement(tGUI[arg1].space) then
                if not tGUI[arg1].notClearSpaceElements then
                    if tGUI[arg1].spaceElements then
                        if next(tGUI[arg1].spaceElements) then
                            for k, v in pairs(tGUI[arg1].spaceElements) do
                                if isElement(v) then
                                    destroyElement(v)
                                end
                            end
                            tGUI.spaceElements = {}
                        end
                    end
                end
            end
        end
        tOpenInterface[arg1] = nil
    end
    for k in pairs(tOpenInterface) do
        if tInterface[k].close then
            tInterface[k].close()
        end
        if tGUI[k] then
            if isElement(tGUI[k].space) then
                if not tGUI[k].notClearSpaceElements then
                    if tGUI[k].spaceElements then
                        if next(tGUI[k].spaceElements) then
                            for k, v in pairs(tGUI[k].spaceElements) do
                                if isElement(v) then
                                    destroyElement(v)
                                end
                            end
                            tGUI.spaceElements = {}
                        end
                    end
                end
            end
        end
    end
    tOpenInterface = {}
    if isCursorShowing() then
        showCursor(false)
    end
    setElementData(localPlayer, "radialMenuDisable", false, false)
    InterfaceEscClose = nil
    InterfacePrevEscClose = nil
end

local function onClientKey(arg1, arg2)
    if arg1 ~= "escape" then
        return
    end
    if not arg2 then
        return
    end
    if not InterfaceEscClose then
        return
    end
    if not tOpenInterface[InterfaceEscClose] then
        return
    end
    closeInterface(InterfaceEscClose)
    cancelEvent()
end

addEventHandler("onClientKey", root, onClientKey)
addEvent("trucker:closeContractInterface", true)

local function sub_1002()
    closeInterface("contract")
    closeInterface("contract_lk")
    closeInterface("contract_new")
    closeInterface("contract_end")
    closeInterface("contract_list")
    closeInterface("invite_job")
end

addEventHandler("trucker:closeContractInterface", resourceRoot, sub_1002)

local function onLogout()
    if not tOpenInterface then
        return
    end
    if not next(tOpenInterface) then
        return
    end
    closeInterface()
end

addEventHandler("onLogout", localPlayer, onLogout)

local function onClientPlayerWasted()
    if not tOpenInterface then
        return
    end
    if not next(tOpenInterface) then
        return
    end
    closeInterface()
end

addEventHandler("onClientPlayerWasted", localPlayer, onClientPlayerWasted)

local function onClientPlayerBusted()
    if not tOpenInterface then
        return
    end
    if not next(tOpenInterface) then
        return
    end
    closeInterface()
end

addEventHandler("onClientPlayerBusted", localPlayer, onClientPlayerBusted)

local function onClientResourceStart(arg1)
    if arg1 then
    end
    if getResourceName(arg1) ~= "province_trucker" then
        return
    end
    if not isBusinessRunning() then
        return
    end
    tBusinessData = exports.province_business:getAllBusiness()
end

addEventHandler("onClientResourceStart", root, onClientResourceStart)

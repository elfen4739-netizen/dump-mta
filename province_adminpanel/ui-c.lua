-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}
local var_1 = {}
local var_2 = {}
local lockClient = {}

local function tripClient()
    if isElement(var_1.hoverPanel) then
        return
    end
    lockClient.fontSize = value_2
    lockClient.font = value_1
    var_1.hoverPanel = hdxCreatePanel(0, 0, dxGetFontHeight(lockClient.fontSize, lockClient.font), yFHD(dxGetFontHeight(lockClient.fontSize, lockClient.font)) + 32, tocolor(45, 45, 45), var_1.adminPanel)
    hdxSetElementRounded(var_1.hoverPanel, 5)
    hdxSetElementDisabled(var_1.hoverPanel, true)
    var_1.hoverPanelText = hdxCreateLabel("", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.hoverPanel)
    hdxSetElementRelativePosition(var_1.hoverPanelText, var_1.hoverPanel, "left", "center", false, 16, 0)
    hdxSetElementTextAlign(var_1.hoverPanelText, "center", "center")
    hdxSetElementDisabled(var_1.hoverPanelText, true)
end

local function var_5(arg1)
    if not value_1 or not value_2 then
        local value_1, value_2 = getCursorPosition()
    end
    if screenW < value_1 * screenW + hdxGetElementSize(arg1) then
        local value_1, value_2 = getCursorPosition()
    end
    if not isElement(arg1) then
        return
    end
    hdxSetElementPosition(arg1, value_1 * screenW, value_2 * screenH)
end

local function var_6(arg1, arg2)
    if arg1 ~= "left" or arg2 then
    end
    if source == var_1.buttonConfirmCancel then
        hdxSetElementVisible(var_1.confirmPanel, false)
        var_2.adminToDelete = nil
    end
    if source ~= var_1.buttonConfirm then
        return
    end
    if not var_2.adminToDelete then
        return
    end
    triggerServerEvent("adminpanel:deleteAdmin", resourceRoot, var_2.adminToDelete)
    hdxSetElementVisible(var_1.confirmPanel, false)
    var_2.adminToDelete = nil
end

local function var_7(arg1, arg2)
    if arg1 ~= "left" or arg2 then
    end
    if source == var_1.cancelAdd then
        hdxSetElementVisible(var_1.addPanel, false)
    end
    if source ~= var_1.addAdminConfirm then
        return
    end
    if not hdxGetEditboxText(var_1.editAddLogin) or hdxGetEditboxText(var_1.editAddLogin) == "" then
        local var = hdxGetEditboxText(var_1.editAddLogin)
    end
    triggerServerEvent("adminpanel:addAdmin", resourceRoot, hdxGetEditboxText(var_1.editAddLogin), (tonumber(hdxGetEditboxText(var_1.editAddLevel)) or 1))
    hdxSetElementVisible(var_1.addPanel, false)
end

local function var_8(arg1, arg2)
    if arg1 ~= "left" or arg2 then
    end
    if source == var_1.closePersonalSettings then
        hdxSetElementVisible(var_1.adminPanel, false)
        var_2.selectedAdmin = nil
    end
    if source == var_1.activeCheckbox then
        if hdxIsCheckboxChecked(var_1.activeCheckbox) then
            triggerServerEvent("adminpanel:setActive", resourceRoot, var_2.selectedAdmin)
        end
        triggerServerEvent("adminpanel:setUnactive", resourceRoot, var_2.selectedAdmin)
    end
    if source == var_1.watcherCheckbox then
        if hdxIsCheckboxChecked(var_1.watcherCheckbox) then
            triggerServerEvent("adminpanel:giveWatcher", resourceRoot, var_2.selectedAdmin)
        end
        triggerServerEvent("adminpanel:takeWatcher", resourceRoot, var_2.selectedAdmin)
    end
    if source == var_1.setAddSalary then
        if not tonumber(hdxGetEditboxText(var_1.editAddSalary)) then
            return
        end
        triggerServerEvent("adminpanel:setAddSalary", resourceRoot, var_2.selectedAdmin, tonumber(hdxGetEditboxText(var_1.editAddSalary)))
        local var_1 = tonumber(hdxGetEditboxText(var_1.editAddSalary))
    end
    if source == var_1.setAdminCoins then
        if not var_2.adminsData[var_2.selectedAdmin] then
            local var = tonumber(hdxGetEditboxText(var_1.editAdminCoins))
            local var_1 = {}
        end
        if not tonumber(hdxGetEditboxText(var_1.editAdminCoins)) then
            return
        end
        triggerServerEvent("adminpanel:setAdminCoins", resourceRoot, var_2.selectedAdmin, var_2.adminsData[var_2.selectedAdmin].coins + tonumber(hdxGetEditboxText(var_1.editAdminCoins)))
    end
    if source == var_1.addSerial then
        if not hdxGetEditboxText(var_1.editSerial) or hdxGetEditboxText(var_1.editSerial) == "" then
            local var = hdxGetEditboxText(var_1.editSerial)
        end
        triggerServerEvent("adminpanel:addSerial", resourceRoot, var_2.selectedAdmin, hdxGetEditboxText(var_1.editSerial))
    end
    if source ~= var_1.deleteSerial then
        return
    end
    if not hdxGetListSelectedRow(var_1.serialList) or hdxGetListSelectedRow(var_1.serialList) <= 0 then
        local var = hdxGetListSelectedRow(var_1.serialList)
    end
    if not hdxGetListRowText(var_1.serialList, hdxGetListSelectedRow(var_1.serialList)) then
        return
    end
    triggerServerEvent("adminpanel:removeSerial", resourceRoot, var_2.selectedAdmin, hdxGetListRowText(var_1.serialList, hdxGetListSelectedRow(var_1.serialList)))
end

local var_9 = {}
local var_10 = {}
local var_11 = {
    "spec",
    "report",
    "spec-report",
    "report-car",
    "help",
    "mp",
    "gmp",
    "fraction",
    "build",
    "personal",
    "afk",
}

local function var_12()
    hdxSetEditboxText(var_1.editSalary, (var_9[1] or var_1.editSalary))
    hdxSetEditboxText(var_1.editSalary, 0)
end

local var_13 = {
    spec = "Спек",
    report = "Репорт",
    ["spec-report"] = "Спек/Репорт",
    ["report-car"] = "Репорт/ЛТС",
    help = "Помощь",
    mp = "МП",
    gmp = "ГМП",
    fraction = "Фрак. дела",
    build = "Стройка",
    personal = "Личные дела",
    afk = "АФК",
}

local function var_14(arg1, arg2)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "left", "source", "closeSettings", "hdxSetElementVisible", "settingsPanel", "saveSettings"
    if source == var_1.closeSettings then
        hdxSetElementVisible(var_1.settingsPanel, false)
    end
    if not tonumber(hdxGetEditboxText(var_1.editSalary)) then
        if not var_9[tonumber(getComboboxValue("levelCombo"))] then
            local var = tonumber(getComboboxValue("levelCombo"))
        end
        local var = tonumber(getComboboxValue("levelCombo"))
        local var_1 = var_9[tonumber(getComboboxValue("levelCombo"))]
    end
    if var_1.hourCoeffs then
        if var_1.hourCoeffs[r8] then
            for k, v in ipairs(var_11) do
                if var_1.hourCoeffs[r8][v] then
                    if not tonumber(hdxGetEditboxText(var_1.hourCoeffs[r8][v])) then
                        local var = tonumber(getComboboxValue("levelCombo"))
                        local var_1 = tonumber(hdxGetEditboxText(var_1.editSalary))
                    end
                    local var = tonumber(getComboboxValue("levelCombo"))
                    local var_1 = tonumber(hdxGetEditboxText(var_1.editSalary))
                end
                local var = tonumber(getComboboxValue("levelCombo"))
                local var_1 = tonumber(hdxGetEditboxText(var_1.editSalary))
            end
            local var = tonumber(getComboboxValue("levelCombo"))
            local var_1 = tonumber(hdxGetEditboxText(var_1.editSalary))
        end
        local var = tonumber(getComboboxValue("levelCombo"))
        local var_1 = tonumber(hdxGetEditboxText(var_1.editSalary))
    end
    triggerServerEvent("adminpanel:updateLevelSettings", resourceRoot, tonumber(getComboboxValue("levelCombo")), tonumber(hdxGetEditboxText(var_1.editSalary)), var)
end

local function sub_1001()
    if var_1.addPanel then
        if isElement(var_1.addPanel) then
            return
        end
    end
    var_1.addPanel = hdxCreatePanel(0, 0, 333, 319, tocolor(45, 45, 45), var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.addPanel, "center", "center")
    hdxSetElementRounded(var_1.addPanel, 30)
    hdxSetElementDragable(var_1.addPanel, true)
    hdxSetElementRelativePosition(hdxCreateLabel("Добавление администратора", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var_1.addPanel), var_1.addPanel, "left", "top", false, 35, 33)
    hdxSetElementDisabled(hdxCreateLabel("Добавление администратора", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var_1.addPanel), true)
    var_1.editAddLogin = hdxCreateEditbox(0, 0, 263, 44, tocolor(38, 38, 38), "Введите логин", false, 60, var_1.addPanel, "FuturaBook", convertFigmaFontSize(16), tocolor(255, 255, 255))
    hdxSetElementRelativePosition(var_1.editAddLogin, var_1.addPanel, "left", "top", false, 35, 100)
    hdxSetElementRounded(var_1.editAddLogin, 10)
    hdxSetEditboxPlaceholderColor(var_1.editAddLogin, STATE_ALL, tocolor(77, 77, 77))
    hdxSetEditboxAllowedChars(var_1.editAddLogin, "keyboardEN")
    hdxSetElementRelativePosition(hdxCreateLabel("Логин:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.addPanel), var_1.editAddLogin, "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel("Логин:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.addPanel), true)
    var_1.editAddLevel = hdxCreateEditbox(0, 0, 40, 44, tocolor(38, 38, 38), "1", false, 1, var_1.addPanel, "FuturaBook", convertFigmaFontSize(16), tocolor(255, 255, 255))
    hdxSetElementRelativePosition(var_1.editAddLevel, var_1.editAddLogin, "left", "under", false, 0, 35)
    hdxSetElementRounded(var_1.editAddLevel, 10)
    hdxSetEditboxTextAlign(var_1.editAddLevel, "center")
    hdxSetEditboxPlaceholderColor(var_1.editAddLevel, STATE_ALL, tocolor(77, 77, 77))
    hdxSetEditboxAllowedChars(var_1.editAddLevel, "0-9")
    hdxSetEditboxText(var_1.editAddLevel, 1)
    hdxSetElementRelativePosition(hdxCreateLabel("Уровень:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.addPanel), var_1.editAddLevel, "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel("Уровень:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.addPanel), true)
    var_1.cancelAdd = hdxCreateButton(0, 0, 125, 40, tocolor(217, 76, 76, 255), "Отмена", var_1.addPanel)
    hdxSetElementRelativePosition(var_1.cancelAdd, var_1.addPanel, "right", "bottom", false, 35, 35)
    hdxSetElementColor(var_1.cancelAdd, STATE_HOVERED, tocolor(217, 76, 76, 180))
    hdxSetElementColor(var_1.cancelAdd, STATE_PRESSED, tocolor(217, 76, 76, 140))
    hdxSetElementRounded(var_1.cancelAdd, 12)
    hdxSetElementFont(var_1.cancelAdd, "FuturaBook", convertFigmaFontSize(16))
    var_1.addAdminConfirm = hdxCreateButton(0, 0, 125, 40, tocolor(71, 178, 125, 255), "Добавить", var_1.addPanel)
    hdxSetElementRelativePosition(var_1.addAdminConfirm, var_1.addPanel, "left", "bottom", false, 35, 35)
    hdxSetElementColor(var_1.addAdminConfirm, STATE_HOVERED, tocolor(71, 178, 125, 180))
    hdxSetElementColor(var_1.addAdminConfirm, STATE_PRESSED, tocolor(71, 178, 125, 140))
    hdxSetElementRounded(var_1.addAdminConfirm, 12)
    hdxSetElementFont(var_1.addAdminConfirm, "FuturaBook", convertFigmaFontSize(16))
    addEventHandler("onHdxElementPressed", var_1.addPanel, var_7)
end

local function sub_1002()
    if var_1.confirmPanel then
        if isElement(var_1.confirmPanel) then
            return
        end
    end
    var_1.confirmPanel = hdxCreatePanel(0, 0, 450, 253, tocolor(38, 38, 38), var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.confirmPanel, "center", "center", false, 0, 0)
    hdxSetElementRounded(var_1.confirmPanel, 30)
    hdxSetElementDragable(var_1.confirmPanel, true)
    hdxSetElementVisible(var_1.confirmPanel, false)
    hdxSetElementRelativePosition(hdxCreateLabel("Подтверждение", 0, 0, tocolor(255, 255, 255), "FuturaDemi", 19.879999999999999, var_1.confirmPanel), var_1.confirmPanel, "left", "top", false, 40, 35)
    hdxSetElementDisabled(hdxCreateLabel("Подтверждение", 0, 0, tocolor(255, 255, 255), "FuturaDemi", 19.879999999999999, var_1.confirmPanel), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 20, 18, nil, tocolor(255, 255, 255), var_1.confirmPanel), hdxCreateLabel("Подтверждение", 0, 0, tocolor(255, 255, 255), "FuturaDemi", 19.879999999999999, var_1.confirmPanel), "atleft", "center", false, 12, 0)
    hdxSetElementDisabled(hdxCreateImage(0, 0, 20, 18, nil, tocolor(255, 255, 255), var_1.confirmPanel), true)
    hdxSetElementRelativePosition(hdxCreatePanel(0, 0, 380, 70, tocolor(44, 44, 44), var_1.confirmPanel), var_1.confirmPanel, "center", "top", false, 0, 88)
    hdxSetElementRounded(hdxCreatePanel(0, 0, 380, 70, tocolor(44, 44, 44), var_1.confirmPanel), 10)
    hdxSetElementDisabled(hdxCreatePanel(0, 0, 380, 70, tocolor(44, 44, 44), var_1.confirmPanel), true)
    var_1.confirmContent = hdxCreateLabel("Вы уверены, что хотите снять\nADMIN NAME?", 0, 0, tocolor(255, 255, 255), "FuturaDemi", 14.199999999999999, var_1.confirmPanel)
    hdxSetElementRelativePosition(var_1.confirmContent, hdxCreatePanel(0, 0, 380, 70, tocolor(44, 44, 44), var_1.confirmPanel), "center", "top", false, 0, 12)
    hdxSetElementDisabled(var_1.confirmContent, true)
    var_1.buttonConfirm = hdxCreateButton(0, 0, 171, 40, tocolor(71, 178, 125), "Да", var_1.confirmPanel)
    hdxSetElementRelativePosition(var_1.buttonConfirm, var_1.confirmPanel, "left", "bottom", false, 35, 35)
    hdxSetElementColor(var_1.buttonConfirm, STATE_HOVERED, tocolor(71, 178, 125, 217))
    hdxSetElementColor(var_1.buttonConfirm, STATE_PRESSED, tocolor(71, 178, 125, 179))
    hdxSetElementTextColor(var_1.buttonConfirm, STATE_ALL, tocolor(255, 255, 255))
    hdxSetElementFont(var_1.buttonConfirm, "FuturaDemi", 11.359999999999999)
    hdxSetElementRounded(var_1.buttonConfirm, 10)
    var_1.buttonConfirmCancel = hdxCreateButton(0, 0, 171, 40, tocolor(217, 76, 76), "Нет", var_1.confirmPanel)
    hdxSetElementRelativePosition(var_1.buttonConfirmCancel, var_1.confirmPanel, "right", "bottom", false, 35, 35)
    hdxSetElementColor(var_1.buttonConfirmCancel, STATE_HOVERED, tocolor(217, 76, 76, 217))
    hdxSetElementColor(var_1.buttonConfirmCancel, STATE_PRESSED, tocolor(217, 76, 76, 179))
    hdxSetElementTextColor(var_1.buttonConfirmCancel, STATE_ALL, tocolor(255, 255, 255))
    hdxSetElementFont(var_1.buttonConfirmCancel, "FuturaDemi", 11.359999999999999)
    hdxSetElementRounded(var_1.buttonConfirmCancel, 10)
    addEventHandler("onHdxElementPressed", var_1.confirmPanel, var_6)
end

local function sub_1003()
    if var_1.adminPanel then
        if isElement(var_1.adminPanel) then
            return
        end
    end
    var_1.adminPanel = hdxCreatePanel(0, 0, 433, 700, tocolor(45, 45, 45), var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.adminPanel, "center", "center")
    hdxSetElementRounded(var_1.adminPanel, 30)
    hdxSetElementDragable(var_1.adminPanel, true)
    var_1.personalTitle = hdxCreateLabel("Настройки администратора", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var_1.adminPanel)
    hdxSetElementRelativePosition(var_1.personalTitle, var_1.adminPanel, "left", "top", false, 35, 33)
    hdxSetElementDisabled(var_1.personalTitle, true)
    var_1.closePersonalSettings = hdxCreateImage(0, 0, 20, 20, ":province_sharedAssets/image/button_close.dds", 4294967295, var_1.adminPanel)
    hdxSetElementRelativePosition(var_1.closePersonalSettings, var_1.adminPanel, "right", "top", false, 35, 35)
    hdxSetElementColor(var_1.closePersonalSettings, STATE_HOVERED, tocolor(120, 120, 120, 255))
    hdxSetElementColor(var_1.closePersonalSettings, STATE_PRESSED, tocolor(120, 120, 120, 255))
    hdxSetElementHoverAnim(var_1.closePersonalSettings, true, 1.05, 1.05)
    var_1.serialList = hdxCreateList(0, 0, 363, 200, 0, var_1.adminPanel)
    hdxSetElementRelativePosition(var_1.serialList, var_1.adminPanel, "left", "top", false, 35, 95)
    hdxSetListRowColor(var_1.serialList, STATE_IDLE, 4281545523)
    hdxSetListRowColor(var_1.serialList, STATE_HOVERED, 4294534144)
    hdxSetListRowColor(var_1.serialList, STATE_PRESSED, 4294534144)
    hdxSetElementTextColor(var_1.serialList, STATE_ALL, 4294967295)
    hdxSetListRowHeight(var_1.serialList, 44)
    hdxSetElementSlotRounded(var_1.serialList, 10)
    hdxSetElementColor(var_1.serialList, STATE_ALL, tocolor(120, 120, 120, 0))
    hdxSetListGapHeight(var_1.serialList, _y(8))
    hdxSetElementFont(var_1.serialList, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementScrollColor(var_1.serialList, STATE_ALL, 4294534144)
    hdxSetElementScrollBackgroundColor(var_1.serialList, 4282071867)
    hdxSetElementScrollWidth(var_1.serialList, 5)
    hdxSetElementScrollTabWidth(var_1.serialList, 15)
    hdxSetElementScrollBackVisible(var_1.serialList, true)
    hdxChangeListContent(var_1.serialList, {})
    hdxSetElementRelativePosition(hdxCreateLabel("Серийные номера:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), var_1.serialList, "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel("Серийные номера:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), true)
    var_1.activeCheckbox = hdxCreateCheckbox(0, 0, 30, 4282071867, "Активен", false, true, var_1.adminPanel)
    hdxSetElementRounded(var_1.activeCheckbox, 5)
    hdxSetElementFont(var_1.activeCheckbox, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementRelativePosition(var_1.activeCheckbox, var_1.serialList, "left", "under", false, 0, 20)
    var_1.watcherCheckbox = hdxCreateCheckbox(0, 0, 30, 4282071867, "Следящий", false, true, var_1.adminPanel)
    hdxSetElementRounded(var_1.watcherCheckbox, 5)
    hdxSetElementFont(var_1.watcherCheckbox, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementRelativePosition(var_1.watcherCheckbox, var_1.activeCheckbox, "left", "under", false, 0, 10)
    var_1.deleteSerial = hdxCreatePanel(0, 0, 44, 44, 4282071867, var_1.adminPanel)
    hdxSetElementRounded(var_1.deleteSerial, 10)
    hdxSetElementColor(var_1.deleteSerial, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.deleteSerial, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.deleteSerial, var_1.serialList, "right", "under", false, 0, 20)
    hdxSetElementDisabled(hdxCreateImage(0, 0, 25, 25, "assets/trash.dds", 4294967295, var_1.deleteSerial), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 25, 25, "assets/trash.dds", 4294967295, var_1.deleteSerial), var_1.deleteSerial, "center", "center")
    var_1.editAdminCoins = hdxCreateEditbox(0, 0, 309, 44, tocolor(38, 38, 38), "0", false, 9, var_1.adminPanel, "FuturaBook", convertFigmaFontSize(16), tocolor(255, 255, 255))
    hdxSetElementRelativePosition(var_1.editAdminCoins, var_1.watcherCheckbox, "left", "under", false, 0, 35)
    hdxSetElementRounded(var_1.editAdminCoins, 10)
    hdxSetEditboxPlaceholderColor(var_1.editAdminCoins, STATE_ALL, tocolor(77, 77, 77))
    hdxSetEditboxAllowedChars(var_1.editAdminCoins, "floatWithMinus")
    hdxSetElementRelativePosition(hdxCreateLabel("Админ-коины:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), var_1.editAdminCoins, "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel("Админ-коины:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), true)
    var_1.setAdminCoins = hdxCreatePanel(0, 0, 44, 44, 4282071867, var_1.adminPanel)
    hdxSetElementRounded(var_1.setAdminCoins, 10)
    hdxSetElementColor(var_1.setAdminCoins, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.setAdminCoins, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.setAdminCoins, var_1.editAdminCoins, "atright", "center", false, 10, 0)
    hdxSetElementDisabled(hdxCreateImage(0, 0, 25, 25, ":province_sharedAssets/image/icon_checked.dds", 4294967295, var_1.setAdminCoins), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 25, 25, ":province_sharedAssets/image/icon_checked.dds", 4294967295, var_1.setAdminCoins), var_1.setAdminCoins, "center", "center")
    var_1.editAddSalary = hdxCreateEditbox(0, 0, 309, 44, tocolor(38, 38, 38), "0", false, 9, var_1.adminPanel, "FuturaBook", convertFigmaFontSize(16), tocolor(255, 255, 255))
    hdxSetElementRelativePosition(var_1.editAddSalary, var_1.editAdminCoins, "left", "under", false, 0, 35)
    hdxSetElementRounded(var_1.editAddSalary, 10)
    hdxSetEditboxPlaceholderColor(var_1.editAddSalary, STATE_ALL, tocolor(77, 77, 77))
    hdxSetEditboxAllowedChars(var_1.editAddSalary, "floatWithMinus")
    hdxSetElementRelativePosition(hdxCreateLabel("Надбавка:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), var_1.editAddSalary, "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel("Надбавка:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), true)
    var_1.setAddSalary = hdxCreatePanel(0, 0, 44, 44, 4282071867, var_1.adminPanel)
    hdxSetElementRounded(var_1.setAddSalary, 10)
    hdxSetElementColor(var_1.setAddSalary, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.deleteSsetAddSalaryerial, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.setAddSalary, var_1.editAddSalary, "atright", "center", false, 10, 0)
    hdxSetElementDisabled(hdxCreateImage(0, 0, 25, 25, ":province_sharedAssets/image/icon_checked.dds", 4294967295, var_1.setAddSalary), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 25, 25, ":province_sharedAssets/image/icon_checked.dds", 4294967295, var_1.setAddSalary), var_1.setAddSalary, "center", "center")
    var_1.editSerial = hdxCreateEditbox(0, 0, 363, 44, tocolor(38, 38, 38), "Серийный номер", false, 40, var_1.adminPanel, "FuturaBook", convertFigmaFontSize(16), tocolor(255, 255, 255))
    hdxSetElementRelativePosition(var_1.editSerial, var_1.editAddSalary, "left", "under", false, 0, 35)
    hdxSetElementRounded(var_1.editSerial, 10)
    hdxSetEditboxPlaceholderColor(var_1.editSerial, STATE_ALL, tocolor(77, 77, 77))
    hdxSetElementRelativePosition(hdxCreateLabel("Новый серийный номер:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), var_1.editSerial, "left", "above", false, 0, 10)
    hdxSetElementDisabled(hdxCreateLabel("Новый серийный номер:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(16), var_1.adminPanel), true)
    var_1.addSerial = hdxCreateButton(0, 0, 200, 44, 4282071867, "Добавить", var_1.adminPanel)
    hdxSetElementRounded(var_1.addSerial, 10)
    hdxSetElementColor(var_1.addSerial, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.addSerial, STATE_PRESSED, 3007003451)
    hdxSetElementFont(var_1.addSerial, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementTextAlign(var_1.addSerial, "center", "center")
    hdxSetElementRelativePosition(var_1.addSerial, var_1.editSerial, "center", "under", false, 0, 10)
    addEventHandler("onHdxElementPressed", var_1.adminPanel, var_8)
end

local function sub_1004()
    if not var_2.selectedAdmin then
        return
    end
    if not var_1.adminPanel then
        return
    end
    if not isElement(var_1.adminPanel) then
        return
    end
    if not (var_2.adminsData[var_2.selectedAdmin] or {}).name then
        local var = var_2.adminsData[var_2.selectedAdmin]
        local lockClient = "Настройки %s [#FF9640%i AC#ffffff]"
        local tripClient = "N/A"
    end
    hdxSetElementText(var_1.personalTitle, string.format("Настройки %s [#FF9640%i AC#ffffff]", var_2.adminsData[var_2.selectedAdmin].name, (var_2.adminsData[var_2.selectedAdmin].coins or 0)))
    hdxChangeListContent(var_1.serialList, (var_2.adminsData[var_2.selectedAdmin].serials or {}))
    if var_2.adminsData[var_2.selectedAdmin].active then
        local var = var_2.adminsData[var_2.selectedAdmin]
    end
    hdxSetCheckboxChecked(var_1.activeCheckbox, false)
    if var_2.adminsData[var_2.selectedAdmin].watcher then
        local var = var_2.adminsData[var_2.selectedAdmin]
    end
    hdxSetCheckboxChecked(var_1.watcherCheckbox, false)
    hdxSetEditboxText(var_1.editAddSalary, (var_2.adminsData[var_2.selectedAdmin].addSalary or ""))
    hdxSetEditboxText(var_1.editAdminCoins, "")
    hdxSetEditboxText(var_1.editSerial, "")
end

local function sub_1005()
    var_1.settingsPanel = hdxCreatePanel(0, 0, 933, 940, tocolor(45, 45, 45), var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.settingsPanel, "center", "center")
    hdxSetElementRounded(var_1.settingsPanel, 30)
    hdxSetElementDragable(var_1.settingsPanel, true)
    hdxSetElementDisabled(hdxCreateLabel("Настройки уровня администрации", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var_1.settingsPanel), true)
    var_1.closeSettings = hdxCreateImage(0, 0, 20, 20, ":province_sharedAssets/image/button_close.dds", 4294967295, var_1.settingsPanel)
    hdxSetElementRelativePosition(var_1.closeSettings, var_1.settingsPanel, "right", "top", false, 35, 35)
    hdxSetElementColor(var_1.closeSettings, STATE_HOVERED, tocolor(120, 120, 120, 255))
    hdxSetElementColor(var_1.closeSettings, STATE_PRESSED, tocolor(120, 120, 120, 255))
    hdxSetElementHoverAnim(var_1.closeSettings, true, 1.05, 1.05)
    var_1.adminLevelCombo = createCombobox(0, 0, 60, 25, "", "Уровень", "levelCombo", var_1.settingsPanel)
    updateList("levelCombo", var)
    hdxSetElementRelativePosition(var_1.adminLevelCombo, var_1.settingsPanel, "left", "top", false, 35, 75)
    addEventHandler("onComboboxSelect", var_1.adminLevelCombo, var_12)
    hdxSetElementRelativePosition(var_1.editSalary, var_1.settingsPanel, "right", "top", false, 35, 75)
    hdxSetElementRounded(var_1.editSalary, 10)
    hdxSetEditboxPlaceholderColor(var_1.editSalary, STATE_ALL, tocolor(77, 77, 77))
    hdxSetEditboxAllowedChars(var_1.editSalary, "0-9")
    hdxSetElementDisabled(hdxCreateLabel("Зарплата в мин:", 0, 0, tocolor(255, 255, 255), "FuturaBook", convertFigmaFontSize(12), var_1.settingsPanel), true)
    for k, v in ipairs(var_11) do
        hdxSetElementRounded(hdxCreatePanel(0, 0, 65, 25, tocolor(38, 38, 38), var_1.settingsPanel), 5)
    end
    var_1.hourCoeffs = {}
    var_1.hourCoeffs.left = {}
    hdxSetElementRounded(hdxCreatePanel(0, 0, 35, 25, tocolor(38, 38, 38), var_1.settingsPanel), 5)
    for k, v in ipairs(var_11) do
        local var_5 = tocolor(77, 77, 77)
        local var_9 = 145 + 30 * "left"
        local var_11 = "FuturaBook"
        local var_12 = convertFigmaFontSize(12)
        local var_13 = tocolor(255, 255, 255)
    end
    var_1.saveSettings = hdxCreateButton(0, 0, 200, 44, 4282071867, "Сохранить", var_1.settingsPanel)
    hdxSetElementRounded(var_1.saveSettings, 10)
    hdxSetElementColor(var_1.saveSettings, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.saveSettings, STATE_PRESSED, 3007003451)
    hdxSetElementFont(var_1.saveSettings, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementTextAlign(var_1.saveSettings, "center", "center")
    hdxSetElementRelativePosition(var_1.saveSettings, var_1.settingsPanel, "center", "bottom", false, 0, 15)
    addEventHandler("onHdxElementPressed", var_1.settingsPanel, var_14)
end

local state = nil

local function var_20(arg1, arg2)
    if not lockClient.font then
        lockClient.fontSize = value_2
        lockClient.font = value_1
    end
    if not isElement(var_1.hoverPanel) then
        tripClient()
    end
    if arg1 then
        hdxSetElementText(var_1.hoverPanelText, value_1)
        hdxSetElementSize(var_1.hoverPanel, dxGetTextWidth(value_1, lockClient.fontSize, lockClient.font) + _x(32), value_2 + _y(16))
        var_5(var_1.hoverPanel)
        hdxSetElementRelativePosition(var_1.hoverPanelText, var_1.hoverPanel, "left", "center", false, 16, 0)
    end
    hdxSetElementVisible(var_1.hoverPanel, arg1)
end

local var_21 = {}
local state_22 = nil

local function var_23(arg1)
    if arg1 ~= state then
        return
    end
    var_20(true, var_21[state])
end

local function var_24(arg1)
    hdxSetGridlistColumnHeaderTextAlign(arg1, "left", "top")
    hdxSetGridlistRowSolidMode(arg1, true)
    hdxSetGridlistSelectionMode(arg1, "row")
    hdxSetElementTextColor(arg1, STATE_ALL, 4294967295)
    hdxSetElementFont(arg1, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementTextTabWidth(arg1, 10)
    hdxSetElementTabs(arg1, 0, 0)
    hdxSetListRowHeight(arg1, 44)
    hdxSetListGapHeight(arg1, _y(8))
    hdxSetElementSlotRounded(arg1, 10)
    hdxSetElementScrollColor(arg1, STATE_ALL, 4294534144)
    hdxSetElementScrollBackgroundColor(arg1, 4282071867)
    hdxSetElementScrollWidth(arg1, 5)
    hdxSetElementScrollTabWidth(arg1, 15)
    hdxSetElementScrollBackVisible(arg1, true)
    hdxSetElementHorizontallScrollTabH(arg1, 16)
    hdxSetGridlistContentBackgroundColor(arg1, 0)
    hdxSetGridlistSlotColor(arg1, STATE_ALL, 4281545523)
    hdxSetGridlistSlotColor(arg1, STATE_PRESSED, 4294534144)
    hdxSetGridlistRowColor(arg1, STATE_IDLE, 4281545523)
    hdxSetGridlistRowColor(arg1, STATE_HOVERED, 4294534144)
    hdxSetGridlistRowColor(arg1, STATE_PRESSED, 4294534144)
    hdxSetGridlistContent(arg1, {})
end

local function var_25(arg1, arg2)
    if source == var_1.close then
        setMainPanelVisible(false)
    end
    if source == var_1.prevMonth then
        if var_2.selectedYear then
            if var_2.selectedMonth then
                if var_2.selectedMonth - 1 < 1 then
                    local var = var_2.selectedYear - 1
                end
                local var_1 = var_2.selectedMonth - 1
            end
        end
        if hdxIsCheckboxChecked(var_1.dailyCheckbox) then
            triggerServerEvent("adminpanel:getMonthData", resourceRoot, nil, nil)
        end
        triggerServerEvent("adminpanel:getAdminsData", resourceRoot, nil, nil)
    end
    if source == var_1.nextMonth then
        if var_2.selectedYear then
            if var_2.selectedMonth then
                if 12 < var_2.selectedMonth + 1 then
                    local var = var_2.selectedYear + 1
                end
                local var_1 = var_2.selectedMonth + 1
            end
        end
        if hdxIsCheckboxChecked(var_1.dailyCheckbox) then
            triggerServerEvent("adminpanel:getMonthData", resourceRoot, nil, nil)
        end
        triggerServerEvent("adminpanel:getAdminsData", resourceRoot, nil, nil)
    end
    if source == var_1.dailyCheckbox then
        if hdxIsCheckboxChecked(var_1.dailyCheckbox) then
            triggerServerEvent("adminpanel:getMonthData", resourceRoot, var_2.selectedYear, var_2.selectedMonth)
        end
        triggerServerEvent("adminpanel:getAdminsData", resourceRoot, var_2.selectedYear, var_2.selectedMonth)
    end
    if source == var_1.downloadData then
        for k, v in ipairs(var_2.adminsToExport) do
            local var = "" .. table.concat(v, "\t") .. "\n"
            local var_1 = table.concat(v, "\t")
            local var_2 = "\n"
            local lockClient = "\t"
        end
        setClipboard("")
        outputNotification("Таблица экспортирована в буфер обмена.")
    end
    if source == var_1.addAdmin then
        hdxSetElementVisible(var_1.addPanel, true)
        hdxSetEditboxText(var_1.editAddLogin, "")
        hdxSetEditboxText(var_1.editAddLevel, 1)
    end
    if source == var_1.deleteAdmin then
        var_2.adminToDelete = hdxGetGridlistRowKey(var_1.mainGrid, hdxGetGridlistSelectedRow(var_1.mainGrid))
        hdxSetElementText(var_1.confirmContent, string.format("Вы уверены, что хотите удалить\n%s?", hdxGetGridlistRowKey(var_1.mainGrid, hdxGetGridlistSelectedRow(var_1.mainGrid))))
        hdxSetElementVisible(var_1.confirmPanel, true)
    end
    if source == var_1.upLevel then
        triggerServerEvent("adminpanel:upLevel", resourceRoot, hdxGetGridlistRowKey(var_1.mainGrid, hdxGetGridlistSelectedRow(var_1.mainGrid)))
    end
    if source == var_1.downLevel then
        triggerServerEvent("adminpanel:downLevel", resourceRoot, hdxGetGridlistRowKey(var_1.mainGrid, hdxGetGridlistSelectedRow(var_1.mainGrid)))
    end
    if source == var_1.adminSettings then
        var_2.selectedAdmin = hdxGetGridlistRowKey(var_1.mainGrid, hdxGetGridlistSelectedRow(var_1.mainGrid))
        hdxSetElementVisible(var_1.adminPanel, true)
    end
    setComboboxRow("levelCombo", 1)
    hdxSetElementVisible(var_1.settingsPanel, true)
end

local function var_26(arg1)
    if not arg1 then
        if state then
            if state_22 then
                if isTimer(state_22) then
                    killTimer(state_22)
                end
            end
            state = nil
            var_20(false)
        end
    end
    if not var_21[source] then
        return
    end
    if state then
        return
    end
    if state_22 then
        if isTimer(state_22) then
            killTimer(state_22)
        end
    end
    state_22 = setTimer(var_23, 250, 1, source)
    state = source
end

local function var_27()
    var_1.mainPanel = hdxCreatePanel(0, 0, 1328, 756, 4280361249)
    hdxSetElementRelativePosition(var_1.mainPanel, "center", "center", false, 495, 0)
    hdxSetElementRounded(var_1.mainPanel, 30)
    hdxSetElementDragable(var_1.mainPanel, true)
    hdxSetElementDisabled(hdxCreateLabel("Управление администрацией", 0, 0, 4294967295, "FuturaDemi", convertFigmaFontSize(28), var_1.mainPanel), true)
    var_1.close = hdxCreateImage(0, 0, 24, 24, ":province_sharedAssets/image/button_close.dds", 4294967295, var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.close, var_1.mainPanel, "right", "top", false, 35, 35)
    hdxSetElementColor(var_1.close, STATE_HOVERED, tocolor(120, 120, 120, 255))
    hdxSetElementColor(var_1.close, STATE_PRESSED, tocolor(120, 120, 120, 255))
    hdxSetElementHoverAnim(var_1.close, true, 1.05, 1.05)
    var_1.prevMonth = hdxCreateButton(0, 0, 20, 20, 4282071867, "<", var_1.mainPanel)
    hdxSetElementRounded(var_1.prevMonth, 5)
    hdxSetElementColor(var_1.prevMonth, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.prevMonth, STATE_PRESSED, 3007003451)
    hdxSetElementFont(var_1.prevMonth, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementTextAlign(var_1.prevMonth, "center", "center")
    hdxSetElementRelativePosition(var_1.prevMonth, var_1.mainPanel, "left", "top", false, 35, 80)
    hdxSetElementTextAlign(var_1.selectedMonth, "center", "center")
    hdxSetElementRelativePosition(var_1.selectedMonth, var_1.prevMonth, "atright", "center", false, 10, 0)
    var_1.nextMonth = hdxCreateButton(0, 0, 20, 20, 4282071867, ">", var_1.mainPanel)
    hdxSetElementRounded(var_1.nextMonth, 5)
    hdxSetElementColor(var_1.nextMonth, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.nextMonth, STATE_PRESSED, 3007003451)
    hdxSetElementFont(var_1.nextMonth, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementTextAlign(var_1.nextMonth, "center", "center")
    hdxSetElementRelativePosition(var_1.nextMonth, var_1.prevMonth, "atright", "center", false, 150, 0)
    var_1.monthSettings = hdxCreatePanel(0, 0, 30, 30, 4282071867, var_1.mainPanel)
    hdxSetElementRounded(var_1.monthSettings, 5)
    hdxSetElementColor(var_1.monthSettings, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.monthSettings, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.monthSettings, var_1.mainPanel, "right", "top", false, 35, 80)
    var_21[var_1.monthSettings] = "Настройки уровня администрации"
    hdxSetElementDisabled(hdxCreateImage(0, 0, 20, 20, ":province_sharedAssets/image/icon_settings.dds", 4294967295, var_1.monthSettings), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 20, 20, ":province_sharedAssets/image/icon_settings.dds", 4294967295, var_1.monthSettings), var_1.monthSettings, "center", "center")
    var_1.mainGrid = hdxCreateGridlist(0, 0, 1258, 536, 0, 30, 0, var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.mainGrid, var_1.mainPanel, "left", "top", false, 35, 111)
    hdxInsertGridlistColumn(var_1.mainGrid, 1, "Имя", 160, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 2, "Логин", 160, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 3, "Уровень", 80, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 4, "Админ-коины", 120, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 5, "Следящий", 80, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 6, "Банк. счёт", 120, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 7, "Общий онлайн", 130, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 8, "Зарплата", 110, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 9, "Надбавка", 110, 6)
    hdxInsertGridlistColumn(var_1.mainGrid, 10, "Сумма", 130, 0)
    hdxSetElementSortEnabled(var_1.mainGrid, true)
    hdxSetGridlistColumnHeaderTextColor(var_1.mainGrid, "Сумма", 4291611852)
    if 2 < "Сумма" and "Сумма" < 7 then
        hdxSetGridlistColumnHeaderTextAlign(var_1.mainGrid, "Сумма", "center", "center")
        hdxSetGridlistColumnTextHorizontalAlign(var_1.mainGrid, "Сумма", "center")
        local var = "Сумма"
    end
    hdxSetGridlistColumnHeaderTextTab(var_1.mainGrid, "Сумма", 10, 0)
    hdxSetGridlistColumnHeaderTextAlign(var_1.mainGrid, "Сумма", "left", "center")
    hdxSetGridlistColumnTextHorizontalAlign(var_1.mainGrid, "Сумма", "left")
    var_24(var_1.mainGrid)
    var_1.daysGrid = hdxCreateGridlist(0, 0, 1258, 536, 0, 30, 0, var_1.mainPanel)
    hdxSetElementRelativePosition(var_1.daysGrid, var_1.mainPanel, "left", "top", false, 35, 111)
    hdxInsertGridlistColumn(var_1.daysGrid, 1, "Имя", 200, 6)
    hdxInsertGridlistColumn(var_1.daysGrid, 2, "Логин", 200, 6)
    hdxSetGridlistColumnHeaderTextTab(var_1.daysGrid, 1, 10, 0)
    hdxSetGridlistColumnHeaderTextAlign(var_1.daysGrid, 1, "left", "center")
    hdxSetGridlistColumnTextHorizontalAlign(var_1.daysGrid, 1, "left")
    hdxSetGridlistColumnHeaderTextTab(var_1.daysGrid, 2, 10, 0)
    hdxSetGridlistColumnHeaderTextAlign(var_1.daysGrid, 2, "left", "center")
    hdxSetGridlistColumnTextHorizontalAlign(var_1.daysGrid, 2, "left")
    hdxInsertGridlistColumn(var_1.daysGrid, "left" + 2, "left", 80, 6)
    hdxSetGridlistColumnHeaderTextColor(var_1.daysGrid, "left" + 2, 4291611852)
    hdxSetGridlistColumnHeaderTextAlign(var_1.daysGrid, "left" + 2, "center", "center")
    hdxSetGridlistColumnTextHorizontalAlign(var_1.daysGrid, "left" + 2, "center")
    hdxSetElementSortEnabled(var_1.daysGrid, true)
    var_24(var_1.daysGrid)
    var_1.dailyCheckbox = hdxCreateCheckbox(0, 0, 30, 4282071867, "Посуточно", false, true, var_1.mainPanel)
    hdxSetElementRounded(var_1.dailyCheckbox, 5)
    hdxSetElementFont(var_1.dailyCheckbox, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementRelativePosition(var_1.dailyCheckbox, var_1.mainGrid, "left", "under", false, 0, 20)
    var_1.downloadData = hdxCreateButton(0, 0, 200, 44, 4282071867, "Экспортировать", var_1.mainPanel)
    hdxSetElementRounded(var_1.downloadData, 10)
    hdxSetElementColor(var_1.downloadData, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.downloadData, STATE_PRESSED, 3007003451)
    hdxSetElementFont(var_1.downloadData, "FuturaBook", convertFigmaFontSize(18))
    hdxSetElementTextAlign(var_1.downloadData, "center", "center")
    hdxSetElementRelativePosition(var_1.downloadData, var_1.mainGrid, "center", "under", false, 0, 20)
    var_1.adminSettings = hdxCreatePanel(0, 0, 44, 44, 4282071867, var_1.mainPanel)
    hdxSetElementRounded(var_1.adminSettings, 10)
    hdxSetElementColor(var_1.adminSettings, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.adminSettings, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.adminSettings, var_1.mainGrid, "right", "under", false, 0, 20)
    var_21[var_1.adminSettings] = "Настройки администратора"
    hdxSetElementDisabled(hdxCreateImage(0, 0, 25, 25, "assets/user_settings.dds", 4294967295, var_1.adminSettings), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 25, 25, "assets/user_settings.dds", 4294967295, var_1.adminSettings), var_1.adminSettings, "center", "center")
    var_1.upLevel = hdxCreatePanel(0, 0, 50, 20, 4282071867, var_1.mainPanel)
    hdxSetElementRounded(var_1.upLevel, 10)
    hdxSetElementColor(var_1.upLevel, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.upLevel, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.upLevel, var_1.adminSettings, "atleft", "top", false, 10, 0)
    var_21[var_1.upLevel] = "Повысить уровень"
    hdxSetElementDisabled(hdxCreateImage(0, 0, 20, 20, "assets/arrow.dds", 4294967295, var_1.upLevel), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 20, 20, "assets/arrow.dds", 4294967295, var_1.upLevel), var_1.upLevel, "center", "center")
    var_1.downLevel = hdxCreatePanel(0, 0, 50, 20, 4282071867, var_1.mainPanel)
    hdxSetElementRounded(var_1.downLevel, 10)
    hdxSetElementColor(var_1.downLevel, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.downLevel, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.downLevel, var_1.adminSettings, "atleft", "bottom", false, 10, 0)
    var_21[var_1.downLevel] = "Понизить уровень"
    hdxSetElementDisabled(hdxCreateImage(0, 0, 20, 20, "assets/arrow.dds", 4294967295, var_1.downLevel), true)
    hdxSetElementRotation(hdxCreateImage(0, 0, 20, 20, "assets/arrow.dds", 4294967295, var_1.downLevel), 180)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 20, 20, "assets/arrow.dds", 4294967295, var_1.downLevel), var_1.downLevel, "center", "center")
    var_1.deleteAdmin = hdxCreatePanel(0, 0, 44, 44, 4282071867, var_1.mainPanel)
    hdxSetElementRounded(var_1.deleteAdmin, 10)
    hdxSetElementColor(var_1.deleteAdmin, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.deleteAdmin, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.deleteAdmin, var_1.upLevel, "atleft", "top", false, 10, 0)
    var_21[var_1.deleteAdmin] = "Удалить администратора"
    hdxSetElementDisabled(hdxCreateImage(0, 0, 25, 25, "assets/user_delete.dds", 4294967295, var_1.deleteAdmin), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 25, 25, "assets/user_delete.dds", 4294967295, var_1.deleteAdmin), var_1.deleteAdmin, "center", "center")
    var_1.addAdmin = hdxCreatePanel(0, 0, 44, 44, 4282071867, var_1.mainPanel)
    hdxSetElementRounded(var_1.addAdmin, 10)
    hdxSetElementColor(var_1.addAdmin, STATE_HOVERED, 3644537659)
    hdxSetElementColor(var_1.addAdmin, STATE_PRESSED, 3007003451)
    hdxSetElementRelativePosition(var_1.addAdmin, var_1.deleteAdmin, "atleft", "top", false, 10, 0)
    var_21[var_1.addAdmin] = "Добавить администратора"
    hdxSetElementDisabled(hdxCreateImage(0, 0, 25, 25, "assets/user_add.dds", 4294967295, var_1.addAdmin), true)
    hdxSetElementRelativePosition(hdxCreateImage(0, 0, 25, 25, "assets/user_add.dds", 4294967295, var_1.addAdmin), var_1.addAdmin, "center", "center")
    addEventHandler("onHdxElementPressed", var_1.mainPanel, var_25)
    addEventHandler("onHdxElementHovered", var_1.mainPanel, var_26)
end

local function var_28(arg1)
    if not arg1 then
        if hdxIsElementVisible(var.mainPanel) then
            return
        end
        if hdxIsElementVisible(var_1.mainPanel) then
            return
        end
        if hdxIsElementVisible(var_1.addPanel) then
            return
        end
        if hdxIsElementVisible(var_1.adminPanel) then
            return
        end
        if hdxIsElementVisible(var_1.settingsPanel) then
            return
        end
        if hdxIsElementVisible(var_1.confirmPanel) then
            return
        end
    end
    showCursor(arg1)
end

setMainPanelVisible = function(arg1)
    if arg1 then
        var_27()
    end
    if var_1.mainPanel then
        if isElement(var_1.mainPanel) then
            hdxSetElementVisible(var_1.mainPanel, arg1)
        end
    end
    if var_1.addPanel then
        if isElement(var_1.addPanel) then
            hdxSetElementVisible(var_1.addPanel, false)
        end
    end
    if var_1.adminPanel then
        if isElement(var_1.adminPanel) then
            hdxSetElementVisible(var_1.adminPanel, false)
        end
    end
    if var_1.settingsPanel then
        if isElement(var_1.settingsPanel) then
            hdxSetElementVisible(var_1.settingsPanel, false)
        end
    end
    if var_1.confirmPanel then
        if isElement(var_1.confirmPanel) then
            hdxSetElementVisible(var_1.confirmPanel, false)
        end
    end
    var_20(false)
    var_28(arg1)
end

addEvent("adminpanel:updateAdminsData", true)

local function sub_1006(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local math = data and data.math
    local floor = data and data.floor
    local string = data and data.string
    local format = data and data.format
end

local var_30 = {
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь",
}

local function sub_1007()
    if not var_1.mainPanel then
        return
    end
    if not isElement(var_1.mainPanel) then
        return
    end
    hdxSetElementVisible(var_1.mainGrid, true)
    hdxSetElementVisible(var_1.daysGrid, false)
    hdxSetCheckboxChecked(var_1.dailyCheckbox, false)
end

local function sub_1008(arg1, arg2, arg3, arg4, arg5)
    if hdxGetGridlistSelectedRow(var_1.mainGrid) and 0 < hdxGetGridlistSelectedRow(var_1.mainGrid) then
        local var = hdxGetGridlistRowKey(var_1.mainGrid, hdxGetGridlistSelectedRow(var_1.mainGrid))
    end
    for k, v in pairs(arg3) do
        if not var_9[v.level] then
        end
        if not v.totalOnline then
            local lockClient = var_9[v.level]
        end
        if not v.name then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        if not v.level then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        if not v.coins then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        if v.watcher then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        if not v.bankAcc then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        if not v.totalOnline then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        if not (v.addSalary or table.insert) then
            local var_2 = math.floor(var_9[v.level] * v.totalOnline / 60)
        end
        table.insert(var, var_1)
    end
    hdxSetGridlistContent(var_1.mainGrid, var)
    hdxSetElementText(var_1.selectedMonth, (var_30[arg5] or "n/a") .. " " .. "")
    if nil then
        hdxSetGridlistRowSelected(var_1.mainGrid, nil)
    end
    var_2.adminsToExport = {}
    table.insert(var_2.adminsToExport, 1, var_1)
end

addEventHandler("adminpanel:updateAdminsData", resourceRoot, sub_1008)
addEvent("adminpanel:updateMonthData", true)
local var_33 = 86400

local function sub_1009()
    if not var_1.mainPanel then
        return
    end
    if not isElement(var_1.mainPanel) then
        return
    end
    hdxSetCheckboxChecked(var_1.dailyCheckbox, true)
    hdxSetElementVisible(var_1.daysGrid, true)
    hdxSetElementVisible(var_1.mainGrid, false)
end

local function sub_1010(arg1, arg2, arg3, arg4, arg5, arg6)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "pairs", "name", "Unknown", "key", "table", "insert"
    for k, v in pairs(arg3) do
        if v[arg6 + r16 * var_33] then
            if 0 < v[arg6 + r16 * var_33] then
                local var_1 = { key = k, v.name, k }
            end
            local var_1 = { key = k, v.name, k }
            local var_2 = "-"
        end
        table.insert({ key = k, v.name, k }, "-")
        table.insert(var_1, { key = k, v.name, k })
    end
    hdxSetGridlistContent(var_1.daysGrid, var)
    hdxSetElementText(var_1.selectedMonth, (var_30[arg5] or "n/a") .. " " .. "")
    var_2.daysToExport = {}
    table.insert({ "Имя", "Логин" }, "")
    table.insert({ "Имя", "Логин" }.daysToExport, 1, { "Имя", "Логин" })
end

addEventHandler("adminpanel:updateMonthData", resourceRoot, sub_1010)
addEvent("adminpanel:togglePanel", true)

local function sub_1011(arg1, arg2)
    var_9 = arg1
    var_10 = arg2
    if var_1.mainPanel then
        if hdxIsElementVisible(var_1.mainPanel) then
            setMainPanelVisible(false)
        end
    end
    setMainPanelVisible(true)
end

addEventHandler("adminpanel:togglePanel", resourceRoot, sub_1011)

local function var_37()
    if var.canSelectAdmins then
        if hdxGetGridlistSelectedRow(var.grid) ~= 0 then
            local value_1, value_2 = getComboboxValue("statusCombo")
        end
        local value_1, value_2 = getComboboxValue("statusCombo")
    end
    triggerServerEvent("adminpanel:setOnlineStatus", resourceRoot, var_11[value_2], nil)
end

local function var_38(arg1, arg2)
    if arg1 == "left" then
        if arg2 then
            if source == var.mainPanel then
                closeCombo()
            end
        end
    end
    if arg1 ~= "left" or arg2 then
    end
    if source ~= var.close then
        return
    end
    hdxSetElementVisible(var.mainPanel, false)
    var_28(false)
end

addEvent("adminpanel:updateAdminList", true)

local function sub_1012(arg1)
    if not var.mainPanel then
        return
    end
    if not isElement(var.mainPanel) then
        return
    end
    if not hdxIsElementVisible(var.mainPanel) then
        return
    end
    hdxSetGridlistContent({}.grid, {})
end

addEventHandler("adminpanel:updateAdminList", resourceRoot, sub_1012)
addEvent("adminpanel:toggleAdminList", true)

local function countChildElements()
    var.mainPanel = hdxCreatePanel(0, 0, 593, 600, tocolor(45, 45, 45))
    hdxSetElementRelativePosition(var.mainPanel, "center", "center")
    hdxSetElementRounded(var.mainPanel, 30)
    hdxSetElementDragable(var.mainPanel, true)
    hdxSetElementDisabled(hdxCreateLabel("Администрация онлайн", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var.mainPanel), true)
    var.close = hdxCreateImage(0, 0, 20, 20, ":province_sharedAssets/image/button_close.dds", 4294967295, var.mainPanel)
    hdxSetElementRelativePosition(var.close, var.mainPanel, "right", "top", false, 35, 35)
    hdxSetElementColor(var.close, STATE_HOVERED, tocolor(120, 120, 120, 255))
    hdxSetElementColor(var.close, STATE_PRESSED, tocolor(120, 120, 120, 255))
    hdxSetElementHoverAnim(var.close, true, 1.05, 1.05)
    var.grid = hdxCreateGridlist(0, 0, 543, 400, 0, 30, 0, var.mainPanel)
    hdxSetElementRelativePosition(var.grid, var.mainPanel, "left", "top", false, 35, 95)
    hdxInsertGridlistColumn(var.grid, 1, "ID", 80, 6)
    hdxInsertGridlistColumn(var.grid, 2, "Имя", 200, 6)
    hdxInsertGridlistColumn(var.grid, 3, "Уровень", 80, 6)
    hdxInsertGridlistColumn(var.grid, 4, "Статус", 110, 6)
    hdxSetElementSortEnabled(var.grid, true)
    hdxSetGridlistColumnHeaderTextColor(var.grid, "Статус", 4291611852)
    if "Статус" ~= 2 then
        hdxSetGridlistColumnHeaderTextAlign(var.grid, "Статус", "center", "center")
        hdxSetGridlistColumnTextHorizontalAlign(var.grid, "Статус", "center")
        local var = hdxCreateLabel("Администрация онлайн", 0, 0, tocolor(255, 255, 255), "FuturaDemi", convertFigmaFontSize(18), var.mainPanel)
        local var_1 = "Статус"
    end
    hdxSetGridlistColumnHeaderTextTab(var.grid, "Статус", 10, 0)
    hdxSetGridlistColumnHeaderTextAlign(var.grid, "Статус", "left", "center")
    hdxSetGridlistColumnTextHorizontalAlign(var.grid, "Статус", "left")
    var_24(var.grid)
    hdxSetElementScrollTabWidth(var.grid, 0)
    var.statusCombo = createCombobox(0, 0, 463, 44, "", "Статус", "statusCombo", var.mainPanel)
    for k, v in ipairs(var_11) do
        table.insert(var, (var_13[v] or table.insert))
    end
    table.insert(var, "Вышел")
    updateList("statusCombo", var_1)
    hdxSetElementRelativePosition(var.statusCombo, var.mainPanel, "center", "bottom", false, 0, 35)
    addEventHandler("onComboboxSelect", var.statusCombo, var_37)
    addEventHandler("onHdxElementPressed", var.mainPanel, var_38)
end

local function sub_1013(arg1, arg2)
    var.canSelectAdmins = arg2
    if var.mainPanel then
        if hdxIsElementVisible(var.mainPanel) then
            hdxSetElementVisible(var.mainPanel, false)
            var_28(false)
        end
    end
    countChildElements()
    if arg2 then
        hdxSetGridlistSlotColor(var.grid, STATE_PRESSED, 4294534144)
        hdxSetGridlistRowColor(var.grid, STATE_HOVERED, 4294534144)
        hdxSetGridlistRowColor(var.grid, STATE_PRESSED, 4294534144)
    end
    hdxSetGridlistSlotColor(var.grid, STATE_PRESSED, 4281545523)
    hdxSetGridlistRowColor(var.grid, STATE_HOVERED, 4281545523)
    hdxSetGridlistRowColor(var.grid, STATE_PRESSED, 4281545523)
    hdxSetGridlistContent({}.grid, {})
    hdxSetElementVisible({}.mainPanel, true)
    var_28(true)
end

addEventHandler("adminpanel:toggleAdminList", resourceRoot, sub_1013)

local function onClientKey(arg1, arg2)
    if arg1 ~= "escape" or not arg2 then
    end
    if var.mainPanel then
        if hdxIsElementVisible(var.mainPanel) then
            hdxSetElementVisible(var.mainPanel, false)
            var_28(false)
            cancelEvent()
        end
    end
    if not var_1.mainPanel then
        return
    end
    if not hdxIsElementVisible(var_1.mainPanel) then
        return
    end
    cancelEvent()
    if var_1.addPanel then
        if hdxIsElementVisible(var_1.addPanel) then
            hdxSetElementVisible(var_1.addPanel, false)
        end
    end
    if var_1.adminPanel then
        if hdxIsElementVisible(var_1.adminPanel) then
            hdxSetElementVisible(var_1.adminPanel, false)
        end
    end
    if var_1.settingsPanel then
        if hdxIsElementVisible(var_1.settingsPanel) then
            hdxSetElementVisible(var_1.settingsPanel, false)
        end
    end
    if var_1.confirmPanel then
        if hdxIsElementVisible(var_1.confirmPanel) then
            hdxSetElementVisible(var_1.confirmPanel, false)
        end
    end
    setMainPanelVisible(false)
end

addEventHandler("onClientKey", root, onClientKey)

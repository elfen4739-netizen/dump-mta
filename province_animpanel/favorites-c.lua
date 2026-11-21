-- ByteRevenant
-- LuaQ 5.1 structured decompile

local var = {}

getCountFavotites = function()
    for k, v in pairs(var) do
        if animationList[value_1] then
            if animationList[value_1][value_2] then
                table.insert(var, table.copy(animationList[value_1][value_2], true))
            end
        end
    end
    return 0, {}
end

local function var_1()
    return xmlCreateFile("configs/favorite.xml", "animations")
end

local var_2 = 5

initFavoriteAnimations = function()
    if xmlLoadFile("configs/favorite.xml") then
        for k, v in pairs(xmlNodeGetChildren(xmlLoadFile("configs/favorite.xml"))) do
            if tonumber(xmlNodeGetAttribute(v, "category")) and tonumber(xmlNodeGetAttribute(v, "id")) then
                if not tRawAnimationsBlockOrder[tonumber(xmlNodeGetAttribute(v, "category"))] then
                    iprint("animpanel missing category", tonumber(xmlNodeGetAttribute(v, "category")))
                    local var = xmlLoadFile("configs/favorite.xml")
                    local var_1 = tonumber(xmlNodeGetAttribute(v, "category"))
                    local var_2 = tonumber(xmlNodeGetAttribute(v, "id"))
                end
                if not tRawAnimationsList[tRawAnimationsBlockOrder[tonumber(xmlNodeGetAttribute(v, "category"))]][tonumber(xmlNodeGetAttribute(v, "id"))] then
                    iprint("animpanel missing animation", tonumber(xmlNodeGetAttribute(v, "category")), tonumber(xmlNodeGetAttribute(v, "id")))
                    local var = xmlLoadFile("configs/favorite.xml")
                    local var_1 = tonumber(xmlNodeGetAttribute(v, "category"))
                    local var_2 = tonumber(xmlNodeGetAttribute(v, "id"))
                end
                if hasAccessToAnim((tRawAnimationsList[tRawAnimationsBlockOrder[tonumber(xmlNodeGetAttribute(v, "category"))]][tonumber(xmlNodeGetAttribute(v, "id"))] or tonumber(xmlNodeGetAttribute(v, "id"))).group, tRawAnimationsList[tRawAnimationsBlockOrder[tonumber(xmlNodeGetAttribute(v, "category"))]][tonumber(xmlNodeGetAttribute(v, "id"))].anim) then
                    var[k] = { tonumber(xmlNodeGetAttribute(v, "category")), tonumber(xmlNodeGetAttribute(v, "id")) }
                end
            end
        end
    end
    xmlSaveFile(var_1())
    xmlUnloadFile(var_1())
    if var_2 < getCountFavotites() then
        for k, v in pairs(var) do
            var["anim." .. v[1] .. "." .. v[2]] = false
        end
        radialUpdateGroupPermission(var)
        fileDelete("configs/favorite.xml")
        initFavoriteAnimations()
    end
    for k, v in pairs(var) do
        var["anim." .. v[1] .. "." .. v[2]] = true
    end
    var.favorite_anims_empty = true
    radialUpdateGroupPermission(var)
end

addEventHandler("onLogin", localPlayer, initFavoriteAnimations)
addEventHandler("onClientResourceStart", resourceRoot, initFavoriteAnimations)

isAnimationAdded = function(arg1, arg2)
    if not arg1 or not arg2 then
        return false
    end
    for k, v in pairs(var) do
        if v[1] == arg1 then
            if v[2] == arg2 then
                return true, k
            end
        end
    end
    return false
end

saveFavoriteAnimation = function(arg1, arg2)
    if isAnimationAdded(arg1, arg2) then
        outputNotification("Данная анимация уже в избранных.")
    end
    if var_2 <= getCountFavotites() then
        outputNotification("Вы не можете добавить в избранные более " .. var_2 .. "-и анимаций.")
    end
    xmlNodeSetAttribute(xmlCreateChild((xmlLoadFile("configs/favorite.xml") or var_1()), "anim"), "category", arg1)
    xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("configs/favorite.xml"), "anim"), "id", arg2)
    var[#var + 1] = { arg1, arg2 }
    if getCountFavotites() > 0 then
        local var = xmlLoadFile("configs/favorite.xml")
        local var_1 = { ["anim." .. arg1 .. "." .. arg2] = true }
    end
    radialUpdateGroupPermission({ ["anim." .. arg1 .. "." .. arg2] = true, favorite_anims_empty = true })
    xmlSaveFile(xmlLoadFile("configs/favorite.xml"))
    xmlUnloadFile(xmlLoadFile("configs/favorite.xml"))
    updateAnimsCategories()
    updateAnimRow(arg1, arg2)
    reloadAnimsList(true)
end

deleteFavoriteAnimation = function(arg1, arg2)
    if not value_1 then
        outputNotification("Данной анимации нет в избранных.")
    end
    for k, v in pairs(xmlNodeGetChildren(xmlLoadFile("configs/favorite.xml"))) do
        if value_2 and arg1 == tonumber(xmlNodeGetAttribute(v, "category")) and arg2 == tonumber(xmlNodeGetAttribute(v, "id")) then
            xmlDestroyNode(v)
            local var = xmlLoadFile("configs/favorite.xml")
        end
        local var = xmlLoadFile("configs/favorite.xml")
    end
    if getCountFavotites() > 0 then
        local var = xmlLoadFile("configs/favorite.xml")
        local lockClient = { ["anim." .. arg1 .. "." .. arg2] = false }
    end
    radialUpdateGroupPermission({ ["anim." .. arg1 .. "." .. arg2] = false, favorite_anims_empty = true })
    xmlSaveFile(xmlLoadFile("configs/favorite.xml"))
    xmlUnloadFile(xmlLoadFile("configs/favorite.xml"))
    updateAnimsCategories()
    updateAnimRow(arg1, arg2)
    reloadAnimsList(true)
end

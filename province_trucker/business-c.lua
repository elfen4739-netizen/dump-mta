-- ByteRevenant
-- LuaQ 5.1 structured decompile

getBusinessPosition = function(arg1)
    if not arg1 then
        return false
    end
    if not tBusinessData then
        tBusinessData = exports.province_business:getAllBusiness()
    end
    if tBusinessData[arg1] then
        if tBusinessData[arg1].pickupCoords then
            return unpack(tBusinessData[arg1].pickupCoords)
        end
    end
    return false
end

getBusinessZone = function(arg1)
    if not arg1 then
        return false
    end
    if not tBusinessData then
        tBusinessData = exports.province_business:getAllBusiness()
    end
    if tBusinessData[arg1] then
        return tBusinessData[arg1].buyZone, tBusinessData[arg1].load, tBusinessData[arg1].unload
    end
    return false
end

addEvent("trucker:setBusinessBlipVisible", false)

local function sub_1001(arg1, arg2)
    if not arg1 or not arg2 then
    end
    if arg2 == "goods" then
    end
    if arg2 == "myBusiness" then
        local var = "Мой бизнес"
    end
    if not nil then
        return
    end
    if not nil then
        return
    end
    if not nil then
        return
    end
    if not nil then
        return
    end
    triggerEvent("newGps:createBlip", resourceRoot, nil, nil, nil, false, nil)
end

addEventHandler("trucker:setBusinessBlipVisible", localPlayer, sub_1001)

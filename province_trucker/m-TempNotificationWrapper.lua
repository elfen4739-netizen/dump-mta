-- ByteRevenant
-- LuaQ 5.1 structured decompile

outputNotification = function(arg1, arg2)
    if not localPlayer then
        triggerClientEvent(arg2, "province:sendNotification", resourceRoot, arg1)
    end
    triggerEvent("province:sendNotification", localPlayer, arg1, arg2)
end

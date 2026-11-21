-- ByteRevenant
-- LuaQ 5.1 structured decompile

getServerTime = function()
    return exports.province_main:getServerTime()
    return exports.province_main.getServerTime, exports.province_main
end

sendPhoneNotification = function()
    return exports.province_phone:sendPhoneNotification()
    return exports.province_phone.sendPhoneNotification, exports.province_phone
end

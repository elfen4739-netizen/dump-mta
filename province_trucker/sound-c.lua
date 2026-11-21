-- ByteRevenant
-- LuaQ 5.1 structured decompile

addEvent("trucker:soundPlay", true)

local function sub_1001(arg1)
    local data = (type(arg1) == "table" and arg1 or nil)
    local isElement = data and data.isElement
    local playSound = data and data.playSound
    local setSoundVolume = data and data.setSoundVolume
end

addEventHandler("trucker:soundPlay", resourceRoot, sub_1001)

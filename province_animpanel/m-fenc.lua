-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function var(arg1)
    if not fileOpen(arg1) then
        return false
    end
    fileClose(fileOpen(arg1))
    return decodeString("tea", fileRead(fileOpen(arg1), fileGetSize(fileOpen(arg1))), { key = "@#4rAsld87dfsO*s" })
end

engineLoadDFF = function(arg1)
    return engineLoadDFF(var(arg1))
end

engineLoadTXD = function(arg1)
    return engineLoadTXD(var(arg1))
end

engineLoadIFP = function(arg1)
    return engineLoadIFP(var(arg1), arg1)
end

engineLoadCOL = function(arg1)
    return engineLoadCOL(var(arg1))
end

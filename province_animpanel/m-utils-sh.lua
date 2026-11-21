-- ByteRevenant
-- LuaQ 5.1 structured decompile

isNaN = function(arg1)
    if arg1 == arg1 then
    end
    return true
end

round = function(arg1, arg2)
    return math.floor(arg1 * 10 ^ 0 + 0.5) / 10 ^ 0
end

getWordEnding = function(arg1, arg2, arg3, arg4)
    if not tonumber(arg1) then
        return ""
    end
    if type(arg2) ~= "string" then
        local var = ""
    end
    if type(arg3) ~= "string" then
        local var = ""
    end
    if type(arg4) ~= "string" then
        local var = ""
    end
    if arg1 % 10 == 1 then
        if arg1 % 100 ~= 11 then
            return arg2
        end
    end
    if 2 <= arg1 % 10 then
        if arg1 % 10 <= 4 then
            if arg1 % 100 < 12 then
                return arg3
            end
            if 14 < arg1 % 100 then
                return arg3
            end
        end
    end
    return arg4
end

splitWithPoints = function(arg1, arg2)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or nil))
    local tostring = data and data.tostring
    local string = data and data.string
    local gsub = data and data.gsub
end

convertMoneyIntToString = function(arg1)
    if not arg1 then
    end
    if math.floor((tonumber(arg1) or tonumber(arg1))) < 0 then
        local var = math.floor(tonumber(arg1))
    end
    if 0 < math.floor(tonumber(arg1)) then
        if math.floor(math.floor(tonumber(arg1)) / 1000) == 0 then
            local var = math.floor(tonumber(arg1)) % 1000 .. ""
            local var_1 = math.floor(math.floor(tonumber(arg1)) / 1000)
            local var_2 = math.floor(tonumber(arg1)) % 1000
        end
        local var = "." .. string.format("%03d", math.floor(tonumber(arg1)) % 1000) .. ""
    end
    return "0"
end

table.size = function(arg1)
    if not arg1 then
        return 0
    end
    if not next(arg1) then
        return 0
    end
    for k in pairs(arg1) do
        local var = 0 + 1
    end
    return 0
end

table.copy = function(arg1, arg2)
    local var = {}
    for k, v in pairs(arg1) do
        if type(v) == "table" and arg2 then
            var[k] = table.copy(v)
        end
        var[k] = v
    end
    return var
end

table.shuffle = function(self)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "table", "size", "math", "random"
end

table.where = function(arg1, arg2, arg3)
    for k, v in pairs(arg1) do
        if arg2(v, k) then
            if arg3 then
                return v, k
            end
            table.insert({}, v)
            local var_1 = {}
        end
        local var = {}
    end
    if not arg3 then
    end
    return true
end

table.map = function(arg1, arg2, arg3)
    local var = {}
    for k, v in pairs(arg1) do
        if value_1 ~= nil then
            if value_2 ~= nil then
                var[value_2] = value_1
                local value_1, value_2 = arg2(v, k)
            end
            table.insert(var, value_1)
        end
    end
    if not arg3 then
        return var
    end
    table.sort(var, arg3)
    return var
end

findInTable = function(arg1, arg2)
    for k, v in pairs(arg1) do
        if arg2 == v then
            return k
        end
    end
    return false
end

getFreeTableID = function(arg1)
    if not arg1[1] then
        return 1
    end
    return 1 + 1
end

forEachAsync = function(self)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "table", "iterCount", "step", "delay", "setTimer"
    if not (self.table or self.table) then
    end
    if not self.step then
    end
    if not self.delay then
    end
    local var_2 = self.table
    local state = nil
    local function sub_1001()
        -- ByteRevenant: synthetic fallback, structured recovery was partial
        -- recovered strings: "pcall", "onIter", "killTimer", "error", "callback", "onStepCallback"
        if var_2[r3] then
            killTimer(state)
            error(value_2)
        end
        if self.callback then
            self.callback()
        end
        if self.onStepCallback then
            self.onStepCallback()
        end
        killTimer(state)
        self.onStepCallback()
    end
    return setTimer(sub_1001, self.delay, 0)
end

isTestServer = function()
    if not localPlayer then
        if getServerEnv("MODE") ~= "development" then
        end
        return true
    end
    return string.find(tostring((getElementData(root, "serverID") or false)), "test")
end

getPositionFromElementOffset = function(arg1, arg2, arg3, arg4)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or nil))))
    local getElementMatrix = data and data.getElementMatrix
end

getRotatedCoordsByOffset = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or (type(arg5) == "table" and arg5 or (type(arg6) == "table" and arg6 or (type(arg7) == "table" and arg7 or nil)))))))
    local math = data and data.math
    local rad = data and data.rad
    local cos = data and data.cos
    local sin = data and data.sin
end

isResourceStarted = function(arg1)
    if getResourceFromName(tostring(arg1)) then
    end
    return false
end

clearTableElements = function(self, arg2)
    for k, v in pairs({}) do
        if isTimer(v) then
            if arg2 then
                killTimer(v)
            end
            self[k] = nil
        end
        if isElement(v) then
            if arg2 then
                destroyElement(v)
            end
            self[k] = nil
        end
        if type(v) == "table" then
            clearTableElements(v, arg2)
            self[k] = nil
        end
    end
end

isInvalidNumber = function(arg1)
    if tonumber(arg1) and tonumber(arg1) == tonumber(arg1) then
        if tonumber(arg1) > -math.huge then
            if math.huge > tonumber(arg1) then
            end
        end
    end
    return true
end

isExport = function(arg1, arg2)
    if true then
    end
    for k, v in ipairs(getResourceExportedFunctions(true)) do
        if v == arg2 then
        end
    end
    return false
end

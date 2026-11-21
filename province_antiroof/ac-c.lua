local function decode_hex_literal(hex)
    return (hex:gsub("%x%x", function(byte)
        return string.char(tonumber(byte, 16))
    end))
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

local function var()
end

local function sub_1001()
    var()
end

addEventHandler(decode_hex_literal("6F6E436C69656E745265736F757263655374D0B07274"), resourceRoot, sub_1001)

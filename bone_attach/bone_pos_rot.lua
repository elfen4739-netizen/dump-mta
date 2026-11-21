-- ByteRevenant
-- LuaQ 5.1 structured decompile

sz = 3
sy = 0
sx = 0
tz = 4
ty = 0
tx = 0
fz = 3
fy = 1
fx = 0

getMatrixFromPoints = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or (type(arg4) == "table" and arg4 or (type(arg5) == "table" and arg5 or (type(arg6) == "table" and arg6 or (type(arg7) == "table" and arg7 or (type(arg8) == "table" and arg8 or (type(arg9) == "table" and arg9 or nil)))))))))
    local math = data and data.math
    local sqrt = data and data.sqrt
end

getEulerAnglesFromMatrix = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    -- ByteRevenant: synthetic fallback, structured recovery was partial
    -- recovered strings: "math", "sqrt", "deg", "asin", "atan2"
end

getMatrixFromEulerAngles = function(arg1, arg2, arg3)
    local data = (type(arg1) == "table" and arg1 or (type(arg2) == "table" and arg2 or (type(arg3) == "table" and arg3 or nil)))
    local math = data and data.math
    local rad = data and data.rad
    local sin = data and data.sin
    local cos = data and data.cos
end

if not localPlayer then
    return
end

getBoneMatrix = function(arg1, arg2)
    if arg2 == 1 then
    end
    if arg2 == 3 then
    end
    if arg2 ~= 1 then
        local value_1, value_2, value_3 = getPedBonePosition(arg1, bone_0[arg2])
        local value_4, value_5, value_6 = getPedBonePosition(arg1, bone_t[arg2])
        local value_7, value_8, value_9 = getPedBonePosition(arg1, bone_f[arg2])
        local value_10, value_11, value_12, value_13, value_14, value_15, value_16, value_17, value_18 = getMatrixFromPoints(value_1, value_2, value_3, value_4, value_5, value_6, value_7, value_8, value_9)
    end
    return -value_13, -value_14, -value_15, value_10, value_11, value_12, value_16, value_17, value_18
end

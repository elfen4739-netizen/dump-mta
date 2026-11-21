-- ByteRevenant
-- LuaQ 5.1 structured decompile

sendReadyMessage = function()
    triggerServerEvent("boneAttach_requestAttachmentData", resourceRoot)
end

addEventHandler("onClientResourceStart", resourceRoot, sendReadyMessage)

getAttachmentData = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    for k, v in pairs(arg1) do
        if isElement(k) then
            setElementCollisionsEnabled(k, false)
        end
        if not attached_to_bones[v] then
            attached_to_bones[v] = {}
        end
        attached_to_bones[v][k] = arg2[k]
        attached_ped[k] = v
        attached_bone[k] = arg2[k]
        attached_x[k] = arg3[k]
        attached_y[k] = arg4[k]
        attached_z[k] = arg5[k]
        attached_rx[k] = arg6[k]
        attached_ry[k] = arg7[k]
        attached_rz[k] = arg8[k]
    end
end

addEvent("boneAttach_sendAttachmentData", true)
addEventHandler("boneAttach_sendAttachmentData", resourceRoot, getAttachmentData)

initAttach = function()
    addEvent("boneAttach_attach", true)
    addEvent("boneAttach_detach", true)
    addEventHandler("boneAttach_attach", resourceRoot, attachElementToBone)
    addEventHandler("boneAttach_detach", resourceRoot, detachElementFromBone)
end

addEventHandler("onClientResourceStart", resourceRoot, initAttach)
bone_f = {}
bone_t = {}
bone_0 = {}
bone_f[1] = 6
bone_t[1] = nil
bone_0[1] = 5
bone_f[2] = 8
bone_t[2] = 5
bone_0[2] = 4
bone_f[3] = 31
bone_t[3] = nil
bone_0[3] = 3
bone_f[4] = 3
bone_t[4] = 2
bone_0[4] = 1
bone_f[5] = 5
bone_t[5] = 32
bone_0[5] = 4
bone_f[6] = 5
bone_t[6] = 22
bone_0[6] = 4
bone_f[7] = 34
bone_t[7] = 33
bone_0[7] = 32
bone_f[8] = 24
bone_t[8] = 23
bone_0[8] = 22
bone_f[9] = 32
bone_t[9] = 34
bone_0[9] = 33
bone_f[10] = 22
bone_t[10] = 24
bone_0[10] = 23
bone_f[11] = 36
bone_t[11] = 35
bone_0[11] = 34
bone_f[12] = 26
bone_t[12] = 25
bone_0[12] = 24
bone_f[13] = 43
bone_t[13] = 42
bone_0[13] = 41
bone_f[14] = 53
bone_t[14] = 52
bone_0[14] = 51
bone_f[15] = 44
bone_t[15] = 43
bone_0[15] = 42
bone_f[16] = 54
bone_t[16] = 53
bone_0[16] = 52
bone_f[17] = 44
bone_t[17] = 42
bone_0[17] = 43
bone_f[18] = 54
bone_t[18] = 52
bone_0[18] = 53
bone_f[19] = 42
bone_t[19] = 43
bone_0[19] = 44
bone_f[20] = 52
bone_t[20] = 53
bone_0[20] = 54

putAttachedElementsOnBones = function()
    for k, v in pairs(attached_ped) do
        clearAttachmentData(k)
        if isElementStreamedIn(v) then
            if value_1 + attached_x[k] * value_4 + attached_y[k] * value_7 + attached_z[k] * value_10 == value_1 + attached_x[k] * value_4 + attached_y[k] * value_7 + attached_z[k] * value_10 and value_2 + attached_x[k] * value_5 + attached_y[k] * value_8 + attached_z[k] * value_11 == value_2 + attached_x[k] * value_5 + attached_y[k] * value_8 + attached_z[k] * value_11 and value_3 + attached_x[k] * value_6 + attached_y[k] * value_9 + attached_z[k] * value_12 == value_3 + attached_x[k] * value_6 + attached_y[k] * value_9 + attached_z[k] * value_12 then
                local var = attached_x[k]
                local var_25 = attached_y[k]
                local var_26 = attached_z[k]
                local var_27 = value_1 + attached_x[k] * value_4 + attached_y[k] * value_7 + attached_z[k] * value_10
                local var_28 = value_2 + attached_x[k] * value_5 + attached_y[k] * value_8 + attached_z[k] * value_11
                local var_29 = value_3 + attached_x[k] * value_6 + attached_y[k] * value_9 + attached_z[k] * value_12
                local var_39 = value_2 + attached_x[k] * value_5 + attached_y[k] * value_8 + attached_z[k] * value_11
                local countChildElements = value_3 + attached_x[k] * value_6 + attached_y[k] * value_9 + attached_z[k] * value_12
            end
            setElementPosition(k, value_1, value_2, value_3)
            setElementRotation(k, attached_rx[k], attached_ry[k], attached_rz[k], "ZXY")
            local var = attached_x[k]
            local var_13 = attached_y[k]
            local var_14 = attached_z[k]
            local var_15 = attached_rx[k]
            local var_16 = attached_ry[k]
            local var_17 = attached_rz[k]
            local var_18 = value_1 + attached_x[k] * value_4 + attached_y[k] * value_7 + attached_z[k] * value_10
            local var_19 = value_2 + attached_x[k] * value_5 + attached_y[k] * value_8 + attached_z[k] * value_11
            local var_20 = value_3 + attached_x[k] * value_6 + attached_y[k] * value_9 + attached_z[k] * value_12
            local var_21 = attached_rx[k]
            local var_22 = attached_ry[k]
            local var_23 = attached_rz[k]
            local var_24 = "ZXY"
        end
        setElementPosition(k, getElementPosition(v))
    end
end

addEventHandler("onClientPreRender", root, putAttachedElementsOnBones)

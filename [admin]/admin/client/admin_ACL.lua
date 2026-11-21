-- ByteRevenant
-- LuaQ 5.1 structured decompile

_aclrights = {}

hasPermissionTo = function(arg1)
    if _aclrights[arg1] then
        return true
    end
    return false
end

addEvent("aPermissions", true)

local function sub_1001(arg1)
    for k, v in ipairs(arg1) do
        _aclrights[v] = true
        if aAdminForm then
            if _guiprotected[v] then
                guiSetEnabled(_guiprotected[v], true)
            end
        end
    end
end

addEventHandler("aPermissions", getLocalPlayer(), sub_1001)

local function onAdminInitialize()
    if #_guiprotected ~= 0 then
        return
    end
    triggerServerEvent("aPermissions", getLocalPlayer())
end

addEventHandler("onAdminInitialize", resourceRoot, onAdminInitialize)

-- ByteRevenant
-- LuaQ 5.1 structured decompile

_guiprotected = {}

guiCreateHeader = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    if guiCreateLabel(arg1, arg2, arg3, arg4, arg5, arg6, arg7) then
        guiLabelSetColor(guiCreateLabel(arg1, arg2, arg3, arg4, arg5, arg6, arg7), 255, 0, 0)
        guiSetFont(guiCreateLabel(arg1, arg2, arg3, arg4, arg5, arg6, arg7), "default-bold-small")
        return guiCreateLabel(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    end
    return false
end

_guiCreateTab = guiCreateTab

guiCreateTab = function(arg1, arg2, arg3)
    if _guiCreateTab(arg1, arg2) then
        if not arg3 then
            return _guiCreateTab(arg1, arg2)
        end
        if hasPermissionTo("general.tab_" .. arg3) then
            return _guiCreateTab(arg1, arg2)
        end
        guiSetEnabled(_guiCreateTab(arg1, arg2), false)
        _guiprotected["general.tab_" .. arg3] = _guiCreateTab(arg1, arg2)
        return _guiCreateTab(arg1, arg2)
    end
    return false
end

_guiCreateButton = guiCreateButton

guiCreateButton = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    if _guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7) then
        if arg8 then
            if not hasPermissionTo("command." .. arg8) then
                guiSetEnabled(_guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7), false)
                _guiprotected["command." .. arg8] = _guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
                local var = _guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
            end
            local var = _guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
        end
        guiSetFont(_guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7), "default-bold-small")
        return _guiCreateButton(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    end
    return false
end

-- ByteRevenant
-- LuaQ 5.1 structured decompile

settings = {
    useanimation = nil,
    toggleable = nil,
    showserverinfo = true,
    showgamemodeinfo = nil,
    showteams = nil,
    usecolors = nil,
    drawspeed = nil,
    scale = nil,
    columnfont = nil,
    contentfont = nil,
    teamfont = nil,
    serverinfofont = nil,
    bg_color = {},
    selection_color = {},
    highlight_color = {},
    header_color = {},
    team_color = {},
    border_color = {},
    serverinfo_color = {},
    content_color = {},
}
defaultSettings = {
    useanimation = true,
    toggleable = false,
    showserverinfo = false,
    showgamemodeinfo = false,
    showteams = true,
    usecolors = true,
    drawspeed = 1.5,
    scale = 1,
    columnfont = "default-bold",
    contentfont = "default-bold",
    teamfont = "clear",
    serverinfofont = "default",
    bg_color = {
        r = 0,
        g = 0,
        b = 0,
        a = 170,
    },
    selection_color = {
        r = 82,
        g = 103,
        b = 188,
        a = 170,
    },
    highlight_color = {
        r = 255,
        g = 255,
        b = 255,
        a = 50,
    },
    header_color = {
        r = 100,
        g = 100,
        b = 100,
        a = 255,
    },
    team_color = {
        r = 100,
        g = 100,
        b = 100,
        a = 100,
    },
    border_color = {
        r = 100,
        g = 100,
        b = 100,
        a = 50,
    },
    serverinfo_color = {
        r = 150,
        g = 150,
        b = 150,
        a = 255,
    },
    content_color = {
        r = 255,
        g = 255,
        b = 255,
        a = 255,
    },
}
tempColors = {
    bg_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    selection_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    highlight_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    header_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    team_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    border_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    serverinfo_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
    content_color = {
        r = nil,
        g = nil,
        b = nil,
        a = nil,
    },
}
MAX_DRAWSPEED = 4
MIN_DRAWSPEED = 0.5
MAX_SCALE = 2.5
MIN_SCALE = 0.5
fontIndexes = {
    column = 1,
    content = 1,
    team = 1,
    serverinfo = 1,
}
fontNames = {
    "default",
    "default-bold",
    "clear",
    "arial",
    "sans",
    "pricedown",
    "bankgothic",
    "diploma",
    "beckett",
}

readScoreboardSettings = function()
    if not xmlLoadFile("settings.xml") then
        if not xmlCreateFile("settings.xml", "settings") then
            return false
        end
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "useanimation"), tostring(defaultSettings.useanimation))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "toggleable"), tostring(defaultSettings.toggleable))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "showserverinfo"), tostring(defaultSettings.showserverinfo))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "showgamemodeinfo"), tostring(defaultSettings.showgamemodeinfo))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "showteams"), tostring(defaultSettings.showteams))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "usecolors"), tostring(defaultSettings.usecolors))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "drawspeed"), tostring(defaultSettings.drawspeed))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "scale"), tostring(defaultSettings.scale))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "columnfont"), tostring(defaultSettings.columnfont))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "contentfont"), tostring(defaultSettings.contentfont))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "teamfont"), tostring(defaultSettings.teamfont))
        xmlNodeSetValue(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfofont"), tostring(defaultSettings.serverinfofont))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "bg_color"), "r", tostring(defaultSettings.bg_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "bg_color"), "g", tostring(defaultSettings.bg_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "bg_color"), "b", tostring(defaultSettings.bg_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "bg_color"), "a", tostring(defaultSettings.bg_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "selection_color"), "r", tostring(defaultSettings.selection_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "selection_color"), "g", tostring(defaultSettings.selection_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "selection_color"), "b", tostring(defaultSettings.selection_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "selection_color"), "a", tostring(defaultSettings.selection_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "highlight_color"), "r", tostring(defaultSettings.highlight_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "highlight_color"), "g", tostring(defaultSettings.highlight_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "highlight_color"), "b", tostring(defaultSettings.highlight_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "highlight_color"), "a", tostring(defaultSettings.highlight_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "header_color"), "r", tostring(defaultSettings.header_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "header_color"), "g", tostring(defaultSettings.header_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "header_color"), "b", tostring(defaultSettings.header_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "header_color"), "a", tostring(defaultSettings.header_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "team_color"), "r", tostring(defaultSettings.team_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "team_color"), "g", tostring(defaultSettings.team_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "team_color"), "b", tostring(defaultSettings.team_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "team_color"), "a", tostring(defaultSettings.team_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "border_color"), "r", tostring(defaultSettings.border_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "border_color"), "g", tostring(defaultSettings.border_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "border_color"), "b", tostring(defaultSettings.border_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "border_color"), "a", tostring(defaultSettings.border_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfo_color"), "r", tostring(defaultSettings.serverinfo_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfo_color"), "g", tostring(defaultSettings.serverinfo_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfo_color"), "b", tostring(defaultSettings.serverinfo_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfo_color"), "a", tostring(defaultSettings.serverinfo_color.a))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "content_color"), "r", tostring(defaultSettings.content_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "content_color"), "g", tostring(defaultSettings.content_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "content_color"), "b", tostring(defaultSettings.content_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "content_color"), "a", tostring(defaultSettings.content_color.a))
        xmlSaveFile(xmlCreateFile("settings.xml", "settings"))
        local var = xmlCreateFile("settings.xml", "settings")
        local var_1 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "usecolors")
        local var_2 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "drawspeed")
        local lockClient = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "scale")
        local tripClient = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "columnfont")
        local var_5 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "contentfont")
        local var_6 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "teamfont")
        local var_7 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfofont")
        local var_8 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "bg_color")
        local var_9 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "selection_color")
        local var_10 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "highlight_color")
        local var_11 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "header_color")
        local var_12 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "team_color")
        local var_13 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "border_color")
        local var_14 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "serverinfo_color")
        local var_15 = xmlCreateChild(xmlCreateFile("settings.xml", "settings"), "content_color")
        local var_16 = xmlCreateFile("settings.xml", "settings")
        local var_17 = "a"
        local var_18 = tostring(defaultSettings.content_color.a)
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "useanimation"), tostring(defaultSettings.useanimation))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlCreateChild(xmlLoadFile("settings.xml"), "useanimation")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "toggleable"), tostring(defaultSettings.toggleable))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlCreateChild(xmlLoadFile("settings.xml"), "toggleable")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "showserverinfo"), tostring(defaultSettings.showserverinfo))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "showgamemodeinfo"), tostring(defaultSettings.showgamemodeinfo))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlCreateChild(xmlLoadFile("settings.xml"), "showgamemodeinfo")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "showteams"), tostring(defaultSettings.showteams))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlCreateChild(xmlLoadFile("settings.xml"), "showteams")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "usecolors"), tostring(defaultSettings.usecolors))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlCreateChild(xmlLoadFile("settings.xml"), "usecolors")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "drawspeed"), tostring(defaultSettings.drawspeed))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlCreateChild(xmlLoadFile("settings.xml"), "drawspeed")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "scale"), tostring(defaultSettings.scale))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlCreateChild(xmlLoadFile("settings.xml"), "scale")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "columnfont"), tostring(defaultSettings.columnfont))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlCreateChild(xmlLoadFile("settings.xml"), "columnfont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "contentfont"), tostring(defaultSettings.contentfont))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlCreateChild(xmlLoadFile("settings.xml"), "contentfont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "teamfont"), tostring(defaultSettings.teamfont))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlCreateChild(xmlLoadFile("settings.xml"), "teamfont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0) then
        xmlNodeSetValue(xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfofont"), tostring(defaultSettings.serverinfofont))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfofont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "bg_color"), "r", tostring(defaultSettings.bg_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "bg_color"), "g", tostring(defaultSettings.bg_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "bg_color"), "b", tostring(defaultSettings.bg_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "bg_color"), "a", tostring(defaultSettings.bg_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlCreateChild(xmlLoadFile("settings.xml"), "bg_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "selection_color"), "r", tostring(defaultSettings.selection_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "selection_color"), "g", tostring(defaultSettings.selection_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "selection_color"), "b", tostring(defaultSettings.selection_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "selection_color"), "a", tostring(defaultSettings.selection_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlCreateChild(xmlLoadFile("settings.xml"), "selection_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "highlight_color"), "r", tostring(defaultSettings.highlight_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "highlight_color"), "g", tostring(defaultSettings.highlight_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "highlight_color"), "b", tostring(defaultSettings.highlight_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "highlight_color"), "a", tostring(defaultSettings.highlight_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_14 = xmlCreateChild(xmlLoadFile("settings.xml"), "highlight_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "header_color"), "r", tostring(defaultSettings.header_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "header_color"), "g", tostring(defaultSettings.header_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "header_color"), "b", tostring(defaultSettings.header_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "header_color"), "a", tostring(defaultSettings.header_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_15 = xmlCreateChild(xmlLoadFile("settings.xml"), "header_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "team_color"), "r", tostring(defaultSettings.team_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "team_color"), "g", tostring(defaultSettings.team_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "team_color"), "b", tostring(defaultSettings.team_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "team_color"), "a", tostring(defaultSettings.team_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_16 = xmlCreateChild(xmlLoadFile("settings.xml"), "team_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "border_color"), "r", tostring(defaultSettings.border_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "border_color"), "g", tostring(defaultSettings.border_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "border_color"), "b", tostring(defaultSettings.border_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "border_color"), "a", tostring(defaultSettings.border_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_17 = xmlCreateChild(xmlLoadFile("settings.xml"), "border_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfo_color"), "r", tostring(defaultSettings.serverinfo_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfo_color"), "g", tostring(defaultSettings.serverinfo_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfo_color"), "b", tostring(defaultSettings.serverinfo_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfo_color"), "a", tostring(defaultSettings.serverinfo_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_18 = xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfo_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0) then
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "content_color"), "r", tostring(defaultSettings.content_color.r))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "content_color"), "g", tostring(defaultSettings.content_color.g))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "content_color"), "b", tostring(defaultSettings.content_color.b))
        xmlNodeSetAttribute(xmlCreateChild(xmlLoadFile("settings.xml"), "content_color"), "a", tostring(defaultSettings.content_color.a))
        xmlSaveFile(xmlLoadFile("settings.xml"))
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_18 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_19 = xmlCreateChild(xmlLoadFile("settings.xml"), "content_color")
    end
    settings.useanimation = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0))
    if settings.useanimation then
        if tostring(settings.useanimation) ~= "false" then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_18 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_18 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.useanimation = iif(settings.useanimation, false, true)
    settings.toggleable = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0))
    if settings.toggleable then
        if tostring(settings.toggleable) ~= "true" then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.toggleable = iif(settings.toggleable, true, false)
    settings.showserverinfo = true
    settings.showgamemodeinfo = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0))
    if settings.showgamemodeinfo then
        if tostring(settings.showgamemodeinfo) ~= "true" then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.showgamemodeinfo = iif(settings.showgamemodeinfo, true, false)
    settings.showteams = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0))
    if settings.showteams then
        if tostring(settings.showteams) ~= "false" then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.showteams = iif(settings.showteams, false, true)
    settings.usecolors = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0))
    if settings.usecolors then
        if tostring(settings.usecolors) ~= "false" then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.usecolors = iif(settings.usecolors, false, true)
    settings.drawspeed = tonumber(xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)))
    if type(settings.drawspeed) == "number" then
        if MIN_DRAWSPEED <= settings.drawspeed then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.drawspeed = iif(true, settings.drawspeed, defaultSettings.drawspeed)
    settings.scale = tonumber(xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)))
    if type(settings.scale) == "number" then
        if MIN_SCALE <= settings.scale then
            local var = xmlLoadFile("settings.xml")
            local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
            local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
            local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
            local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
            local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
            local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
            local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
            local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
            local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
            local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
            local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
            local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
        end
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0)
    end
    settings.scale = iif(true, settings.scale, defaultSettings.scale)
    settings.columnfont = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0))
    settings.columnfont = iif(fontScale[settings.columnfont], settings.columnfont, defaultSettings.columnfont)
    settings.contentfont = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0))
    settings.contentfont = iif(fontScale[settings.contentfont], settings.contentfont, defaultSettings.contentfont)
    settings.teamfont = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0))
    settings.teamfont = iif(fontScale[settings.teamfont], settings.teamfont, defaultSettings.teamfont)
    settings.serverinfofont = xmlNodeGetValue(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0))
    settings.serverinfofont = iif(fontScale[settings.serverinfofont], settings.serverinfofont, defaultSettings.serverinfofont)
    settings.bg_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "r"))) or defaultSettings.bg_color.r)
    settings.bg_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "g"))) or defaultSettings.bg_color.g)
    settings.bg_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "b"))) or defaultSettings.bg_color.b)
    settings.bg_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "a"))) or defaultSettings.bg_color.a)
    settings.selection_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "r"))) or defaultSettings.selection_color.r)
    settings.selection_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "g"))) or defaultSettings.selection_color.g)
    settings.selection_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "b"))) or defaultSettings.selection_color.b)
    settings.selection_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "a"))) or defaultSettings.selection_color.a)
    settings.highlight_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "r"))) or defaultSettings.highlight_color.r)
    settings.highlight_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "g"))) or defaultSettings.highlight_color.g)
    settings.highlight_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "b"))) or defaultSettings.highlight_color.b)
    settings.highlight_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "a"))) or defaultSettings.highlight_color.a)
    settings.header_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "r"))) or defaultSettings.header_color.r)
    settings.header_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "g"))) or defaultSettings.header_color.g)
    settings.header_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "b"))) or defaultSettings.header_color.b)
    settings.header_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "a"))) or defaultSettings.header_color.a)
    settings.team_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "r"))) or defaultSettings.team_color.r)
    settings.team_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "g"))) or defaultSettings.team_color.g)
    settings.team_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "b"))) or defaultSettings.team_color.b)
    settings.team_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "a"))) or defaultSettings.team_color.a)
    settings.border_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "r"))) or defaultSettings.border_color.r)
    settings.border_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "g"))) or defaultSettings.border_color.g)
    settings.border_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "b"))) or defaultSettings.border_color.b)
    settings.border_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "a"))) or defaultSettings.border_color.a)
    settings.serverinfo_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "r"))) or defaultSettings.serverinfo_color.r)
    settings.serverinfo_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "g"))) or defaultSettings.serverinfo_color.g)
    settings.serverinfo_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "b"))) or defaultSettings.serverinfo_color.b)
    settings.serverinfo_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "a"))) or defaultSettings.serverinfo_color.a)
    settings.content_color.r = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "r"))) or defaultSettings.content_color.r)
    settings.content_color.g = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "g"))) or defaultSettings.content_color.g)
    settings.content_color.b = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "b"))) or defaultSettings.content_color.b)
    settings.content_color.a = (validateRange(tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "a"))) or defaultSettings.content_color.a)
    xmlUnloadFile(xmlLoadFile("settings.xml"))
    useAnimation = settings.useanimation
    scoreboardIsToggleable = settings.toggleable
    showServerInfo = settings.showserverinfo
    showGamemodeInfo = settings.showgamemodeinfo
    showTeams = settings.showteams
    useColors = settings.usecolors
    drawSpeed = settings.drawspeed
    scoreboardScale = settings.scale
    columnFont = settings.columnfont
    contentFont = settings.contentfont
    teamHeaderFont = settings.teamfont
    serverInfoFont = settings.serverinfofont
    cScoreboardBackground = tocolor(settings.bg_color.r, settings.bg_color.g, settings.bg_color.b, settings.bg_color.a)
    cSelection = tocolor(settings.selection_color.r, settings.selection_color.g, settings.selection_color.b, settings.selection_color.a)
    cHighlight = tocolor(settings.highlight_color.r, settings.highlight_color.g, settings.highlight_color.b, settings.highlight_color.a)
    cHeader = tocolor(settings.header_color.r, settings.header_color.g, settings.header_color.b, settings.header_color.a)
    cTeam = tocolor(settings.team_color.r, settings.team_color.g, settings.team_color.b, settings.team_color.a)
    cBorder = tocolor(settings.border_color.r, settings.border_color.g, settings.border_color.b, settings.border_color.a)
    cServerInfo = tocolor(settings.serverinfo_color.r, settings.serverinfo_color.g, settings.serverinfo_color.b, settings.serverinfo_color.a)
    cContent = tocolor(settings.content_color.r, settings.content_color.g, settings.content_color.b, settings.content_color.a)
end

createScoreboardSettingsWindow = function(arg1, arg2)
    if not windowSettings then
        windowSettings = guiCreateWindow(arg1, arg2, 323, 350, "Настройки", false)
        guiSetText(windowSettings, "Настройки")
        guiWindowSetSizable(windowSettings, false)
        labelUseAnimation = guiCreateLabel(10, 26, 64, 15, "Анимация:", false, windowSettings)
        guiSetFont(labelUseAnimation, "default-small")
        checkAnimationYes = guiCreateCheckBox(101, 26, 94, 14, "вкл.", false, false, windowSettings)
        checkAnimationNo = guiCreateCheckBox(197, 26, 94, 14, "выкл.", false, false, windowSettings)
        labelMode = guiCreateLabel(10, 43, 64, 15, "Режим:", false, windowSettings)
        guiSetFont(labelMode, "default-small")
        checkModeHolding = guiCreateCheckBox(101, 43, 94, 14, "удерживать", false, false, windowSettings)
        checkModeToggled = guiCreateCheckBox(197, 43, 94, 14, "переключать", false, false, windowSettings)
        labelShowInfoOf = guiCreateLabel(10, 60, 64, 15, "Информация:", false, windowSettings)
        guiSetFont(labelShowInfoOf, "default-small")
        checkServerInfoServer = guiCreateCheckBox(101, 60, 64, 14, "сервер", false, false, windowSettings)
        checkServerInfoGamemode = guiCreateCheckBox(197, 60, 84, 14, "режим", false, false, windowSettings)
        labelShowTeams = guiCreateLabel(10, 77, 64, 15, "Команды:", false, windowSettings)
        guiSetFont(labelShowTeams, "default-small")
        checkShowTeamsYes = guiCreateCheckBox(101, 77, 64, 14, "вкл.", false, false, windowSettings)
        checkShowTeamsNo = guiCreateCheckBox(197, 77, 84, 14, "выкл.", false, false, windowSettings)
        labelUseColors = guiCreateLabel(10, 94, 64, 15, "Исп. цвета:", false, windowSettings)
        guiSetFont(labelUseColors, "default-small")
        checkUseColorsYes = guiCreateCheckBox(101, 94, 64, 14, "да", false, false, windowSettings)
        checkUseColorsNo = guiCreateCheckBox(197, 94, 84, 14, "нет", false, false, windowSettings)
        labelDrawSpeed = guiCreateLabel(10, 111, 94, 15, "Скорость отрисовки:", false, windowSettings)
        guiSetFont(labelDrawSpeed, "default-small")
        scrollDrawSpeed = guiCreateScrollBar(101, 111, 172, 14, true, false, windowSettings)
        labelScale = guiCreateLabel(10, 128, 64, 15, "Масштаб:", false, windowSettings)
        guiSetFont(labelScale, "default-small")
        scrollScale = guiCreateScrollBar(101, 128, 172, 14, true, false, windowSettings)
        labelFonts = guiCreateLabel(10, 145, 64, 15, "Шрифты:", false, windowSettings)
        guiSetFont(labelFonts, "default-small")
        buttonColumnFont = guiCreateButton(101, 145, 87, 14, " ", false, windowSettings)
        buttonContentFont = guiCreateButton(187, 145, 87, 14, " ", false, windowSettings)
        buttonTeamFont = guiCreateButton(101, 162, 87, 14, " ", false, windowSettings)
        buttonServerInfoFont = guiCreateButton(187, 162, 87, 14, " ", false, windowSettings)
        labelBackgroundColor = guiCreateLabel(10, 179, 74, 12, "Цвет фона:", false, windowSettings)
        guiSetFont(labelBackgroundColor, "default-small")
        buttonChangeBackgroundColor = guiCreateButton(187, 179, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeBackgroundColor, "default-bold-small")
        labelSelectionColor = guiCreateLabel(10, 196, 74, 12, "Текущий игрок:", false, windowSettings)
        guiSetFont(labelSelectionColor, "default-small")
        buttonChangeSelectionColor = guiCreateButton(187, 196, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeSelectionColor, "default-bold-small")
        labelHighlightColor = guiCreateLabel(10, 213, 87, 12, "Выбранный ряд:", false, windowSettings)
        guiSetFont(labelHighlightColor, "default-small")
        buttonChangeHighlightColor = guiCreateButton(187, 213, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeHighlightColor, "default-bold-small")
        labelColumnHeaderColor = guiCreateLabel(10, 230, 87, 12, "Название столбца:", false, windowSettings)
        guiSetFont(labelColumnHeaderColor, "default-small")
        buttonChangeColumnHeaderColor = guiCreateButton(187, 230, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeColumnHeaderColor, "default-bold-small")
        labelTeamHeaderColor = guiCreateLabel(10, 247, 85, 12, "Название команды:", false, windowSettings)
        guiSetFont(labelTeamHeaderColor, "default-small")
        buttonChangeTeamHeaderColor = guiCreateButton(187, 247, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeTeamHeaderColor, "default-bold-small")
        labelBorderlineColor = guiCreateLabel(10, 264, 86, 12, "Цвет границы:", false, windowSettings)
        guiSetFont(labelBorderlineColor, "default-small")
        buttonChangeBorderlineColor = guiCreateButton(187, 264, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeBorderlineColor, "default-bold-small")
        labelServerInfoColor = guiCreateLabel(10, 281, 86, 12, "Цвет информации:", false, windowSettings)
        guiSetFont(labelServerInfoColor, "default-small")
        buttonChangeServerInfoColor = guiCreateButton(187, 281, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeServerInfoColor, "default-bold-small")
        labelContentColor = guiCreateLabel(10, 298, 86, 12, "Цвет содержимого:", false, windowSettings)
        guiSetFont(labelContentColor, "default-small")
        buttonChangeContentColor = guiCreateButton(187, 298, 87, 14, "Изменить", false, windowSettings)
        guiSetFont(buttonChangeContentColor, "default-bold-small")
        buttonSaveChanges = guiCreateButton(10, 322, 80, 15, "Сохранить", false, windowSettings)
        guiSetFont(buttonSaveChanges, "default-small")
        buttonRestoreDefaults = guiCreateButton(95, 322, 80, 15, "По умолчанию", false, windowSettings)
        guiSetFont(buttonRestoreDefaults, "default-small")
        buttonCancel = guiCreateButton(200, 322, 120, 15, "Отмена", false, windowSettings)
        guiSetFont(buttonCancel, "default-small")
    end
    if type(settings.useanimation) == "boolean" then
        if not settings.useanimation then
            guiCheckBoxSetSelected(checkAnimationNo, true)
            guiCheckBoxSetSelected(checkAnimationYes, false)
        end
    end
    guiCheckBoxSetSelected(checkAnimationNo, false)
    guiCheckBoxSetSelected(checkAnimationYes, true)
    if type(settings.toggleable) == "boolean" then
        if settings.toggleable then
            guiCheckBoxSetSelected(checkModeToggled, true)
            guiCheckBoxSetSelected(checkModeHolding, false)
        end
    end
    guiCheckBoxSetSelected(checkModeToggled, false)
    guiCheckBoxSetSelected(checkModeHolding, true)
    if type(settings.showteams) == "boolean" then
        if not settings.showteams then
            guiCheckBoxSetSelected(checkShowTeamsNo, true)
            guiCheckBoxSetSelected(checkShowTeamsYes, false)
        end
    end
    guiCheckBoxSetSelected(checkShowTeamsNo, false)
    guiCheckBoxSetSelected(checkShowTeamsYes, true)
    if type(settings.usecolors) == "boolean" then
        if not settings.usecolors then
            guiCheckBoxSetSelected(checkUseColorsNo, true)
            guiCheckBoxSetSelected(checkUseColorsYes, false)
        end
    end
    guiCheckBoxSetSelected(checkUseColorsNo, false)
    guiCheckBoxSetSelected(checkUseColorsYes, true)
    guiCheckBoxSetSelected(checkServerInfoServer, (settings.showserverinfo or defaultSettings.showserverinfo))
    guiCheckBoxSetSelected(checkServerInfoGamemode, (settings.showgamemodeinfo or defaultSettings.showgamemodeinfo))
    guiScrollBarSetScrollPosition(scrollDrawSpeed, ((settings.drawspeed or defaultSettings.drawspeed) - MIN_DRAWSPEED) / (MAX_DRAWSPEED - MIN_DRAWSPEED) * 100)
    guiScrollBarSetScrollPosition(scrollScale, ((settings.scale or defaultSettings.scale) - MIN_SCALE) / (MAX_SCALE - MIN_SCALE) * 100)
    for k, v in ipairs(fontNames) do
        if settings.columnfont == v then
            fontIndexes.column = k
        end
        if settings.contentfont == v then
            fontIndexes.content = k
        end
        if settings.teamfont == v then
            fontIndexes.team = k
        end
        if settings.serverinfofont == v then
            fontIndexes.serverinfo = k
        end
    end
    tempColors.bg_color.r = (settings.bg_color.r or defaultSettings.bg_color.r)
    tempColors.bg_color.g = (settings.bg_color.g or defaultSettings.bg_color.g)
    tempColors.bg_color.b = (settings.bg_color.b or defaultSettings.bg_color.b)
    tempColors.bg_color.a = (settings.bg_color.a or defaultSettings.bg_color.a)
    tempColors.selection_color.r = (settings.selection_color.r or defaultSettings.selection_color.r)
    tempColors.selection_color.g = (settings.selection_color.g or defaultSettings.selection_color.g)
    tempColors.selection_color.b = (settings.selection_color.b or defaultSettings.selection_color.b)
    tempColors.selection_color.a = (settings.selection_color.a or defaultSettings.selection_color.a)
    tempColors.highlight_color.r = (settings.highlight_color.r or defaultSettings.highlight_color.r)
    tempColors.highlight_color.g = (settings.highlight_color.g or defaultSettings.highlight_color.g)
    tempColors.highlight_color.b = (settings.highlight_color.b or defaultSettings.highlight_color.b)
    tempColors.highlight_color.a = (settings.highlight_color.a or defaultSettings.highlight_color.a)
    tempColors.header_color.r = (settings.header_color.r or defaultSettings.header_color.r)
    tempColors.header_color.g = (settings.header_color.g or defaultSettings.header_color.g)
    tempColors.header_color.b = (settings.header_color.b or defaultSettings.header_color.b)
    tempColors.header_color.a = (settings.header_color.a or defaultSettings.header_color.a)
    tempColors.team_color.r = (settings.team_color.r or defaultSettings.team_color.r)
    tempColors.team_color.g = (settings.team_color.g or defaultSettings.team_color.g)
    tempColors.team_color.b = (settings.team_color.b or defaultSettings.team_color.b)
    tempColors.team_color.a = (settings.team_color.a or defaultSettings.team_color.a)
    tempColors.border_color.r = (settings.border_color.r or defaultSettings.border_color.r)
    tempColors.border_color.g = (settings.border_color.g or defaultSettings.border_color.g)
    tempColors.border_color.b = (settings.border_color.b or defaultSettings.border_color.b)
    tempColors.border_color.a = (settings.border_color.a or defaultSettings.border_color.a)
    tempColors.serverinfo_color.r = (settings.serverinfo_color.r or defaultSettings.serverinfo_color.r)
    tempColors.serverinfo_color.g = (settings.serverinfo_color.g or defaultSettings.serverinfo_color.g)
    tempColors.serverinfo_color.b = (settings.serverinfo_color.b or defaultSettings.serverinfo_color.b)
    tempColors.serverinfo_color.a = (settings.serverinfo_color.a or defaultSettings.serverinfo_color.a)
    tempColors.content_color.r = (settings.content_color.r or defaultSettings.content_color.r)
    tempColors.content_color.g = (settings.content_color.g or defaultSettings.content_color.g)
    tempColors.content_color.b = (settings.content_color.b or defaultSettings.content_color.b)
    tempColors.content_color.a = (settings.content_color.a or defaultSettings.content_color.a)
    addEventHandler("onClientGUIClick", windowSettings, settingsWindowClickHandler)
    addEventHandler("onClientRender", root, drawSettingsWindowColors)
end

destroyScoreboardSettingsWindow = function()
    addEventHandler("onClientGUIClick", windowSettings, settingsWindowClickHandler)
    addEventHandler("onClientRender", root, drawSettingsWindowColors)
    destroyElement(windowSettings)
    if not getKeyState("mouse2") then
        showCursor(false)
    end
    colorPicker.closeSelect()
    windowSettings = nil
end

settingsWindowClickHandler = function(arg1, arg2)
    if source == buttonSaveChanges then
        saveSettingsFromSettingsWindow()
    end
    if source == buttonRestoreDefaults then
        restoreDefaultSettings()
    end
    if source == buttonCancel then
        destroyScoreboardSettingsWindow()
    end
    if source == buttonColumnFont then
        if #fontNames < fontIndexes.column + 1 then
            fontIndexes.column = 1
        end
        fontIndexes.column = fontIndexes.column + 1
    end
    if source == buttonContentFont then
        if #fontNames < fontIndexes.content + 1 then
            fontIndexes.content = 1
        end
        fontIndexes.content = fontIndexes.content + 1
    end
    if source == buttonTeamFont then
        if #fontNames < fontIndexes.team + 1 then
            fontIndexes.team = 1
        end
        fontIndexes.team = fontIndexes.team + 1
    end
    if source == buttonServerInfoFont then
        if #fontNames < fontIndexes.serverinfo + 1 then
            fontIndexes.serverinfo = 1
        end
        fontIndexes.serverinfo = fontIndexes.serverinfo + 1
    end
    if source == buttonChangeBackgroundColor then
        colorPicker.openSelect("bg_color")
    end
    if source == buttonChangeSelectionColor then
        colorPicker.openSelect("selection_color")
    end
    if source == buttonChangeHighlightColor then
        colorPicker.openSelect("highlight_color")
    end
    if source == buttonChangeColumnHeaderColor then
        colorPicker.openSelect("header_color")
    end
    if source == buttonChangeTeamHeaderColor then
        colorPicker.openSelect("team_color")
    end
    if source == buttonChangeBorderlineColor then
        colorPicker.openSelect("border_color")
    end
    if source == buttonChangeServerInfoColor then
        colorPicker.openSelect("serverinfo_color")
    end
    if source == buttonChangeContentColor then
        colorPicker.openSelect("content_color")
    end
    if source ~= checkAnimationNo then
    end
    guiCheckBoxSetSelected(checkAnimationYes, false)
    guiCheckBoxSetSelected(checkAnimationNo, false)
    guiCheckBoxSetSelected(source, true)
    if source ~= checkModeToggled then
    end
    guiCheckBoxSetSelected(checkModeToggled, false)
    guiCheckBoxSetSelected(checkModeHolding, false)
    guiCheckBoxSetSelected(source, true)
    if source ~= checkShowTeamsNo then
    end
    guiCheckBoxSetSelected(checkShowTeamsYes, false)
    guiCheckBoxSetSelected(checkShowTeamsNo, false)
    guiCheckBoxSetSelected(source, true)
    if source ~= checkUseColorsNo then
    end
    guiCheckBoxSetSelected(checkUseColorsYes, false)
    guiCheckBoxSetSelected(checkUseColorsNo, false)
    guiCheckBoxSetSelected(source, true)
end

drawSettingsWindowColors = function()
    dxDrawText(string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)), value_1 + 280, value_2 + 111, value_1 + 280 + 33, value_2 + 111 + 16, cWhite, 1, "default", "left", "top", true, false, true)
    dxDrawText(string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)), value_1 + 280, value_2 + 128, value_1 + 280 + 33, value_2 + 128 + 16, cWhite, 1, "default", "left", "top", true, false, true)
    dxDrawText("Столбец", value_1 + 101, value_2 + 145, value_1 + 101 + 87, value_2 + 145 + 14, cWhite, fontscale(fontNames[fontIndexes.column], 1), fontNames[fontIndexes.column], "center", "center", true, false, true)
    dxDrawText("Содержимое", value_1 + 187, value_2 + 145, value_1 + 187 + 87, value_2 + 145 + 14, cWhite, fontscale(fontNames[fontIndexes.content], 1), fontNames[fontIndexes.content], "center", "center", true, false, true)
    dxDrawText("Команда", value_1 + 101, value_2 + 162, value_1 + 101 + 87, value_2 + 162 + 14, cWhite, fontscale(fontNames[fontIndexes.team], 1), fontNames[fontIndexes.team], "center", "center", true, false, true)
    dxDrawText("Информация", value_1 + 187, value_2 + 162, value_1 + 187 + 87, value_2 + 162 + 14, cWhite, fontscale(fontNames[fontIndexes.serverinfo], 1), fontNames[fontIndexes.serverinfo], "center", "center", true, false, true)
    if tempColors.bg_color.r then
        if tempColors.bg_color.g then
            if tempColors.bg_color.b then
                if tempColors.bg_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 179, 84, 16, tocolor(tempColors.bg_color.r, tempColors.bg_color.g, tempColors.bg_color.b, tempColors.bg_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if tempColors.selection_color.r then
        if tempColors.selection_color.g then
            if tempColors.selection_color.b then
                if tempColors.selection_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 196, 84, 16, tocolor(tempColors.selection_color.r, tempColors.selection_color.g, tempColors.selection_color.b, tempColors.selection_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if tempColors.highlight_color.r then
        if tempColors.highlight_color.g then
            if tempColors.highlight_color.b then
                if tempColors.highlight_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 213, 84, 16, tocolor(tempColors.highlight_color.r, tempColors.highlight_color.g, tempColors.highlight_color.b, tempColors.highlight_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if tempColors.header_color.r then
        if tempColors.header_color.g then
            if tempColors.header_color.b then
                if tempColors.header_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 230, 84, 16, tocolor(tempColors.header_color.r, tempColors.header_color.g, tempColors.header_color.b, tempColors.header_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if tempColors.team_color.r then
        if tempColors.team_color.g then
            if tempColors.team_color.b then
                if tempColors.team_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 247, 84, 16, tocolor(tempColors.team_color.r, tempColors.team_color.g, tempColors.team_color.b, tempColors.team_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if tempColors.border_color.r then
        if tempColors.border_color.g then
            if tempColors.border_color.b then
                if tempColors.border_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 264, 84, 16, tocolor(tempColors.border_color.r, tempColors.border_color.g, tempColors.border_color.b, tempColors.border_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if tempColors.serverinfo_color.r then
        if tempColors.serverinfo_color.g then
            if tempColors.serverinfo_color.b then
                if tempColors.serverinfo_color.a then
                    dxDrawRectangle(value_1 + 101, value_2 + 281, 84, 16, tocolor(tempColors.serverinfo_color.r, tempColors.serverinfo_color.g, tempColors.serverinfo_color.b, tempColors.serverinfo_color.a), true)
                    local value_1, value_2 = guiGetPosition(windowSettings, false)
                end
                local value_1, value_2 = guiGetPosition(windowSettings, false)
            end
            local value_1, value_2 = guiGetPosition(windowSettings, false)
        end
        local value_1, value_2 = guiGetPosition(windowSettings, false)
    end
    if not tempColors.content_color.r then
        return
    end
    if not tempColors.content_color.g then
        return
    end
    if not tempColors.content_color.b then
        return
    end
    if not tempColors.content_color.a then
        return
    end
    dxDrawRectangle(value_1 + 101, value_2 + 298, 84, 16, tocolor(tempColors.content_color.r, tempColors.content_color.g, tempColors.content_color.b, tempColors.content_color.a), true)
end

saveSettingsFromSettingsWindow = function()
    if not tempColors.bg_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.bg_color.r = tempColors.bg_color.r
    if not tempColors.bg_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.bg_color.g = tempColors.bg_color.g
    if not tempColors.bg_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.bg_color.b = tempColors.bg_color.b
    if not tempColors.bg_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.bg_color.a = tempColors.bg_color.a
    if not tempColors.selection_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.selection_color.r = tempColors.selection_color.r
    if not tempColors.selection_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.selection_color.g = tempColors.selection_color.g
    if not tempColors.selection_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.selection_color.b = tempColors.selection_color.b
    if not tempColors.selection_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.selection_color.a = tempColors.selection_color.a
    if not tempColors.highlight_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.highlight_color.r = tempColors.highlight_color.r
    if not tempColors.highlight_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.highlight_color.g = tempColors.highlight_color.g
    if not tempColors.highlight_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.highlight_color.b = tempColors.highlight_color.b
    if not tempColors.highlight_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.highlight_color.a = tempColors.highlight_color.a
    if not tempColors.header_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.header_color.r = tempColors.header_color.r
    if not tempColors.header_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.header_color.g = tempColors.header_color.g
    if not tempColors.header_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.header_color.b = tempColors.header_color.b
    if not tempColors.header_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.header_color.a = tempColors.header_color.a
    if not tempColors.team_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.team_color.r = tempColors.team_color.r
    if not tempColors.team_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.team_color.g = tempColors.team_color.g
    if not tempColors.team_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.team_color.b = tempColors.team_color.b
    if not tempColors.team_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.team_color.a = tempColors.team_color.a
    if not tempColors.border_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.border_color.r = tempColors.border_color.r
    if not tempColors.border_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.border_color.g = tempColors.border_color.g
    if not tempColors.border_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.border_color.b = tempColors.border_color.b
    if not tempColors.border_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.border_color.a = tempColors.border_color.a
    if not tempColors.serverinfo_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.serverinfo_color.r = tempColors.serverinfo_color.r
    if not tempColors.serverinfo_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.serverinfo_color.g = tempColors.serverinfo_color.g
    if not tempColors.serverinfo_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.serverinfo_color.b = tempColors.serverinfo_color.b
    if not tempColors.serverinfo_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.serverinfo_color.a = tempColors.serverinfo_color.a
    if not tempColors.content_color.r then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.content_color.r = tempColors.content_color.r
    if not tempColors.content_color.g then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.content_color.g = tempColors.content_color.g
    if not tempColors.content_color.b then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.content_color.b = tempColors.content_color.b
    if not tempColors.content_color.a then
        local var = {
            useanimation = nil,
            toggleable = nil,
            showserverinfo = nil,
            showgamemodeinfo = nil,
            showteams = nil,
            usecolors = nil,
            drawspeed = nil,
            scale = nil,
            columnfont = nil,
            contentfont = nil,
            teamfont = nil,
            serverinfofont = nil,
            bg_color = {},
            selection_color = {},
            highlight_color = {},
            header_color = {},
            team_color = {},
            border_color = {},
            serverinfo_color = {},
            content_color = {},
            useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
            toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
            showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
            usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
            showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
            showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
            drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
            drawspeed = tonumber(nil.drawspeed),
            scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
            scale = tonumber(nil.scale),
            columnfont = fontNames[fontIndexes.column],
            contentfont = fontNames[fontIndexes.content],
            teamfont = fontNames[fontIndexes.team],
            serverinfofont = fontNames[fontIndexes.serverinfo],
        }
    end
    nil.content_color.a = tempColors.content_color.a
    local var = {
        useanimation = nil,
        toggleable = nil,
        showserverinfo = nil,
        showgamemodeinfo = nil,
        showteams = nil,
        usecolors = nil,
        drawspeed = nil,
        scale = nil,
        columnfont = nil,
        contentfont = nil,
        teamfont = nil,
        serverinfofont = nil,
        bg_color = {},
        selection_color = {},
        highlight_color = {},
        header_color = {},
        team_color = {},
        border_color = {},
        serverinfo_color = {},
        content_color = {},
        useanimation = iif(guiCheckBoxGetSelected(checkAnimationNo), false, true),
        toggleable = iif(guiCheckBoxGetSelected(checkModeToggled), true, false),
        showteams = iif(guiCheckBoxGetSelected(checkShowTeamsNo), false, true),
        usecolors = iif(guiCheckBoxGetSelected(checkUseColorsNo), false, true),
        showserverinfo = guiCheckBoxGetSelected(checkServerInfoServer),
        showgamemodeinfo = guiCheckBoxGetSelected(checkServerInfoGamemode),
        drawspeed = string.format("%.2f", MIN_DRAWSPEED + guiScrollBarGetScrollPosition(scrollDrawSpeed) / 100 * (MAX_DRAWSPEED - MIN_DRAWSPEED)),
        drawspeed = tonumber(nil.drawspeed),
        scale = string.format("%.2f", MIN_SCALE + guiScrollBarGetScrollPosition(scrollScale) / 100 * (MAX_SCALE - MIN_SCALE)),
        scale = tonumber(nil.scale),
        columnfont = fontNames[fontIndexes.column],
        contentfont = fontNames[fontIndexes.content],
        teamfont = fontNames[fontIndexes.team],
        serverinfofont = fontNames[fontIndexes.serverinfo],
    }
    saveSettings(var)
end

restoreDefaultSettings = function()
    saveSettings(defaultSettings)
end

saveSettings = function(self)
    if not xmlLoadFile("settings.xml") then
        if not xmlCreateFile("settings.xml", "settings") then
            return false
        end
        local var = xmlCreateFile("settings.xml", "settings")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlCreateChild(xmlLoadFile("settings.xml"), "useanimation")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlCreateChild(xmlLoadFile("settings.xml"), "toggleable")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlCreateChild(xmlLoadFile("settings.xml"), "showserverinfo")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlCreateChild(xmlLoadFile("settings.xml"), "showgamemodeinfo")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlCreateChild(xmlLoadFile("settings.xml"), "showteams")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlCreateChild(xmlLoadFile("settings.xml"), "usecolors")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlCreateChild(xmlLoadFile("settings.xml"), "drawspeed")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlCreateChild(xmlLoadFile("settings.xml"), "scale")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlCreateChild(xmlLoadFile("settings.xml"), "columnfont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlCreateChild(xmlLoadFile("settings.xml"), "contentfont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlCreateChild(xmlLoadFile("settings.xml"), "teamfont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfofont")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlCreateChild(xmlLoadFile("settings.xml"), "bg_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlCreateChild(xmlLoadFile("settings.xml"), "selection_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_15 = xmlCreateChild(xmlLoadFile("settings.xml"), "highlight_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_16 = xmlCreateChild(xmlLoadFile("settings.xml"), "header_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_17 = xmlCreateChild(xmlLoadFile("settings.xml"), "team_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_18 = xmlCreateChild(xmlLoadFile("settings.xml"), "border_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_18 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_19 = xmlCreateChild(xmlLoadFile("settings.xml"), "serverinfo_color")
    end
    if not xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0) then
        local var = xmlLoadFile("settings.xml")
        local var_1 = xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0)
        local var_2 = xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0)
        local lockClient = xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0)
        local tripClient = xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0)
        local var_5 = xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0)
        local var_6 = xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0)
        local var_7 = xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0)
        local var_8 = xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0)
        local var_9 = xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0)
        local var_10 = xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0)
        local var_11 = xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0)
        local var_12 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0)
        local var_13 = xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0)
        local var_14 = xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0)
        local var_15 = xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0)
        local var_16 = xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0)
        local var_17 = xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0)
        local var_18 = xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0)
        local var_19 = xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0)
        local var_20 = xmlCreateChild(xmlLoadFile("settings.xml"), "content_color")
    end
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "useanimation", 0), tostring(self.useanimation))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "toggleable", 0), tostring(self.toggleable))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "showserverinfo", 0), tostring(self.showserverinfo))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "showgamemodeinfo", 0), tostring(self.showgamemodeinfo))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "showteams", 0), tostring(self.showteams))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "usecolors", 0), tostring(self.usecolors))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "drawspeed", 0), tostring(self.drawspeed))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "scale", 0), tostring(self.scale))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "columnfont", 0), tostring(self.columnfont))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "contentfont", 0), tostring(self.contentfont))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "teamfont", 0), tostring(self.teamfont))
    xmlNodeSetValue(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfofont", 0), tostring(self.serverinfofont))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "r", tostring(self.bg_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "g", tostring(self.bg_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "b", tostring(self.bg_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "bg_color", 0), "a", tostring(self.bg_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "r", tostring(self.selection_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "g", tostring(self.selection_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "b", tostring(self.selection_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "selection_color", 0), "a", tostring(self.selection_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "r", tostring(self.highlight_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "g", tostring(self.highlight_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "b", tostring(self.highlight_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "highlight_color", 0), "a", tostring(self.highlight_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "r", tostring(self.header_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "g", tostring(self.header_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "b", tostring(self.header_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "header_color", 0), "a", tostring(self.header_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "r", tostring(self.team_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "g", tostring(self.team_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "b", tostring(self.team_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "team_color", 0), "a", tostring(self.team_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "r", tostring(self.border_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "g", tostring(self.border_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "b", tostring(self.border_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "border_color", 0), "a", tostring(self.border_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "r", tostring(self.serverinfo_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "g", tostring(self.serverinfo_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "b", tostring(self.serverinfo_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "serverinfo_color", 0), "a", tostring(self.serverinfo_color.a))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "r", tostring(self.content_color.r))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "g", tostring(self.content_color.g))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "b", tostring(self.content_color.b))
    xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("settings.xml"), "content_color", 0), "a", tostring(self.content_color.a))
    xmlSaveFile(xmlLoadFile("settings.xml"))
    xmlUnloadFile(xmlLoadFile("settings.xml"))
    destroyScoreboardSettingsWindow()
    readScoreboardSettings()
end

validateRange = function(arg1)
    if type(arg1) == "number" then
        if 0 <= arg1 then
        end
        if true then
            return arg1
        end
    end
    return false
end

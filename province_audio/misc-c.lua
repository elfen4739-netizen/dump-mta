-- ByteRevenant
-- LuaQ 5.1 structured decompile

local state = nil

local function var()
end

local state_1 = nil
local var_2 = getTickCount()
local lockClient = {
    { 792.64999999999998, 806.64400000000001, 599.5 },
    { 792.64999999999998, 804.84900000000005, 599.5 },
    { 792.64999999999998, 801.83699999999999, 599.5 },
    { 792.64999999999998, 799.93799999999999, 599.5 },
    { 792.64999999999998, 796.99099999999999, 599.5 },
}
local state_4 = nil
local state_5 = nil

local function var_6()
    if value_1 == 8 and value_2 == 30 then
        if not state then
            state = FMOD_playEvent("ChurchPrivoljsk")
            if state then
                setElementPosition(state, 1879.847, 2291.9459999999999, 32)
                addEventHandler("onClientElementDestroy", state, var)
                local value_1, value_2 = getTime()
            end
            local value_1, value_2 = getTime()
        end
        local value_1, value_2 = getTime()
    end
    if getElementInterior(localPlayer) == 0 then
        if state_1(localPlayer, -1852.2639999999999, 2204.1260000000002, -1703.8430000000001, 2398.567) and value_5 < 0.75 then
            cave = FMOD_playEvent("Cave1")
            local value_1, value_2 = getTime()
            local var = getElementInterior(localPlayer)
            local var_6 = getElementDimension(localPlayer)
        end
        local value_1, value_2 = getTime()
        local var = getElementInterior(localPlayer)
        local var_6 = getElementDimension(localPlayer)
    end
    if cave then
        FMOD_stopEvent(cave)
        cave = nil
        local value_1, value_2 = getTime()
        local var = getElementInterior(localPlayer)
        local var_6 = getElementDimension(localPlayer)
    end
    if getElementInterior(localPlayer) == 4 then
        if state_1(localPlayer, 787.50599999999997, 791.56899999999996, 812.65999999999997, 808.43600000000004) then
            magnit = FMOD_playEvent("Magnit")
            setElementDimension(magnit, getElementDimension(localPlayer))
            fr1 = FMOD_playEvent("FridgeVitrina")
            setElementPosition(fr1, 811.49699999999996, 797.74099999999999, 600)
            setElementDimension(fr1, getElementDimension(localPlayer))
            fr2 = FMOD_playEvent("FridgeVitrina")
            setElementPosition(fr2, 811.49699999999996, 801.601, 600)
            setElementDimension(fr2, getElementDimension(localPlayer))
            fr3 = FMOD_playEvent("FridgeContainer")
            setElementPosition(fr3, 806.125, 801.79999999999995, 598)
            setElementDimension(fr3, getElementDimension(localPlayer))
            fr4 = FMOD_playEvent("FridgeContainer")
            setElementPosition(fr4, 801.68299999999999, 801.79999999999995, 598)
            setElementDimension(fr4, getElementDimension(localPlayer))
            local value_1, value_2 = getTime()
            local var = getElementInterior(localPlayer)
            local var_6 = getElementDimension(localPlayer)
            local var_7 = getElementDimension(localPlayer)
            local var_8 = 801.79999999999995
            local var_9 = 598
            local var_10 = 808.43600000000004
        end
        local value_1, value_2 = getTime()
        local var = getElementInterior(localPlayer)
        local var_6 = getElementDimension(localPlayer)
        local var_7 = 787.50599999999997
        local var_8 = 791.56899999999996
        local var_9 = 812.65999999999997
        local var_10 = 808.43600000000004
    end
    if magnit then
        FMOD_stopEvent(magnit)
        FMOD_stopEvent(fr1)
        FMOD_stopEvent(fr2)
        FMOD_stopEvent(fr3)
        FMOD_stopEvent(fr4)
        magnit = nil
        local value_1, value_2 = getTime()
        local var = getElementInterior(localPlayer)
        local var_6 = getElementDimension(localPlayer)
    end
    if magnit then
        if 1500 < getTickCount() - var_2 then
            math.randomseed(getTickCount())
            setElementPosition(FMOD_playEvent("Kassa" .. math.random(2)), unpack(lockClient[math.random(table.getn(lockClient))]))
            setElementDimension(FMOD_playEvent("Kassa" .. math.random(2)), getElementDimension(localPlayer))
            var_2 = getTickCount() + math.random(1250)
            local value_1, value_2 = getTime()
            local var = getElementInterior(localPlayer)
        end
        local value_1, value_2 = getTime()
        local var = getElementInterior(localPlayer)
    end
    if not house1 and getElementInterior(localPlayer) == 5 then
        house1 = FMOD_playEvent("WallClock1")
        setElementPosition(house1, -297, -498.01600000000002, 600.5)
        house1_sink = FMOD_playEvent("WaterSink")
        setElementPosition(house1_sink, -298.62200000000001, -494.19999999999999, 600.20000000000005)
        local value_1, value_2 = getTime()
        local var = getElementInterior(localPlayer)
    end
    if not house1 then
        return
    end
    if getElementInterior(localPlayer) == 5 then
        return
    end
    FMOD_stopEvent(house1)
    FMOD_stopEvent(house1_sink)
    house1 = nil
end

playBetaSounds = function()
    FMOD_playEvent3D("Peregovory", -631.875, 634.66399999999999, 28)
    FMOD_playEvent3D("Peregovory", -837.50699999999995, 592.32000000000005, 28)
    FMOD_playEvent3D("Peregovory", -1033.9369999999999, 636.85799999999995, -0.69699999999999995)
    state_4 = FMOD_playEvent3D("Building", 1939.7239999999999, 2386.7849999999999, 21.992000000000001)
    state_5 = FMOD_playEvent3D("Building", 2058.3649999999998, 2416.9099999999999, 30.405999999999999)
    FMOD_playEvent3D("LarekFridge", 2648.5, 2283.5999999999999, 13.765000000000001)
    setTimer(var_6, 1000, 0)
end

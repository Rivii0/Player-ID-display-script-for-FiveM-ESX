local showIDs = false
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)

RegisterCommand('toggleIDs', function()
    showIDs = not showIDs
    while showIDs do
        local players = GetActivePlayers()
        for _, playerId in ipairs(players) do
            local targetPed = GetPlayerPed(playerId)
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)

            if distance < 50.0 then
                local targetId = GetPlayerServerId(playerId)
                DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, tostring(targetId))

                if playerId ~= PlayerId() then
                    DrawMarker(1, targetCoords.x, targetCoords.y, targetCoords.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 255, 0, 0, 200, false, false, 2, nil, nil, false)
                end
            end
        end
        Wait(0)
    end
end, false)

RegisterKeyMapping('toggleIDs', 'Show Player IDs', 'keyboard', 'z')

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local scale = 0.35

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

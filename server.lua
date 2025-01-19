ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('logPlayerAction')
AddEventHandler('logPlayerAction', function(playerId, action)
    print(('[Player ID %d] %s'):format(playerId, action))
end)

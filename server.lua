ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('logPlayerAction')
AddEventHandler('logPlayerAction', function(playerId, action)
    print(('[Player ID %d] %s'):format(playerId, action))
end)

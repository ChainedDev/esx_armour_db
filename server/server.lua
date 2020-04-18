
AddEventHandler('esx:playerLoaded', function(source)
        
    local identifier = GetPlayerIdentifiers(source)[1]
        
    MySQL.Async.fetchScalar("SELECT armour FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = identifier
    }, function(data)
        if (data ~= nil) then
            TriggerClientEvent('LRP-Armour:Client:SetPlayerArmour', playerId, data)
        end
    end)
        
end)

RegisterServerEvent('LRP-Armour:Server:RefreshCurrentArmour')
AddEventHandler('LRP-Armour:Server:RefreshCurrentArmour', function(updateArmour)
    
    local identifier = GetPlayerIdentifiers(source)[1]
        
    MySQL.Async.execute("UPDATE users SET armour = @armour WHERE identifier = @identifier", { 
        ['@identifier'] = identifier,
        ['@armour'] = tonumber(updateArmour)
    })
end)


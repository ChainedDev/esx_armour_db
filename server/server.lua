
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
    local src = source
    if (updateArmour ~= nil) and (type(updateArmour) == 'number') and (updateArmour <= 200) then
        local identifier = GetPlayerIdentifiers(src)[1]

        MySQL.Async.execute("UPDATE users SET armour = @armour WHERE identifier = @identifier", { 
           ['@identifier'] = identifier,
           ['@armour'] = tonumber(updateArmour)
        })
    else
        exports.clrp_base.banCheater(src, 'armour injection')
    end
end)


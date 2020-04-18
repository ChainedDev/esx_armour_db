local playerLoaded = false

RegisterNetEvent('LRP-Armour:Client:SetPlayerArmour')
AddEventHandler('LRP-Armour:Client:SetPlayerArmour', function(armour)
    Citizen.Wait(10000)  -- Give ESX time to load their stuff. Because some how ESX remove the armour when load the ped.
    SetPedArmour(PlayerPedId(), tonumber(armour))
    playerLoaded = true
end)


Citizen.CreateThread(function()
       
    local armor = 0
    
    while not playerLoaded do
        Wait(1)
    end
        
    while true do
        Citizen.Wait(0)
            
        armor = GetPedArmour(PlayerPedId())
        if armor <= 200 then
            TriggerServerEvent('LRP-Armour:Server:RefreshCurrentArmour', armor)
        end
        Citizen.Wait(60000)
                
    end
end)

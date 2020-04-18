local playerLoaded = false

RegisterNetEvent('LRP-Armour:Client:SetPlayerArmour')
AddEventHandler('LRP-Armour:Client:SetPlayerArmour', function(armour)
    Citizen.Wait(10000)  -- Give ESX time to load their stuff. Because some how ESX remove the armour when load the ped.
    SetPedArmour(PlayerPedId(), tonumber(armour))
    playerLoaded = true
end)

local TimeFreshCurrentArmour = 60000  -- 60 seconds

local armor = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            
        if playerLoaded then
            armor = GetPedArmour(PlayerPedId()
            if armor <= 200 then
                TriggerServerEvent('LRP-Armour:Server:RefreshCurrentArmour', armor)
            end
            Citizen.Wait(TimeFreshCurrentArmour)
        else
            Citizen.Wait(500)
        end
                
    end
end)

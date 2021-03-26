ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local data = {}
local items = {'bandage', 'bulletproof', 'phone', 'fixkit', 'coins', 'cannabis', 'coke', 'orangen'}

item1 = (items[math.random(#items)])
item2 = (items[math.random(#items)])
item3 = (items[math.random(#items)])

RegisterServerEvent('holEquipment')
AddEventHandler('holEquipment', function()
    if data[GetPlayerIdentifier(source, 1)] == nil then
        data[GetPlayerIdentifier(source, 1)] = 1
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(item1, 1)  
        xPlayer.addInventoryItem(item2, 1)
        xPlayer.addInventoryItem(item3, 1)
        xPlayer.addMoney(3000)
        TriggerClientEvent('notifications', source, "#8a2be2", "INFORMAION", "Du hast deine Tägliche Belohnung abgeholt.")
    else
        TriggerClientEvent('notifications', source, "#8a2be2", "INFORMAION", "Du kannst erst nach der nächsten Sonnenwende deine Belohnung abholen.")
    end
end)

RegisterNetEvent("ali_dailyreward:deny")
AddEventHandler("ali_dailyreward:deny", function(data)
    TriggerClientEvent('notifications', source, "#8a2be2", "INFORMAION", "Du hast deine Tägliche Belohnung abgelehnt.")
end)
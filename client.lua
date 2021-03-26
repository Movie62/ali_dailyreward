ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
    end
end)


Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords  = GetEntityCoords(GetPlayerPed(-1))
		if(GetDistanceBetweenCoords(coords, -429.04, 1110.75, 327.6907, 331, true) < 2) then
			isInMarker2  = true
		else
			isInMarker2 = false
		end
		if isInMarker2 then                    
            ESX.ShowHelpNotification("Drücke E um deine Tägliche Belohnung abzuholen.")
            if IsControlPressed(0, 38) then
				TriggerEvent('ali_dailyreward:show')
				Wait(1000)
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		DrawMarker(1, -429.04, 1110.75, 326.6907, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 140, 0, 255, false, true, 2, false, false, false, false)
	end
end)

-----------------------------------------------------------------------------------------------------------------

RegisterNetEvent('ali_dailyreward:show')
AddEventHandler('ali_dailyreward:show', function(title)
    SendNUIMessage({
        title = title,
    })

    SetNuiFocus(true, true)
end)

RegisterNUICallback('exit', function(data)
   SetNuiFocus(false, false)
   TriggerServerEvent("ali_dailyreward:deny")
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)


RegisterNUICallback('join', function(data, cb)
   TriggerServerEvent('holEquipment')
   SetNuiFocus(false, false)
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)









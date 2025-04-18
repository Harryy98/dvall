local function playSound()
    local playerPed = PlayerPedId()
	PlaySoundFrontend(-1,"CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET",1)
end

local function deleteUnoccupiedVehicles()
    local playerPed = PlayerPedId()
    local vehiclePool = GetGamePool("CVehicle")
    
    for _, vehicle in ipairs(vehiclePool) do
        if not IsPedInVehicle(playerPed, vehicle, false) then
            SetEntityAsMissionEntity(vehicle, true, true)
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
        end
    end
end

RegisterNetEvent("harry:deleteUnoccupiedVehicles")
AddEventHandler("harry:deleteUnoccupiedVehicles", function()
    local countdownTimes = {10, 5, 3, 1}

    Noti("You have 15 seconds to get into your vehicles. They will be deleted shortly.", 'inform')
    playSound()

    for _, time in ipairs(countdownTimes) do
        Citizen.Wait((15 - time) * 1000) 
        Noti(string.format("%d seconds left before unoccupied vehicles are deleted!", time), 'inform')
        playSound()
    end

    Citizen.Wait(1000)
    Noti("Deleting unoccupied vehicles now.", 'inform')
    playSound()
    
    deleteUnoccupiedVehicles()
    
    Noti("All unoccupied vehicles have been removed.", 'success')
    playSound()
end)

TriggerEvent("chat:addSuggestion", "/dvall", "Remove all unoccupied vehicles with a 15-second countdown.")

function Noti(text, type)
    lib.notify({
        title = 'Notification',
        description = text,
        position = "center-right",
        duration = 6000,
        type = type or 'inform'
    })
end

local cooldown = 0
local ispriority = false
local ishold = false

ESX                = nil

Citizen.CreateThread(function(src)
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerFromId()
end)

             
RegisterCommand("resetpcd", function()

        local xPlayer = ESX.GetPlayerData(src)

        if xPlayer["job"]["name"] == "police" then

        TriggerServerEvent("cancelcooldown")

        end

end,false)



RegisterNetEvent('UpdateCooldown')
AddEventHandler('UpdateCooldown', function(newCooldown)
    cooldown = newCooldown
end)

RegisterNetEvent('UpdatePriority')
AddEventHandler('UpdatePriority', function(newispriority)
    ispriority = newispriority
end)

RegisterNetEvent('UpdateHold')
AddEventHandler('UpdateHold', function(newishold)
    ishold = newishold
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ishold == true then
			DrawText2("Priority Cooldown: ~b~Priorities Are On Hold")
		elseif ispriority == false then
			DrawText2("~y~Priority Cooldown: ~r~".. cooldown .." ~w~Mins")
		elseif ispriority == true then
			DrawText2("Priority Cooldown: ~g~Priority In Progress")
		end
	end
end)

	function DrawText2(text)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.0, 0.40)
        SetTextDropshadow(1, 254, 202, 23, 255)
        SetTextEdge(1, 254, 202, 23, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(0.290, 0.963)
    end
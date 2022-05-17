local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local CurrentAction = nil
local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentActionMsg = ""
local CurrentActionCoords = nil
local CurrentActionData = {}

local garageName = {}
cachedData = {}

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject",function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
    print("[esx_96_MYX_garage] GARAGE PASADO A ESX, TODOS LOS CREDITOS A MARC DE FORAS")
    refreshBlips()

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    refreshBlips()
end)
local loadedBlips = false
function refreshBlips()
	if(loadedBlips == false)then
		loadedBlips = true
        for garage, v in pairs(Config.Garages) do
            if v["blip"] == true then
                local blip = AddBlipForCoord(v["positions"]["spawnermenu"]["pos"])

                SetBlipSprite(blip, 50)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.6)
                SetBlipColour(blip, 38)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Garaje " .. garage)
                EndTextCommandSetBlipName(blip)
            end
		end
	end
end

AddEventHandler("eden_garage:OpenGarageMenu", function(typeofmenu)
    OpenMenuGarage(typeofmenu)
end)
function OpenMenuGarage(typeofmenu)
	ESX.UI.Menu.CloseAll()

	local elements = {}
	if typeofmenu == "spawnermenu" then
		table.insert(elements, {label = "Lista de vehiculo", value = "list_vehicles"})
		table.insert(elements, {label = "Recuperar por $" .. Config.Price, value = "return_vehicle"})
	end
	if typeofmenu == "spawn" then
		table.insert(elements, {label = "Lista de vehiculo", value = "list_vehicles"})
	end

	if typeofmenu == "delete" then
		table.insert(elements, {label = "Aparcar vehiculo", value = "stock_vehicle"})
	end

	if typeofmenu == "pound" then
		table.insert(elements, {label = "Recuperar por $" .. Config.Price, value = "return_vehicle"})
	end

	ESX.UI.Menu.Open("default",GetCurrentResourceName(),"garagemenutypes",{
        title = "Garaje",
        align = "bottom-right",
        elements = elements}, 
    function(data, menu)
        if (data.current.value == "list_vehicles") then
            ListVehiclesMenu()
        elseif (data.current.value == "stock_vehicle") then
            StockVehicleMenu()
        elseif (data.current.value == "return_vehicle") then
            ReturnVehicleMenu()
        else
            menu.close()
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

RegisterCommand("addveh", function(source)
    local hasPermission = false
    local xPlayer = ESX.GetPlayerData()
    for k, v in pairs(Config.AdminsWithPeds) do
        if xPlayer.identifier == v then
            hasPermission = true 
        end
    end
    if hasPermission then
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
        local vehicleProps = GetVehicleProperties(vehicle)
        TriggerServerEvent("esx_drp_garage:addVehicleToPerson", vehicleProps)
    end
end)

function ListVehiclesMenu()
	local elements = {}
	CameraPos(garageName, true)
    ESX.TriggerServerCallback("eden_garage:getVehicles", function(vehicles)
        local vehicle1 = nil
        for _, v in pairs(vehicles) do
            if (v.type == "boat" or v.type == "helicopter") then
            else
                local hashVehicule = v.vehicle.model
                local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                local vehicleNameText = GetLabelText(vehicleName)
                local vehicleLabel = nil
                local plate = v.plate
                if (vehicleNameText == "NULL") then
                    vehicleNameText = vehicleName
                end
                if (v.state) then
                    if (v.garage ~= nil) then
                        if (garageName ~= nil and garageName == v.garage) then
                            vehicleLabel = vehicleNameText .. " (" .. plate .. "): " .. v.garage
                        end
                    else
                        vehicleLabel = vehicleNameText .. " (" .. plate .. "): Garaje"
                    end
                else
                    vehicleLabel = nil
                    vehicleLabel = vehicleNameText .. " (" .. plate .. "): En la calle"
                end
                if (vehicleLabel ~= nil) then
                    if(vehicle1 == nil)then
                        vehicle1 = v
                    end
                    table.insert(elements, {label = vehicleLabel, value = v.plate})
                end
            end
        end
        local c = 0
        for _, a in pairs(vehicles) do
            if (a.state) then
                c = c + 1
            else
                c = c - 1
            end
        end
        if(vehicle1 ~= nil)then
            SpawnLocalVehicle(vehicle1.vehicle)
        end
        ESX.UI.Menu.Open(
            "default",
            GetCurrentResourceName(),
            "spawn_vehicle",
            {
                title = "Garaje",
                align = "bottom-right",
                elements = elements
            },
            function(data, menu)
                local selectedVehicle = nil
                for _, v in pairs(vehicles) do
                    if (v.plate == data.current.value) then
                        selectedVehicle = v
                        break
                    end
                end
                if (selectedVehicle and selectedVehicle.state) then
                    menu.close()
                    CameraPos(garageName, false)
                    SpawnVehicle(selectedVehicle.vehicle, selectedVehicle.plate)
                    ESX.UI.Menu.CloseAll()
                else
                    TriggerEvent("esx:showNotification", "Tu vehículo esta en la calle")
                end
            end,
            function(data, menu)
                menu.close()
                CameraPos(garageName, false)
            end,
            function(data, menu)
                local selectedVehicle = nil
                for _, v in pairs(vehicles) do
                    if (v.plate == data.current.value) then
                        selectedVehicle = v
                        break
                    end
                end
                if (selectedVehicle and selectedVehicle.state) then
                    SpawnLocalVehicle(selectedVehicle.vehicle)
                else
                    TriggerEvent("esx:showNotification", "Tu vehículo esta en la calle")
                end
            end
        )
    end,garageName)
end

function ranger(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent("eden_garage:modifystate", vehicleProps, true, garageName)
	TriggerEvent("esx:showNotification", "Tu vehiculo esta en el garaje")
end
function StockVehicleMenu()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback("eden_garage:stockv",function(valid)
            if (valid) then
                TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                Citizen.Wait(2000)
                ranger(vehicle, vehicleProps)
            else
                TriggerEvent("esx:showNotification", "No es posible aparcar el vehiculo")
            end
        end, vehicleProps, garageName, true)
	else
		TriggerEvent("esx:showNotification", "No hay ningun vehiculo aparcado")
	end
end

GetVehicleProperties = function(vehicle)
    if DoesEntityExist(vehicle) then
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

        vehicleProps["tyres"] = {}
        vehicleProps["windows"] = {}
        vehicleProps["doors"] = {}

        for id = 1, 7 do
            local tyreId = IsVehicleTyreBurst(vehicle, id, false)
        
            if tyreId then
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = tyreId
        
                if tyreId == false then
                    tyreId = IsVehicleTyreBurst(vehicle, id, true)
                    vehicleProps["tyres"][ #vehicleProps["tyres"]] = tyreId
                end
            else
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = false
            end
        end

        for id = 1, 13 do
            local windowId = IsVehicleWindowIntact(vehicle, id)

            if windowId ~= nil then
                vehicleProps["windows"][#vehicleProps["windows"] + 1] = windowId
            else
                vehicleProps["windows"][#vehicleProps["windows"] + 1] = true
            end
        end
        
        for id = 0, 5 do
            local doorId = IsVehicleDoorDamaged(vehicle, id)
        
            if doorId then
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = doorId
            else
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = false
            end
        end

        vehicleProps["engineHealth"] = GetVehicleEngineHealth(vehicle)
        vehicleProps["bodyHealth"] = GetVehicleBodyHealth(vehicle)
        vehicleProps["fuelLevel"] = GetVehicleFuelLevel(vehicle)

        return vehicleProps
    end
end

function SpawnVehicle(vehicle, plate)
	ESX.Game.SpawnVehicle(
		vehicle.model,
		{
			x = Config.Garages[garageName]['positions']['vehiclespawner']['pos'].x,
			y = Config.Garages[garageName]['positions']['vehiclespawner']['pos'].y,
			z = Config.Garages[garageName]['positions']['vehiclespawner']['pos'].z
		},
		Config.Garages[garageName]['positions']['vehiclespawner']['h'],
		function(callback_vehicle)
            SetVehicleProperties(callback_vehicle, vehicle)
            SetVehRadioStation(callback_vehicle, "OFF")
            TaskWarpPedIntoVehicle(PlayerPedId(), callback_vehicle, -1)
            TriggerEvent("esx_lockpick:giveKey", callback_vehicle)
		end
	)

	TriggerServerEvent("eden_garage:modifystate", vehicle, false, "OUT")
end

SetVehicleProperties = function(vehicle, vehicleProps)
    ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
    SetVehicleEngineHealth(vehicle, vehicleProps["engineHealth"] and vehicleProps["engineHealth"] + 0.0 or 1000.0)
    SetVehicleBodyHealth(vehicle, vehicleProps["bodyHealth"] and vehicleProps["bodyHealth"] + 0.0 or 1000.0)
    TriggerEvent("LegacyFuel:SetFuel", vehicle, ESX.Math.Round(vehicleProps["fuelLevel"]))

    if vehicleProps["windows"] then
        for windowId = 1, 13, 1 do
            if vehicleProps["windows"][windowId] == false then
                SmashVehicleWindow(vehicle, windowId)
            end
        end
    end

    -- if vehicleProps["tyres"] then
    --     for tyreId = 1, 7, 1 do
    --         if vehicleProps["tyres"][tyreId] ~= false then
    --             SetVehicleTyreBurst(vehicle, tyreId, true, 1000)
    --         end
    --     end
    -- end

    if vehicleProps["doors"] then
        for doorId = 0, 5, 1 do
            if vehicleProps["doors"][doorId] ~= false then
                SetVehicleDoorBroken(vehicle, doorId - 1, true)
            end
        end
    end
end

function SpawnLocalVehicle(vehicle)
	local spawnpoint = Config.Garages[garageName]["positions"]["vehiclespawner"]

	WaitForModel(vehicle.model)

	if DoesEntityExist(cachedData["vehiclespawner"]) then
		DeleteEntity(cachedData["vehiclespawner"])
	end
	
	if not ESX.Game.IsSpawnPointClear(spawnpoint["pos"], 3.0) then 
		ESX.ShowNotification("Ya hay un vehículo en ese punto.")

		return
	end
	
	if not IsModelValid(vehicle.model) then
		return
	end

	ESX.Game.SpawnLocalVehicle(vehicle.model, spawnpoint["pos"], spawnpoint["h"], function(yourVehicle)
		cachedData["vehiclespawner"] = yourVehicle
        -- MYX.Game.SetVehicleProperties(yourVehicle, vehicle)
        SetVehicleProperties(yourVehicle, vehicle)
		SetModelAsNoLongerNeeded(vehicle.model)
	end)
end

function SpawnPoundedVehicle(vehicle, plate)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local allvehicles = ESX.Game.GetVehicles()
	if #allvehicles > 0 then
		for k, vehicles in ipairs(allvehicles) do
			local ingameplate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicles))
			if ingameplate == ESX.Math.Trim(plate) then
				if GetVehicleNumberOfPassengers(vehicles) == 0 and IsVehicleSeatFree(vehicles, -1) then
					ESX.Game.DeleteVehicle(vehicles)
				else
					TriggerEvent("esx:showNotification", "Tu vehículo no puede ser recuperado por la grua ahora mismo")
					return false
				end
			end
		end
	end

    SpawnVehicle(vehicle, plate)
    ESX.UI.Menu.CloseAll()
	return true
end

AddEventHandler("eden_garage:hasEnteredMarker",function(zone)
    if zone == "spawnermenu" then
        CurrentAction = "spawnermenu"
        CurrentActionMsg = "Presiona ~r~E~s~ para abrir el garaje"
        CurrentActionData = {}
    end
    if zone == "vehiclespawner" then
        CurrentAction = "delete"
        CurrentActionMsg = "Presiona ~r~E~s~ para aparcar el vehículo"
        CurrentActionData = {}
    end
end)

AddEventHandler("eden_garage:hasExitedMarker",function(zone)
    ESX.UI.Menu.CloseAll()
    CameraPos(garageName, false)
    CurrentAction = nil
end)

function ReturnVehicleMenu()
	ESX.TriggerServerCallback("eden_garage:getOutVehicles", function(vehicles)
        local elements = {}

        for _, v in pairs(vehicles) do
            local hashVehicule = v.model
            local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
            local vehicleNameText = GetLabelText(vehicleName)

            local vehicleLabel
            vehicleLabel = vehicleNameText .. ": traer con la grua"
            table.insert(elements, {label = vehicleLabel, value = v})
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(),"return_vehicle_menu",{
                title = "Garaje",
                align = "bottom-right",
                elements = elements
            },
            function(data, menu)
                ESX.TriggerServerCallback("eden_garage:checkMoney", function(hasEnoughMoney)
                    if hasEnoughMoney then
                        TriggerServerEvent('eden_garage:pay')
                        SpawnPoundedVehicle(data.current.value, data.current.value.plate)
                        menu.close()
                    else
                        ESX.ShowNotification("No tienes suficiente dinero")
                    end
                end)
            end, function(data, menu)
                menu.close()
        end)
    end)
end

Citizen.CreateThread(function()
    local close = false
    local close_to = 0 
    while true do
        Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if close then
            if #(coords - close_to) > Config.DrawDistance then
                close = false
                Citizen.Wait(350)
            end
        elseif not close then
            Citizen.Wait(350)
        end
        for garage, data in pairs(Config.Garages) do
            local m = data["positions"]["spawnermenu"]["pos"]
            if (GetDistanceBetweenCoords(coords, m.x, m.y, m.z -1, true) < Config.DrawDistance) then
                close_to = vector3(m.x, m.y, m.z)
                close = true
                DrawMarker(Config.SpawnerMenu.Marker, m.x, m.y, m.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.SpawnerMenu.Size.x, Config.SpawnerMenu.Size.y, Config.SpawnerMenu.Size.z, Config.SpawnerMenu.Color.r, Config.SpawnerMenu.Color.g, Config.SpawnerMenu.Color.b, Config.SpawnerMenu.Color.a, false, true, 2, false, false, false, false)
            end
            local v = data["positions"]["vehiclespawner"]["pos"]
            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z -1, true) < Config.DrawDistance) then
                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    close_to = vector3(v.x, v.y, v.z)
                    close = true
                    DrawMarker(Config.SpawnerPoint.Marker, v.x, v.y, v.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.SpawnerPoint.Size.x, Config.SpawnerPoint.Size.y, Config.SpawnerPoint.Size.z, Config.SpawnerPoint.Color.r, Config.SpawnerPoint.Color.g, Config.SpawnerPoint.Color.b, Config.SpawnerPoint.Color.a, false, true, 2, false, false, false, false)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local currentZone = "garaje"
    local close = false
    local close_to = 0      
    while true do
        Citizen.Wait(200)
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        
        if close then
            if #(coords - close_to) > Config.SpawnerMenu.Size.x then
                close = false
                Citizen.Wait(400)
            end
        elseif not close then
            Citizen.Wait(400)
        end
        
        local isInMarker = false
        for garage, garageData in pairs(Config.Garages) do
            for action, actionData in pairs(garageData["positions"]) do
                local show = true
                if(action =='vehicle')then
                    if not IsPedInAnyVehicle(playerPed, false) then
                        show = false
                    end
                end
                if (show and GetDistanceBetweenCoords(coords, actionData["pos"], true) < Config.SpawnerMenu.Size.x) then
                    close_to = vector3(actionData["pos"].x, actionData["pos"].y, actionData["pos"].z)
                    close = true
                    isInMarker = true
                    garageName = garage
                    currentZone = action
                    CurrentActionCoords = actionData["pos"]
                end
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent("eden_garage:hasEnteredMarker", currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent("eden_garage:hasExitedMarker", LastZone)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if CurrentAction ~= nil then
            ESX.ShowFloatingHelpNotification(CurrentActionMsg, vector3(CurrentActionCoords.x, CurrentActionCoords.y, CurrentActionCoords.z + 1.0))
            if IsControlPressed(0, Keys["E"]) and (GetGameTimer() - GUI.Time) > 150 then
                
                if(CurrentAction == "spawnermenu")then
                    OpenMenuGarage("spawnermenu")
                end
                if CurrentAction == "pound_action_menu" then
                    OpenMenuGarage("pound")
                end
                if CurrentAction == "spawn" then
                    OpenMenuGarage("spawn")
                end
                if CurrentAction == "delete" then
                    OpenMenuGarage("delete")
                end

                CurrentAction = nil
                GUI.Time = GetGameTimer()
            end
        end
    end
end)

 function CameraPos(garage, toggle)
    local Camerapos = Config.Garages[garage]["camerapos"]

    if not Camerapos then return end

	if not toggle then
		if cachedData["cam"] then
			DestroyCam(cachedData["cam"])
		end
		
		if DoesEntityExist(cachedData["vehiclespawner"]) then
			DeleteEntity(cachedData["vehiclespawner"])
		end

		RenderScriptCams(0, 1, 750, 1, 0)

		return
	end

	if cachedData["cam"] then
		DestroyCam(cachedData["cam"])
	end

	cachedData["cam"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

	SetCamCoord(cachedData["cam"], Camerapos["x"], Camerapos["y"], Camerapos["z"])
	SetCamRot(cachedData["cam"], Camerapos["rotationX"], Camerapos["rotationY"], Camerapos["rotationZ"])
	SetCamActive(cachedData["cam"], true)

	RenderScriptCams(1, 1, 750, 1, 1)

	Citizen.Wait(500)
end
function WaitForModel(model)
    local DrawScreenText = function(text, red, green, blue, alpha)
        SetTextFont(4)
        SetTextScale(0.0, 0.5)
        SetTextColour(red, green, blue, alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(true)
    
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0.5, 0.5)
    end

    if not IsModelValid(model) then
        return ESX.ShowNotification("Este modelo no existe en el juego. " .. model)
    end

	if not HasModelLoaded(model) then
		RequestModel(model)
	end
	
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
		ESX.ShowHelpNotification("Cargando modelo " .. GetLabelText(GetDisplayNameFromVehicleModel(model)) .. "...")
	end
end


ShowFloatingHelpNotification = function(msg, coords)
    AddTextEntry('esx_drp_garage:ShowFloatingHelpNotification', msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('esx_drp_garage:ShowFloatingHelpNotification')
    EndTextCommandDisplayHelp(2, false, false, -1)
end
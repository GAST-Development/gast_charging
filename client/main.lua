if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
    Config.Framework = "esx"
elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
    Config.Framework = "qb"
else
    print("^1ERROR: Neither ESX nor QBCore detected!^0")
end

require('client/editables')

local isCharging = false
local chargingVehicle = nil
local Notifications, ProgressBars, Menus, FuelHandler, Interactions = table.unpack(require('client/editables'))

Citizen.CreateThread(function()
    for _, station in pairs(Config.ChargingStations) do
        if station.useProp then
            local prop = CreateObject(GetHashKey(Config.GlobalProp), station.coords.x, station.coords.y, station.coords.z, false, false, false)
            SetEntityHeading(prop, station.coords.w)
            FreezeEntityPosition(prop, true)
        end
        Interactions.AddChargingTarget(station)
    end
end)

function StartCharging(station)
    if isCharging then return end

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    -- Hráč nesmie byť vo vozidle
    if vehicle ~= 0 then
        Notifications.Show("exit_vehicle_first")
        return
    end

    -- Zistenie najbližšieho vozidla
    vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 5.0, 0, 71)

    if not DoesEntityExist(vehicle) then
        Notifications.Show("no_vehicle")
        return
    end

    local model = GetEntityModel(vehicle)
    local modelName = GetDisplayNameFromVehicleModel(model):lower()
    local isAllowed = false
    
    for _, allowedVehicle in ipairs(Config.AllowedVehicles) do
        if allowedVehicle == modelName then
            isAllowed = true
            break
        end
    end
    
    if not isAllowed then
        Notifications.Show("not_allowed_vehicle")
        return
    end

    chargingVehicle = vehicle
    local currentFuel = GetVehicleFuelLevel(vehicle)
    local fuelToFull = 100 - currentFuel
    local totalPrice = fuelToFull * Config.ChargePricePerPercent
    local duration = fuelToFull * Config.ChargeTimePerPercent

    Menus.ShowPaymentMenu(function(paymentMethod)
        TriggerServerEvent("gast_charging:checkPayment", totalPrice, paymentMethod, station, vehicle, duration)
    end)
end

RegisterNetEvent("gast_charging:startCharging")
AddEventHandler("gast_charging:startCharging", function(station, vehicle, duration)
    isCharging = true

    -- Zablokovanie možnosti nastúpiť do vozidla počas nabíjania
    SetVehicleDoorsLocked(vehicle, 2)

    ProgressBars.Show(duration, "charging_vehicle")  

    FuelHandler.RefillVehicle(vehicle)
    Notifications.Show("charging_complete")

    -- Odomknutie vozidla a resetovanie premenných
    SetVehicleDoorsLocked(vehicle, 1)
    isCharging = false
end)
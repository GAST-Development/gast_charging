local ServerNotifications = require('server/editables')

if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
    Config.Framework = "esx"
elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
    Config.Framework = "qb"
else
    print("^1ERROR: Neither ESX nor QBCore detected!^0")
end

RegisterServerEvent("gast_charging:checkPayment")
AddEventHandler("gast_charging:checkPayment", function(price, paymentMethod, station, vehicle, duration)
    local src = source
    local player

    if Config.Framework == "esx" then
        player = ESX.GetPlayerFromId(src)
        local hasMoney = (paymentMethod == "cash" and player.getMoney() >= price) or
                         (paymentMethod == "bank" and player.getAccount('bank').money >= price)

        if hasMoney then
            if paymentMethod == "cash" then
                player.removeMoney(price)
            else
                player.removeAccountMoney('bank', price)
            end
            TriggerClientEvent("gast_charging:startCharging", src, station, vehicle, tonumber(duration))
        else
            ServerNotifications.Show(src, "insufficient_funds")
        end

    elseif Config.Framework == "qb" then
        player = QBCore.Functions.GetPlayer(src)
        local cashAmount = player.Functions.GetMoney('cash')
        local bankAmount = player.Functions.GetMoney('bank')

        local hasMoney = (paymentMethod == "cash" and cashAmount >= price) or
                         (paymentMethod == "bank" and bankAmount >= price)

        if hasMoney then
            if paymentMethod == "cash" then
                player.Functions.RemoveMoney('cash', price)
            else
                player.Functions.RemoveMoney('bank', price)
            end
            TriggerClientEvent("gast_charging:startCharging", src, station, vehicle, tonumber(duration))
        else
            ServerNotifications.Show(src, "insufficient_funds")
        end
    end
end)

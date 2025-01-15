local Notifications = {}

function Translate(key)
    return Config.Translations[Config.Language][key] or key
end

function Notifications.Show(msgKey)
    local msg = Translate(msgKey)
    if Config.Notifications == "qb" then
        QBCore.Functions.Notify(msg, "primary", 5000)
    elseif Config.Notifications == "esx" then
        TriggerEvent('esx:showNotification', msg)
        ESX.ShowNotification(msg, 'info', 3000)
    elseif Config.Notifications == "ox_lib" then
        lib.notify({
            title = 'Notification',
            description = msg,
            type = 'inform'
        })
    elseif Config.Notifications == "ps-ui" then
        exports['ps-ui']:Notify({
            title = "Notification",
            description = msg,
            type = "success"
        })
    end
end

local ProgressBars = {}

function ProgressBars.Show(duration, labelKey)
    local label = Translate(labelKey)
    if Config.ProgressBar == "qb" then
        QBCore.Functions.Progressbar("charging", label, tonumber(duration), false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()

        end, function()

        end)
    elseif Config.ProgressBar == "esx" then
        exports['esx_progressbar']:Progress({
            name = "charging",
            duration = tonumber(duration),
            label = label,
            useWhileDead = false,
            canCancel = false,
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        })
    elseif Config.ProgressBar == "ox_lib" then
        lib.progressCircle({
            duration = tonumber(duration),
            label = label,
            position = 'middle',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = false,
                car = true,
                combat = true
            }
        })
    end
end

local FuelHandler = {}

function FuelHandler.RefillVehicle(vehicle)
    if Config.FuelSystem == "ox_fuel" then
        Entity(vehicle).state.fuel = 100
    elseif Config.FuelSystem == "legacyfuel" then
        SetVehicleFuelLevel(vehicle, 100)
    end
end

local Menus = {}

function Menus.ShowPaymentMenu(callback)
    if Config.Menu == "ox_lib" then
        lib.registerContext({
            id = 'charging_menu',
            title = Translate("choose_payment"),
            options = {
                {
                    title = Translate("pay_cash"),
                    description = "Pay using cash",
                    icon = "fas fa-wallet",
                    onSelect = function()
                        callback("cash")
                    end
                },
                {
                    title = Translate("pay_bank"),
                    description = "Pay using bank account",
                    icon = "fas fa-university",
                    onSelect = function()
                        callback("bank")
                    end
                }
            }
        })
        lib.showContext('charging_menu')
    elseif Config.Menu == "qb" then
        exports['qb-menu']:openMenu({
            {
                header = Translate("choose_payment"),
                txt = Translate("choose_payment"),
                isMenuHeader = true
            },
            {
                header = Translate("pay_cash"),
                txt = "Pay using cash",
                params = {
                    event = "charging:processPayment",
                    args = "cash"
                }
            },
            {
                header = Translate("pay_bank"),
                txt = "Pay using bank account",
                params = {
                    event = "charging:processPayment",
                    args = "bank"
                }
            }
        })
    elseif Config.Menu == "esx" then
        local elements = {
            { label = Translate("pay_cash"), value = "cash" },
            { label = Translate("pay_bank"), value = "bank" }
        }

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'charging_menu', {
            title    = Translate("choose_payment"),
            align    = 'top-left',
            elements = elements
        }, function(data, menu)
            callback(data.current.value)
            menu.close()
        end, function(data, menu)
            menu.close()
        end)
    elseif Config.Menu == "ps_ui" then
        exports['ps-ui']:CreateMenu({
            {
                id = "charging_menu",
                header = Translate("choose_payment"),
                text = Translate("choose_payment"),
                icon = "fas fa-credit-card",
                color = "blue",
                event = "charging:processPayment",
                args = "cash",
                server = false,
                subMenu = {
                    {
                        id = "cash_payment",
                        header = Translate("pay_cash"),
                        icon = "fas fa-wallet",
                        color = "green",
                        event = "charging:processPayment",
                        args = "cash",
                        server = false
                    },
                    {
                        id = "bank_payment",
                        header = Translate("pay_bank"),
                        icon = "fas fa-university",
                        color = "blue",
                        event = "charging:processPayment",
                        args = "bank",
                        server = false
                    }
                }
            }
        })
    elseif Config.Menu == "context menu" then
        local formMenu = {
            {
                name = 'submit',
                title = Translate("choose_payment"),
                unselectable= true,
            },
            {
                name = 'cash',
                title = Translate("pay_cash"),
                input = false
            },
            {
                name = 'bank',
                title = Translate("pay_bank"),
                input = false
            }
        }

        ESX.OpenContext('right', formMenu, function(menu, element)
            if element.name == 'cash' then
                callback("cash")
            elseif element.name == 'bank' then
                callback("bank")
            end
            ESX.CloseContext()
        end, function()
            print('Context closed')
        end)
    end
end

local Interactions = {}

function Interactions.AddChargingTarget(station)
    local coords = vector3(station.coords.x, station.coords.y, station.coords.z)

    if Config.Interaction == "ox_target" then
        exports['ox_target']:addBoxZone({
            coords = coords,
            size = vec3(1.5, 1.5, 2.0),
            rotation = station.coords.w,
            debug = false,
            options = {
                {
                    name = 'start_charging',
                    icon = 'fas fa-bolt',
                    label = Translate("choose_payment"),
                    onSelect = function()
                        StartCharging(station)
                    end
                }
            }
        })
    elseif Config.Interaction == "qb_target" then
        exports['qb-target']:AddBoxZone("charging_station_" .. tostring(coords), coords, 1.5, 1.5, {
            name = "charging_station_" .. tostring(coords),
            heading = station.coords.w,
            debugPoly = false,
            minZ = station.coords.z - 1.0,
            maxZ = station.coords.z + 1.0,
        }, {
            options = {
                {
                    label = Translate("choose_payment"),
                    icon = "fas fa-bolt",
                    action = function()
                        StartCharging(station)
                    end
                }
            },
            distance = 2.5
        })
    elseif Config.Interaction == "textui" then
        Citizen.CreateThread(function()
            while true do
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local distance = #(playerCoords - coords)

                if distance < 2.0 then
                    if Config.Notifications == "ox_lib" then
                        lib.showTextUI(Translate("choose_paymentTextUI"))
                        if IsControlJustPressed(0, 38) then 
                            lib.hideTextUI()
                            StartCharging(station)
                        end
                    else
                        ESX.ShowHelpNotification(Translate("choose_paymentTextUI"))
                        if IsControlJustPressed(0, 38) then 
                            StartCharging(station)
                        end
                    end
                else
                    lib.hideTextUI()
                end
                Citizen.Wait(0)
            end
        end)
    end
end

return { Notifications, ProgressBars, Menus, FuelHandler, Interactions }
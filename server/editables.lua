local ServerNotifications = {}

function Translate(key)
    return Config.Translations[Config.Language][key] or key
end

function ServerNotifications.Show(source, msgKey)
    local msg = Translate(msgKey)
    if Config.Notifications == "qb" then
        TriggerClientEvent('QBCore:Notify', source, msg)
    elseif Config.Notifications == "esx" then
        TriggerClientEvent('esx:showNotification', source, msg)
    elseif Config.Notifications == "ox_lib" then
        TriggerClientEvent('ox_lib:notify', source, {
            title = "Notification",
            description = msg,
            type = 'inform'
        })
    elseif Config.Notifications == "ps-ui" then
        TriggerClientEvent('ps-ui:Notify', source, {
            title = "Notification",
            description = msg,
            type = "success"
        })
    end
end

return ServerNotifications

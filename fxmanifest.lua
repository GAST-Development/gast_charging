fx_version 'cerulean'

lua54 'yes'

game 'gta5'

author 'TvojMeno'

description 'gast_charging - Script na nabíjanie vozidiel pre ESX a QBcore'

version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua', 
    '@ox_lib/init.lua',  
    'config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

items {
    'charging_station'
}


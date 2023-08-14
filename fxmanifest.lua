server_script '@sentry/Config/protectevent.config.lua'
server_script '@sentry/Config/sensitive.function.config.lua'
server_script '@sentry/Source/Shared/server.sentry.lua'
client_script '@sentry/Source/Shared/client.sentry.lua'
fx_version 'cerulean'
games { 'gta5' }

author 'h3x'
description 'test'
version '1.0.0' 

client_scripts {
    'Config/modules.config.lua',
    'Config/client.functions.lua',
    'Config/zone.config.lua',
    'Source/client.lua'
}

server_scripts {
    'Config/getItem.config.lua',
    'Source/server.lua'
}
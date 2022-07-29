fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'RageUI'
description 'RageUI'
version '1.0.0'


--RAGEUI
client_scripts {
	"vendor/RageUI/RMenu.lua",
    "vendor/RageUI/menu/RageUI.lua",
    "vendor/RageUI/menu/Menu.lua",
    "vendor/RageUI/menu/MenuController.lua",
    "vendor/RageUI/components/*.lua",
    "vendor/RageUI/menu/elements/*.lua",
    "vendor/RageUI/menu/items/*.lua",
    "vendor/RageUI/menu/panels/*.lua",
    "vendor/RageUI/menu/windows/*.lua",
	"vendor/ContextUI/components/*.lua",
	"vendor/ContextUI/ContextUI.lua",
	"vendor/ContextUI/ContextItems.lua",
}


--RAGEUI2
client_scripts {
	"vendor/RageUI2/RMenu2.lua",
    "vendor/RageUI2/menu/RageUI2.lua",
    "vendor/RageUI2/menu/Menu2.lua",
    "vendor/RageUI2/menu/MenuController2.lua",
    "vendor/RageUI2/components/*.lua",
    "vendor/RageUI2/menu/elements/*.lua",
    "vendor/RageUI2/menu/items/*.lua",
    "vendor/RageUI2/menu/panels/*.lua",
    "vendor/RageUI2/menu/windows/*.lua",
}


client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}


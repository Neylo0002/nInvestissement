-- Neylo0002 on Github

TriggerEvent('esx:getSharedObject', function(obj)
    Light = obj
end)

RegisterServerEvent("nMoney:reward")
AddEventHandler("nMoney:reward", function(price)
    local xPlayer = Light.GetPlayerFromId(source)
    xPlayer.addAccountMoney('cash', price)
    xPlayer.showNotification(("Vous venez de recevoir ~g~ %s ~s~ $"):format(price))
end)
RegisterServerEvent("nMoney:tarif")
AddEventHandler("nMoney:tarif", function(tarif)
    local xPlayer = Light.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('cash', tarif)


end)
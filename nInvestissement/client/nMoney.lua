-- Neylo0002 on Github

TriggerEvent('esx:getSharedObject', function(obj)
    Light = obj
end)

local temps = 0
local open = false



function nInvest()
    local mainMenu = RageUI.CreateMenu("Investissement", "Gagne de l'argent en etant AFK")
    mainMenu.TitleFont = 2;
    mainMenu.Closed = function()
    end
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        while mainMenu do
            Wait(0)
            RageUI.IsVisible(mainMenu, function()
                RageUI.Separator("Gagne de l'argent en etant AFK !")
                RageUI.Separator("Investis ton argent et double l'investissement")
                RageUI.Button("0$ -> 15.000 $", nil, {RightLabel = "1h"}, true, {
                    onSelected = function()  
                        open = true      
                        lastpos = GetEntityCoords(PlayerPedId())            
                        SetEntityCoords(PlayerPedId(), afkzone)  
                        if IsPedOnFoot(PlayerPedId()) then
                            while open do
                                Citizen.Wait(100)
                                nInvest2(1, 3600)
                            end

                        end
                        

                    end

                    
                })
                RageUI.Button("15.000$ -> 45.000 $", nil, {RightLabel = "2h"}, true, {
                    onSelected = function()
                        open = true      
                        lastpos = GetEntityCoords(PlayerPedId())            
                        SetEntityCoords(PlayerPedId(), afkzone)  
                        if IsPedOnFoot(PlayerPedId()) then
                            while open do
                                Citizen.Wait(100)
                                nInvest2(2, 7200)
                            end

                        end
                        TriggerServerEvent("nMoney:tarif", 15000)
                        
                    end

                    
                })
                RageUI.Button("45.000$ -> 95.000 $", nil, {RightLabel = "4h"}, true, {
                    onSelected = function()
                        open = true      
                        lastpos = GetEntityCoords(PlayerPedId())            
                        SetEntityCoords(PlayerPedId(), afkzone)  
                        while open do
                            Citizen.Wait(100)
                            nInvest2(4, 14400)
                        end
                        
                        
                        TriggerServerEvent("nMoney:tarif", 45000)
                        
                    end

                    
                })
            end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType("mainMenu", true)
        end
    end
end


function nInvest2(heure, temps)
    Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        temps = temps - 1 
        if temps == 0 then
            SetEntityCoords(PlayerPedId(), lastpos)
            RageUI.CloseAll()
            open = false
            TriggerEvent("nMoney:goodjob", heure)
        end
    end
    end)
    
    local mainMenu = RageUI.CreateMenu("Investissement", "Un investissement est en cour...")
    mainMenu.TitleFont = 2;
    mainMenu.Closed = function()
        
    end

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        while mainMenu do
            Wait(0)
            RageUI.IsVisible(mainMenu, function()
                RageUI.Separator("Gagne de l'argent en etant AFK !")
                RageUI.Separator("Investis ton argent et double l'investissement")
                RageUI.Separator(("Vous avez le contrat de :~b~ %s h"):format(heure))
                RageUI.Button("Voir Mon temps", nil, {}, true, {
                    onSelected = function ()
                        Light.ShowAdvancedNotification("LightRP", "~b~Investissement", ("Il vous reste :~b~ %s ~s~secondes"):format(temps), "CHAR_CALIFORNIA")
                    end


                })
                RageUI.Button("Retourner en RP", nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        SetEntityCoords(PlayerPedId(), lastpos)
                        RageUI.CloseAll()
                        open = false
                        temps = nil
                        


                        
                        
                    end

                    
                })
            end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType("mainMenu", true)
        end
    end
end


RegisterCommand("investissement", function()
    if open == false then
        nInvest()  
    else
    nInvest2(heure, temps)
    end

end)

RegisterNetEvent("nMoney:goodjob")
AddEventHandler("nMoney:goodjob", function(heure)
    if heure == 1 then
        TriggerServerEvent("nMoney:reward", 15000)
    end
    if heure == 2 then
        TriggerServerEvent("nMoney:reward", 45000)
    end
    if heure == 4 then
        TriggerServerEvent("nMoney:reward", 95000)
    end
end)


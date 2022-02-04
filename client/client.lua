local QBCore = exports['qb-core']:GetCoreObject()
local sellstart = false

CreateThread(function()
    local enterZone = false
    local Notify = nil
    while true do
        local sleep = 1250
        local inZone = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        local coords = GetBlipInfoIdCoord(sellblip)
        local tacobreadDist = #(PlayerPos - Config.TacoMarker["tacobread"])
        local tacomeatDist = #(PlayerPos - Config.TacoMarker["tacomeat"])
        local tacosaladDist = #(PlayerPos - Config.TacoMarker["tacosalad"])
        local tacoDist = #(PlayerPos - Config.TacoMarker["taco"])
        local tacopackedDist = #(PlayerPos - Config.TacoMarker["packedtaco"])
        local tacoSell = #(PlayerPos - Config.TacoMarker["selltaco"])
        local tacoDelivery = #(PlayerPos - vec3(coords[1], coords[2], coords[3]))
        local pressedKeyE = IsControlJustPressed(0, 38)
        if tacobreadDist < 1 then sleep = 5 inZone  = true 
            Notify = '[E] - Taco Bread' if pressedKeyE then addItem(2000,"tacobread") end
        end
        if tacomeatDist < 1 then sleep = 5 inZone  = true  
            Notify = '[E] - Taco Meat' if pressedKeyE then  addItem(8000,"tacomeat") end
        end
        if tacosaladDist < 1 then sleep = 5 inZone  = true 
            Notify = '[E] - Taco Salad' if pressedKeyE then addItem(8000,"tacosalad") end
        end
        if tacoDist < 1 then sleep = 5 inZone  = true 
            Notify = '[E] - Taco' if pressedKeyE then checkTaco("taco") end
        end
        if tacopackedDist < 1 then sleep = 5 inZone  = true 
            Notify = '[E] - Packed Taco' if pressedKeyE then checkItem("taco","packedtaco") end
        end
        if tacoSell < 1 then sleep = 5 inZone  = true 
            Notify = '[E] - Sell Taco' if pressedKeyE then sellTaco("packedtaco") end
        end
        if tacoDelivery < 4 and sellstart then sleep = 5
            DrawMarker(2, coords[1], coords[2], coords[3], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 225, 138, 21, 200, 0, 0, 0, 1, 0, 0, 0)
            if tacoDelivery < 1 then inZone  = true 
               Notify = '[E] - Delivery Taco' if pressedKeyE then checkDelivery("packedtaco") end
         end
    end
        if inZone and not enterZone then
            enterZone = true
            TriggerEvent('luke_textui:ShowUI', "<b>"..Notify.."</b>", "#D9911B")
        end
        if not inZone and enterZone then
            enterZone = false
            TriggerEvent('luke_textui:HideUI')
        end
        Wait(sleep)
    end
end)

addItem = function(time,additem) 
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("tacos","Process in progress", time, false, true, 
        {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
        {animDict = "mp_arresting",anim = "a_uncuff",flags = 49,}, {}, {}, function() -- Done
        StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
        TriggerServerEvent('um-taco:server:additem',additem)
    end)
end

checkItem = function(checkitem,additem)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(cb)  
        if cb then
            TriggerServerEvent('um-taco:server:removeitem',checkitem)
            addItem(8000,additem) 
        else
            QBCore.Functions.Notify("You don't have a "..checkitem, "error")
        end
    end,checkitem)
end

checkTaco = function(additem)
    QBCore.Functions.TriggerCallback('um-taco:server:checktaco', function(cb)  
        if cb then
            addItem(8000,additem) 
        else
            QBCore.Functions.Notify("You don\'t have all the ingredients yet..", "error")
        end
    end)
end

sellTaco = function(checkitem)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(cb)  
        if cb and not sellstart then
            local random = math.random(1,#Config.Locations)
            sellcoords = {x = Config.Locations[random][1],y = Config.Locations[random][2],z = Config.Locations[random][3],h = Config.Locations[random][4]}
            sellblip = CreateSellBlip(sellcoords.x, sellcoords.y, sellcoords.z)
            SetNewWaypoint(sellcoords.x, sellcoords.y)
            sellstart = true
            QBCore.Functions.Notify("New address gps marked", "success")
        else
            QBCore.Functions.Notify("You don't have a "..checkitem.." or have an active delivery", "error")
        end
    end,checkitem)
end

checkDelivery = function(checkitem)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(cb)  
        if cb and sellstart then
            local ped = PlayerPedId()
            QBCore.Functions.Progressbar("delivery","Process in progress", 6000, false, true, 
            {disableMovement = true,disableCarMovement = true,disableMouse = false, disableCombat = true,}, 
            {animDict = "mp_common",anim = "givetake1_a",flags = 49,}, {}, {}, function() -- Done
            StopAnimTask(ped, "mp_common", "givetake1_a", 1.0)
            RemoveBlip(sellblip) 
            TriggerServerEvent('um-taco:server:removeitem',checkitem) 
            TriggerServerEvent('um-taco:server:givemoney')
            sellstart = false 
        end)
        else
            QBCore.Functions.Notify("You don't have a "..checkitem, "error")
        end
    end,checkitem)
end

CreateSellBlip = function(x,y,z)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip, 489)
	SetBlipColour(blip, 1)
	AddTextEntry('MYBLIP', "Customer")
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	return blip
end

CreateThread(function()
    local modelHash = GetHashKey("u_f_o_eileen")
    RequestModel(modelHash)
      while not HasModelLoaded(modelHash) do
        Wait(10)
      end
    local ped = CreatePed(4, modelHash, 9.95, -1604.68, 28.38, 230.2, false, false)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    local blip = AddBlipForCoord(12.92127, -1602.86, 29.374)
    SetBlipSprite(blip, 208)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, 44)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Taco")
    EndTextCommandSetBlipName(blip)
end)

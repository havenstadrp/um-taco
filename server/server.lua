local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('um-taco:server:additem', function(additem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(additem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[additem], "add")
end)

RegisterNetEvent('um-taco:server:removeitem', function(removeitem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(removeitem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[removeitem], "remove")
end)

RegisterNetEvent('um-taco:server:givemoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tiprandom = math.random(1,50)
    local tacomoney = math.random(UM.TacoMoneyMin,UM.TacoMoneyMax)
    Player.Functions.AddMoney("cash", tacomoney, "taco-money")
    TriggerClientEvent('QBCore:Notify', src, "Taco delivered! Go back to the taco shop for a new delivery", "success")
    TriggerClientEvent('QBCore:Notify', src, "You have earned in money $"..tacomoney)
    if tiprandom >= 25 then
        Player.Functions.AddMoney("cash", UM.TacoTip, "taco-tip")
        TriggerClientEvent('QBCore:Notify', src, "You have earned in tips $"..UM.TacoTip)
    end
end)

QBCore.Functions.CreateCallback('um-taco:server:checktaco', function(source, cb)
    local src = source
    local Player =  QBCore.Functions.GetPlayer(src)
    local tacobread = Player.Functions.GetItemByName("tacobread")
    local tacomeat = Player.Functions.GetItemByName("tacomeat")
    local tacosalad = Player.Functions.GetItemByName("tacosalad")
    if tacobread ~= nil and tacomeat ~= nil  and tacosalad ~= nil then
        Player.Functions.RemoveItem("tacobread", 1)
        Player.Functions.RemoveItem("tacomeat", 1)
        Player.Functions.RemoveItem("tacosalad", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["tacobread"], "remove")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["tacomeat"], "remove")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["tacosalad"], "remove")
        cb(true)
    else
        cb(false)
    end
end)

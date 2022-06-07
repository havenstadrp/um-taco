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
    local tacomoney = math.random(Config.TacoMoneyMin,Config.TacoMoneyMax)
    Player.Functions.AddMoney("cash", tacomoney, "taco-money")
    TriggerClientEvent('QBCore:Notify', src, "Taco delivered! Go back to the taco shop for a new delivery", "success")
    TriggerClientEvent('QBCore:Notify', src, "You have earned in money $"..tacomoney)
    if tiprandom >= 25 then
        Player.Functions.AddMoney("cash", Config.TacoTip, "taco-tip")
        TriggerClientEvent('QBCore:Notify', src, "You have earned in tips $"..Config.TacoTip)
    end
end)

QBCore.Functions.CreateCallback('um-taco:server:checktaco', function(source, cb)
    local src = source
    local Player =  QBCore.Functions.GetPlayer(src)
    local taco_bread = Player.Functions.GetItemByName("taco_bread")
    local taco_meat = Player.Functions.GetItemByName("taco_meat")
    local taco_meat = Player.Functions.GetItemByName("taco_salad")
    if taco_bread ~= nil and taco_meat ~= nil  and taco_meat ~= nil then
        Player.Functions.RemoveItem("taco_bread", 1)
        Player.Functions.RemoveItem("taco_meat", 1)
        Player.Functions.RemoveItem("taco_salad", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["taco_bread"], "remove")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["taco_meat"], "remove")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["taco_salad"], "remove")
        cb(true)
    else
        cb(false)
    end
end)

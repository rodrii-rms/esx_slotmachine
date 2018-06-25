ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_slotmachine:sv:1')
AddEventHandler('esx_slotmachine:sv:1', function(amount,a,b,c)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local amount = tonumber(amount)
	if not (xPlayer.getMoney() >= tonumber(amount)) or (xPlayer.getAccounts('black_money') >= tonumber(amount)) then
		TriggerClientEvent('esx:showNotification', source, "Not enough money in your wallet")
	else
		xPlayer.removeMoney(amount)
		-- xPlayer.removeAccountMoney('black_money', (amount))
		TriggerClientEvent("esx_slotmachine:1", _source, tonumber(amount), tostring(a), tostring(b), tostring(c))
	end
end)



RegisterServerEvent('esx_slotmachine:sv:2')
AddEventHandler('esx_slotmachine:sv:2', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	    xPlayer.addMoney(amount)
	    -- xPlayer.addAccountMoney('black_money', (amount))
	    TriggerClientEvent('esx:showNotification', source, "You WON : " .. amount .. "$")
end)

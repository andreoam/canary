local refillBoots = Action()

local config = {
	wormId = 6530,
	newId = 6529,
	value = 1000000,
}

local function formatValue(value)
	if value >= 1000000 then
		if value % 1000000 == 0 then
			return string.format("%dkk", value / 1000000)
		else
			return string.format("%.1fkk", value / 1000000)
		end
	elseif value >= 1000 then
		if value % 1000 == 0 then
			return string.format("%dk", value / 1000)
		else
			return string.format("%.1fk", value / 1000)
		end
	else
		return tostring(value)
	end
end

function refillBoots.onUse(player, item, fromPosition, target, toPosition, isHotkey)
  
	if player:getItemCount(config.wormId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newId, 1) -- id new soft boots
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged a boots successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			local formattedValue = formatValue(config.value)
			player:sendCancelMessage("You do not have enough money! You need " .. formattedValue .. " for refill.")
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough money! You need " .. formattedValue .. " for refill.")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have boots!")
	end
	
	return true
end

refillBoots:id(config.wormId)
refillBoots:register()

local rewards = {
    { id = 49512, name = "Blazing Shroud" },
    { id = 49513, name = "Blazing Mantle" },
    { id = 49514, name = "Blazing Shell" },
    { id = 49515, name = "Pair of Blazing Stalkers" },
    { id = 49516, name = "Pair of Blazing Walkers" },
    { id = 49517, name = "Blazing Helmet" },
    { id = 49518, name = "Blazing Strider" },
    { id = 49519, name = "Blazing Shanks" },
}

local bagyouCovet = Action()

function bagyouCovet.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a ' .. rewardItem.name .. '.')
	return true
end

bagyouCovet:id(49521)
bagyouCovet:register()
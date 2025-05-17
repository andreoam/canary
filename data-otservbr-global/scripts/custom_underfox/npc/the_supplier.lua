local internalNpcName = "The Supplier"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 155,
	lookHead = 77,
	lookBody = 0,
	lookLegs = 76,
	lookFeet = 132,
	lookAddons = 3,
}

npcConfig.flags = {
    floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "From the toughest tools to potions that would make anyone envious."},
	{ text = "My potions are so potent, not a drop of water is needed to stretch the supply."},
	{ text = "From tools to bags, exotic foods, and potions that even the stars would envy"},
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {}

local function creatureSayCallback(npc, player, type, message)
	local formattedCategoryNames = {}
	for categoryName, _ in pairs(SupplyShopConfigTable) do
		table.insert(formattedCategoryNames, "{" .. categoryName .. "}")
	end

	local categoryTable = SupplyShopConfigTable[message:lower()]
	if MsgContains(message, "shop options") then
		npcHandler:say("I sell a selection of " .. table.concat(formattedCategoryNames, ", "), npc, player)
	elseif categoryTable then
		npcHandler:say("Here are the items for the category " .. message, npc, player)
		npc:openShopWindowTable(player, categoryTable)
	else
		npcHandler:say("I sell a selection of " .. table.concat(formattedCategoryNames, ", "), npc, player)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|! I can also show you my {shop options}") 
npcHandler:setMessage(MESSAGE_FAREWELL, "Good luck with your adventures, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back if you need more supplies!")

-- Configura��es de compra e venda no NPC
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)

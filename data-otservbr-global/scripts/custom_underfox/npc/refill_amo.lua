local internalNpcName = "Distance Merchant"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "Merchant specializing in distance equipment."

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 154,
    lookHead = 96,
    lookBody = 101,
    lookLegs = 120,
    lookFeet = 120,
    lookAddons = 2,
}

npcConfig.flags = {
    floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Precisa de Muni��es?" },
	{ text = "Venha conferir o melhor pre�o de muni��es." },
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

-- Combinar itens de SupplyShopConfigTable
local npcShopItems = {}
for _, item in ipairs(SupplyShopConfigTable["distance equipments"] or {}) do
	table.insert(npcShopItems, item)
end

-- Atribuir os itens ao NPC
npcConfig.shop = npcShopItems

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|! I sell distance equipments. Would you like to check my {trade}?")
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
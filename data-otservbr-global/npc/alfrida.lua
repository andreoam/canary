local internalNpcName = "Alfrida"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 95,
	lookBody = 4,
	lookLegs = 17,
	lookFeet = 95,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Feel the wind in your hair during one of my carpet rides!" },
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

-- Travel
local TheNewFrontier = Storage.Quest.U8_54.TheNewFrontier
local function addTravelKeyword(keyword, text, cost, destination, condition, action)
	if condition then
		keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "Never heard about a place like this." }, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "Do you seek a ride to " .. keyword:titleCase() .. " for |TRAVELCOST|?", cost = cost, discount = "postman" })
	travelKeyword:addChildKeyword({ "yes" }, StdModule.travel, { npcHandler = npcHandler, premium = false, text = "Hold on!", cost = cost, discount = "postman", destination = destination })
	travelKeyword:addChildKeyword({ "no" }, StdModule.say, { npcHandler = npcHandler, text = "You shouldn't miss the experience.", reset = true })
end

addTravelKeyword("darashia", "", 60, Position(33270, 32441, 6))
addTravelKeyword("darama", "", 60, Position(33270, 32441, 6))
addTravelKeyword("edron", "", 60, Position(33193, 31783, 3))
addTravelKeyword("femor hills", "", 60, Position(32536, 31837, 4))
addTravelKeyword("kazordoon", "", 70, Position(32588, 31942, 0))
addTravelKeyword("svargrond", "", 60, Position(32253, 31097, 4))
addTravelKeyword("marapur", "", 70, Position(33805, 32767, 2))

-- Basic

keywordHandler:addKeyword({ "fly" }, StdModule.say, { npcHandler = npcHandler, text = "I can fly you to {Darashia} on Darama, {Edron}, {Femor Hills}, {Kazordoon}, {Svargron} or {Marapur} if you like. Where do you want to go?" })
keywordHandler:addKeyword({ "passage" }, StdModule.say, { npcHandler = npcHandler, text = "I can fly you to {Darashia} on Darama, {Edron}, {Femor Hills}, {Kazordoon}, {Svargron} or {Marapur} if you like. Where do you want to go?" })
keywordHandler:addKeyword({ "transport" }, StdModule.say, { npcHandler = npcHandler, text = "I can fly you to {Darashia} on Darama, {Edron}, {Femor Hills}, {Kazordoon}, {Svargron} or {Marapur} if you like. Where do you want to go?" })

npcHandler:setMessage(MESSAGE_GREET, "Greetings, traveller |PLAYERNAME|. Where do you want me to {fly} you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Daraman's blessings")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Daraman's blessings")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)

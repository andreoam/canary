local internalNpcName = 'Haldor Hammerfall' 
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName
npcConfig.speechBubble = 2

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 610,
    lookHead = 77,
    lookBody = 38,
    lookLegs = 97,
    lookFeet = 78,
    lookAddons = 1
}

npcConfig.flags = {
    floorchange = false
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

local function greetCallback(npc, creature)
    local player = Player(creature)
    local playerId = player:getId()
    return true
end

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local playerId = player:getId()

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    local config = {
        toolsAction = 62990,
        repairToolsAction = 62991,
        extractToolsAction = 62992,
        tools = {
            {id = 673, name = "lesser", cost = 250000000},
            {id = 49457, name = "superior", cost = 375000000},
            {id = 49458, name = "divine", cost = 600000000},
			-- {id = 4835, name = "heroic", cost = 40000},
			-- {id = 4835, name = "unique", cost = 50000},
			-- {id = 4835, name = "celestial", cost = 60000},
            -- {id = 4835, name = "divine", cost = 60000},
			-- {id = 4835, name = "epic", cost = 70000},
			-- {id = 4835, name = "legendary", cost = 80000},
			-- {id = 4835, name = "mythic", cost = 100000},
            -- {id = 4835, name = "eternal", cost = 200000},
        },
        repairtools = {
            {id = 12128, name = "grand", cost = 1000000000000},
            {id = 12128, name = "rare", cost = 20000000000000},
            {id = 12128, name = "arcane", cost = 30000000000000},
			-- {id = 12128, name = "heroic", cost = 400000},
			-- {id = 12128, name = "unique", cost = 500000},
			-- {id = 12128, name = "celestial", cost = 600000},
            -- {id = 12128, name = "divine", cost = 70000},
			-- {id = 12128, name = "epic", cost = 800000},
			-- {id = 12128, name = "legendary", cost = 900000},
			-- {id = 12128, name = "mythic", cost = 1000000},
            -- {id = 12128, name = "eternal", cost = 2000000},
        },
        extracttools = {
            {id = 7281, name = "lesser", cost = 0, currencyItem = "magic crystal"},
            {id = 7281, name = "superior", cost = 0, currencyItem = "magic crystal"},
            {id = 7281, name = "divine", cost = 0, currencyItem = "magic crystal"},
			-- {id = 7281, name = "heroic", cost = 400000},
			-- {id = 7281, name = "unique", cost = 500000},
			-- {id = 7281, name = "celestial", cost = 600000},
			-- {id = 7281, name = "divine", cost = 700000},
			-- {id = 7281, name = "epic", cost = 800000},
			-- {id = 7281, name = "legendary", cost = 900000},
            -- {id = 7281, name = "mythic", cost = 1000000},
            -- {id = 7281, name = "eternal", cost = 2000000},
        },
    }

    if MsgContains(message, 'forging') then
        local toolsOptions = {}
        for _, tools in ipairs(config.tools) do
            table.insert(toolsOptions, '{' .. tools.name .. '} cost ' .. tools.cost .. ' gold coins')
        end
        local message = 'Choose which tools you want: ' .. table.concat(toolsOptions, ', ') .. '.'
        npcHandler:say(message, npc, creature)
        npcHandler:setTopic(playerId, 1)
    elseif MsgContains(message, 'Nildaotoasdasp') then
        local repairtoolOptions = {}
        for _, repairtool in ipairs(config.repairtools) do
            table.insert(repairtoolOptions, '{' .. repairtool.name .. '} cost ' .. repairtool.cost .. ' gold coins')
        end
        local message = 'Choose which tools you want: ' .. table.concat(repairtoolOptions, ', ') .. '.'
        npcHandler:say(message, npc, creature)
        npcHandler:setTopic(playerId, 2)
    elseif MsgContains(message, 'extracting') then
        local extracttoolOptions = {}
        for _, extracttool in ipairs(config.extracttools) do
            table.insert(extracttoolOptions, '{' .. extracttool.name .. '} cost ' .. extracttool.currencyItem .. '.')
        end
        local message = 'To receive a memory crystal and extract your upgrade you need to give me a magic crystal: ' .. table.concat(extracttoolOptions, ', ') .. '.'
        npcHandler:say(message, npc, creature)
        npcHandler:setTopic(playerId, 3)
	elseif npcHandler:getTopic(playerId) == 1 then
		local selectedTool = nil
		for i, tools in ipairs(config.tools) do
			if MsgContains(message, tools.name) or MsgContains(message, string.upper(tools.name)) then
				if player:getMoney() + player:getBankBalance() >= tools.cost then
					npc:setDirection(DIRECTION_EAST)
					player:removeMoneyBank(tools.cost)
					local inbox = player:getStoreInbox()
                    local itemAdd = inbox:addItem(tools.id, 1)
                    --itemAdd:setName("upgrade hammer")
                    itemAdd:setCustomAttribute("tool", "upgrade tool")
                    itemAdd:setCustomAttribute("rank", tools.name)
                    itemAdd:setCustomAttribute("durability", 100)
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. tools.name:gsub("^%l", string.upper) .."")
                    itemAdd:setActionId(config.toolsAction)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tool has been added to store inbox.")
					npcHandler:say('Here is your tool, it was made to refine ' .. tools.name .. ' level equipment.', npc, creature)
					selectedTool = tools
                    npcHandler:resetNpc(player)
                    npcHandler:removeInteraction(npc, player)
					break
				else
					npcHandler:say('You don\'t have enough money.', npc, creature)
				end
			end
		end
	elseif npcHandler:getTopic(playerId) == 2 then
		local selectedTool = nil
		for i, repairtools in ipairs(config.repairtools) do
			if MsgContains(message, repairtools.name) or MsgContains(message, string.upper(repairtools.name)) then
				if player:getMoney() + player:getBankBalance() >= repairtools.cost then
					npc:setDirection(DIRECTION_EAST)
					player:removeMoneyBank(repairtools.cost)
					local inbox = player:getStoreInbox()
                    local itemAdd = inbox:addItem(repairtools.id, 1, true)
                    itemAdd:setName("repair tools kit")
                    itemAdd:setCustomAttribute("tool", "repair tool")
                    itemAdd:setCustomAttribute("rank", repairtools.name)
                    itemAdd:setCustomAttribute("durability", 100)
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. repairtools.name:gsub("^%l", string.upper) .."\nDurability: ".. itemAdd:getCustomAttribute("durability") .."%")
                    itemAdd:setActionId(config.repairToolsAction)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tool has been added to store inbox.")
					npcHandler:say('Here is your tool, it was made to repair forging ' .. repairtools.name .. ' level equipment.', npc, creature)
					selectedTool = repairtools
                    npcHandler:resetNpc(player)
                    npcHandler:removeInteraction(npc, player)
					break
				else
					npcHandler:say('You don\'t have enough money.', npc, creature)
				end
			end
		end
	elseif npcHandler:getTopic(playerId) == 3 then
		local selectedTool = nil
		for i, extracttools in ipairs(config.extracttools) do
			if MsgContains(message, extracttools.name) or MsgContains(message, string.upper(extracttools.name)) then
				if player:getItemCount(11552) > 0 then
                    player:removeItem(11552, 1)
					npc:setDirection(DIRECTION_EAST)
					player:removeMoneyBank(extracttools.cost)
					local inbox = player:getStoreInbox()
                    local itemAdd = inbox:addItem(extracttools.id, 1, true)
                    itemAdd:setName("extraction crystal")
                    itemAdd:setCustomAttribute("tool", "extract tool")
                    itemAdd:setCustomAttribute("rank", extracttools.name)
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. extracttools.name:gsub("^%l", string.upper))
                    itemAdd:setActionId(config.extractToolsAction)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tool has been added to store inbox.")
					npcHandler:say('Here is your tool, it was made to extract refining from ' .. extracttools.name .. ' level forging equipment..', npc, creature)
					selectedTool = extracttools
                    npcHandler:resetNpc(player)
                    npcHandler:removeInteraction(npc, player)
					break
				else
					npcHandler:say('You don\'t have enough item.', npc, creature)
				end
			end
		end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET,
    'Hello |PLAYERNAME| and welcome, I currently have the following types of products, tool for {forging} or tool for {extracting} the refining of the item.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye.')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
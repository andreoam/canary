-- upgradeSystem library
dofile(DATA_DIRECTORY .. "/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")

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

npcConfig.voices = {
    interval = 15000,
    chance = 50,
    {text = "I can forge tools for you."}
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

for _, categoryTable in pairs(UpgradeSystemShopConfigTable) do
	for _, itemTable in ipairs(categoryTable) do
		table.insert(npcConfig.shop, itemTable)
	end
end

local function getFormattedCategoryNames()
    local formattedNames = {}
    for categoryName, _ in pairs(UpgradeSystemShopConfigTable) do
        table.insert(formattedNames, "{" .. categoryName .. "}")
    end
    return formattedNames
end

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local categoryTable = UpgradeSystemShopConfigTable[message:lower()]

    if categoryTable == UpgradeSystemShopConfigTable["upgrade stones"] then
        npc:setCurrency(22721)
    elseif categoryTable == UpgradeSystemShopConfigTable["extract tools"] then
        npc:setCurrency(11552)
    end

    if categoryTable then
        npcHandler:say("Here are my " .. message, npc, player)
        npc:openShopWindowTable(player, categoryTable)
    else
        npcHandler:say("I don't understand. Available categories: " .. table.concat(getFormattedCategoryNames(), ", "), npc, player)
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome |PLAYERNAME|! I sell special {upgrade stones} or {extract tools} that can enhance your equipment.")

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    if npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks) then
        local item = player:getItemById(itemId, true)
        if item then
            for _, tool in pairs(UpgradeSystemShopConfigTable["upgrade stones"]) do
                if tool.clientId == itemId then
                    item:setCustomAttribute("tool", "upgrade tool")
                    item:setCustomAttribute("rank", tool.name)
                    item:setActionId(Upgrade_System_config.upgradetool)
                    break
                end
            end

            for _, extracttools in pairs(UpgradeSystemShopConfigTable["extract tools"]) do
                if extracttools.clientId == itemId then
                    if player:getItemCount(11552) > 0 then
                        player:removeItem(11552, 1)
                        item:setName("Extraction Crystal")
                        item:setCustomAttribute("tool", "extract tool")
                        item:setCustomAttribute("rank", extracttools.itemName)
                        item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: " .. extracttools.itemName)
                        item:setActionId(Upgrade_System_config.extractiontool)
                        npcHandler:say("Here is your Extraction Crystal!", npc, creature)
                        break
                    else
                        npcHandler:say("You don't have enough required items to buy this.", npc, creature)
                        break
                    end
                end
            end
        end
    end
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

-- npcType registering the npcConfig table
npcType:register(npcConfig)
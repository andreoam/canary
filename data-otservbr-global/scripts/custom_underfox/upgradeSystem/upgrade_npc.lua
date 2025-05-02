-- upgradeSystem library
dofile(DATA_DIRECTORY .. "/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")

-- Constantes para moedas de troca
local CURRENCY = {
    GOLD_TOKEN = 22721,
    NORMAL_STONE = 60207,
    EPIC_STONE = 60208,
    REFINED_STONE = 60206,
    MEMORY_CRYSTAL = 11552
}

local internalNpcName = 'Haldor Hammerfall'
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

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
    {
        text = "I can forge tools for you."
    }
}

npcConfig.currency = CURRENCY.GOLD_TOKEN
npcConfig.shop = {}

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
                    if player:getItemCount(CURRENCY.MEMORY_CRYSTAL) > 0 then
                        player:removeItem(CURRENCY.MEMORY_CRYSTAL, 1)
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

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

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
    local playerId = creature:getId()
    npcHandler:setTopic(playerId, 0)
    return true
end

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local playerId = player:getId()
    local categoryTable = UpgradeSystemShopConfigTable[message:lower()]

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    -- Define a moeda baseada na categoria
    if categoryTable == UpgradeSystemShopConfigTable["upgrade stones"] then
        npc:setCurrency(CURRENCY.GOLD_TOKEN)
    elseif categoryTable == UpgradeSystemShopConfigTable["normal stones mined"] then
        npc:setCurrency(CURRENCY.NORMAL_STONE)
    elseif categoryTable == UpgradeSystemShopConfigTable["epic stones mined"] then
        npc:setCurrency(CURRENCY.EPIC_STONE)
    elseif categoryTable == UpgradeSystemShopConfigTable["refined stones mined"] then
        npc:setCurrency(CURRENCY.REFINED_STONE)
    elseif categoryTable == UpgradeSystemShopConfigTable["extract tools"] then
        npc:setCurrency(CURRENCY.MEMORY_CRYSTAL)
    end

    if MsgContains(message, "information") then
        npcHandler:say("You can buy {upgrade stones} to enhance your items, you can also exchange {mined stones}, you can exchange {extract tools} to store your upgrade in a memory crystal", npc, creature)
    elseif MsgContains(message, "mined stones") then
        npcHandler:say("You can trade {normal stones mined}, {epic stones mined} or {refined stones mined} for upgrade stones.", npc, creature)        
    elseif MsgContains(message, "normal stones mined") or MsgContains(message, "epic stones mined") or MsgContains(message, "refined stones mined") or MsgContains(message, "upgrade stones") or MsgContains(message, "extract tools") then
        if categoryTable then
            npcHandler:say("Here are my " .. message, npc, player)
            npc:openShopWindowTable(player, categoryTable)
        end
    else
        npcHandler:say("I don't understand. Do you need more {information}?", npc, player)        
        -- frase que lista todas as categorias disponíveis
        -- npcHandler:say("I don't understand. Available categories: " .. GetFormattedShopCategoryNames(UpgradeSystemShopConfigTable), npc, player)     
    end
    return true
end

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setMessage(MESSAGE_GREET,"Welcome |PLAYERNAME|! You can buy {upgrade stones} to enhance your items, you can also exchange {mined stones}, you can exchange {extract tools} to store your upgrade in a memory crystal?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
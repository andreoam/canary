local config = {
    actionId = 18561, -- on lever
    lever = {
        left = 2772,
        right = 2773
    },
    playItem = {
        itemId = 5957, -- item required to pull lever
        count = 1
    },
    
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 500,
        ignoredItems = {1617}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 3, max = 8}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = 48550 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },

    prizePool = {
         -- muito Raros
        {itemId = 34109, count = {1, 1}, chance = 100}, -- bag you desire
        {itemId = 39546, count = {1, 1}, chance = 200}, -- primal bag
        {itemId = 43860, count = {1, 1}, chance = 300}, -- bag you covet
        {itemId = 34326, count = {1, 1}, chance = 400}, -- wicked witch

        -- raro
        {itemId = 5957, count = {5, 10}, chance = 500}, -- roulette token
        {itemId = 22118, count = {100, 100}, chance = 600}, -- Tibia Coins
        {itemId = 22721, count = {1, 5}, chance = 700}, -- Gold Token
        {itemId = 22516, count = {1, 5}, chance = 800}, -- Silver Token
        {itemId = 39693, count = {1, 1}, chance = 900}, -- 25 years backpack

        -- semi raro
        {itemId = 37110, count = {1, 1}, chance = 1000}, -- exalted core
        {itemId = 6529, count = {1, 1}, chance = 1100}, -- soft boots
        {itemId = 28484, count = {1, 10}, chance = 1200}, -- blueberry cupcake
        {itemId = 28485, count = {1, 10}, chance = 1300}, -- strawberry cupcake
        {itemId = 28486, count = {1, 10}, chance = 1400}, -- lemon cupcake

        -- incomum
        {itemId = 16175, count = {1, 1}, chance = 1500}, -- shiny blade
        {itemId = 3043, count = {50, 100}, chance = 1600}, -- Crystal Coin
        {itemId = 36724, count = {1, 5}, chance = 1700}, -- strike enhancement
        {itemId = 36723, count = {1, 5}, chance = 1800}, -- kooldown-aid
        {itemId = 36736, count = {1, 5}, chance = 1900}, -- fire amplification
        {itemId = 36737, count = {1, 5}, chance = 2000}, -- ice amplification
        {itemId = 36738, count = {1, 5}, chance = 2100}, -- earth amplification
        {itemId = 36739, count = {1, 5}, chance = 2200}, -- energy amplification
        {itemId = 36740, count = {1, 5}, chance = 2300}, -- holy amplification
        {itemId = 36741, count = {1, 5}, chance = 2400}, -- death amplification
        {itemId = 36742, count = {1, 5}, chance = 2500}, -- physical amplification
        {itemId = 36725, count = {1, 5}, chance = 2600}, -- stamina extension
        {itemId = 36729, count = {1, 5}, chance = 2700}, -- fire resilience
        {itemId = 36730, count = {1, 5}, chance = 2800}, -- ice resilience 
        {itemId = 36731, count = {1, 5}, chance = 2900}, -- earth resilience
        {itemId = 36732, count = {1, 5}, chance = 3000}, -- energy resilience
        {itemId = 36733, count = {1, 5}, chance = 3100}, -- holy resilience
        {itemId = 36734, count = {1, 5}, chance = 3200}, -- death resilience
        {itemId = 36735, count = {1, 5}, chance = 3300}, -- physical resilience
        {itemId = 5957, count = {1, 1}, chance = 3400}, -- roulette token

        -- comum
        {itemId = 25718, count = {1, 1}, chance = 3500}, -- temple teleport scroll
        {itemId = 3734, count = {1, 10}, chance = 3600}, -- blood herb
        {itemId = 3079, count = {1, 1}, chance = 3700}, -- boots of haste
        {itemId = 3392, count = {1, 5}, chance = 3800} -- royal helmet
    },

    roulettePositions = { -- hard-coded to 7 positions.
        Position(1135, 1028, 5),
        Position(1136, 1028, 5),
        Position(1137, 1028, 5),
        Position(1138, 1028, 5), 
        Position(1139, 1028, 5),-- position 4 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(1140, 1028, 5),
        Position(1141, 1028, 5),
        Position(1142, 1028, 5),
        Position(1143, 1028, 5),
    }
}

local chancedItems = {} -- used for broadcast. don't edit

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 9 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    if ItemType(newItemInfo.itemId):getCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute("charges", newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            if ItemType(newItemInfo.itemId):getCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute("charges", newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[5], config.rouletteOptions.winEffects[1])
            config.roulettePositions[9]:sendDistanceEffect(config.roulettePositions[5], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[5]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    local item = Tile(config.roulettePositions[5]):getTopVisibleThing()
    
    if ItemType(item:getId()):getCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� ganhou " .. item:getCount() .. " " .. item:getName() .. "!")
    end
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end
    
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)
    
    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Casino Roulette is currently in progress. Please wait.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
        -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Free Spin being used due to a previous unforeseen error.")
    end
    
    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()


local disableMovingItemsToRoulettePositions = MoveEvent()

disableMovingItemsToRoulettePositions.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:position(config.roulettePositions)
disableMovingItemsToRoulettePositions:register()
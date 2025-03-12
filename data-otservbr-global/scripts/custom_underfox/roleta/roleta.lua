local config = {
    actionId = 18562,  -- ActionID da alavanca
    requiredItemId = 37317, 
    positions = {

        Position(31720, 32434, 10),
        Position(31721, 32434, 10),
        Position(31722, 32434, 10),
        Position(31723, 32434, 10),
        Position(31724, 32434, 10),  -- position this list is hard-coded to be the reward location, which is the item given to the player
        Position(31725, 32434, 10),
        Position(31726, 32434, 10),
        Position(31727, 32434, 10),
        Position(31728, 32434, 10),
        Position(31729, 32434, 10),
    },

    items = {

        -- muito Raros

        {id = 34109, count = 1, chance = 1, raro = true}, -- bag you desire
        {id = 39546, count = 1, chance = 1, raro = true},-- primal bag
        {id = 43860, count = 1, chance = 1, raro = true}, -- bag you covet
        {id = 34326, count = 1, chance = 1, raro = true}, -- wicked witch

        -- raro
        {id = 37317, count = 1, chance = 2, raro = true}, -- roulette token
        {id = 22118, count = 100, chance = 2, raro = true},  -- Tibia Coins
        {id = 22721, count = 5, chance = 2, raro = true},  -- Gold Token
        {id = 22516, count = 5, chance = 2, raro = true},  -- Silver Token
        {id = 39693, count = 1, chance = 2, raro = true}, -- 25 years backpack

         -- semi raro
        {id = 37110, count = 1, chance = 4}, -- exalted core
        {id = 6529, count = 1, chance = 4}, -- soft boots
        {id = 28484, count = 10, chance = 4}, -- blueberry cupcake
        {id = 28485, count = 10, chance = 4}, -- strawberry cupcake
        {id = 28486, count = 10, chance = 4}, -- lemon cupcake

        -- incomum

        {id = 16175, count = 1, chance = 5}, -- shiny blade
        {id = 3043, count = 100, chance = 5}, -- Crystal Coin
        {id = 36724, count = 5, chance = 5}, -- strike enhancement
        {id = 36723, count = 5, chance = 5}, -- kooldown-aid
        {id = 36736, count = 5, chance = 5}, -- fire amplification
        {id = 36737, count = 5, chance = 5}, -- ice amplification
        {id = 36738, count = 5, chance = 5}, -- earth amplification
        {id = 36739, count = 5, chance = 5}, -- energy amplification
        {id = 36740, count = 5, chance = 5}, -- holy amplification
        {id = 36741, count = 5, chance = 5}, -- death amplification
        {id = 36742, count = 5, chance = 5}, -- physical amplification
        {id = 36725, count = 5, chance = 5}, -- stamina extension
        {id = 36729, count = 5, chance = 6}, -- fire resilience
        {id = 36730, count = 5, chance = 6}, -- ice resilience 
        {id = 36731, count = 5, chance = 6}, -- earth resilience
        {id = 36732, count = 5, chance = 6}, -- energy resilience
        {id = 36733, count = 5, chance = 6}, -- holy resilience
        {id = 36734, count = 5, chance = 6}, -- death resilience
        {id = 36735, count = 5, chance = 6}, -- physical resilience
        {id = 37317, count = 1, chance = 7},-- roulette token

        -- comum
        {id = 25718, count = 1, chance = 10}, -- temple teleport scroll -- item
        {id = 3734, count = 10, chance = 9}, -- blood herb
        {id = 3079, count = 1, chance = 9}, -- boots of haste
        {id = 3392, count = 5, chance = 9}, -- royal helmet
        
    },
    rouletteOptions = {
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
    },
}

local isRouletteRunning = false

local function addItemToPlayer(player, item)
    player:addItem(item.id, item.count)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Legal! Ganhou um " .. ItemType(item.id):getName() .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    if item.raro then
        Game.broadcastMessage(player:getName() .. " ganhou um item raro: " .. ItemType(item.id):getName() .. " na roleta!", MESSAGE_EVENT_ADVANCE)
    end
end

local function getRandomItem()
    local totalWeight = 0
    for _, item in ipairs(config.items) do
        totalWeight = totalWeight + item.chance
    end

    local randomWeight = math.random() * totalWeight
    local cumulativeWeight = 0
    for _, item in ipairs(config.items) do
        cumulativeWeight = cumulativeWeight + item.chance
        if randomWeight <= cumulativeWeight then
            return item
        end
    end
end

local function moveItems()
    for i = #config.positions, 2, -1 do
        local tile = Tile(config.positions[i - 1])
        local item = tile and tile:getTopDownItem()
        if item then
            item:moveTo(config.positions[i])
            Position(config.positions[i]):sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end
end

local function clearItems()
    for _, pos in ipairs(config.positions) do
        local tile = Tile(Position(pos))
        if tile then
            local item = tile:getTopDownItem()
            while item do
                item:remove()
                item = tile:getTopDownItem()
            end
        end
    end
end

local function createItemWithEffect(position, item)
    Game.createItem(item.id, item.count, Position(position))
    Position(position):sendMagicEffect(CONST_ME_MAGIC_BLUE)
end

local function getItemConfigById(itemId)
    for _, item in ipairs(config.items) do
        if item.id == itemId then
            return item
        end
    end
    return nil
end

local function rouletteAction(player)
    isRouletteRunning = true
    local steps = 50 + math.random(5, 10)  -- Número de passos que a roleta dará antes de parar
    local interval = 20  -- Intervalo

    local currentItem = getRandomItem()
    createItemWithEffect(config.positions[1], currentItem)

    for i = 1, steps do
        addEvent(function()
            moveItems()
            if i == steps then
                local winningItem = Tile(Position(config.positions[5])):getTopDownItem()
                if winningItem then
                    clearItems()
                    for _, pos in ipairs(config.positions) do
                        createItemWithEffect(pos, {id = winningItem:getId(), count = winningItem:getCount()})
                    end
                    local itemConfig = getItemConfigById(winningItem:getId())
                    addItemToPlayer(player, itemConfig)
                end
                isRouletteRunning = false
            else
                local lastPositionTile = Tile(Position(config.positions[#config.positions]))
                if lastPositionTile then
                    local lastItem = lastPositionTile:getTopDownItem()
                    if lastItem then
                        lastItem:remove()
                        Position(config.positions[#config.positions]):sendMagicEffect(CONST_ME_POFF)
                    end
                end
                currentItem = getRandomItem()
                createItemWithEffect(config.positions[1], currentItem)
            end
        end, i * interval)

        -- Aumentar o intervalo para simular a desaceleração
        interval = interval + 3
    end
end

local rouletteLever = Action()

function rouletteLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if isRouletteRunning then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Roleta funcionando. Por favor, espere.")
        return false
    end

    if item.actionid == config.actionId then
        if player:removeItem(config.requiredItemId, 1) then
            clearItems()
            rouletteAction(player)
            return true
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Precisa de um item especial para acionar a roleta.")
            return false
        end
    end
    return false
end

rouletteLever:aid(config.actionId)
rouletteLever:register()

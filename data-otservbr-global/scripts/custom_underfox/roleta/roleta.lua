local vocations = {
    [RouletteConfig.actionIds.druid] = "druid",
    [RouletteConfig.actionIds.knight] = "knight",
    [RouletteConfig.actionIds.paladin] = "paladin",
    [RouletteConfig.actionIds.sorcerer] = "sorcerer"
}

local function getConfigForVocation(actionId)
    local vocation = vocations[actionId]
    if not vocation then return nil end

    local vocationItems = RouletteConfig[vocation .. "Items"] or {}
    
    return {
        actionId = actionId,
        requiredItemId = RouletteConfig.requiredItemId,
        positions = RouletteConfig.positions[vocation],
        items = vocationItems,
        leverIds = RouletteConfig.leverIds
    }
end

local isRouletteRunning = false
local cleanupEventId = nil

local function addItemToPlayer(player, item)
    player:addItem(item.id, item.count)
    player:sendTextMessage(MESSAGE_LOOK, 'Recebeu ' .. ItemType(item.id):getName() .. '!')
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    if item.raro then
        Game.broadcastMessage(player:getName() .. " ganhou um item raro: " .. ItemType(item.id):getName() .. " na roleta!", MESSAGE_EVENT_ADVANCE)
    end
end

local function getRandomItem(config)
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

local function moveItems(config)
    for i = #config.positions, 2, -1 do
        local tile = Tile(config.positions[i - 1])
        local item = tile and tile:getTopDownItem()
        if item then
            item:moveTo(config.positions[i])
            Position(config.positions[i]):sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end
end

local function clearItems(config)
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

local function getItemConfigById(itemId, config)
    for _, item in ipairs(config.items) do
        if item.id == itemId then
            return item
        end
    end
    return nil
end

local function rouletteAction(player, item, config)
    isRouletteRunning = true
    
    -- Cancela qualquer limpeza pendente
    if cleanupEventId then
        stopEvent(cleanupEventId)
        cleanupEventId = nil
    end
    
    item:transform(config.leverIds.activated)
    
    local steps = 50 + math.random(5, 10)
    local interval = 20

    local currentItem = getRandomItem(config)
    createItemWithEffect(config.positions[1], currentItem)

    for i = 1, steps do
        addEvent(function()
            moveItems(config)
            if i == steps then
                local winningItem = Tile(Position(config.positions[5])):getTopDownItem()
                if winningItem then
                    clearItems(config)
                    for _, pos in ipairs(config.positions) do
                        createItemWithEffect(pos, {id = winningItem:getId(), count = winningItem:getCount()})
                    end
                    local itemConfig = getItemConfigById(winningItem:getId(), config)
                    addItemToPlayer(player, itemConfig)
                    
                    -- Agenda a nova limpeza
                    cleanupEventId = addEvent(function()
                        if not isRouletteRunning then  -- Só limpa se a roleta não estiver rodando
                            clearItems(config)
                            for _, pos in ipairs(config.positions) do
                                Position(pos):sendMagicEffect(CONST_ME_POFF)
                            end
                        end
                        cleanupEventId = nil
                    end, 10000)

                end
                item:transform(config.leverIds.normal)
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
                currentItem = getRandomItem(config)
                createItemWithEffect(config.positions[1], currentItem)
            end
        end, i * interval)

        interval = interval + 3
    end
end

local roulette = Action()

function roulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if isRouletteRunning then
        player:sendTextMessage(MESSAGE_LOOK, 'Roleta funcionando. Por favor, espere.')
        return false
    end

    local config = getConfigForVocation(item.actionid)
    if not config then
        return false
    end

    -- Adicionar items comuns à configuração
    for _, commonItem in ipairs(RouletteConfig.commonItems) do
        table.insert(config.items, commonItem)
    end

    if player:removeItem(config.requiredItemId, 1) then
        clearItems(config)  -- Passa a config como parâmetro
        rouletteAction(player, item, config)
        return true
    else
        player:sendTextMessage(MESSAGE_LOOK, 'Precisa de um roulette token acionar a roleta.')
        return false
    end
end

-- Registrar a action para todas as vocações
for actionId, _ in pairs(vocations) do
    roulette:aid(actionId)
end
roulette:register()

local config = {
    leverPositions = {
        [1] = Position(31745, 32436, 10),
        [2] = Position(31724, 32436, 10),
        [3] = Position(31703, 32436, 10),
    },
    
    lever = {
        left = 8911,
        right = 8912
    },
    playItem = {
        itemId = 37317, -- item required to pull lever
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 1,
        ignoredItems = {1617}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 4, max = 4}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = 48550 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },
    prizePool = {
        [1] = {
            {itemId = 14000, count = {1, 1}, chance = 500}, --Ornate Shield
            {itemId = 22118, count = {20, 100}, chance = 1000}, -- Tibia Coins
            {itemId = 25718, count = {50, 100}, chance = 9000}, -- temple teleport scroll -- item
            {itemId = 3079, count = {1, 1}, chance = 5000 }, -- boots of haste
            {itemId = 3278, count = {1, 1}, chance = 5000}, -- Magic Longsword
            {itemId = 3364, count = {1, 1}, chance = 1000}, -- golden legs 
            {itemId = 34109, count = {1, 1}, chance = 450}, -- bag you desire
        },
        [2] = {
            {itemId = 39546, count = {1, 1}, chance = 400}, -- primal bag
            {itemId = 9803, count = {1, 1}, chance = 1100}, -- friendship amulet
            {itemId = 37110, count = {1, 1}, chance = 4200}, -- exalted core
            {itemId = 3363, count = {1, 1}, chance = 4000}, -- DSL
            {itemId = 34326, count = {1, 1}, chance = 700}, -- wicked witch
            {itemId = 37317, count = {1, 3}, chance = 4000 }, -- roulette token
            {itemId = 3366, count = {1, 1}, chance = 1500 }, -- magic plate armor
        },
        [3] = {
            {itemId = 3555, count = {1, 1}, chance = 500  },  -- golden boots    
            {itemId = 3079, count = {1, 1}, chance = 8500 }, -- boots of haste
            {itemId = 3392, count = {1, 1}, chance = 7500 }, -- royal helmet
            {itemId = 35607, count = {1, 1}, chance = 3600}, -- diamond necklace
            {itemId = 37061, count = {1, 1}, chance = 2000}, -- Evora
            {itemId = 3043, count = {20, 100}, chance = 4000},
            {itemId = 3423, count = {1, 1}, chance = 1600},
        },
    },
    roulettePositions = { 
        [1] = { -- lista lista de posições de itens da alavanca 1
            Position(31742, 32434, 10),
            Position(31743, 32434, 10),
            Position(31744, 32434, 10),
            Position(31745, 32434, 10),
            Position(31746, 32434, 10),
            Position(31747, 32434, 10),
            Position(31748, 32434, 10),
        },
        [2] = { -- lista lista de posições de itens da alavanca 2
            Position(31721, 32434, 10),
            Position(31722, 32434, 10),
            Position(31723, 32434, 10),
            Position(31724, 32434, 10),
            Position(31725, 32434, 10),
            Position(31726, 32434, 10),
            Position(31727, 32434, 10),
        },
        [3] = { -- lista lista de posições de itens da alavanca 3
            Position(31700, 32434, 10),
            Position(31701, 32434, 10),
            Position(31702, 32434, 10),
            Position(31703, 32434, 10),
            Position(31704, 32434, 10),
            Position(31705, 32434, 10),
            Position(31706, 32434, 10),
        },
    }
}

local chancedItems = {} -- used for broadcast. don't edit

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo, positions)
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 7 then
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

local function clearRoulette(newItemInfo, positions)
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
    
    -- Modificação aqui para garantir que percorre as sub-tabelas de prizePool
    while #rewardTable < 1 do
        for i, prizeGroup in ipairs(config.prizePool) do
            for j, prize in ipairs(prizeGroup) do
                if prize.chance >= math.random(10000) then
                    rewardTable[#rewardTable + 1] = prize
                end
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = rewardTable[rand].itemId
    newItemInfo.count = math.random(rewardTable[rand].count[1], rewardTable[rand].count[2])
    chancedItems[#chancedItems + 1] = rewardTable[rand].chance
    
    return newItemInfo
end


-- Função para exibir o prêmio na roleta
local function displayPrizePool(leverPosition)
    -- Identifica o índice da alavanca com base na posição
    local leverIndex = nil
    for index, position in pairs(config.leverPositions) do
        if position == leverPosition then
            leverIndex = index
            break
        end
    end

    if not leverIndex then
        print("Erro: Posição da alavanca não encontrada.")
        return
    end

    -- Pega as posições da roleta com base no índice da alavanca
    local positions = config.roulettePositions[leverIndex]
    
    if not positions then
        print("Erro: Posições da roleta não encontradas para o índice da alavanca.")
        return
    end
    
    -- Remove todos os itens da roleta
    clearRoulette(nil, positions)
    
    -- Exibe os itens do prizePool nas posições
    local prizePool = config.prizePool[leverIndex]
    if not prizePool then
        print("Erro: Prize pool não encontrado para o índice da alavanca.")
        return
    end
    
    for i = 1, #prizePool do
        local prize = prizePool[i]
        local position = positions[i] -- Assume que as posições estão alinhadas com a lista de prêmio
        
        if position and prize then
            if ItemType(prize.itemId):getCharges() then
                local item = Game.createItem(prize.itemId, 1, position)
                item:setAttribute("charges", prize.count[1]) -- Exemplo de contagem, ajuste conforme necessário
            else
                Game.createItem(prize.itemId, prize.count[1], position) -- Usa o primeiro valor do intervalo para contagem
            end
        end
    end
end


local function initiateReward(leverPosition, effectCounter, positions)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            positions[1]:sendDistanceEffect(positions[4], config.rouletteOptions.winEffects[1])
            positions[7]:sendDistanceEffect(positions[4], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #positions do
                positions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(positions[4]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo, positions)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter, positions)
        return
    end
    clearRoulette(newItemInfo, positions)
    resetLever(leverPosition)
    displayPrizePool(leverPosition)
end

-- Função para premiar o jogador
local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    -- Acessa a posição correta baseada na leverPosition
    local leverIndex = nil
    for index, position in pairs(config.leverPositions) do
        if position == leverPosition then
            leverIndex = index
            break
        end
    end
    
    if not leverIndex then
        print("Erro: Posição da alavanca não encontrada.")
        return
    end

    local positions = config.roulettePositions[leverIndex]
    local item = Tile(positions[4]):getTopVisibleThing()
    
    -- Verifica se o item não é nil
    if not item then
        print("Erro: Nenhum item encontrado na posição esperada.")
        return
    end

    if ItemType(item:getId()):getCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
    end
    player:sendTextMessage(MESSAGE_LOOK, "You has won " .. item:getName() .. " from the roulette!")
end

-- Função para gerenciar a roleta
local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        clearRoulette(nil, positions)
        return
    end

    -- Identifica o índice da alavanca com base na posição
    local leverIndex = nil
    for index, position in pairs(config.leverPositions) do
        if position == leverPosition then
            leverIndex = index
            break
        end
    end

    if not leverIndex then
        print("Erro: Posição da alavanca não encontrada.")
        return
    end

    -- Pega as posições da roleta com base no índice da alavanca
    local positions = config.roulettePositions[leverIndex]

    -- Substitua config.roulettePositions pelo valor de `positions` em updateRoulette e clearRoulette
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo, positions)

    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0, positions)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

-- Evento onUse para gerenciar o uso da alavanca
function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local function getPositionTileItem(pos)
        local p = player:getPosition()
        local xDiff = pos.x - p.x
        local yDiff = pos.y - p.y

        if math.abs(xDiff) <= 1 and math.abs(yDiff) <= 1 then
            return true
        end

        return false
    end

    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Casino Roulette is currently in progress. Please wait.")
        return true
    end

    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_LOOK, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
    end
    
    item:transform(config.lever.right)

    -- Definindo positions de acordo com a leverPosition antes de chamar clearRoulette
    local positions
    if toPosition == config.leverPositions[1] then
        positions = config.roulettePositions[1]
    elseif toPosition == config.leverPositions[2] then
        positions = config.roulettePositions[2]
    elseif toPosition == config.leverPositions[3] then
        positions = config.roulettePositions[3]
    end

    -- Chama clearRoulette com a variável positions corretamente inicializada
    clearRoulette(nil, positions)
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:id(8911)
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
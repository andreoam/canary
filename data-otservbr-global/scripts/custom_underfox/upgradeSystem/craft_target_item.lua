-- upgradeSystem library
dofile(DATA_DIRECTORY .. "/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")

local craftSystem = {}

-- Construindo a tabela craftSystem dinamicamente
for name, config in pairs(Upgrade_System_config) do
    if type(config) == "table" and config.enable and config.gem and config.itemId then
        craftSystem[config.gem] = {
            reward = { 
                id = config.minedgem, 
                name = string.format("%s mined stone", name:lower())
            }
        }
    end
end

local anvil = Upgrade_System_itemForge.anvilOn -- ID da bigorna
local validUniqueId = Upgrade_System_config.forge -- UniqueID do sistema de upgrade
local hammer = Upgrade_System_itemForge.hammer -- ID do martelo

local ForgeCreation = Action()

function ForgeCreation.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    
    -- Primeiro verifica se o alvo é uma pedra válida
    if craftSystem[target:getId()] then
        local tile = Tile(toPosition)
        if not tile then
            return false
        end

        local foundAnvil = false
        for _, tileItem in ipairs(tile:getItems()) do
            if tileItem:getId() == anvil and tileItem:getUniqueId() == validUniqueId then
                foundAnvil = true
                break
            end
        end

        if not foundAnvil then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need to place the stone on an anvil first.')
            toPosition:sendMagicEffect(CONST_ME_POFF)
            return true
        end

        -- Se encontrou a bigorna, usa a pedra alvo como stone
        stone = target
    else
        -- Código original para quando clicar na bigorna
        if target:getId() ~= anvil then
            return false
        end
        
        if target:getUniqueId() ~= validUniqueId then
            return false
        end

        -- Verifica se tem uma pedra na posição
        local tile = Tile(toPosition)
        if not tile then
            return false
        end

        stone = nil
        for _, item in ipairs(tile:getItems()) do
            if craftSystem[item:getId()] then
                stone = item
                break
            end
        end

        if not stone then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need to place a stone on the anvil first.')
            toPosition:sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

    -- Adiciona skill tries
    player:addSkillTries(SKILL_FIST, 1)

    -- Chance baseada no skill (máximo 30% no skill 100)
    local craftChance = math.min(math.max(5 + (player:getEffectiveSkillLevel(SKILL_FIST) - 10) * 0.25, 5), 30)
    if math.random(1, 100) > craftChance then
        stone:remove(1) -- Remove a pedra em caso de falha
        toPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Cria o item de sucesso
    local reward = craftSystem[stone:getId()].reward
    local item = player:addItem(reward.id, 1)
    if item then
        -- Captura o nome da pedra procurando na configuração
        local stoneName
        for name, config in pairs(Upgrade_System_config) do
            if type(config) == "table" and config.itemId == reward.id then
                stoneName = name
                break
            end
        end

        if stoneName then
            local itemName = string.format("%s mined stone", stoneName:lower())
            local pluralName = string.format("%s mined stones", stoneName:lower())
            
            item:setName(itemName)
            item:setAttribute(ITEM_ATTRIBUTE_PLURALNAME, pluralName)
            item:setCustomAttribute("tool", "stone mined")
            item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "This item is used to upgrade equipment.\nFirst trade it with Haldor") 
        end
    end

    stone:remove(1) -- Remove a pedra usada
    toPosition:sendMagicEffect(CONST_ME_FIREAREA)
    player:sendTextMessage(MESSAGE_LOOT, 'You successfully crafted ' .. reward.name .. '.')
    return true
end

ForgeCreation:id(hammer)
ForgeCreation:register()
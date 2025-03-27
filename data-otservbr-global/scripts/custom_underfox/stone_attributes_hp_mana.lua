local config = {
    stoneId = 9632, -- item que da o boost no item
    removeStoneItem = true, -- se vai remover ao usar
    chanceBonus = "stoneAttributesChanceBonus",
    maxAttributes = 100, -- valor maximo de todos os atributos
    effectSucess = CONST_ME_FIREWORK_YELLOW,
    effectFailed = CONST_ME_POFF,
    soundSucess = SOUND_EFFECT_TYPE_ACTION_NOTIFICATION,
    soundFailed = SOUND_EFFECT_TYPE_ACTION_WOOD_PIECES_FALL,
    options = {
        health = {
            enabled = true, stonePerUse = 1, chanceEnabled = false, chance = 0.30,
            attributeId = "stoneAttributesHealth",
            value = {
                [1] = 22, -- sorcerer
                [2] = 26, -- druid
                [3] = 32, -- paladin
                [4] = 40, -- knight
            }
        },
        mana = {
            enabled = true, stonePerUse = 1, chanceEnabled = true, chance = 0.30,
            attributeId = "stoneAttributesMana",
            value = {
                [1] = 40, -- sorcerer
                [2] = 32, -- druid
                [3] = 26, -- paladin
                [4] = 22, -- knight
            }
        },
    },
}

function stoneMain(player, button, choice)
    local window = ModalWindow{
        title = "Stone Attributes",
        message = "Select one of the attributes options."
        }
        if config.options.health.enabled == true then
            window:addChoice("Health", function() openStoneHealth(player) end)
        end
        if config.options.mana.enabled == true then
            window:addChoice("Mana", function() openStoneMana(player) end)
        end
        window:addButton("Select")
        window:addButton("Exit", function() closeStoneAttributes(player) end)
        window:sendToPlayer(player)
    return true
end

function openStoneHealth(player, button, choice)
    local playerKV = player:kv()
    local posTo = player:getPosition()
    local oldHealth = player:getMaxHealth()
    local vocationId = player:getVocation():getId()
	if vocationId <= 0 then return true end
    local healthIncrease = config.options.health.value[vocationId]
    local newHealth = player:getMaxHealth() + healthIncrease
    local healthPoints = playerKV:get(config.options.health.attributeId)
    local chanceBonus = playerKV:get(config.chanceBonus)
    local chance = math.random()
    --playerKV:set(config.chanceBonus, 0.7)
    --playerKV:set(config.options.health.attributeId, 0)
    healthPoints = healthPoints or 0
    chanceBonus = chanceBonus or 0
    if healthPoints < config.maxAttributes then
    if player:getItemCount(config.stoneId) >= 1 then
        if config.options.health.chanceEnabled == true then
            if chance <= config.options.health.chance + chanceBonus then
                player:removeItem(config.stoneId, 1)
                posTo:sendMagicEffect(config.effectSucess)
                posTo:sendSingleSoundEffect(config.soundSucess, player:isInGhostMode() and nil or player)
                player:addHealth(newHealth)
                player:setMaxHealth(newHealth)
                playerKV:set(config.options.health.attributeId, healthPoints + 1)
                local window = ModalWindow{
                    title = "Stone Attributes",
                    message = "Health Gain Sucess."
                }
                window:addChoice("Old Health: "..oldHealth)
                window:addChoice("New Health: "..newHealth)
                window:addChoice("Limit: ".. playerKV:get(config.options.health.attributeId) .."/"..config.maxAttributes)
                window:addButton("Again", function() openStoneHealth(player) end)
                window:addButton("Back", function() stoneMain(player) end)
                window:addButton("Exit", function() closeStoneAttributes(player) end)
                window:sendToPlayer(player)
            
            else
            
                posTo:sendSingleSoundEffect(config.soundFailed, player:isInGhostMode() and nil or player)
                posTo:sendMagicEffect(config.effectFailed)
                player:removeItem(config.stoneId, 1)
                local window = ModalWindow{
                    title = "Stone Attributes",
                    message = "Health Gain Failed."
                }
                window:addChoice("Old Health: "..oldHealth)
                window:addChoice("Failed New Health: "..newHealth)
                window:addButton("Again", function() openStoneHealth(player) end)
                window:addButton("Back", function() stoneMain(player) end)
                window:addButton("Exit", function() closeStoneAttributes(player) end)
                window:sendToPlayer(player)
            end
        else
            player:removeItem(config.stoneId, 1)
            posTo:sendMagicEffect(config.effectSucess)
            posTo:sendSingleSoundEffect(config.soundSucess, player:isInGhostMode() and nil or player)
            player:addHealth(newHealth)
            player:setMaxHealth(newHealth)
            playerKV:set(config.options.health.attributeId, healthPoints + 1)
            local window = ModalWindow{
                title = "Stone Attributes",
                message = "Health Gain Sucess."
            }
            window:addChoice("Old Health: "..oldHealth)
            window:addChoice("New Health: "..newHealth)
            window:addChoice("Limit: ".. playerKV:get(config.options.health.attributeId) .."/"..config.maxAttributes)
            window:addButton("Again", function() openStoneHealth(player) end)
            window:addButton("Back", function() stoneMain(player) end)
            window:addButton("Exit", function() closeStoneAttributes(player) end)
            window:sendToPlayer(player)
        end
    else
        local window = ModalWindow{
            title = "Stone Attributes",
            message = "You do not have enough stones."
        }
        window:addChoice("Need is: ".. config.options.health.stonePerUse .. " stones")
        window:addChoice("You have: ".. player:getItemCount(config.stoneId).. " stones")
        window:addButton("Back", function() stoneMain(player) end)
        window:addButton("Exit", function() closeStoneAttributes(player) end)
        window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(config.soundFailed, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(config.effectFailed)
    end
    else
        local window = ModalWindow{
            title = "Stone Attributes",
            message = "You have the maximum attribute bonus allowed."
        }
        window:addChoice("Points Awarded: ".. playerKV:get(config.options.health.attributeId) .. "")
        window:addButton("Back", function() stoneMain(player) end)
        window:addButton("Exit", function() closeStoneAttributes(player) end)
        window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(config.soundFailed, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(config.effectFailed)
    end
    return true
end

function openStoneMana(player, button, choice)
    local playerKV = player:kv()
    local posTo = player:getPosition()
    local oldMana = player:getMaxMana()
    local vocationId = player:getVocation():getId()
	if vocationId <= 0 then return true end
    local manaIncrease = config.options.mana.value[vocationId]
    local newMana = player:getMaxMana() + manaIncrease
    local manaPoints = playerKV:get(config.options.mana.attributeId)
    local chanceBonus = playerKV:get(config.chanceBonus)
    local chance = math.random()
    --playerKV:set(config.chanceBonus, 0.7)
    --playerKV:set(config.options.mana.attributeId, 0)
    manaPoints = manaPoints or 0
    chanceBonus = chanceBonus or 0
    if manaPoints < config.maxAttributes then
    if player:getItemCount(config.stoneId) >= 1 then
        if config.options.mana.chanceEnabled == true then
            if chance <= config.options.mana.chance + chanceBonus then
                player:removeItem(config.stoneId, 1)
                posTo:sendMagicEffect(config.effectSucess)
                posTo:sendSingleSoundEffect(config.soundSucess, player:isInGhostMode() and nil or player)
                player:addMana(newMana)
                player:setMaxMana(newMana)
                playerKV:set(config.options.mana.attributeId, manaPoints + 1)
                local window = ModalWindow{
                    title = "Stone Attributes",
                    message = "Mana Gain Sucess."
                }
                window:addChoice("Old Mana: "..oldMana)
                window:addChoice("New Mana: "..newMana)
                window:addChoice("Limit: ".. playerKV:get(config.options.mana.attributeId) .."/"..config.maxAttributes)
                window:addButton("Again", function() openStoneMana(player) end)
                window:addButton("Back", function() stoneMain(player) end)
                window:addButton("Exit", function() closeStoneAttributes(player) end)
                window:sendToPlayer(player)
            
            else
            
                posTo:sendSingleSoundEffect(config.soundFailed, player:isInGhostMode() and nil or player)
                posTo:sendMagicEffect(config.effectFailed)
                player:removeItem(config.stoneId, 1)
                local window = ModalWindow{
                    title = "Stone Attributes",
                    message = "Mana Gain Failed."
                }
                window:addChoice("Old Mana: "..oldMana)
                window:addChoice("Failed New Mana: "..newMana)
                window:addButton("Again", function() openStoneMana(player) end)
                window:addButton("Back", function() stoneMain(player) end)
                window:addButton("Exit", function() closeStoneAttributes(player) end)
                window:sendToPlayer(player)
            end
        else
            player:removeItem(config.stoneId, 1)
            posTo:sendMagicEffect(config.effectSucess)
            posTo:sendSingleSoundEffect(config.soundSucess, player:isInGhostMode() and nil or player)
            player:addMana(newMana)
            player:setMaxMana(newMana)
            playerKV:set(config.options.mana.attributeId, manaPoints + 1)
            local window = ModalWindow{
                title = "Stone Attributes",
                message = "Mana Gain Sucess."
            }
            window:addChoice("Old Mana: "..oldMana)
            window:addChoice("New Mana: "..newMana)
            window:addChoice("Limit: ".. playerKV:get(config.options.mana.attributeId) .."/"..config.maxAttributes)
            window:addButton("Again", function() openStoneMana(player) end)
            window:addButton("Back", function() stoneMain(player) end)
            window:addButton("Exit", function() closeStoneAttributes(player) end)
            window:sendToPlayer(player)
        end
    else
        local window = ModalWindow{
            title = "Stone Attributes",
            message = "You do not have enough stones."
        }
        window:addChoice("Need is: ".. config.options.mana.stonePerUse .. " stones")
        window:addChoice("You have: ".. player:getItemCount(config.stoneId).. " stones")
        window:addButton("Back", function() stoneMain(player) end)
        window:addButton("Exit", function() closeStoneAttributes(player) end)
        window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(config.soundFailed, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(config.effectFailed)
    end
    else
        local window = ModalWindow{
            title = "Stone Attributes",
            message = "You have the maximum attribute bonus allowed."
        }
        window:addChoice("Points Awarded: ".. playerKV:get(config.options.mana.attributeId) .. "")
        window:addButton("Back", function() stoneMain(player) end)
        window:addButton("Exit", function() closeStoneAttributes(player) end)
        window:sendToPlayer(player)
        player:getPosition():sendSingleSoundEffect(config.soundFailed, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(config.effectFailed)
    end
    return true
end

function closeStoneAttributes(player, button, choice)
    return true
end

local stoneAttributes = Action()

function stoneAttributes.onUse(player, item, fromPosition, target, toPosition, isHotkey, tilePosition)
    if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Can only be used in a protected area.")
        return true
	end
    
    stoneMain(player)

    return true
end

stoneAttributes:id(config.stoneId)
stoneAttributes:register()
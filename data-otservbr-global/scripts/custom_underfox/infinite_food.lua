local foodAmount = 30 -- Quantidade de food adicionada ao jogador

local infiniteFood = Action()

function infiniteFood.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
    if condition and math.floor(condition:getTicks() / 1000 + (foodAmount * 12)) >= 1200 then
        player:sendTextMessage(MESSAGE_FAILURE, "You are full.")
        return true
    end

    player:feed(foodAmount * 12)
    player:say("Mmmm.", TALKTYPE_MONSTER_SAY)
    player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_EAT, player:isInGhostMode() and nil or player)
    -- Não remove o item, mantendo-o infinito
    return true
end

infiniteFood:id(49414) -- ID do item (pizza)
infiniteFood:register()

local charmItemId = 60221  -- substitua pelo ID do item que dará os pontos de charm
local charmPointsAmount = 350  -- quantidade de pontos de charm que o jogador vai ganhar ao usar o item

local charmAction = Action()

function charmAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Adiciona pontos de charm ao jogador
    player:addCharmPoints(charmPointsAmount)

    -- Feedback para o jogador
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received " .. charmPointsAmount .. " charm points!")

    -- Efeito visual
    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

    -- Remove o item após o uso (opcional, dependendo se você quer que o item seja consumível)
    item:remove(1)

    return true
end

-- Configura o ID do item para a ação
charmAction:id(60221)
charmAction:register()
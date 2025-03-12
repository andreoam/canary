local config = {
    teleportActionId = 44222
}

local vipEnter = MoveEvent()
function vipEnter.onStepIn(player, item, position, fromPosition)
    if not player then
        return false
    end

    if player:isVip() then
        return true
    end
    player:teleportTo(fromPosition)
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be VIP to pass.")

end
vipEnter:aid(config.teleportActionId)
vipEnter:register()
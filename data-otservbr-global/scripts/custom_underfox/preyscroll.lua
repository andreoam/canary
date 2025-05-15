local preyscroll = Action()

function preyscroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:remove(1) then
        player:addPreyCards(15)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 15 prey cards.')
    end
	return true
end

preyscroll:id(49506)
preyscroll:register()

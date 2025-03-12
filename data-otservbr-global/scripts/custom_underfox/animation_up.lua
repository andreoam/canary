function onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	local position = player:getPosition()
	local positions = {
		[1] = Position(position.x, position.y, position.z),
		
	}
	
	local efeito = 50
	local shot = 31
	
	if newLevel > oldLevel then
		for _, pos in ipairs(positions) do
			position:sendDistanceEffect(pos, shot)
			pos:sendMagicEffect(efeito)
		end
		player:say("[LEVEL UP]", TALKTYPE_MONSTER_SAY)
		position:sendMagicEffect(40)
	end

	return true
end
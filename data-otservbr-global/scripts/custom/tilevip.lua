local config = {
    -- Coloca as posições que vc quer aqui
    {x = 17610, y = 17524, z = 6},
    {x = 17610, y = 17525, z = 6},
    {x = 17610, y = 17526, z = 6},
    {x = 17696, y = 17314, z = 7}, -- Dragons
}

local vipTile = MoveEvent()
function vipTile.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()

    if not player then
        return false
    end

        for value in pairs(config) do
            if Position(config[value]) == player:getPosition() then
                if player:isVip() then
                    return true
                end
                player:teleportTo(fromPosition)
                fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be VIP to pass.")
                return true
            end
        end
end

for value in pairs(config) do
    vipTile:position(config[value])
end

vipTile:register()
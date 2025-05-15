local setting = {
    -- [5000] = { position = Position(489, 168, 7), minLevel = 250 },
    -- [5001] = { position = Position(520, 103, 7), minLevel = 500, needVip = true, requiredKeyValue = "ferumbras-acess" },

    [5004] = { position = Position(1116, 1092, 7) }, -- Trainers
    [5005] = { position = Position(17660, 17373, 7) }, -- hunts


}

local teleportLocationsEvent = MoveEvent()

function teleportLocationsEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local settingData = setting[item.actionid]
    if not settingData then
        return true
    end

    if settingData.minLevel and player:getLevel() < settingData.minLevel then
        player:sendTextMessage(MESSAGE_STATUS, "You need to be at least level " .. settingData.minLevel .. " to enter this portal.")
        player:teleportTo(fromPosition, true)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end

    if settingData.needVip and not player:isVip() then
        player:sendTextMessage(MESSAGE_STATUS, "You need to be a VIP to enter this portal.")
        player:teleportTo(fromPosition, true)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end

    if settingData.requiredKeyValue and not player:kv():get(settingData.requiredKeyValue) then
        player:sendTextMessage(MESSAGE_STATUS, "You need to have access to enter this portal.")
        player:teleportTo(fromPosition, true)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end

    local teleportPosition = settingData.position
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(teleportPosition)
    teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

teleportLocationsEvent:type("stepin")

for index, _ in pairs(setting) do
    teleportLocationsEvent:aid(index)
end

teleportLocationsEvent:register()
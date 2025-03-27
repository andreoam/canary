dofile("data-otservbr-global/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")
local upgradeSystem_repair = Action()
function upgradeSystem_repair.onUse(player, item, fromPosition, target, toPosition, isHotkey, tilePosition)
    if target:getCustomAttribute("tool") ~= "upgrade tool" then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only repair upgrade tools.")
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end
    
    local durabilityDown = item:getCustomAttribute("durability")
    local durability = target:getCustomAttribute("durability")
    local category
    local categoryTarget = target:getCustomAttribute("rank")
    if categoryTarget then
        categoryTarget = categoryTarget:gsub("^%l", string.upper)
    else
        categoryTarget = category
    end
    category = item:getCustomAttribute("rank"):gsub("^%l", string.upper)
    local randomDurability = math.random()
    local decimalDurability = math.random(0, 4)
    local remainingDurability = 100 - durability
    local repairAmount = math.min(durabilityDown, remainingDurability)
    if durabilityDown < durability then
        durability = math.min(100, durability + repairAmount)
        durabilityDown = math.max(0, durabilityDown - repairAmount)
    else
        durability = math.min(100, durability + remainingDurability)
        durabilityDown = math.max(0, durabilityDown - remainingDurability)
    end

    if target:getCustomAttribute("break") == true or target:getCustomAttribute("durability") < 100 then
        if category == categoryTarget then
        item:setCustomAttribute("durability", durabilityDown)
        item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION,
            "Rank: " .. category .. "\nDurability: " .. string.format("%.2f", durabilityDown) .. "%")
        target:setCustomAttribute("durability", durability)
        target:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION,
            "Rank: " .. category .. "\nDurability: " .. string.format("%.2f", durability) .. "%")
        if durabilityDown < durability then
            player:say('Tool Durability: +' .. string.format('%.2f', repairAmount) .. '%'..'\nRepair Tool Durability: -' .. string.format('%.2f', repairAmount) .. '%.')
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Tool ".. categoryTarget .." durability has been restored by ".. string.format('%.2f', repairAmount) .." for a total of ".. string.format("%.2f", durability) ..".")
        else
        player:say('Tool Durability: +' .. string.format('%.2f', remainingDurability) .. '%'..'\nRepair Tool Durability: -' .. string.format('%.2f', remainingDurability) .. '%.')
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Tool ".. categoryTarget .." durability has been restored by ".. string.format('%.2f', remainingDurability) .." for a total of ".. string.format("%.2f", durability) ..".")
        end
        if target:getCustomAttribute("durability") >= 100 then
            target:setCustomAttribute("break", false)
        end
        if durabilityDown <= 0 then
            item:remove()
            player:say('Repair Tool Broke !!!')
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The repair tool broke during the repair process.")
        end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The repair tool is not compatible with the upgrade tool, both must have the same rank.")
            player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your tool is broken, repair it first before trying to forge.")
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
    end
    return true
end


upgradeSystem_repair:aid(Upgrade_System_config.actionId.repairtool)
upgradeSystem_repair:register()
dofile("data-otservbr-global/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")
local leotk_upgradeSystem_extraction = Action()
function leotk_upgradeSystem_extraction.onUse(player, item, fromPosition, target, toPosition, isHotkey, tilePosition)
    local category = item:getCustomAttribute("rank"):gsub("^%l", string.upper)
    local categoryTarget = target:getCustomAttribute("rank")
    if categoryTarget then
        categoryTarget = categoryTarget:gsub("^%l", string.upper)
    else
        categoryTarget = category
    end
    local targetItem = target:getId()
    local targetName = target:getName()
    local itemName = item:getName()
    local itemType = ItemType(target:getId())
    local durability = item:getCustomAttribute("durability")
    local elementType = itemType:getElementType()
    local elementDamage = itemType:getElementDamage()
    local armor = itemType:getArmor()
    local attack = itemType:getAttack()
    local defense = itemType:getDefense()
    local hitChance = itemType:getHitChance()
    local chance = math.random()
    local tier = target:getTier()
    local function cleanName(name)
        return name:gsub("%s%+%d+$", "")
    end
    local getUpgrade = target:getCustomAttribute("upgrade")
    local currentUpgrade = getUpgrade or 0
    local categoryName = item:getName()
    local attackTypeName = LeoTK_Upgrade_System_attackTypes[elementType] or "None"
    local upgradeConfig = LeoTK_Upgrade_System_config[category]
    local currentArmor = target:getCustomAttribute("armor") or 0
    local currentAttack = target:getCustomAttribute("attack") or 0
    local currentHitChance = target:getCustomAttribute("hitChance") or 0
    local currentElement = target:getCustomAttribute("element") or 0
    local currentDefense = target:getCustomAttribute("defense") or 0
    local currentMagicAttack = target:getCustomAttribute("magicAttack") or 0
    local newUpgrade = currentUpgrade + (upgradeConfig.addLevel or 0)
    local downUpgrade = currentUpgrade - (upgradeConfig.addLevel or 0)
    local newArmor = (currentUpgrade > 0) and (currentArmor + upgradeConfig.addArmor) or (armor + upgradeConfig.addArmor)
    local newAttack = (currentUpgrade > 0) and (currentAttack + upgradeConfig.addAttack) or (attack + upgradeConfig.addAttack)
    local newHitChance = (currentUpgrade > 0) and (currentHitChance + upgradeConfig.addHitChance) or (hitChance + upgradeConfig.addHitChance)
    local newElement = (currentUpgrade > 0) and (currentElement + upgradeConfig.addElement) or (elementDamage + upgradeConfig.addElement)
    local newDefense = (currentUpgrade > 0) and (currentDefense + upgradeConfig.addDefense) or (defense + upgradeConfig.addDefense)
    local newMagicAttack = (currentUpgrade > 0) and (currentMagicAttack + upgradeConfig.addAttack) or (attack + upgradeConfig.addAttack)
    local armorDescription = ""
    local attackDescription = ""
    local hitChanceDescription = ""
    local defenseDescription = ""
    local elementDamageDescription = ""
    local magicAttackDescription = ""
    if currentUpgrade > 0 and item:getCustomAttribute("tool") == "extract tool" then
        if category == categoryTarget then
            item:setCustomAttribute("tool", "condensed tool")
            item:setCustomAttribute("upgrade", currentUpgrade)
            item:setCustomAttribute("armor", currentArmor)
            item:setCustomAttribute("attack", currentAttack)
            item:setCustomAttribute("hitChance", currentHitChance)
            item:setCustomAttribute("element", currentElement)
            item:setCustomAttribute("defense", currentDefense)
            item:setCustomAttribute("magicAttack", currentMagicAttack)
            item:setCustomAttribute("Type", itemType:getType())
            target:remove()
            local inbox = player:getStoreInbox()
            local itemAdd = inbox:addItem(target:getId(), 1, true)
            itemAdd:setTier(tier)
            local cleanUpgrade = cleanName(itemAdd:getName())
            local newName
            if currentUpgrade > 0 then
                newName = cleanUpgrade
            else
                newName = ""
            end
            itemAdd:setName(newName)
            if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                armorDescription = ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, armor)
                itemAdd:setCustomAttribute("armor", 0)
            end
            if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                attackDescription = ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, attack)
                itemAdd:setCustomAttribute("attack", 0)
            end
            if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                hitChanceDescription = ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, hitChance)
                itemAdd:setCustomAttribute("hitChance", 0)
            end
            if elementDamage > 0 and upgradeConfig.addElement > 0 then
                elementDamageDescription = ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, elementDamage)
                itemAdd:setCustomAttribute("element", 0)
            end
            if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                defenseDescription = ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, defense)
                itemAdd:setCustomAttribute("defense", 0)
            end
            if itemType:getType() == ITEM_TYPE_WAND then
                magicAttackDescription = ""
                itemAdd:setCustomAttribute("magicAttack", 0)
            end
            itemAdd:setCustomAttribute("upgrade", 0)
            if currentUpgrade > 0 then
                local finalDescription = ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
            end
            itemAdd:setCustomAttribute("rank", category)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "Extraction the item [" .. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "]")
            player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effect)
            item:setName("condensed crystal")
            local cleanUpgrade = cleanName(item:getName())
            local newName = cleanUpgrade .. " +" .. currentUpgrade
            item:setName(newName)
            local itemTypeIndex = itemType:getType()
            local typeName = LeoTK_Upgrade_System_equipmentNames[itemTypeIndex]
            if typeName then
                item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: " .. category.. "\nType: ".. typeName .."")
            else
                item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: " .. category.. "\nType: ".. itemTypeIndex .."")
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "The extract tool is not compatible with the " .. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) ..
                    ", both must have the same rank.")
            player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        end
    elseif currentUpgrade < 1 and item:getCustomAttribute("tool") == "condensed tool" then
        if itemType:getType() == item:getCustomAttribute("type") then
        local inbox = player:getStoreInbox()
        local itemAdd = inbox:addItem(target:getId(), 1, true)
        itemAdd:setTier(tier)
        local cleanUpgrade = cleanName(itemAdd:getName())
        local newName = cleanUpgrade .. " +" .. item:getCustomAttribute("upgrade")
        itemAdd:setName(newName)
            if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() ==
                ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or
                itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING and
                item:getCustomAttribute("armor") > 0 then
                armorDescription = "Arm: +" .. upgradeConfig.addArmor * item:getCustomAttribute("upgrade") .. ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, armor + (upgradeConfig.addArmor * item:getCustomAttribute("upgrade")))
            end
            if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() ==
                ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE and
                item:getCustomAttribute("attack") > 0 then
                attackDescription = "Atk: +" .. upgradeConfig.addAttack * item:getCustomAttribute("upgrade") .. ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, attack + (upgradeConfig.addAttack * item:getCustomAttribute("upgrade")))
            end
            if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE and
                item:getCustomAttribute("hitChance") > 0 then
                hitChanceDescription = " Hit%: +" .. upgradeConfig.addHitChance * item:getCustomAttribute("upgrade") .. ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, hitChance + (upgradeConfig.addHitChance * item:getCustomAttribute("upgrade")))
            end
            if elementDamage > 0 and upgradeConfig.addElement > 0 and item:getCustomAttribute("element") > 0 then
                elementDamageDescription = " " .. attackTypeName .. ": +" .. upgradeConfig.addElement * item:getCustomAttribute("upgrade") .. ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, elementDamage + (upgradeConfig.addElement * item:getCustomAttribute("upgrade")))
            end
            if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD and
                item:getCustomAttribute("defense") > 0 then
                defenseDescription = " Def: +" .. upgradeConfig.addDefense * item:getCustomAttribute("upgrade") .. ""
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, defense + (upgradeConfig.addDefense * item:getCustomAttribute("upgrade")))
            end
            if itemType:getType() == ITEM_TYPE_WAND and item:getCustomAttribute("magicAttack") > 0 then
                magicAttackDescription = "Magic Attack: +" .. upgradeConfig.addMagicAttack * item:getCustomAttribute("upgrade") .. ""
                itemAdd:setCustomAttribute("magicAttack", currentMagicAttack + (upgradeConfig.addMagicAttack * item:getCustomAttribute("upgrade")))
            end
            local finalDescription = "[Bonus]:" .. " (" ..
                                         armorDescription .. attackDescription .. hitChanceDescription ..
                                         defenseDescription .. elementDamageDescription .. magicAttackDescription .. ")" ..
                                         "\nRank: ".. category .." | Level: ".. item:getCustomAttribute("upgrade") .." | By: ".. player:getName()
            itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
            itemAdd:setCustomAttribute("rank", category)
            itemAdd:setCustomAttribute("upgrade", item:getCustomAttribute("upgrade"))
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "Success the item [" .. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level " .. currentUpgrade ..
                    " to the level " .. item:getCustomAttribute("upgrade"))
            player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effect)
            target:remove()
            item:remove()
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The equipment is not valid for using condensed crystal.")
            player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is not possible to extract the power of this item.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
    end
    return true
end


leotk_upgradeSystem_extraction:aid(LeoTK_Upgrade_System_config.actionId.extractiontool)
leotk_upgradeSystem_extraction:register()
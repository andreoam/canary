-- upgradeSystem library
dofile(DATA_DIRECTORY .. "/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")

local itemIds = {}
for _, data in pairs(Upgrade_System_config) do
    if type(data) == "table" and data.enable and data.itemId then
        local alreadyExists = false
        for _, id in ipairs(itemIds) do
            if id == data.itemId then
                alreadyExists = true
                break
            end
        end
        if not alreadyExists then
            table.insert(itemIds, data.itemId)
        end
    end
end

local upgradeSystem = Action()

-- Modularização de funções repetitivas
local function isValidEquipmentType(itemType)
    for _, validType in pairs(Upgrade_System_equipmentTypes) do
        if itemType:getType() == validType then
            return true
        end
    end
    return false
end

local function cleanName(name)
    return name:gsub("%s%+%d+$", "")
end

-- Simplificação de verificações de atributos
local function getAttributeOrDefault(item, attribute, default)
    return item:getCustomAttribute(attribute) or default
end

function upgradeSystem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not (item:getActionId() == 62990 and item:getCustomAttribute("tool") == "upgrade tool") then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item cannot be used for upgrades.")
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end

    if item:getCustomAttribute("rank") == nil then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The weapon does not have the necessary rank.")
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end

    category = item:getCustomAttribute("rank"):gsub("^%l", string.upper)
    local categoryTarget = target:getCustomAttribute("rank")
    if categoryTarget then
        categoryTarget = categoryTarget:gsub("^%l", string.upper)
    else
        categoryTarget = category
    end

    local upgradeConfig = Upgrade_System_config[category]

    local targetItem = target:getId()
    local targetName = target:getName()
    local itemName = item:getName()
    local itemType = ItemType(target:getId())
    local elementType = itemType:getElementType()
    local elementDamage = itemType:getElementDamage()
    local armor = itemType:getArmor()
    local attack = itemType:getAttack()
    local defense = itemType:getDefense()
    local hitChance = itemType:getHitChance()
    local chance = math.random()
    local tier = target:getTier()

    local upgradeConfig
    for name, config in pairs(Upgrade_System_config) do
        if type(config) == "table" and config.enable and config.itemId == item:getId() then
            upgradeConfig = config
            break
        end
    end

    if not upgradeConfig then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item cannot be used for upgrades.")
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end

    -- Uso da função modular para validação de tipo
    if not isValidEquipmentType(itemType) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[" .. Upgrade_System_capitalizeFirstLetters(targetName) ..
            "]: " .. Upgrade_System_config.itemNotValid)
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end

    -- Uso da função modular para atributos
    local currentUpgrade = getAttributeOrDefault(target, "upgrade", 0)
    if currentUpgrade >= Upgrade_System_config.maxLevelUp then
        local message = "You have reached the maximum level for this upgrade stone."
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end

    local processingMoney = false

    if Upgrade_System_config.costGoldCoin == true and player:getMoney() + player:getBankBalance() >=
        upgradeConfig.goldCoin then
        processingMoney = true
        -- player:removeMoneyBank(upgradeConfig.goldCoin)
        player:removeMoney(upgradeConfig.goldCoin) -- Remove diretamente do inventário

    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            "You do not have " .. upgradeConfig.goldCoin .. ".")
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
        return false
    end

    local chanceNormal = upgradeConfig.chanceBase * (1 - currentUpgrade * 0.05)
    local chanceVip = chanceNormal + Upgrade_System_config.chanceBonus
    local attackTypeName = Upgrade_System_attackTypes[elementType] or "None"
    local currentArmor = getAttributeOrDefault(target, "armor", 0)
    local currentAttack = getAttributeOrDefault(target, "attack", 0)
    local currentHitChance = getAttributeOrDefault(target, "hitChance", 0)
    local currentElement = getAttributeOrDefault(target, "element", 0)
    local currentDefense = getAttributeOrDefault(target, "defense", 0)
    local currentMagicAttack = getAttributeOrDefault(target, "magicAttack", 0)
    local newUpgrade = currentUpgrade + (Upgrade_System_config.addLevel or 0)
    local downUpgrade = currentUpgrade - (Upgrade_System_config.addLevel or 0)
    local newArmor = (currentUpgrade > 0) and (currentArmor + Upgrade_System_config.addArmor) or
                         (armor + Upgrade_System_config.addArmor)
    local newAttack = (currentUpgrade > 0) and (currentAttack + Upgrade_System_config.addAttack) or
                          (attack + Upgrade_System_config.addAttack)
    local newHitChance = (currentUpgrade > 0) and (currentHitChance + Upgrade_System_config.addHitChance) or
                             (hitChance + Upgrade_System_config.addHitChance)
    local newElement = (currentUpgrade > 0) and (currentElement + Upgrade_System_config.addElement) or
                           (elementDamage + Upgrade_System_config.addElement)
    local newDefense = (currentUpgrade > 0) and (currentDefense + Upgrade_System_config.addDefense) or
                           (defense + Upgrade_System_config.addDefense)
    local newMagicAttack = (currentUpgrade > 0) and (currentMagicAttack + Upgrade_System_config.addMagicAttack) or
                               (Upgrade_System_config.addMagicAttack)
    local armorDescription = ""
    local attackDescription = ""
    local hitChanceDescription = ""
    local defenseDescription = ""
    local elementDamageDescription = ""
    local magicAttackDescription = ""

    if player then
        if Upgrade_System_config.removeOnUse then
            item:remove(1)
        end
        addEvent(function()
            target:remove(1)
            if chance <= upgradeConfig.chanceBreak and currentUpgrade < 10 then
                local itemAdd = player:addItem(target:getId(), 1, true)
                itemAdd:setTier(tier)
                local cleanUpgrade = cleanName(itemAdd:getName())
                local newName
                if currentUpgrade > 0 then
                    newName = cleanUpgrade
                else
                    newName = ""
                end
                itemAdd:setName(newName)
                itemAdd:setCustomAttribute("rank", category)
                if armor > 0 and Upgrade_System_config.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or
                    itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() ==
                    ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                    armorDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, armor)
                    itemAdd:setCustomAttribute("armor", 0)
                end
                if attack > 0 and Upgrade_System_config.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or
                    itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    attackDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, attack)
                    itemAdd:setCustomAttribute("attack", 0)
                end
                if hitChance > 0 and Upgrade_System_config.addHitChance > 0 or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    hitChanceDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, hitChance)
                    itemAdd:setCustomAttribute("hitChance", 0)
                end
                if elementDamage > 0 and Upgrade_System_config.addElement > 0 then
                    elementDamageDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, elementDamage)
                    itemAdd:setCustomAttribute("element", 0)
                end
                if defense > 0 and Upgrade_System_config.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, defense)
                    itemAdd:setCustomAttribute("defense", 0)
                end
                if itemType:getType() == ITEM_TYPE_WAND then
                    local baseAttack = attack -- Mantém o ataque base da wand
                    local bonusMagicAttack = newUpgrade * Upgrade_System_config.addMagicAttack -- Calcula apenas o bônus
                    magicAttackDescription = "Magic Attack: +" .. bonusMagicAttack .. ""
                    itemAdd:setCustomAttribute("magicAttack", bonusMagicAttack) -- Armazena apenas o bônus, não o total
                end
                itemAdd:setCustomAttribute("upgrade", 0)
                if currentUpgrade > 0 then
                    local finalDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                end
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Breakdown the item [" ..
                    Upgrade_System_capitalizeFirstLetters(targetName) .. "] - All upgrades lost!")
                player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
            elseif chance <= upgradeConfig.chanceDownGrade and currentUpgrade > 4 then
                local itemAdd = player:addItem(target:getId(), 1, true)
                itemAdd:setTier(tier)
                local cleanUpgrade = cleanName(itemAdd:getName())
                local newName = cleanUpgrade .. " +" .. downUpgrade
                itemAdd:setName(newName)
                itemAdd:setCustomAttribute("rank", category)
                if armor > 0 and Upgrade_System_config.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or
                    itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() ==
                    ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                    armorDescription = "Arm: +" .. Upgrade_System_config.addArmor * downUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, currentArmor - Upgrade_System_config.addArmor)
                    itemAdd:setCustomAttribute("armor", currentArmor - Upgrade_System_config.addArmor)
                end
                if attack > 0 and Upgrade_System_config.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or
                    itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    attackDescription = "Atk: +" .. Upgrade_System_config.addAttack * downUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, currentAttack - Upgrade_System_config.addAttack)
                    itemAdd:setCustomAttribute("attack", currentAttack - Upgrade_System_config.addAttack)
                end
                if hitChance > 0 and Upgrade_System_config.addHitChance > 0 or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    hitChanceDescription = " Hit%: +" .. Upgrade_System_config.addHitChance * downUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE,
                        currentHitChance - Upgrade_System_config.addHitChance)
                    itemAdd:setCustomAttribute("hitChance", currentHitChance - Upgrade_System_config.addHitChance)
                end
                if elementDamage > 0 and Upgrade_System_config.addElement > 0 then
                    elementDamageDescription =
                        " " .. attackTypeName .. ": +" .. Upgrade_System_config.addElement * downUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, currentElement - Upgrade_System_config.addElement)
                    itemAdd:setCustomAttribute("element", currentElement - Upgrade_System_config.addElement)
                end
                if defense > 0 and Upgrade_System_config.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = " Def: +" .. Upgrade_System_config.addDefense * downUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, currentDefense - Upgrade_System_config.addDefense)
                    itemAdd:setCustomAttribute("defense", currentDefense - Upgrade_System_config.addDefense)
                end
                if itemType:getType() == ITEM_TYPE_WAND then
                    local baseAttack = attack -- Mantém o ataque base da wand
                    local bonusMagicAttack = downUpgrade * Upgrade_System_config.addMagicAttack -- Calcula apenas o bônus
                    magicAttackDescription = "Magic Attack: +" .. bonusMagicAttack .. ""
                    itemAdd:setCustomAttribute("magicAttack", bonusMagicAttack) -- Armazena apenas o bônus, não o total
                end
                itemAdd:setCustomAttribute("upgrade", downUpgrade)
                local finalDescription = "[Bonus]:" .. " (" .. armorDescription .. attackDescription ..
                                             hitChanceDescription .. defenseDescription .. elementDamageDescription ..
                                             magicAttackDescription .. ")"
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Downgrade the item [" ..
                    Upgrade_System_capitalizeFirstLetters(targetName) .. "] to level " .. downUpgrade)
                player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
            elseif chance <= (player:isVip() and chanceVip or chanceNormal) then
                local itemAdd = player:addItem(target:getId(), 1, true)
                itemAdd:setTier(tier)
                local cleanUpgrade = cleanName(itemAdd:getName())
                local newName = cleanUpgrade .. " +" .. newUpgrade
                itemAdd:setName(newName)
                itemAdd:setCustomAttribute("rank", category)
                if armor > 0 and Upgrade_System_config.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or
                    itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() ==
                    ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                    armorDescription = "Arm: +" .. Upgrade_System_config.addArmor * newUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, newArmor)
                    itemAdd:setCustomAttribute("armor", newArmor)
                end
                if attack > 0 and Upgrade_System_config.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or
                    itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    attackDescription = "Atk: +" .. Upgrade_System_config.addAttack * newUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, newAttack)
                    itemAdd:setCustomAttribute("attack", newAttack)
                end
                if hitChance > 0 and Upgrade_System_config.addHitChance > 0 or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    hitChanceDescription = " Hit%: +" .. Upgrade_System_config.addHitChance * newUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, newHitChance)
                    itemAdd:setCustomAttribute("hitChance", newHitChance)
                end
                if elementDamage > 0 and Upgrade_System_config.addElement > 0 then
                    elementDamageDescription = " " .. attackTypeName .. ": +" .. Upgrade_System_config.addAttack *
                                                   newUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, newElement)
                    itemAdd:setCustomAttribute("element", newElement)
                end
                if defense > 0 and Upgrade_System_config.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = " Def: +" .. Upgrade_System_config.addDefense * newUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, newDefense)
                    itemAdd:setCustomAttribute("defense", newDefense)
                end
                if itemType:getType() == ITEM_TYPE_WAND then
                    local baseAttack = attack -- Mantém o ataque base da wand
                    local bonusMagicAttack = newUpgrade * Upgrade_System_config.addMagicAttack -- Calcula apenas o bônus
                    magicAttackDescription = "Magic Attack: +" .. bonusMagicAttack .. ""
                    itemAdd:setCustomAttribute("magicAttack", bonusMagicAttack) -- Armazena apenas o bônus, não o total
                end
                itemAdd:setCustomAttribute("upgrade", newUpgrade)
                local finalDescription = "[Bonus]:" .. " (" .. armorDescription .. attackDescription ..
                                             hitChanceDescription .. defenseDescription .. elementDamageDescription ..
                                             magicAttackDescription .. ")"
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                player:sendTextMessage(MESSAGE_LOOK,
                    "Success! The item [" .. Upgrade_System_capitalizeFirstLetters(targetName) ..
                        "] upgraded to level " .. newUpgrade)
                player:getPosition():sendMagicEffect(Upgrade_System_config.effect)
            else
                local itemAdd = player:addItem(target:getId(), 1, true)
                itemAdd:setTier(tier)
                local cleanUpgrade = cleanName(itemAdd:getName())
                local newName
                if currentUpgrade > 0 then
                    newName = cleanUpgrade .. " +" .. currentUpgrade
                else
                    newName = ""
                end
                itemAdd:setName(newName)
                itemAdd:setCustomAttribute("rank", category)
                if armor > 0 and Upgrade_System_config.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or
                    itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() ==
                    ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                    armorDescription = "Arm: +" .. Upgrade_System_config.addArmor * currentUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, currentArmor)
                    itemAdd:setCustomAttribute("armor", currentArmor)
                end
                if attack > 0 and Upgrade_System_config.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or
                    itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    attackDescription = "Atk: +" .. Upgrade_System_config.addAttack * currentUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, currentAttack)
                    itemAdd:setCustomAttribute("attack", currentAttack)
                end
                if hitChance > 0 and Upgrade_System_config.addHitChance > 0 or itemType:getType() ==
                    ITEM_TYPE_DISTANCE then
                    hitChanceDescription = " Hit%: +" .. Upgrade_System_config.addHitChance * currentUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, currentHitChance)
                    itemAdd:setCustomAttribute("hitChance", currentHitChance)
                end
                if elementDamage > 0 and Upgrade_System_config.addElement > 0 then
                    elementDamageDescription =
                        " " .. attackTypeName .. ": +" .. Upgrade_System_config.addElement * currentUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, currentElement)
                    itemAdd:setCustomAttribute("element", currentElement)
                end
                if defense > 0 and Upgrade_System_config.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = " Def: +" .. Upgrade_System_config.addDefense * currentUpgrade .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, currentDefense)
                    itemAdd:setCustomAttribute("defense", currentDefense)
                end
                if itemType:getType() == ITEM_TYPE_WAND then
                    local baseAttack = attack -- Mantém o ataque base da wand
                    local bonusMagicAttack = currentUpgrade * Upgrade_System_config.addMagicAttack -- Calcula apenas o bônus
                    magicAttackDescription = "Magic Attack: +" .. bonusMagicAttack .. ""
                    itemAdd:setCustomAttribute("magicAttack", bonusMagicAttack) -- Armazena apenas o bônus, não o total
                end
                itemAdd:setCustomAttribute("upgrade", currentUpgrade)
                if currentUpgrade > 0 then
                    local finalDescription = "[Bonus]:" .. " (" .. armorDescription .. attackDescription ..
                                                 hitChanceDescription .. defenseDescription .. elementDamageDescription ..
                                                 magicAttackDescription .. ")"
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                end
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                    "Failed! The item [" .. Upgrade_System_capitalizeFirstLetters(targetName) ..
                        "] remains at level " .. currentUpgrade)
                player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
            end
        end, Upgrade_System_config.durationUpgrade * 1000)
    end
    return true
end

upgradeSystem:aid(Upgrade_System_config.upgradetool)
upgradeSystem:register()

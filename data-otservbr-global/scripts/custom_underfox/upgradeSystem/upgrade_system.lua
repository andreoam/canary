dofile("data-otservbr-global/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")
local itemIds = {}
for _, data in pairs(LeoTK_Upgrade_System_config) do
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

local leotk_upgradeSystem = Action()

function leotk_upgradeSystem.onUse(player, item, fromPosition, target, toPosition, isHotkey, tilePosition)
    local category
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
    local validForge = false
    local isForgeEmpty = true
    local forgePosition = nil
    local posTo = {}
    local directions = {"north", "south", "east", "west"}
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(LeoTK_Upgrade_System_forge[direction]) do
            local tile = Tile(wallPosition)
            if tile then
                local itemsOnForge = tile:getItems()
                for _, itemOnForge in ipairs(itemsOnForge) do
                    local itemID = itemOnForge:getId()
                    if not (
                        itemID == LeoTK_Upgrade_System_itemForge.anvil or
                        itemID == LeoTK_Upgrade_System_itemForge.base or
                        itemID == LeoTK_Upgrade_System_itemForge.basetwo
                    ) then
                        isForgeEmpty = false
                        validForge = true
                        break
                    end
                end
            end
        end
    end

    if item:getCustomAttribute("rank") == nil then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The weapon does not have the necessary rank to be used in the forge.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    if item:getCustomAttribute("break") == true then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your tool is broken, repair it first before trying to forge.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        -- item:setCustomAttribute("durability", 5)
        -- item:setCustomAttribute("break", false)
        return false
    end

    category = item:getCustomAttribute("rank"):gsub("^%l", string.upper)
    local categoryTarget = target:getCustomAttribute("rank")
    if categoryTarget then
        categoryTarget = categoryTarget:gsub("^%l", string.upper)
    else
        categoryTarget = category
    end
    local upgradeConfig = LeoTK_Upgrade_System_config[category]

    local isValidPosition = false
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(LeoTK_Upgrade_System_forge[direction]) do
            if wallPosition == toPosition then
                isValidPosition = true
                break
            end
        end
    end
    
    if not isValidPosition then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "]: " .. LeoTK_Upgrade_System_config.forgePosition)
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    if isForgeEmpty then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "]: " .. LeoTK_Upgrade_System_config.forgeEmpty)
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    local function isValidEquipmentType(itemType)
        for _, validType in pairs(LeoTK_Upgrade_System_equipmentTypes) do
            if itemType:getType() == validType then
                return true
            end
        end
        return false
    end

    if not isValidEquipmentType(itemType) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "]: " .. LeoTK_Upgrade_System_config.itemNotValid)
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    local getUpgrade = target:getCustomAttribute("upgrade")
    local currentUpgrade = getUpgrade or 0
    -- Verificar se o nível atual atende ao nível mínimo da configuração
    if currentUpgrade < upgradeConfig.minLevelUp then
        local message = "This item requires at least upgrade level " .. upgradeConfig.minLevelUp .. " to use (" .. category .. ")."
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end
    
    -- Verificar se o nível atual excede o máximo permitido
    if currentUpgrade >= upgradeConfig.maxLevelUp then
        local nextCategory = nil
        local currentMaxLevelUp = upgradeConfig.maxLevelUp
        for catName, catData in pairs(LeoTK_Upgrade_System_config) do
            if type(catData) == "table" and catData.enable and catData.minLevelUp == currentMaxLevelUp then
                nextCategory = catName
                break
            end
        end
    
        local message
        if nextCategory then
            message = "You have reached the maximum level for the (" .. category .. ") category. Use (" .. nextCategory .. ") to continue upgrading."
        else
            message = "You have reached the maximum level for the (" .. category .. ") category, and there are no further upgrades available."
        end
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    local processingMoney = false
    local processingRecipe = false

    if upgradeConfig.costGoldCoin == true and player:getMoney() + player:getBankBalance() >= upgradeConfig.goldCoin then
        processingMoney = true
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have ".. upgradeConfig.goldCoin .." gold coins to use the forge.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    local recipeOptions = {}
    local function hasRecipeItems(player)
        local hasAllItems = true
        for _, item in ipairs(upgradeConfig.recipe.items) do
            if player:getItemCount(item.id) < item.count then
                local itemName = ItemType(item.id):getName()
                table.insert(recipeOptions, ''..item.count ..' '.. itemName .. '')
                hasAllItems = false
            end
        end
        return hasAllItems
    end

    local function removeRecipeItems(player)
        for _, item in ipairs(upgradeConfig.recipe.items) do
            player:removeItem(item.id, item.count)
        end
    end
    local playerKV = player:kv()
    if upgradeConfig.recipe.enable == true and hasRecipeItems(player) == true then
        processingRecipe = true
    elseif upgradeConfig.recipe.enable == true and hasRecipeItems(player) == false and (upgradeConfig.recipe.required == true or playerKV:get(LeoTK_Upgrade_System_config.recipeOptionSelected.noRemoveItem) == 1) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have the following items " ..
            table.concat(recipeOptions, ' and ') .. " to upgrade the item.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
        return false
    end

    if upgradeConfig.costGoldCoin == true and upgradeConfig.recipe.enable == true and processingMoney == true and processingRecipe == true then
        player:removeMoneyBank(upgradeConfig.goldCoin)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A value of ".. upgradeConfig.goldCoin .." gold coins was spent on forging.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effectPayment)
        removeRecipeItems(player)
    elseif upgradeConfig.costGoldCoin == true and upgradeConfig.recipe.enable == false and processingMoney == true and processingRecipe == false then
        player:removeMoneyBank(upgradeConfig.goldCoin)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A value of ".. upgradeConfig.goldCoin .." gold coins was spent on forging.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effectPayment)
    elseif upgradeConfig.costGoldCoin == false and upgradeConfig.recipe.enable == true and processingMoney == false and processingRecipe == true then
        removeRecipeItems(player)
    elseif upgradeConfig.costGoldCoin == true and upgradeConfig.recipe.enable == true and processingMoney == true and processingRecipe == false then
        player:removeMoneyBank(upgradeConfig.goldCoin)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A value of ".. upgradeConfig.goldCoin .." gold coins was spent on forging.")
        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effectPayment)
    end

    posTo = player:getPosition()
    local itemRemoved = false
    local playerPosition = player:getPosition()
    local tolerance = 1
    --print("targetItem:", targetItem)
    --print("Player position:", playerPosition.x, playerPosition.y, playerPosition.z)
    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(LeoTK_Upgrade_System_forge[direction]) do
            if math.abs(playerPosition.x - wallPosition.x) <= tolerance and
               math.abs(playerPosition.y - wallPosition.y) <= tolerance and
               math.abs(playerPosition.z - wallPosition.z) <= tolerance then
                local tile = Tile(wallPosition)
                if tile then
                    local itemOnForge = tile:getItemById(targetItem)
                    if itemOnForge then
                        local playerKV = player:kv()
                        playerKV:set(LeoTK_Upgrade_System_config.kv, os.time() + LeoTK_Upgrade_System_config.durationUpgrade + 2)
                        itemOnForge:remove()
                        wallPosition:sendMagicEffect(LeoTK_Upgrade_System_config.effectItemRemove)
                        forgePosition = wallPosition
                        for i = 1, LeoTK_Upgrade_System_config.durationUpgrade do
                            addEvent(function() wallPosition:sendMagicEffect(LeoTK_Upgrade_System_config.effectItemBoost) end, 1000 * (i - 1))
                            --addEvent(function() player:getPosition():sendSingleSoundEffect(sound.forgeHit, player:isInGhostMode() and nil or player) end, 1000 * (i - 2.8))
                        end
                        for i = 1, LeoTK_Upgrade_System_config.durationUpgrade* 10 do
                            addEvent(function() player:teleportTo(posTo) end, 100 * (i - 1))
                        end
                        itemRemoved = true
                        break
                    end
                end
            end
        end
        if itemRemoved then
            break
        end
    end
    if upgradeConfig.removeOnUse == true then
        item:remove(1)
    end
    local chanceVip = upgradeConfig.chanceBase + upgradeConfig.chanceBonus
    local function cleanName(name)
        return name:gsub("%s%+%d+$", "")
    end
    local attackTypeName = LeoTK_Upgrade_System_attackTypes[elementType] or "None"
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

    local randomDurability = math.random()
    local decimalDurability = math.random(0, 4)
    durability = math.max(0, durability - (decimalDurability + randomDurability))
    item:setCustomAttribute("durability", durability)
    item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. category .."\nDurability: ".. string.format("%.2f", durability) .."%")
    if durability <= 0 then
        item:setCustomAttribute("break", true)
    end

    local ringSlot = player:getSlotItem(CONST_SLOT_RING)
    if not player:isVip() then
        addEvent(function()
            if chance <= upgradeConfig.chanceBreak and currentUpgrade > 100 and (not ringSlot or ringSlot:getId() ~= upgradeConfig.ringProtect) then
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
                    itemAdd:setCustomAttribute("armor", armor)
                end
                if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                    attackDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, attack)
                    itemAdd:setCustomAttribute("attack", attack)
                end
                if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                    hitChanceDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, hitChance)
                    itemAdd:setCustomAttribute("hitChance", hitChance)
                end
                if elementDamage > 0 and upgradeConfig.addElement > 0 then
                    elementDamageDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, elementDamage)
                    itemAdd:setCustomAttribute("element", elementDamage)
                end
                if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, defense)
                    itemAdd:setCustomAttribute("defense", defense)
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
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Breakdown the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
                item:setCustomAttribute("break", true)
                itemAdd:setCustomAttribute("rank", category)
            elseif chance <= upgradeConfig.chanceDownGrade and currentUpgrade > 4 and processingRecipe == false then
                local inbox = player:getStoreInbox()
                local itemAdd = inbox:addItem(target:getId(), 1, true)
                itemAdd:setTier(tier)
                local cleanUpgrade = cleanName(itemAdd:getName())
                local newName = cleanUpgrade .. " +" .. downUpgrade
                itemAdd:setName(newName)
                if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                    armorDescription = "Arm: +" .. currentArmor - upgradeConfig.addArmor .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, (armor + currentArmor) - upgradeConfig.addArmor)
                    itemAdd:setCustomAttribute("armor", (armor + currentArmor) - upgradeConfig.addArmor)
                end
                if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                    attackDescription = "Atk: +" .. currentAttack - upgradeConfig.addAttack .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, (attack + currentAttack) - upgradeConfig.addAttack)
                    itemAdd:setCustomAttribute("attack", (attack + currentAttack) - upgradeConfig.addAttack)
                end
                if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                    hitChanceDescription = " Hit%: +" .. currentHitChance - upgradeConfig.addHitChance .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, (hitChance + currentHitChance) - upgradeConfig.addHitChance)
                    itemAdd:setCustomAttribute("hitChance", (hitChance + currentHitChance) - upgradeConfig.addHitChance)
                end
                if elementDamage > 0 and upgradeConfig.addElement > 0 then
                    elementDamageDescription = " ".. attackTypeName ..": +" .. currentElement - upgradeConfig.addElement .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, (elementDamage + currentElement) - upgradeConfig.addElement)
                    itemAdd:setCustomAttribute("element", (elementDamage + currentElement) - upgradeConfig.addElement)
                end
                if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = " Def: +" .. currentDefense - upgradeConfig.addDefense .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, (defense + currentDefense) - upgradeConfig.addDefense)
                    itemAdd:setCustomAttribute("defense", (defense + currentDefense) - upgradeConfig.addDefense)
                end
                if itemType:getType() == ITEM_TYPE_WAND then
                    magicAttackDescription = "Magic Attack: +" .. currentMagicAttack - upgradeConfig.addMagicAttack .. ""
                    itemAdd:setCustomAttribute("magicAttack", currentMagicAttack - upgradeConfig.addMagicAttack)
                end
                itemAdd:setCustomAttribute("upgrade", downUpgrade)
                local finalDescription = 
                "[Bonus]:" .." ("..
                armorDescription ..
                attackDescription ..
                hitChanceDescription ..
                defenseDescription ..
                elementDamageDescription .. 
                magicAttackDescription .. ")"..
                "\nRank: ".. categoryTarget .." | Level: ".. itemAdd:getCustomAttribute("upgrade") .." | By: ".. player:getName()
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Downgrade the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
                local randomDurability = math.random()
                local decimalDurability = math.random(0, 2)
                durability = math.max(0, durability - (decimalDurability + randomDurability))
                item:setCustomAttribute("durability", durability)
                item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. category .."\nDurability: ".. string.format("%.2f", durability) .."%")
                if durability <= 0 then
                    item:setCustomAttribute("break", true)
                end
                itemAdd:setCustomAttribute("rank", category)
            elseif chance <= upgradeConfig.chanceBase then
                    local inbox = player:getStoreInbox()
                    local itemAdd = inbox:addItem(target:getId(), 1, true)
                    itemAdd:setTier(tier)
                    local cleanUpgrade = cleanName(itemAdd:getName())
                    local newName = cleanUpgrade .. " +" .. newUpgrade
                    itemAdd:setName(newName)
                    if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                        armorDescription = "Arm: +" .. upgradeConfig.addArmor + currentArmor .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, newArmor)
                        itemAdd:setCustomAttribute("armor", newArmor)
                    end
                    if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                        attackDescription = "Atk: +" .. upgradeConfig.addAttack + currentAttack .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, newAttack)
                        itemAdd:setCustomAttribute("attack", newAttack)
                    end
                    if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                        hitChanceDescription = " Hit%: +" .. upgradeConfig.addHitChance + currentHitChance .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, newHitChance)
                        itemAdd:setCustomAttribute("hitChance", newHitChance)
                    end
                    if elementDamage > 0 and upgradeConfig.addElement > 0 then
                        elementDamageDescription = " ".. attackTypeName ..": +" .. upgradeConfig.addAttack + currentElement .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, newElement)
                        itemAdd:setCustomAttribute("element", newElement)
                    end
                    if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                        defenseDescription = " Def: +" .. upgradeConfig.addDefense + currentDefense .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, newDefense)
                        itemAdd:setCustomAttribute("defense", newDefense)
                    end
                    if itemType:getType() == ITEM_TYPE_WAND then
                        magicAttackDescription = "Magic Attack: +" .. upgradeConfig.addMagicAttack + currentMagicAttack .. ""
                        itemAdd:setCustomAttribute("magicAttack", upgradeConfig.addMagicAttack + currentMagicAttack)
                    end
                    itemAdd:setCustomAttribute("upgrade", newUpgrade)
                    local finalDescription = 
                    "[Bonus]:" .." ("..
                    armorDescription ..
                    attackDescription ..
                    hitChanceDescription ..
                    defenseDescription ..
                    elementDamageDescription ..
                    magicAttackDescription .. ")"..
                    "\nRank: ".. category .." | Level: ".. itemAdd:getCustomAttribute("upgrade") .." | By: ".. player:getName()
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Success the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                    player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effect)
                    itemAdd:setCustomAttribute("rank", category)
            else
                local inbox = player:getStoreInbox()
                local itemAdd = inbox:addItem(target:getId(), 1, true)
                itemAdd:setTier(tier)
                local cleanUpgrade = cleanName(itemAdd:getName())
                local newName
                if currentUpgrade > 0 then
                newName = cleanUpgrade .. " +" .. currentUpgrade
                else
                newName = ""
                end
                itemAdd:setName(newName)
                if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                    armorDescription = "Arm: +" .. currentArmor .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, armor + currentArmor)
                    itemAdd:setCustomAttribute("armor", armor + currentArmor)
                end
                if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                    attackDescription = "Atk: +" .. currentAttack .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, attack + currentAttack)
                    itemAdd:setCustomAttribute("attack", attack + currentAttack)
                end
                if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                    hitChanceDescription = " Hit%: +" .. currentHitChance .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, hitChance + currentHitChance)
                    itemAdd:setCustomAttribute("hitChance", hitChance + currentHitChance)
                end
                if elementDamage > 0 and upgradeConfig.addElement > 0 then
                    elementDamageDescription = " ".. attackTypeName ..": +" .. currentElement .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, elementDamage + currentElement)
                    itemAdd:setCustomAttribute("element", elementDamage + currentElement)
                end
                if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                    defenseDescription = " Def: +" .. currentDefense .. ""
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, defense + currentDefense)
                    itemAdd:setCustomAttribute("defense", defense + currentDefense)
                end
                if itemType:getType() == ITEM_TYPE_WAND then
                    magicAttackDescription = "Magic Attack: +" .. currentMagicAttack .. ""
                    itemAdd:setCustomAttribute("magicAttack", currentMagicAttack)
                end
                itemAdd:setCustomAttribute("upgrade", currentUpgrade)
                if currentUpgrade > 0 then
                local finalDescription = 
                "[Bonus]:" .." ("..
                armorDescription ..
                attackDescription ..
                hitChanceDescription ..
                defenseDescription ..
                elementDamageDescription ..
                magicAttackDescription .. ")"..
                "\nRank: ".. categoryTarget .." | Level: ".. itemAdd:getCustomAttribute("upgrade") .." | By: ".. player:getName()
                itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                end
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
                itemAdd:setCustomAttribute("rank", category)
                local randomDurability = math.random()
                local decimalDurability = math.random(0, 1)
                durability = math.max(0, durability - (decimalDurability + randomDurability))
                item:setCustomAttribute("durability", durability)
                item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. category .."\nDurability: ".. string.format("%.2f", durability) .."%")
                if durability <= 0 then
                    item:setCustomAttribute("break", true)
                end
            end
        end, LeoTK_Upgrade_System_config.durationUpgrade * 1000)
    elseif player:isVip() then
            addEvent(function()
                if chance <= upgradeConfig.chanceBreak and currentUpgrade > 100 and (not ringSlot or ringSlot:getId() ~= upgradeConfig.ringProtect) then
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
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Breakdown the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                    player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
                    item:setCustomAttribute("break", true)
                    itemAdd:setCustomAttribute("rank", category)
                elseif chance <= upgradeConfig.chanceDownGrade and currentUpgrade > 4 and processingRecipe == false then
                    local inbox = player:getStoreInbox()
                    local itemAdd = inbox:addItem(target:getId(), 1, true)
                    itemAdd:setTier(tier)
                    local cleanUpgrade = cleanName(itemAdd:getName())
                    local newName = cleanUpgrade .. " +" .. downUpgrade
                    itemAdd:setName(newName)
                    if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                        armorDescription = "Arm: +" .. upgradeConfig.addArmor * downUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, currentArmor - upgradeConfig.addArmor)
                        itemAdd:setCustomAttribute("armor", currentArmor - upgradeConfig.addArmor)
                    end
                    if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                        attackDescription = "Atk: +" .. upgradeConfig.addAttack * downUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, currentAttack - upgradeConfig.addAttack)
                        itemAdd:setCustomAttribute("attack", currentAttack - upgradeConfig.addAttack)
                    end
                    if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                        hitChanceDescription = " Hit%: +" .. upgradeConfig.addHitChance * downUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, currentHitChance - upgradeConfig.addHitChance)
                        itemAdd:setCustomAttribute("hitChance", currentHitChance - upgradeConfig.addHitChance)
                    end
                    if elementDamage > 0 and upgradeConfig.addElement > 0 then
                        elementDamageDescription = " ".. attackTypeName ..": +" .. upgradeConfig.addElement * downUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, currentElement - upgradeConfig.addElement)
                        itemAdd:setCustomAttribute("element", currentElement - upgradeConfig.addElement)
                    end
                    if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                        defenseDescription = " Def: +" .. upgradeConfig.addDefense * downUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, currentDefense - upgradeConfig.addDefense)
                        itemAdd:setCustomAttribute("defense", currentDefense - upgradeConfig.addDefense)
                    end
                    if itemType:getType() == ITEM_TYPE_WAND then
                        magicAttackDescription = "Magic Attack: +" .. upgradeConfig.addMagicAttack * downUpgrade .. ""
                        itemAdd:setCustomAttribute("magicAttack", currentMagicAttack - upgradeConfig.addMagicAttack)
                    end
                    itemAdd:setCustomAttribute("upgrade", downUpgrade)
                    local finalDescription = 
                    "[Bonus]:" .." ("..
                    armorDescription ..
                    attackDescription ..
                    hitChanceDescription ..
                    defenseDescription ..
                    elementDamageDescription .. 
                    magicAttackDescription .. ")"..
                    "\nRank: ".. categoryTarget .." | Level: ".. itemAdd:getCustomAttribute("upgrade") .." | By: ".. player:getName()
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Downgrade the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                    player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
                    itemAdd:setCustomAttribute("rank", category)
                    local randomDurability = math.random()
                    local decimalDurability = math.random(0, 2)
                    durability = math.max(0, durability - (decimalDurability + randomDurability))
                    item:setCustomAttribute("durability", durability)
                    item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. category .."\nDurability: ".. string.format("%.2f", durability) .."%")
                    if durability <= 0 then
                        item:setCustomAttribute("break", true)
                    end
                elseif chance <= upgradeConfig.chanceBase + upgradeConfig.chanceBonus then
                        local inbox = player:getStoreInbox()
                        local itemAdd = inbox:addItem(target:getId(), 1, true)
                        itemAdd:setTier(tier)
                        local cleanUpgrade = cleanName(itemAdd:getName())
                        local newName = cleanUpgrade .. " +" .. newUpgrade
                        itemAdd:setName(newName)
                        if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                            armorDescription = "Arm: +" .. upgradeConfig.addArmor * newUpgrade .. ""
                            itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, newArmor)
                            itemAdd:setCustomAttribute("armor", newArmor)
                        end
                        if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                            attackDescription = "Atk: +" .. upgradeConfig.addAttack * newUpgrade .. ""
                            itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, newAttack)
                            itemAdd:setCustomAttribute("attack", newAttack)
                        end
                        if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                            hitChanceDescription = " Hit%: +" .. upgradeConfig.addHitChance * newUpgrade .. ""
                            itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, newHitChance)
                            itemAdd:setCustomAttribute("hitChance", newHitChance)
                        end
                        if elementDamage > 0 and upgradeConfig.addElement > 0 then
                            elementDamageDescription = " ".. attackTypeName ..": +" .. upgradeConfig.addAttack * newUpgrade .. ""
                            itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, newElement)
                            itemAdd:setCustomAttribute("element", newElement)
                        end
                        if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                            defenseDescription = " Def: +" .. upgradeConfig.addDefense * newUpgrade .. ""
                            itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, newDefense)
                            itemAdd:setCustomAttribute("defense", newDefense)
                        end
                        if itemType:getType() == ITEM_TYPE_WAND then
                            magicAttackDescription = "Magic Attack: +" .. upgradeConfig.addMagicAttack * newUpgrade .. ""
                            itemAdd:setCustomAttribute("magicAttack", newMagicAttack)
                        end
                        itemAdd:setCustomAttribute("upgrade", newUpgrade)
                        local finalDescription = 
                        "[Bonus]:" .." ("..
                        armorDescription ..
                        attackDescription ..
                        hitChanceDescription ..
                        defenseDescription ..
                        elementDamageDescription ..
                        magicAttackDescription .. ")"..
                       "\nRank: ".. category .." | Level: ".. itemAdd:getCustomAttribute("upgrade") .." | By: ".. player:getName()
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Success the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                        player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.effect)
                        itemAdd:setCustomAttribute("rank", category)
                else
                    local inbox = player:getStoreInbox()
                    local itemAdd = inbox:addItem(target:getId(), 1, true)
                    itemAdd:setTier(tier)
                    local cleanUpgrade = cleanName(itemAdd:getName())
                    local newName
                    if currentUpgrade > 0 then
                    newName = cleanUpgrade .. " +" .. currentUpgrade
                    else
                    newName = ""
                    end
                    itemAdd:setName(newName)
                    if armor > 0 and upgradeConfig.addArmor > 0 or itemType:getType() == ITEM_TYPE_HELMET or itemType:getType() == ITEM_TYPE_ARMOR or itemType:getType() == ITEM_TYPE_LEGS or itemType:getType() == ITEM_TYPE_BOOTS or itemType:getType() == ITEM_TYPE_AMULET or itemType:getType() == ITEM_TYPE_RING then
                        armorDescription = "Arm: +" .. upgradeConfig.addArmor * currentUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ARMOR, currentArmor)
                        itemAdd:setCustomAttribute("armor", currentArmor)
                    end
                    if attack > 0 and upgradeConfig.addAttack > 0 or itemType:getType() == ITEM_TYPE_CLUB or itemType:getType() == ITEM_TYPE_SWORD or itemType:getType() == ITEM_TYPE_AXE or itemType:getType() == ITEM_TYPE_DISTANCE then
                        attackDescription = "Atk: +" .. upgradeConfig.addAttack * currentUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ATTACK, currentAttack)
                        itemAdd:setCustomAttribute("attack", currentAttack)
                    end
                    if hitChance > 0 and upgradeConfig.addHitChance > 0 or itemType:getType() == ITEM_TYPE_DISTANCE then
                        hitChanceDescription = " Hit%: +" .. upgradeConfig.addHitChance * currentUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, currentHitChance)
                        itemAdd:setCustomAttribute("hitChance", currentHitChance)
                    end
                    if elementDamage > 0 and upgradeConfig.addElement > 0 then
                        elementDamageDescription = " ".. attackTypeName ..": +" .. upgradeConfig.addElement * currentUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_ELEMENT, currentElement)
                        itemAdd:setCustomAttribute("element", currentElement)
                    end
                    if defense > 0 and upgradeConfig.addDefense > 0 or itemType:getType() == ITEM_TYPE_SHIELD then
                        defenseDescription = " Def: +" .. upgradeConfig.addDefense * currentUpgrade .. ""
                        itemAdd:setAttribute(ITEM_ATTRIBUTE_DEFENSE, currentDefense)
                        itemAdd:setCustomAttribute("defense", currentDefense)
                    end
                    if itemType:getType() == ITEM_TYPE_WAND then
                        magicAttackDescription = "Magic Attack: +" .. upgradeConfig.addMagicAttack * currentUpgrade .. ""
                        itemAdd:setCustomAttribute("magicAttack", currentMagicAttack)
                    end
                    itemAdd:setCustomAttribute("upgrade", currentUpgrade)
                    if currentUpgrade > 0 then
                    local finalDescription = 
                    "[Bonus]:" .." ("..
                    armorDescription ..
                    attackDescription ..
                    hitChanceDescription ..
                    defenseDescription ..
                    elementDamageDescription ..
                    magicAttackDescription .. ")"..
                    "\nRank: ".. categoryTarget .." | Level: ".. itemAdd:getCustomAttribute("upgrade") .." | By: ".. player:getName()
                    itemAdd:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, finalDescription)
                    end
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed the item [".. LeoTK_Upgrade_System_capitalizeFirstLetters(targetName) .. "] raised the level ".. currentUpgrade .." to the level ".. newUpgrade)
                    player:getPosition():sendMagicEffect(LeoTK_Upgrade_System_config.failedEffect)
                    itemAdd:setCustomAttribute("rank", category)
                    local randomDurability = math.random()
                    local decimalDurability = math.random(0, 1)
                    durability = math.max(0, durability - (decimalDurability + randomDurability))
                    item:setCustomAttribute("durability", durability)
                    item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Rank: ".. category .."\nDurability: ".. string.format("%.2f", durability) .."%")
                    if durability <= 0 then
                        item:setCustomAttribute("break", true)
                    end
                end
            end, LeoTK_Upgrade_System_config.durationUpgrade * 1000)
    end
    return true
end

leotk_upgradeSystem:aid(LeoTK_Upgrade_System_config.actionId.upgradetool)
leotk_upgradeSystem:register()
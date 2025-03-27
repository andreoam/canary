Upgrade_System_config = {
    kv = "upgradeNoLogout",
    recipeOptionSelected = {
        noRemoveItem = "noRemoveItemUpgrade",
        removeItem = "removeItemUpgrade",
    },
    itemUnique = {
        enable = false,
        itemId = 9150,
        removeOnUse = false,
        costGoldCoin = true,
        goldCoin = 10000,
        chanceBase = 0.40,
        chanceBonus = 0.10,
        chanceBreak = 0.10,
        chanceDownGrade = 0.05,
        ringProtect = 3099,
        minLevelUp = 0,
        maxLevelUp = 100,
        addLevel = 100,
        addArmor  = 100,
        addAttack = 100,
        addMagicAttack = 1000,
        addHitChance = 100,
        addElement = 100,
        addDefense = 100,
        recipe = {
            enable = true,
            required = false,
            items = {
                {id = 5880, count = 1}, {id = 27447, count = 0},
            },
        },
    },
    ["Lesser"] = {
        enable = true,
        itemId = 673,
        removeOnUse = true,
        costGoldCoin = true,
        goldCoin = 50000,
        chanceBase = 0.50,
        chanceBonus = 0.10,
        chanceBreak = 0.20,
        chanceDownGrade = 0.01,
        ringProtect = 3099,
        minLevelUp = 0,
        maxLevelUp = 5,
        addLevel = 1,
        addArmor = 1,
        addAttack = 1,
        addMagicAttack = 90,
        addHitChance = 1,
        addElement = 1,
        addDefense = 1,
        recipe = {
            enable = true,
            required = false,
            items = {
                {id = 19371, count = 1},
            },
        },
        -- exp = { -- comming son
        --     enable = true,
        --     expFormula = 1252,
        -- },
    },
    ["Superior"] = {
        enable = true,
        itemId = 49457,
        removeOnUse = true,
        costGoldCoin = true,
        goldCoin = 100000,
        chanceBase = 0.30,
        chanceBonus = 0.10,
        chanceBreak = 0.05,
        chanceDownGrade = 0.30,
        ringProtect = 3099,
        minLevelUp = 5,
        maxLevelUp = 10,
        addLevel = 1,
        addArmor = 1,
        addAttack = 1,
        addMagicAttack = 90,
        addHitChance = 1,
        addElement = 1,
        addDefense = 1,
        recipe = {
            enable = true,
            required = false,
            items = {
                {id = 19371, count = 1},
            },
        },
    },
    ["Divine"] = {
        enable = true,
        itemId = 49458,
        removeOnUse = true,
        costGoldCoin = true,
        goldCoin = 200000,
        chanceBase = 0.30,
        chanceBonus = 0.10,
        chanceBreak = 0.10,
        chanceDownGrade = 0.60,
        ringProtect = 3099,
        minLevelUp = 10,
        maxLevelUp = 15,
        addLevel = 1,
        addArmor = 1,
        addAttack = 1,
        addMagicAttack = 90,
        addHitChance = 1,
        addElement = 1,
        addDefense = 1,
        recipe = {
            enable = true,
            required = false,
            items = {
                {id = 19371, count = 1},
            },
        },
    },
    -- ["Heroic"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 300000,
    --     chanceBase = 0.30,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.15,
    --     chanceDownGrade = 0.25,
    --     ringProtect = 3099,
    --     minLevelUp = 15,
    --     maxLevelUp = 20,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 4,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Unique"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 400000,
    --     chanceBase = 0.20,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.20,
    --     chanceDownGrade = 0.30,
    --     ringProtect = 3099,
    --     minLevelUp = 20,
    --     maxLevelUp = 25,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 4,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Celestial"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 500000,
    --     chanceBase = 0.15,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.25,
    --     chanceDownGrade = 0.35,
    --     ringProtect = 3099,
    --     minLevelUp = 25,
    --     maxLevelUp = 30,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 4,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Divine"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 1000000,
    --     chanceBase = 0.10,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.30,
    --     chanceDownGrade = 0.40,
    --     ringProtect = 3099,
    --     minLevelUp = 30,
    --     maxLevelUp = 35,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 6,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Epic"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 5000000,
    --     chanceBase = 0.05,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.35,
    --     chanceDownGrade = 0.45,
    --     ringProtect = 3099,
    --     minLevelUp = 35,
    --     maxLevelUp = 40,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 6,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Legendary"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 10000000,
    --     chanceBase = 0.01,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.40,
    --     chanceDownGrade = 0.50,
    --     ringProtect = 3099,
    --     minLevelUp = 45,
    --     maxLevelUp = 50,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 6,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Mythic"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 10000000,
    --     chanceBase = 0.01,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.40,
    --     chanceDownGrade = 0.50,
    --     ringProtect = 3099,
    --     minLevelUp = 55,
    --     maxLevelUp = 60,
    --     addLevel = 1,
    --     addArmor = 1,
    --     addAttack = 1,
    --     addMagicAttack = 8,
    --     addHitChance = 1,
    --     addElement = 1,
    --     addDefense = 1,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    -- ["Eternal"] = {
    --     enable = false,
    --     itemId = 7451,
    --     removeOnUse = false,
    --     costGoldCoin = true,
    --     goldCoin = 10000000,
    --     chanceBase = 0.01,
    --     chanceBonus = 0.20,
    --     chanceBreak = 0.40,
    --     chanceDownGrade = 0.50,
    --     ringProtect = 3099,
    --     minLevelUp = 60,
    --     maxLevelUp = 70,
    --     addLevel = 1,
    --     addArmor = 2,
    --     addAttack = 2,
    --     addMagicAttack = 10,
    --     addHitChance = 2,
    --     addElement = 2,
    --     addDefense = 2,
    --     recipe = {
    --         enable = true,
    --         required = false,
    --         items = {
    --             {id = 5880, count = 1}, {id = 27447, count = 0},
    --         },
    --     },
    -- },
    actionId = {
        upgradetool = 62990,
        repairtool = 62991,
        extractiontool = 62992,
        entranceforge = 62993,
    },
    effect = CONST_ME_FIREWORK_YELLOW,
    effectPayment = CONST_ME_MAGIC_POWDER,
    failedEffect = CONST_ME_POFF,
    effectItemBoost = CONST_ME_GROUNDSHAKER,
    effectItemRemove = CONST_ME_BLOCKHIT,
    durationUpgrade = 5,
    itemNotValid = "This item is not valid for upgrade",
    forgeEmpty = "The forge is empty",
    forgePosition = "This position is not valid because the correct position of the forge.",
}

Upgrade_System_itemForge = {
    base = 2342, -- <== or ==>
    basetwo = 2344, -- /\ or \/
    anvil = 3458,
    basin = 2113,
    basintwo = 2112,
    basintree = 2111,
    tile = 410,
}

Upgrade_System_forge = {
    north = { -- /\ /\ /\ /\
    Position(1571, 1250, 6),
    Position(1574, 1250, 6),
    },
    south = { -- \/ \/ \/ \/
    --Position(1081, 876, 7),
    },
    east = { -- => => => =>
    --Position(32371, 32238, 7),
    },
    west = { -- <= <= <= <=
    --Position(32367, 32236, 7),
    },
}

Upgrade_System_attackTypes = {
    [0] = "Physical", 
    [1] = "Energy", 
    [2] = "Earth", 
    [3] = "Fire", 
    [4] = "Undefined", 
    [5] = "Life Drain", 
    [6] = "Mana Drain", 
    [7] = "Healing", 
    [8] = "Drown", 
    [9] = "Ice", 
    [10] = "Holy", 
    [11] = "Death", 
    [12] = "Agony", 
    [13] = "Neutral"
}

Upgrade_System_equipmentTypes = {
    [1] = ITEM_TYPE_ARMOR,
    [2] = ITEM_TYPE_AMULET,
    [3] = ITEM_TYPE_BOOTS,
    [4] = ITEM_TYPE_HELMET,
    [5] = ITEM_TYPE_LEGS,
    [6] = ITEM_TYPE_RING,
    [7] = ITEM_TYPE_SHIELD,
    [8] = ITEM_TYPE_AXE,
    [9] = ITEM_TYPE_CLUB,
    [10] = ITEM_TYPE_DISTANCE,
    [11] = ITEM_TYPE_SWORD,
    [12] = ITEM_TYPE_WAND,
    [13] = ITEM_TYPE_QUIVER,
}

Upgrade_System_equipmentNames = {
    [1] = "Armor",
    [2] = "Amulet",
    [3] = "Boots",
    [7] = "Helmet",
    [8] = "Legs",
    [11] = "Ring",
    [13] = "Shield",
    [17] = "Axe",
    [18] = "Club",
    [19] = "Distance",
    [20] = "Sword",
    [21] = "Wand",
    [25] = "Quiver",
}

function Upgrade_System_capitalizeFirstLetters(name)
    return name:gsub("(%a)([%w_']*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

function Upgrade_System_levels(config)
    local levels = {}
    for level, data in pairs(config) do
        if type(data) == "table" and data.enable ~= nil then
            table.insert(levels, level)
        end
    end
    return levels
end

local upgradeSystemLogout = CreatureEvent("UpgradeSystemLogout")
function upgradeSystemLogout.onLogout(player)
    local playerKV = player:kv()
    local checkKV = playerKV:get(Upgrade_System_config.kv)
	if checkKV and checkKV - os.time() > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[System] Alert, you can disconnect at "..checkKV - os.time().." seconds")
        --player:getPosition():sendSingleSoundEffect(sound.alertChance, player:isInGhostMode() and nil or player)
        player:getPosition():sendMagicEffect(Upgrade_System_config.failedEffect)
       return false
	end
    return true
end
upgradeSystemLogout:register()
Upgrade_System_config = {
    
    -- actions ids
    upgradetool = 62990,
    extractiontool = 62992,
    entranceforge = 62993,
    forge = 62994,
    
    -- levels
    maxLevelUp = 15,
    removeOnUse = true,
    costGoldCoin = true,
    addLevel = 1,
    addArmor = 5,
    addAttack = 10,
    addMagicAttack = 20,
    addHitChance = 5,
    addElement = 10,
    addDefense = 5,
    
    -- effect
    effect = CONST_ME_FIREWORK_YELLOW,
    failedEffect = CONST_ME_POFF,
    durationUpgrade = 0,
    itemNotValid = "This item is not valid for upgrade",
    chanceBonus = 0.10,    -- +10% for players VIP

    -- stones
    ["Normal"] = {
        enable = true,
        gem = 3041,             -- ID do item de craft
        minedgem = 60207,       -- ID da gema minerada
        itemId = 60165,         -- ID do item de upgrade
        price = 10,             -- Price to buy on NPC
        goldCoin = 2500000,     -- Price to use
        chanceBase = 0.60,      -- 30% chance success
        chanceBreak = 0.10,     -- 10% chance break
        chanceDownGrade = 0.30, -- 30% chance downgrade        
    },

    ["Epic"] = {
        enable = true,
        gem = 3038,
        minedgem = 60206,
        itemId = 60166,
        price = 15,
        goldCoin = 5000000,
        chanceBase = 0.70,
        chanceBreak = 0.05,
        chanceDownGrade = 0.30,
    },

    ["Refined"] = {
        enable = true,
        gem = 3039,
        minedgem = 60208,
        itemId = 60167,
        price = 20,
        goldCoin = 7500000,
        chanceBase = 0.80,
        chanceBreak = 0.00,
        chanceDownGrade = 0.10,
    }    
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

Upgrade_System_forge = {
    anvilpositions = {
    Position(1571, 1250, 6),
    Position(1574, 1250, 6),
    },
}

Upgrade_System_itemForge = {
    base = 2342, -- <== or ==>
    basetwo = 2344, -- /\ or \/
    anvil = 35185,
    anvilOn = 35186,
    --anvil = 3458,
    basin = 2113,
    tile = 410,
    hammer = 37171,
}

local UPGRADE_STONES_KEY = "upgrade stones"

UpgradeSystemShopConfigTable = {
    [UPGRADE_STONES_KEY] = {},
    ["extract tools"] = {
        { clientId = 7281, itemName = "Memory Crystal", buy = 10 },
    },
    ["normal stones mined"] = {}, -- Este nome deve corresponder exatamente
    ["epic stones mined"] = {},   -- ao usado no categoryKey abaixo
    ["refined stones mined"] = {}
}

-- Popula as tabelas de stones
for name, config in pairs(Upgrade_System_config) do
    if type(config) == "table" and config.enable then
        if config.itemId and config.price and config.gem then
            -- Adiciona upgrade stones
            table.insert(UpgradeSystemShopConfigTable[UPGRADE_STONES_KEY], {
                name = name,
                itemName = name .. " Upgrade Stone",
                clientId = config.itemId,
                buy = config.price,
            })
            
            -- Adiciona em categorias separadas (Alterado para corresponder aos nomes acima)
            local categoryKey = string.format("%s stones mined", name:lower())
            table.insert(UpgradeSystemShopConfigTable[categoryKey], {
                name = name,
                itemName = name .. " Upgrade Stone",
                clientId = config.itemId,
                buy = config.price,
                --buy = 1
            })
        end
    end
end

for i = #UpgradeSystemShopConfigTable[UPGRADE_STONES_KEY], 1, -1 do
    local stone = UpgradeSystemShopConfigTable[UPGRADE_STONES_KEY][i]
    if not Upgrade_System_config[stone.name].enable then
        table.remove(UpgradeSystemShopConfigTable[UPGRADE_STONES_KEY], i)
    end
end

function Upgrade_System_capitalizeFirstLetters(name)
    if not name or name == "" then return "" end -- Validação para strings vazias ou nulas
    return name:gsub("(%a)([%w_']*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end
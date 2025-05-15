--[[
Add in lib/lib.lua
-- Roleta
dofile(DATA_DIRECTORY .. "/scripts/custom/roleta/roleta_lib.lua")
]]

-- Primeiro definimos os itens de cada vocação separadamente
local druidItems = {
    {id = 39165, count = 1, chance = 1500}, -- midnight tunic
    {id = 39167, count = 1, chance = 1500}, -- midnight sarong
    {id = 16104, count = 1, chance = 1500}, -- gill gugel
    {id = 16105, count = 1, chance = 1500}, -- gill coat
    {id = 16106, count = 1, chance = 1500}, -- gill legs
    {id = 16107, count = 1, chance = 1200}, -- spellbook of vigilance
    {id = 3397, count = 1, chance = 1200}, -- dwarven armor
    {id = 22536, count = 1, chance = 1200}, -- thunder raiment
    {id = 22535, count = 1, chance = 1200}, -- earth raiment
    {id = 22534, count = 1, chance = 1200}, -- fire raiment
    {id = 22537, count = 1, chance = 1200}, -- frost raiment
    {id = 22755, count = 1, chance = 900}, -- book of lies
    {id = 20090, count = 1, chance = 900}, -- umbral master spellbook
    {id = 6529, count = 1, chance = 1000}, -- soft boots
    {id = 28484, count = 1, chance = 1000}, -- blueberry cupcake
}

local knightItems = {
    {id = 3397, count = 1, chance = 1200}, -- dwarven armor
    {id = 16109, count = 1, chance = 1200}, -- prismatic helmet
    {id = 16110, count = 1, chance = 1200}, -- prismatic armor
    {id = 16116, count = 1, chance = 1200}, -- prismatic shield
    {id = 22521, count = 1, chance = 1200}, -- armor ST sword terra
    {id = 22523, count = 1, chance = 1200}, -- armor ST club terra
    {id = 22522, count = 1, chance = 1200}, -- armor ST axe terra
    {id = 22518, count = 1, chance = 1200}, -- armor ST sword fire
    {id = 22519, count = 1, chance = 1200}, -- armor ST axe fire
    {id = 22520, count = 1, chance = 1200}, -- armor ST club fire
    {id = 22527, count = 1, chance = 1200}, -- armor ST sword ice
    {id = 22528, count = 1, chance = 1200}, -- armor ST axe ice
    {id = 22529, count = 1, chance = 1200}, -- armor ST club ice
    {id = 22525, count = 1, chance = 1200}, -- armor ST axe energy
    {id = 22526, count = 1, chance = 1200}, -- armor ST club energy
    {id = 22524, count = 1, chance = 1200}, -- armor ST sword energy
    {id = 28722, count = 1, chance = 1000}, -- falcon shield
    {id = 36656, count = 1, chance = 1000}, -- eldricth shield
    {id = 34154, count = 1, chance = 1000}, -- Lion Shield
    {id = 14000, count = 1, chance = 1000}, -- ornate shield
    {id = 11688, count = 1, chance = 1000}, -- shield of corruption
    {id = 8055, count = 1, chance = 1000}, -- windborn
    {id = 8054, count = 1, chance = 1000}, -- earthborn
    {id = 8053, count = 1, chance = 1000}, -- fireborn
    {id = 8056, count = 1, chance = 1000}, -- oceanborn
    {id = 28485, count = 1, chance = 2000}, -- strawberry cupcake
}

local paladinItems = {
    {id = 22531, count = 1, chance = 1100}, -- armadura ST earth
    {id = 22530, count = 1, chance = 1100}, -- armadura ST fire
    {id = 22533, count = 1, chance = 1100}, -- armadura ST ice
    {id = 22532, count = 1, chance = 1100}, -- armadura ST energy
    {id = 39160, count = 1, chance = 1500}, -- naga Quiver
    {id = 16111, count = 1, chance = 1500}, -- prismatic legs
    {id = 13994, count = 1, chance = 1500}, -- depth lorica
    {id = 35524, count = 1, chance = 1500}, -- jungle quiver
    {id = 3575, count = 1, chance = 1500}, -- wood cape
    {id = 8058, count = 1, chance = 1200}, -- molten plate
    {id = 8059, count = 1, chance = 1200}, -- frozen plate
    {id = 8057, count = 1, chance = 1200}, -- divine plate
    {id = 28484, count = 1, chance = 1500}, -- blueberry cupcake
    {id = 28485, count = 1, chance = 1500}, -- strawberry cupcake
    {id = 36666, count = 1, chance = 1500}, -- Eldritch Quiver
}

local sorcererItems = {
    {id = 39166, count = 1, chance = 1200}, -- dawnfire pantaloons
    {id = 39164, count = 1, chance = 1200}, -- dawnfire sherwani
    {id = 16104, count = 1, chance = 1200}, -- gill gugel
    {id = 16105, count = 1, chance = 1200}, -- gill coat
    {id = 16106, count = 1, chance = 1200}, -- gill legs
    {id = 16107, count = 1, chance = 1500}, -- spellbook of vigilance
    {id = 3397, count = 1, chance = 1000}, -- dwarven armor
    {id = 22536, count = 1, chance = 1000}, -- thunder raiment
    {id = 22535, count = 1, chance = 1000}, -- earth raiment
    {id = 22534, count = 1, chance = 1000}, -- fire raiment
    {id = 22537, count = 1, chance = 1000}, -- frost raiment
    {id = 22755, count = 1, chance = 900}, -- book of lies
    {id = 20090, count = 1, chance = 900}, -- umbral master spellbook
    {id = 6529, count = 1, chance = 1000}, -- soft boots
    {id = 28484, count = 1, chance = 1500} -- blueberry cupcake
}

-- Agora definimos o RouletteConfig usando as variáveis locais
RouletteConfig = {
    actionIds = {
        druid = 18562,
        knight = 18563,
        paladin = 18564,
        sorcerer = 18565
    },
    requiredItemId = 37317,

    leverIds = {
        normal = 8911,
        activated = 8912
    },

    positions = {
        druid = {
            Position(31701, 32438, 10),
            Position(31702, 32438, 10),
            Position(31703, 32438, 10),
            Position(31704, 32438, 10),
            Position(31705, 32438, 10),
            Position(31706, 32438, 10),
            Position(31707, 32438, 10),
            Position(31708, 32438, 10),
            Position(31709, 32438, 10),
            Position(31710, 32438, 10),
        },
        knight = {
            Position(31713, 32438, 10),
            Position(31714, 32438, 10),
            Position(31715, 32438, 10),
            Position(31716, 32438, 10),
            Position(31717, 32438, 10),
            Position(31718, 32438, 10),
            Position(31719, 32438, 10),
            Position(31720, 32438, 10),
            Position(31721, 32438, 10),
            Position(31722, 32438, 10),
        },
        paladin = {
            Position(31728, 32438, 10),
            Position(31729, 32438, 10),
            Position(31730, 32438, 10),
            Position(31731, 32438, 10),
            Position(31732, 32438, 10),
            Position(31733, 32438, 10),
            Position(31734, 32438, 10),
            Position(31735, 32438, 10),
            Position(31736, 32438, 10),
            Position(31737, 32438, 10),
        },
        sorcerer = {
            Position(31740, 32438, 10),
            Position(31741, 32438, 10),
            Position(31742, 32438, 10),
            Position(31743, 32438, 10),
            Position(31744, 32438, 10),
            Position(31745, 32438, 10),
            Position(31746, 32438, 10),
            Position(31747, 32438, 10),
            Position(31748, 32438, 10),
            Position(31749, 32438, 10)
        }
    },

    rouletteOptions = {
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}
    },

    commonItems = {
        {id = 5903, count = 1, chance = 10, raro = true}, -- ferumbras hat
        {id = 34109, count = 1, chance = 350, raro = true}, -- bag you desire
        {id = 39546, count = 1, chance = 350, raro = true}, -- primal bag
        {id = 43895, count = 1, chance = 350, raro = true}, -- bag you covet
        {id = 36478, count = 1, chance = 250, raro = true}, -- dragon scale doll
        {id = 39759, count = 1, chance = 250, raro = true}, -- golden outfit doll
        {id = 25779, count = 1, chance = 1500}, -- swan feather cloak
        {id = 20063, count = 1, chance = 1000}, -- dream matter
        {id = 43946, count = 1, chance = 1000}, -- abridged promotion scroll
        {id = 43947, count = 1, chance = 1000}, -- basic promotion scroll
        {id = 43948, count = 1, chance = 1000}, -- revised promotion scroll
        {id = 43949, count = 1, chance = 1000}, -- extended promotion scroll
        {id = 43950, count = 1, chance = 1000}, -- advanced promotion scroll
        {id = 12803, count = 1, chance = 600}, -- elemental spikes
        {id = 12599, count = 1, chance = 600}, -- mages cap
        {id = 36736, count = 1, chance = 1000}, -- fire amplification
        {id = 36739, count = 1, chance = 1000}, -- energy amplification
        {id = 36741, count = 1, chance = 1000}, -- death amplification
        {id = 36729, count = 1, chance = 1000}, -- fire resilience
        {id = 36732, count = 1, chance = 1000}, -- energy resilience
        {id = 36734, count = 1, chance = 1000}, -- death resilience
        {id = 36735, count = 1, chance = 1000}, -- physical resilience
        {id = 36730, count = 1, chance = 1000}, -- ice resilience
        {id = 36733, count = 1, chance = 1000}, -- holy resilience
        {id = 36731, count = 1, chance = 1000}, -- earth resilience
        {id = 36742, count = 1, chance = 1000}, -- physical amplification
        {id = 36737, count = 1, chance = 1000}, -- ice amplification
        {id = 36740, count = 1, chance = 1000}, -- holy amplification
        {id = 36738, count = 1, chance = 1000}, -- earth amplification
        {id = 3555, count = 1, chance = 800}, -- golden boots
    },

    -- Usando as variáveis locais definidas anteriormente
    druidItems = druidItems,
    knightItems = knightItems,
    paladinItems = paladinItems,
    sorcererItems = sorcererItems,

    items = {
        druid = druidItems,
        knight = knightItems,
        paladin = paladinItems,
        sorcerer = sorcererItems
    }
}
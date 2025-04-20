local mType = Game.createMonsterType("Frost Undead Dragon")
local monster = {}

monster.description = "a frost undead dragon"
monster.experience = 15000
monster.outfit = {
	lookType = 2200,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2637
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Arcadia.",
}


monster.health = 16200
monster.maxHealth = 16200
monster.race = "undead"
monster.corpse = 60224
monster.speed = 185
monster.manaCost = 0


monster.changeTarget = {
	interval = 2000,
	chance = 5,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 250,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "YOU WILL FREEZE!", yell = true },
	{ text = "ZCHHHHH!", yell = true },
	{ text = "I am so cool.", yell = false },
	{ text = "Chill out!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 99110, maxCount = 207 },
	{ name = "green mushroom", chance = 10710 },
	{ id = 7441, chance = 6250 }, -- ice cube
	{ id = 2842, chance = 8500 }, -- book
	{ name = "power bolt", chance = 5360, maxCount = 6 },
	{ name = "golden mug", chance = 5360 },
	{ id = 3051, chance = 2680 }, -- energy ring
	{ name = "small sapphire", chance = 1790 },
	{ name = "strange helmet", chance = 890 },
	{ name = "life crystal", chance = 890 },
	{ name = "shard", chance = 520 },
	{ name = "ice rapier", chance = 310 },
	{ name = "tower shield", chance = 290 },
	{ name = "royal helmet", chance = 230 },
	{ name = "dragon scale mail", chance = 100 },
	{ name = "dragon slayer", chance = 100 },
	{ id = 7420, chance = 3000 }, -- reaper's axe
	{ id = 3366, chance = 2000 }, -- Magic plate armor
	{ id = 238, chance = 9000, maxCount = 4 }, -- great mana potion
	{ id = 239, chance = 9000, maxCount = 4 }, -- great health potion
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -450, maxDamage = -1000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -350, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "speed", interval = 2000, chance = 5, speedChange = -700, radius = 3, effect = CONST_ME_POFF, target = false, duration = 12000 },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -850, length = 7, spread = 3, effect = CONST_ME_ICEATTACK, target = false, duration = 18000 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_ICEDAMAGE, minDamage = -320, maxDamage = -1040, radius = 3, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -200, maxDamage = -1080, radius = 4, effect = CONST_ME_ICEAREA, target = true },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -1040, length = 1, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -600, radius = 4, effect = CONST_ME_ICEAREA, target = true, duration = 12000 },
}

monster.defenses = {
	defense = 55,
	armor = 44,
	mitigation = 1.74,
	{ name = "combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 320, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

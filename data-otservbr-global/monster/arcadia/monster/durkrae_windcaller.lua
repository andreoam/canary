local mType = Game.createMonsterType("Durkrae Windcaller")
local monster = {}

monster.description = "a Durkrae windcaller"
monster.experience = 3000
monster.outfit = {
	lookType = 260,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1900
monster.maxHealth = 1900
monster.race = "blood"
monster.corpse = 7320
monster.speed = 71
monster.manaCost = 305

monster.changeTarget = {
	interval = 60000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Siqsiq ji jusipa!", yell = false },
	{ text = "Jagura taluka taqua!", yell = false },
	{ text = "Mupi! Si siyoqua jinuma!", yell = false },
	{ text = "Quatu nguraka!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 71170, maxCount = 27 },
	{ name = "brass helmet", chance = 4390 },
	{ name = "bone shield", chance = 960 },
	{ id = 3578, chance = 30790, maxCount = 3 }, -- fish
	{ name = "northern pike", chance = 40 },
	{ name = "rainbow trout", chance = 40 },
	{ name = "green perch", chance = 110 },
	{ name = "fireproof horn", chance = 410 },
	{ name = "platinum coin", chance = 60240, maxCount = 2 },
	{ name = "strong health potion", chance = 10950, maxCount = 2 },
	{ name = "great mana potion", chance = 8330, maxCount = 2 },
	{ name = "small topaz", chance = 10240 },
	{ name = "bonecarving knife", chance = 8100 },
	{ name = "guardian shield", chance = 1430 },
	{ name = "tower shield", chance = 240 },
	{ name = "spiked squelcher", chance = 240 },


}


monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -350, range = 7, shootEffect = CONST_ANI_ICE, target = false },
	-- freeze
	{ name = "condition", type = CONDITION_FREEZING, interval = 2000, chance = 10, minDamage = -130, maxDamage = -250, radius = 3, effect = CONST_ME_ICEAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -500, length = 5, spread = 2, effect = CONST_ME_ICEAREA, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 20,
	mitigation = 0.38,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -8 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)

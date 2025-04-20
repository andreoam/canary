local mType = Game.createMonsterType("Lion Archer of Caribean")
local monster = {}

monster.name = "Lion Archer"
monster.description = "a lion archer"
monster.experience = 6800
monster.outfit = {
	lookType = 1316,
	lookHead = 0,
	lookBody = 78,
	lookLegs = 57,
	lookFeet = 57,
	lookAddons = 2,
	lookMount = 0,
}

monster.health = 7300
monster.maxHealth = 7300
monster.race = "blood"
monster.corpse = 33961
monster.speed = 125
monster.manaCost = 0

monster.faction = FACTION_LION
monster.enemyFactions = { FACTION_PLAYER, FACTION_LIONUSURPERS }

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 90,
	targetDistance = 6,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
}

monster.loot = {
	{ name = "platinum coin", chance = 100000, maxCount = 5 },
	{ name = "ultimate health potion", chance = 75135, maxCount = 3 },
	{ name = "meat", chance = 47703 },
	{ name = "broken longbow", chance = 14595 },
	{ name = "lion cloak patch", chance = 10135 },
	{ name = "black pearl", chance = 8784 },
	{ name = "warrior helmet", chance = 8784 },
	{ name = "mino shield", chance = 8514 },
	{ name = "silver brooch", chance = 7838 },
	{ name = "knife", chance = 7703 },
	{ name = "lion crest", chance = 6892 },
	{ id = 281, chance = 5676 }, -- giant shimmering pearl (green)
	{ name = "gemmed figurine", chance = 4189 },
	{ name = "white pearl", chance = 3514 },
	{ name = "glacier shoes", chance = 2432 },
	{ name = "knight armor", chance = 1892 },
	{ name = "coral brooch", chance = 1757 },
	{ name = "assassin dagger", chance = 1622 },
	{ name = "ornate crossbow", chance = 946 },
	{ name = "emerald bangle", chance = 811 },
	{ name = "wood cape", chance = 405 },
	{ name = "elvish bow", chance = 270 },
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -400, range = 7, shootEffect = CONST_ANI_BURSTARROW, target = true },
	{ name = "combat", interval = 6000, chance = 22, type = COMBAT_HOLYDAMAGE, minDamage = -200, maxDamage = -500, range = 7, radius = 4, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 4000, chance = 12, type = COMBAT_HOLYDAMAGE, minDamage = -400, maxDamage = -500, range = 7, effect = CONST_ME_HOLYDAMAGE, target = true },
	{ name = "combat", interval = 4000, chance = 17, type = COMBAT_ICEDAMAGE, minDamage = -400, maxDamage = -500, radius = 3, effect = CONST_ME_ICEAREA, target = false },
}

monster.defenses = {
	defense = 86,
	armor = 0,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

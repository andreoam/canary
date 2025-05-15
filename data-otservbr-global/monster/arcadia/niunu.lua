local mType = Game.createMonsterType("Niunu")
local monster = {}

monster.description = "a niunu" 
monster.experience = 35000
monster.outfit = {
	lookType = 391,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "undead"
monster.corpse = 12058
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
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
	staticAttackChance = 90,
	targetDistance = 1,
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
	{ text = "Aaaauuuuuooooooo!!", yell = false },
	{ text = "Raaarrr!", yell = false },
}

monster.loot = {

	{ name = "gold coin", chance = 56000, maxCount = 52 },
	{ name = "hailstorm rod", chance = 7400 },
	{ name = "meat", chance = 52000, maxCount = 4 },
	{ name = "wolf paw", chance = 3700 },
	{ name = "shiver arrow", chance = 11000, maxCount = 10 },
	{ name = "crystalline armor", chance = 3700 },


	{ id = 3076, chance = 2500 }, -- crystal ball
	{ id = 3008, chance = 1500 }, -- crystal necklace
	{ id = 3007, chance = 5500 }, -- crystal ring
	{ id = 3051, chance = 13500 }, -- energy ring
	{ id = 3284, chance = 7500 }, -- ice rapier
	{ id = 3061, chance = 1000 }, -- life crystal
	{ id = 3046, chance = 11500 }, -- magic light wand
	{ id = 3070, chance = 3500 }, -- moonlight rod
	{ id = 3060, chance = 12000 }, -- orb
	{ id = 3055, chance = 4500 }, -- platinum amulet
	{ id = 3084, chance = 4500 }, -- protection amulet
	{ id = 2848, chance = 2600 }, -- purple tome
	{ id = 3054, chance = 13000 }, -- silver amulet
	{ id = 3049, chance = 9500 }, -- stealth ring
	{ id = 3081, chance = 4000 }, -- stone skin amulet
	{ id = 3058, chance = 2500 }, -- strange symbol
	{ id = 3034, chance = 14000, maxCount = 7 }, -- talon
	{ id = 2993, chance = 14500 }, -- teddy bear
	{ id = 3309, chance = 13500 }, -- thunder hammer
	{ id = 3265, chance = 20000 }, -- two handed sword
	{ id = 3069, chance = 3500 }, -- necrotic rod
	{ id = 3072, chance = 2500 }, -- wand of decay
	{ id = 3026, chance = 12500, maxCount = 15 }, -- white pearl
}

monster.attacks = {
	{ name = "crystal wolf wave", interval = 2000, chance = 15, minDamage = 800, maxDamage = -1300, target = false },
	{ name = "melee", interval = 2000, chance = 100, skill = 230, attack = 210 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -800, range = 6, radius = 3, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_GIANTICE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -700, range = 7, target = false },

}

monster.defenses = {
	defense = 145,
	armor = 188,
	mitigation = 0.67,
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 5 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)

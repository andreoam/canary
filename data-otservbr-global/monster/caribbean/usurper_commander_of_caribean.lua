local mType = Game.createMonsterType("Usurper Commander of Caribean")
local monster = {}

monster.name = "Usurper Commander"
monster.description = "an usurper commander"
monster.experience = 7200
monster.outfit = {
	lookType = 1317,
	lookHead = 40,
	lookBody = 95,
	lookLegs = 40,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0,
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 33957
monster.speed = 125
monster.manaCost = 0

monster.faction = FACTION_LIONUSURPERS
monster.enemyFactions = { FACTION_PLAYER, FACTION_LION }

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

monster.summon = {
	maxSummons = 5,
	summons = {
		{ name = "Usurper Archer of Caribean", chance = 100000, interval = 6000, count = 2 },
		{ name = "Usurper Warlock of Caribean", chance = 100000, interval = 6000, count = 2 },
		{ name = "Usurper Knight of Caribean", chance = 100000, interval = 6000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "FORMATION!", yell = true },
}

monster.loot = {
	{ name = "platinum coin", chance = 77111, maxCount = 5 },
	{ name = "gold ingot", chance = 11778 },
	{ name = "lion cloak patch", chance = 8444 },
	{ name = "lion crest", chance = 8222 },
	{ id = 281, chance = 5556 }, -- giant shimmering pearl (green)
	{ name = "green gem", chance = 3556 },
	{ name = "springsprout rod", chance = 2667 },
	{ name = "Violet Gem", chance = 2667 },
	{ name = "Fur Shred", chance = 1897 },
	{ id = 23533, chance = 1452 }, -- Ring of Red Plasma
	{ name = "Spellbook of Warding", chance = 874 },
	{ name = "Wand of Voodoo", chance = 667 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 4000, chance = 14, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, radius = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 4000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -400, length = 4, spread = 0, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "singlecloudchain", interval = 6000, chance = 17, minDamage = -200, maxDamage = -450, range = 4, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "singledeathchain", interval = 6000, chance = 15, minDamage = -250, maxDamage = -530, range = 5, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 86,
	armor = 86,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 1 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 1 },
	{ type = COMBAT_DEATHDAMAGE, percent = -1 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onSpawn = function(monster, spawnPosition)
	local sum
	for i = 1, 5 do
		sum = Game.createMonster(monster:getType():getSummonList()[math.random(1, #monster:getType():getSummonList())].name, monster:getPosition(), true)
		if sum then
			monster:setSummon(sum)
			sum:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			sum:setStorageValue(Storage.TheOrderOfTheLion.Drume.Commander, 1)
		end
	end
	monster:setStorageValue(Storage.TheOrderOfTheLion.Drume.Commander, 1)
end

mType:register(monster)

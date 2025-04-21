local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local wand_of_starstorm = Weapon(WEAPON_WAND)

if not wand_of_starstorm then
    print("[ERROR] Falha ao criar a wand 'wand of starstorm'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de Energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY) -- Projétil de Energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 56
    local max = 74
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

wand_of_starstorm.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

wand_of_starstorm:id(8092)
wand_of_starstorm:mana(1)
wand_of_starstorm:range(3)
wand_of_starstorm:register()

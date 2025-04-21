local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local energized_limb = Weapon(WEAPON_WAND)

if not energized_limb then
    print("[ERROR] Falha ao criar a wand 'energized limb'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de Energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY) -- Projétil de Energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 88
    local max = 108
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

energized_limb.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

energized_limb:id(29425)
energized_limb:mana(1)
energized_limb:range(3)
energized_limb:register()

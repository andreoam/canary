local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local Wand_of_Inferno = Weapon(WEAPON_WAND)

if not Wand_of_Inferno then
    print("[ERROR] Falha ao criar a wand 'Wand of Inferno'. Verifique a configuração do servidor.")
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

Wand_of_Inferno.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

Wand_of_Inferno:id(3074)
Wand_of_Inferno:mana(1)
Wand_of_Inferno:range(3)
Wand_of_Inferno:register()

local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local falconWand = Weapon(WEAPON_WAND)

if not falconWand then
    print("[ERROR] Falha ao criar a wand 'Falcon Wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL) -- Projétil de energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 86
    local max = 102
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

falconWand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

falconWand:id(28717)
falconWand:mana(21)
falconWand:range(5)
falconWand:register()

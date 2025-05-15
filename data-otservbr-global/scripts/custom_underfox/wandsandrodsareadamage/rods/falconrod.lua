local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local falconRod = Weapon(WEAPON_WAND)

if not falconRod then
    print("[ERROR] Falha ao criar a rod 'Falcon Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH) -- Projétil de Terra

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 87
    local max = 101
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

falconRod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

falconRod:id(28716)
falconRod:mana(20)
falconRod:range(5)
falconRod:register()

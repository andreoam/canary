local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local amberWand = Weapon(WEAPON_WAND)

if not amberWand then
    print("[ERROR] Falha ao criar a wand 'Amber Wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL) -- Projétil de energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 90
    local max = 115
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

amberWand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

amberWand:id(47372)
amberWand:mana(15)
amberWand:range(6)
amberWand:register()

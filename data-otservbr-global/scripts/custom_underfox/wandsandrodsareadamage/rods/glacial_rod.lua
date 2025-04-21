local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local glacial_rod = Weapon(WEAPON_WAND)

if not glacial_rod then
    print("[ERROR] Falha ao criar a rod 'glacial rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de Terra

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 75
    local max = 95
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

glacial_rod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

glacial_rod:id(16118)
glacial_rod:mana(2)
glacial_rod:range(3)
glacial_rod:register()

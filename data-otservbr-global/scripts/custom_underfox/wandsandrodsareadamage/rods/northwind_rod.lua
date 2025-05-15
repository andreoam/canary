local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local northwind_rod = Weapon(WEAPON_WAND)

if not northwind_rod then
    print("[ERROR] Falha ao criar a rod 'northwind Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo pequeno

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 23
    local max = 37
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

northwind_rod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

northwind_rod:id(8083)
northwind_rod:mana(2)
northwind_rod:range(3)
northwind_rod:register()

local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local hailstormrod = Weapon(WEAPON_WAND)

if not hailstormrod then
    print("[ERROR] Falha ao criar a rod 'hailstorm Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 56
    local max = 74
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

hailstormrod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

hailstormrod:id(3067)
hailstormrod:mana(2)
hailstormrod:range(3)
hailstormrod:register()

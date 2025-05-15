local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local cobraRod = Weapon(WEAPON_WAND)

if not cobraRod then
    print("[ERROR] Falha ao criar a rod 'Cobra Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de Terra pequeno

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 70
    local max = 110
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

cobraRod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

cobraRod:id(30400)
cobraRod:mana(21)
cobraRod:range(5)
cobraRod:register()

local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local Eldritch_Rod = Weapon(WEAPON_WAND)

if not Eldritch_Rod then
    print("[ERROR] Falha ao criar a rod 'Eldritch rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de Terra

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 85
    local max = 105
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

Eldritch_Rod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

Eldritch_Rod:id(36674)
Eldritch_Rod:mana(2)
Eldritch_Rod:range(3)
Eldritch_Rod:register()

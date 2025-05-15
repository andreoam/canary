local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local eldritch_wand = Weapon(WEAPON_WAND)

if not eldritch_wand then
    print("[ERROR] Falha ao criar a wand 'eldritch wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
-- combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
-- combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) -- Dano de Fogo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE) -- Projétil de Fogo

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 85
    local max = 105
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

eldritch_wand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

eldritch_wand:id(36668)
eldritch_wand:mana(21)
eldritch_wand:range(5)
eldritch_wand:register()

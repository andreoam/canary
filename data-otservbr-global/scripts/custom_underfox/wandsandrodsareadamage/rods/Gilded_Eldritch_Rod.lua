local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local Gilded_Eldritch_Rod = Weapon(WEAPON_WAND)

if not Gilded_Eldritch_Rod then
    print("[ERROR] Falha ao criar a rod 'Gilded Eldritch Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 85
    local max = 105
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

Gilded_Eldritch_Rod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

Gilded_Eldritch_Rod:id(36675)
Gilded_Eldritch_Rod:mana(2)
Gilded_Eldritch_Rod:range(3)
Gilded_Eldritch_Rod:register()

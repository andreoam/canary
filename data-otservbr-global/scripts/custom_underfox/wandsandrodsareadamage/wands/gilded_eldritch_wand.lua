local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local gilded_eldritch_wand = Weapon(WEAPON_WAND)

if not gilded_eldritch_wand then
    print("[ERROR] Falha ao criar a wand 'gilded eldritch wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 85
    local max = 105
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

gilded_eldritch_wand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

gilded_eldritch_wand:id(36669)
gilded_eldritch_wand:mana(21)
gilded_eldritch_wand:range(5)
gilded_eldritch_wand:register()

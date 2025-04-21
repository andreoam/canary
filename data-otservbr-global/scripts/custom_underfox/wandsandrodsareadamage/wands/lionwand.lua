local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local lionWand = Weapon(WEAPON_WAND)

if not lionWand then
    print("[ERROR] Falha ao criar a wand 'Lion Wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 89
    local max = 109
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

lionWand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

lionWand:id(34152)
lionWand:mana(21)
lionWand:range(5)
lionWand:register()

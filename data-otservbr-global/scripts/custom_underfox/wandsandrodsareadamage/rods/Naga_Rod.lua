local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local Naga_Rod = Weapon(WEAPON_WAND)

if not Naga_Rod then
    print("[ERROR] Falha ao criar a rod 'Naga Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo pequeno

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 90
    local max = 110
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

Naga_Rod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

Naga_Rod:id(39163)
Naga_Rod:mana(2)
Naga_Rod:range(3)
Naga_Rod:register()

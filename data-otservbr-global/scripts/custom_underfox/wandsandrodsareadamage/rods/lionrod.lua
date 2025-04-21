local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local lionRod = Weapon(WEAPON_WAND)

if not lionRod then
    print("[ERROR] Falha ao criar a rod 'Lion Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Dano de Gelo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo pequeno

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 85
    local max = 105
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

lionRod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

lionRod:id(34151)
lionRod:mana(20)
lionRod:range(5)
lionRod:register()

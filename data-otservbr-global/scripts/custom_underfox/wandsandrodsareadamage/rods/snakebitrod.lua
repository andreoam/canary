local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local snakebiteRod = Weapon(WEAPON_WAND)

if not snakebiteRod then
    print("[ERROR] Falha ao criar a rod 'Snakebite Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de Terra

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 8
    local max = 18
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

snakebiteRod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

snakebiteRod:id(3066)
snakebiteRod:mana(2)
snakebiteRod:range(3)
snakebiteRod:register()

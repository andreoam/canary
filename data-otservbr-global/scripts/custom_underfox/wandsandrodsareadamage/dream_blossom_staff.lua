local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local dream_blossom_staff = Weapon(WEAPON_WAND)

if not dream_blossom_staff then
    print("[ERROR] Falha ao criar a rod 'dream blossom staff'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL) -- Projétil de energia

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 75
    local max = 95
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

dream_blossom_staff.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

dream_blossom_staff:id(25700)
dream_blossom_staff:mana(2)
dream_blossom_staff:range(3)
dream_blossom_staff:register()

local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local naga_wand = Weapon(WEAPON_WAND)

if not naga_wand then
    print("[ERROR] Falha ao criar a wand 'Naga Wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL) -- Projétil de energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 90
    local max = 120
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

naga_wand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

naga_wand:id(39162)
naga_wand:mana(21)
naga_wand:range(5)
naga_wand:register()

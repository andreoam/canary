local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local cobraWand = Weapon(WEAPON_WAND)

if not cobraWand then
    print("[ERROR] Falha ao criar a wand 'Cobra Wand'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL) -- Projétil de energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 94
    local max = 100
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

cobraWand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

cobraWand:id(30399)
cobraWand:mana(22)
cobraWand:range(4)
cobraWand:register()

local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local vortexWand = Weapon(WEAPON_WAND)

if not vortexWand then
    print("[ERROR] Falha ao criar a wand 'Wand of Vortex'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE) -- Dano de Energia
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY) -- Projétil de Energia

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 8
    local max = 18
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

vortexWand.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

vortexWand:id(3074)
vortexWand:mana(1)
vortexWand:range(3)
vortexWand:register()

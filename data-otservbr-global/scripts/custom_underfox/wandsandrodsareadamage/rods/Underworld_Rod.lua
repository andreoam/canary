local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local underworldrod = Weapon(WEAPON_WAND)

if not underworldrod then
    print("[ERROR] Falha ao criar a rod 'Underworld Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE) -- Dano de death
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH) -- Projétil death

combat:setArea(area) -- Definindo a área de combate

function onGetFormulaValues()
    local min = 56
    local max = 74
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

underworldrod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

underworldrod:id(8082)
underworldrod:mana(20)
underworldrod:range(5)
underworldrod:register()

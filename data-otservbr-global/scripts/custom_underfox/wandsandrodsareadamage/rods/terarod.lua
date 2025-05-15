local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local terarod = Weapon(WEAPON_WAND)

if not terarod then
    print("[ERROR] Falha ao criar a rod 'Tera Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de Terra

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 37
    local max = 53
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

terarod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

terarod:id(3065)
terarod:mana(2)
terarod:range(3)
terarod:register()

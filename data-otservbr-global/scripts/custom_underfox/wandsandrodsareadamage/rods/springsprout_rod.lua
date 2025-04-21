local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local springsprout_rod = Weapon(WEAPON_WAND)

if not springsprout_rod then
    print("[ERROR] Falha ao criar a rod 'Springsprout Rod'. Verifique a configuração do servidor.")
    return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de Terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de Terra

combat:setArea(area)  -- Definindo a área de combate

function onGetFormulaValues()
    local min = 56
    local max = 74
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

springsprout_rod.onUseWeapon = function(player, variant)
    return combat:execute(player, variant)
end

springsprout_rod:id(8084)
springsprout_rod:mana(2)
springsprout_rod:range(3)
springsprout_rod:register()

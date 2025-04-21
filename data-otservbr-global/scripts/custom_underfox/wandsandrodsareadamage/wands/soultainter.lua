local area = createCombatArea({
   {0, 1, 1, 1, 0},
   {1, 1, 1, 1, 1},
   {1, 1, 3, 1, 1},
   {1, 1, 1, 1, 1},
   {0, 1, 1, 1, 0},
})

local soultainter = Weapon(WEAPON_WAND)

if not soultainter then
   print("[ERROR] Falha ao criar a wand 'soultainter'. Verifique a configuração do servidor.")
   return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE) -- Dano de morte
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA) -- Efeito de morte
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH) -- Projétil SD

function onGetFormulaValues()
   local min = 100
   local max = 120
   return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

soultainter.onUseWeapon = function(player, variant)
   return combat:execute(player, variant)
end

combat:setArea(area)
soultainter:id(34090)
soultainter:mana(21)
soultainter:range(6)
soultainter:register()

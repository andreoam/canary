local area = createCombatArea({
   {0, 1, 1, 1, 0},
   {1, 1, 1, 1, 1},
   {1, 1, 3, 1, 1},
   {1, 1, 1, 1, 1},
   {0, 1, 1, 1, 0},
})

local soulhexer = Weapon(WEAPON_WAND) -- Certifique-se de que esta linha existe

if not soulhexer then
   print("[ERROR] Falha ao criar a wand 'soulhexer'. Verifique a configuração do servidor.")
   return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Corrigindo para ICE DAMAGE
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE) -- Projétil de gelo

function onGetFormulaValues()
   local min = 200
   local max = 300
   return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

soulhexer.onUseWeapon = function(player, variant)
   return combat:execute(player, variant)
end

combat:setArea(area)
soulhexer:id(34091)
soulhexer:mana(21)
soulhexer:range(6) -- Certifique-se de que a range é a correta
soulhexer:register()

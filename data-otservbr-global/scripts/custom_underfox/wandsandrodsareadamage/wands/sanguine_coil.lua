local area = createCombatArea({
   {0, 1, 1, 1, 0},
   {1, 1, 1, 1, 1},
   {1, 1, 3, 1, 1},
   {1, 1, 1, 1, 1},
   {0, 1, 1, 1, 0},
})

local sanguineCoil = Weapon(WEAPON_WAND)

if not sanguineCoil then
   print("[ERROR] Falha ao criar a wand 'sanguineCoil'. Verifique a configuração do servidor.")
   return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) -- Dano de Fogo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE) -- Projétil de Fogo

function onGetFormulaValues()
   local min = 113
   local max = 125
   return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

sanguineCoil.onUseWeapon = function(player, variant)
   return combat:execute(player, variant)
end

combat:setArea(area)
sanguineCoil:id(43882)
sanguineCoil:mana(21)
sanguineCoil:range(6)
sanguineCoil:register()

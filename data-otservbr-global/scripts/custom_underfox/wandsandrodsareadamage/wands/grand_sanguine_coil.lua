local area = createCombatArea({
   {0, 1, 1, 1, 0},
   {1, 1, 1, 1, 1},
   {1, 1, 3, 1, 1},
   {1, 1, 1, 1, 1},
   {0, 1, 1, 1, 0},
})

local grandSanguineCoil = Weapon(WEAPON_WAND)

if not grandSanguineCoil then
   print("[ERROR] Falha ao criar a wand 'grandSanguineCoil'. Verifique a configuração do servidor.")
   return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) -- Dano de fogo
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA) -- Efeito de fogo
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE) -- Projétil de fogo

function onGetFormulaValues()
   local min = 103
   local max = 125
   return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

grandSanguineCoil.onUseWeapon = function(player, variant)
   return combat:execute(player, variant)
end

combat:setArea(area)
grandSanguineCoil:id(43883)
grandSanguineCoil:mana(21)
grandSanguineCoil:range(6)
grandSanguineCoil:register()

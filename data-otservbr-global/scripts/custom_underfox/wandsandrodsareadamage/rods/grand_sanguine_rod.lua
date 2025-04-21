local area = createCombatArea({
   {0, 1, 1, 1, 0},
   {1, 1, 1, 1, 1},
   {1, 1, 3, 1, 1},
   {1, 1, 1, 1, 1},
   {0, 1, 1, 1, 0},
})

local grandSanguineRod = Weapon(WEAPON_WAND)

if not grandSanguineRod then
   print("[ERROR] Falha ao criar a wand 'grandSanguineRod'. Verifique a configuração do servidor.")
   return
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Dano de terra
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS) -- Efeito de terra
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH) -- Projétil de terra

function onGetFormulaValues()
   local min = 100
   local max = 124
   return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

grandSanguineRod.onUseWeapon = function(player, variant)
   return combat:execute(player, variant)
end

combat:setArea(area)
grandSanguineRod:id(43886)
grandSanguineRod:mana(20)
grandSanguineRod:range(6)
grandSanguineRod:register()

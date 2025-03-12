local bless_Book = Action()

function bless_Book.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and (player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)) then
        player:sendCancelMessage("You can't buy bless while in battle.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end
    local hasToF = player:hasBlessing(1) or true
    donthavefilter = function(p, b)
        return not p:hasBlessing(b)
    end
    local missingBless = player:getBlessings(nil, donthavefilter)
    local missingBlessAmt = #missingBless + (hasToF and 0 or 1)

    if missingBlessAmt == 0 then
        player:sendCancelMessage("You are already blessed.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local missingBless = player:getBlessings(nil, donthavefilter)
        for i, v in ipairs(missingBless) do
            player:addBlessing(v.id, 1)
        end
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

    return true
end

bless_Book:id(60151)
bless_Book:register()
--put this file in: canary\data-otservbr-global\scripts\actions\custom\get_boxes.lua

local OfferType = {
    COINS = 1,
    ITEM = 2,
    BACKPACK = 3,
    OUTFIT = 4,
    MOUNT = 5,
    HOUSE = 6,
}

-- example
local boxes = {
    [60168] = {
        {
            type = OfferType.COINS,
            id = 22118,
            count = 1500,
        },
        {
            type = OfferType.ITEM,
            id = 649,
            count = 1,
        }, -- item
        -- {
        --     type = OfferType.OUTFIT,
        --     id = { female = 1777, male = 1776 },
        --     count = 1,
        --     valueCoins = 100,
        -- }, -- outfit
        -- {
        --     type = OfferType.MOUNT,
        --     id = 000,
        --     count = 1,
        --     valueCoins = 100,
        -- }, -- mount
        {
            type = OfferType.ITEM,
            id = 60221,
            count = 1,
        }, -- other item
        -- {
        --     type = OfferType.HOUSE,
        --     id = 00000,
        --     count = 1,
        -- }, -- item house
        -- {
        --     type = OfferType.HOUSE,
        --     id = 00000,
        --     count = 1,
        -- }, -- item house
        {
            type = OfferType.BACKPACK,
            id = 30197,
            count = 1,
        }, -- backpack
    },
    [60169] = {
        {
            type = OfferType.COINS,
            id = 22118,
            count = 1500,
        },
        {
            type = OfferType.ITEM,
            id = 649,
            count = 1,
        }, 
        {
            type = OfferType.ITEM,
            id = 60221,
            count = 1,
        }, 
        {
            type = OfferType.BACKPACK,
            id = 30197,
            count = 1,
        },
    },
    [60170] = {
        {
            type = OfferType.COINS,
            id = 22118,
            count = 1500,
        },
        {
            type = OfferType.ITEM,
            id = 649,
            count = 1,
        }, 
        {
            type = OfferType.ITEM,
            id = 60221,
            count = 1,
        }, 
        {
            type = OfferType.BACKPACK,
            id = 30197,
            count = 1,
        },
    },
    [60171] = {
        {
            type = OfferType.COINS,
            id = 22118,
            count = 1500,
        },
        {
            type = OfferType.ITEM,
            id = 649,
            count = 1,
        }, 
        {
            type = OfferType.ITEM,
            id = 60221,
            count = 1,
        }, 
        {
            type = OfferType.BACKPACK,
            id = 30197,
            count = 1,
        },
    },
    [60172] = {
        {
            type = OfferType.COINS,
            id = 22118,
            count = 1500,
        },
        {
            type = OfferType.ITEM,
            id = 649,
            count = 1,
        }, 
        {
            type = OfferType.ITEM,
            id = 60221,
            count = 1,
        }, 
        {
            type = OfferType.BACKPACK,
            id = 30197,
            count = 1,
        },
    },
    [60173] = {
       {
            type = OfferType.COINS,
            id = 22118,
            count = 1500,
        }, 
        {
            type = OfferType.ITEM,
            id = 649,
            count = 1,
        }, 
        {
            type = OfferType.ITEM,
            id = 60221,
            count = 1,
        }, 
        {
            type = OfferType.BACKPACK,
            id = 30197,
            count = 1,
        },
    },
}

function createHistory(accId, message, value)
    GameStore.insertHistory(accId, GameStore.HistoryTypes.HISTORY_TYPE_NONE, message, value, GameStore.CoinType.Transferable)
end

local getBox = Action()
function getBox.onUse(player, box, fromPosition, target, toPosition, isHotkey)
    local boxItems = boxes[box.itemid]
    if not boxItems then
        return false
    end

    local boxName = ItemType(box.itemid):getName():lower()
    box:remove(1)

    local itemsCreated = {}
    for _, item in ipairs(boxItems) do
        local count = item.count or 1
        if item.type == OfferType.COINS then
            player:addTransferableCoins(count)
            createHistory(player:getAccountId(), boxName .. " gift", count)
            table.insert(itemsCreated, string.format("%d transferable tibia coins.", count))
        elseif item.type == OfferType.ITEM or item.type == OfferType.BACKPACK or item.type == OfferType.HOUSE then
            local itemType = ItemType(item.id)
            if itemType then
                local inbox = player:getStoreInbox()
                if inbox then
                    if item.type == OfferType.HOUSE then
                        local decoKit = inbox:addItem(ITEM_DECORATION_KIT, 1)
                        if decoKit then
                            decoKit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Unwrap it in your own house to create a <" .. itemType:getName() .. ">.")
                            decoKit:setCustomAttribute("unWrapId", item.id)
                            decoKit:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())
                            player:sendUpdateContainer(inbox)
                            table.insert(itemsCreated, string.format("%d %s in your store inbox.", count, itemType:getName()))
                        end
                    else
                        local pendingCount = 0
                        while pendingCount < count do
                            local newItem = inbox:addItem(item.id, 1)
                           --[[f item.type == OfferType.ITEM then
                                newItem:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())
                            end ]]
                            pendingCount = pendingCount + 1
                        end
                        table.insert(itemsCreated, string.format("%d %s in your store inbox.", count, itemType:getName()))
                    end
                end
            end
        else
            if item.type == OfferType.OUTFIT then
                local female, male = item.id.female, item.id.male
                if player:hasOutfit(female) or player:hasOutfit(male) then
                    player:addTransferableCoins(item.valueCoins)
                    createHistory(player:getAccountId(), boxName .. " gift, because you already have full NAME outfit", item.valueCoins)
                    table.insert(itemsCreated, string.format("%d transferable tibia coins, because you already have this outfit.", item.valueCoins))
                else
                    player:addOutfitAddon(female, 3)
                    player:addOutfitAddon(male, 3)
                    table.insert(itemsCreated, "Full NAME outfit.")
                end
            elseif item.type == OfferType.MOUNT then
                if player:hasMount(item.id) then
                    player:addTransferableCoins(item.valueCoins)
                    createHistory(player:getAccountId(), boxName .. " gift, because you already have NAME mount", item.valueCoins)
                    table.insert(itemsCreated, string.format("%d transferable tibia coins, because you already have this mount.", item.valueCoins))
                else
                    player:addMount(item.id)
                    table.insert(itemsCreated, "1 NAME mount.")
                end
            end
        end
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Congratulations! \zYou have used %s and won the followed items:\n%s", boxName, table.concat(itemsCreated, "\n")))
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)

    local messages = {
        string.format("O Jogador {yellow|" .. player:getName() .. "} acabou de abrir um {blue|%s}.", boxName),
    }
    

    local players = Game.getPlayers()
    for _, player in ipairs(players) do
        player:sendColoredMessage(messages[math.random(#messages)])
    end
    return true
end

for boxId in pairs(boxes) do
    getBox:id(boxId)
end
getBox:register()

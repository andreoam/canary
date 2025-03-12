-- Função para retirar dinheiro do banco
function getBankMoney(cid, amount)
    local player = Player(cid)
    if player:getBankBalance() >= amount then
        player:setBankBalance(player:getBankBalance() - amount)
        player:sendTextMessage(MESSAGE_TRADE, "Paid " .. FormatNumber(amount) .. " gold from bank account. Your account balance is now " .. FormatNumber(player:getBankBalance()) .. " gold.")
        return true
    end
    return false
end

-- Configuração das runas para o crafting
local config = {
    -- Window Config
    mainTitleMsg = "Rune System", 
    mainMsg = "Welcome to the crafting system. Please choose an item to craft.", 

    craftTitle = "Rune System: ", 
    craftMsg = "Here is a list of runes you can craft:", 

    needItems = "You need money in your backpack to make the purchase ", 

    -- Crafting Config
    runes = {
    [1] = { item = "Avalanche Rune", itemID = 3161, reqGold = 5700 },
    [2] = { item = "Destroy Field Rune", itemID = 3148, reqGold = 5700 },
    [3] = { item = "Disintegrate Rune", itemID = 3197, reqGold = 5700 },
    [4] = { item = "Energy Bomb Rune", itemID = 3149, reqGold = 5700 },
    [5] = { item = "Fire Bomb Rune", itemID = 3192, reqGold = 5700 },
    [6] = { item = "Great Fireball Rune", itemID = 3191, reqGold = 5700 },
    [7] = { item = "Magic Wall Rune", itemID = 3180, reqGold = 5700 },
    [8] = { item = "Paralyse Rune", itemID = 3165, reqGold = 5700 },
    [9] = { item = "Poison Bomb Rune", itemID = 3173, reqGold = 5700 },
    [10] = { item = "Stone Shower Rune", itemID = 3175, reqGold = 5700 },   
    [11] = { item = "Sudden Death Rune", itemID = 3155, reqGold = 5700 },
    [12] = { item = "Thunderstorm Rune", itemID = 3202, reqGold = 5700 },
    [13] = { item = "Ultimate Healing Rune", itemID = 3160, reqGold = 5700 },
    [14] = { item = "Wild Growth Rune", itemID = 3156, reqGold = 5700 }
    },
}

-- Função para adicionar runas à mochila dentro do inbox do jogador
local function addRunesToPlayer(player, runeID, amount)
    local inbox = player:getStoreInbox()
    if inbox then
        local backpack = nil

        -- Itera sobre os itens no inbox para encontrar a mochila com ID 23721
        for i = 0, inbox:getSize() - 1 do
            local item = inbox:getItem(i)
            if item and item:getId() == 23721 then
                backpack = item
                break
            end
        end

        if backpack then
            -- Adiciona as runas dentro da mochila
            for _ = 1, amount do
                local rewardItem = backpack:addItem(runeID, 1)
                if rewardItem then
                    rewardItem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "You received this item from crafting.")
                    rewardItem:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, 1)
                end
            end
        else
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "No backpack found in your store inbox.")
        end
    end
end

-- Rune Crafting Window
function Player:sendRuneCraftWindow(config)
    local function buttonCallback(player, button, choice)
        local rune = config.runes[choice.id]
        local runeAmount = 100  -- Padrão para 100 itens

        if button.name == "100" then
            runeAmount = 100
        elseif button.name == "500" then
            runeAmount = 500
        else
            return
        end

        local requiredGold = rune.reqGold * (runeAmount / 100)

        -- Verifica se o jogador tem ouro suficiente no banco
        if not getBankMoney(player:getId(), requiredGold) then
            player:say(config.needItems .. rune.item, TALKTYPE_MONSTER_SAY)
            return false
        end

        -- Adiciona as runas à mochila dentro do inbox do jogador
        addRunesToPlayer(player, rune.itemID, runeAmount)

        player:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
    end

    -- Modal window design
    local window = ModalWindow {
        title = config.craftTitle,
        message = config.craftMsg .. "\n\n",
    }

    -- Add buttons to the window
    window:addButton("100", buttonCallback)
    window:addButton("500", buttonCallback)
    window:addButton("Exit")

    -- Set default buttons
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(2)

    -- Add choices for the crafting options
    for i = 1, #config.runes do
        window:addChoice(config.runes[i].item)
    end

    -- Send the window to player
    window:sendToPlayer(self)
end

-- Ação para o item que abre o sistema de crafting
local runerefill = Action()
function runerefill.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if item:getId() == 60065 then
        player:sendRuneCraftWindow(config)  -- Abre diretamente a janela de crafting
        return true
    end
    return false
end

runerefill:id(60065) -- Define ID do item que irá abrir o crafting
runerefill:register()
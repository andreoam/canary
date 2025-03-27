dofile("data-otservbr-global/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")

function mainUpgradeSystem(player)
    local posTo = player:getPosition()
        local window = ModalWindow{
            title = "Upgrade System",
            message = "Voce gostaria de utilizar o System Upgrade com garantia de que nao havera downgrade no seu item?\n\nVerifique o item necessario clicando em Seguro.\n\nClique no numero 1 se deseja realizar o upgrade sem o uso do seguro. Nesta opcao, sua Upgrade Stone pode aprimorar, falhar ou causar downgrade no item.\n\nClique no numero 2 se deseja realizar o upgrade utilizando o item seguro, garantindo protecao contra downgrade.\n\nPara alterar entre as opcoes, e necessario sair e entrar do System Upgrade."
        }
        window:addChoice("Seguro: Contra Downgrade")
        window:addButton("Seguro", function() recipeUpgradeSystem(player) end)
        window:addButton("1", function() removeItemUpgradeSystem(player) end)
        window:addButton("2", function() noRemoveItemUpgradeSystem(player) end)
        window:addButton("Exit", function() closeUpgradeSystem(player) end)
        window:sendToPlayer(player)
end

function removeItemUpgradeSystem(player)
    local posTo = player:getPosition()
    local playerKV = player:kv()
    playerKV:set(Upgrade_System_config.recipeOptionSelected.removeItem, 1)
    playerKV:set(Upgrade_System_config.recipeOptionSelected.noRemoveItem, 0)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lembrando que nesta opcao voce nao esta utilizando o seguro. Aperte Start, jogue o item em cima da forja e bate a pedra. Boa sorte.")
        local window = ModalWindow{
            title = "Upgrade System",
            message = "Lembrando que nesta opcao voce nao esta utilizando o seguro. Aperte Start, jogue o item em cima da forja e bate a pedra. Boa sorte."
        }
        window:addButton("Back", function() mainUpgradeSystem(player) end)
        window:addButton("Go", function() closeUpgradeSystem(player) end)
        window:sendToPlayer(player)
end

function noRemoveItemUpgradeSystem(player)
    local posTo = player:getPosition()
    local playerKV = player:kv()
    playerKV:set(Upgrade_System_config.recipeOptionSelected.removeItem, 0)
    playerKV:set(Upgrade_System_config.recipeOptionSelected.noRemoveItem, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lembrando que nesta opcao voce esta utilizando o item seguro, logo, voce esta protegido contra downgrade. Seu Upgrade Stone pode falhar ou aprimorar. Clicka Start, jogue seu item na forja e bata a pedra. Boa sorte.")
        local window = ModalWindow{
            title = "Upgrade System",
            message = "Lembrando que nesta opcao voce esta utilizando o item seguro, logo, voce esta protegido contra downgrade. Seu Upgrade Stone pode falhar ou aprimorar. Clicka Start, jogue seu item na forja e bata a pedra. Boa sorte."
        }
        window:addButton("Back", function() mainUpgradeSystem(player) end)
        window:addButton("Start", function() closeUpgradeSystem(player) end)
        window:sendToPlayer(player)
end

function recipeUpgradeSystem(player, button, choice)
    local posTo = player:getPosition()
    local window = ModalWindow{
        title = "Upgrade System",
        message = "Item para protecao."
    }
    local upgradeLevels = Upgrade_System_levels(Upgrade_System_config)
    local blackList = {"itemUnique"}
    for _, level in ipairs(upgradeLevels) do
        if not table.contains(blackList, level) then
            local functionName = level:lower() .. "Recipe"
            if _G[functionName] then
                window:addChoice(level, function() 
                    _G[functionName](player, level)
                end)
            end
        end
    end
    window:addButton("Read")
    window:addButton("Back", function() mainUpgradeSystem(player) end)
    window:addButton("Exit", function() closeTierForge(player) end)
    window:sendToPlayer(player)
    return true
end

local function generateRecipeFunctions()
    local upgradeLevels = Upgrade_System_config
    for level, data in pairs(upgradeLevels) do
        local functionName = level:lower() .. "Recipe"
        _G[functionName] = function(player, level)
            local posTo = player:getPosition()
            local window = ModalWindow{
                title = "Upgrade System",
                message = "Recipe Items for " .. level .. ":"
            }
            if data.recipe and data.recipe.items then
                for _, item in ipairs(data.recipe.items) do
                    window:addChoice("" .. Upgrade_System_capitalizeFirstLetters(getItemName(item.id)) .. " x" .. item.count, function() 
                    end)
                end
            end
            window:addButton("Back", function() recipeUpgradeSystem(player) end)
            window:addButton("Exit", function() closeUpgradeSystem(player) end)
            window:sendToPlayer(player)
            return true
        end
    end
end
generateRecipeFunctions()

function closeUpgradeSystem(player, button, choice)
    return true
end

local upgradeSystem_entrance = MoveEvent()

function upgradeSystem_entrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
    mainUpgradeSystem(player)
	return true
end

upgradeSystem_entrance:type("stepin")
upgradeSystem_entrance:aid(Upgrade_System_config.actionId.entranceforge)
upgradeSystem_entrance:register()

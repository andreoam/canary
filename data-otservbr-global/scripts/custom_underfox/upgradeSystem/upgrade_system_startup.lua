-- upgradeSystem library
dofile(DATA_DIRECTORY .. "/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")
local upgradeStartup = GlobalEvent("UpgradeStartup")

function upgradeStartup.onStartup()
    local function isItemOnPosition(position, itemId)
        local tile = Tile(position)
        if tile then
            for _, item in ipairs(tile:getItems()) do
                if item:getId() == itemId then
                    return true
                end
            end
        end
        return false
    end
    
    local function createForgeBase(baseConfig, direction, itemForge, wallPosition)
        local yOffset = 0
        local xOffset = 0

        if direction == "anvilpositions" then
            xOffset = -1
            yOffset = 2
        end

        for i, row in ipairs(baseConfig) do
            for j, value in ipairs(row) do
                local position = Position(wallPosition.x + j - 1 + xOffset, wallPosition.y - i + 1 + yOffset, wallPosition.z)
                
                -- Checa apenas se os itens na posição fazem parte de itemForge
                if value == 2 and not isItemOnPosition(position, Upgrade_System_itemForge.basetwo) then
                    Game.createItem(Upgrade_System_itemForge.basetwo, 1, position)
                elseif value == 3 and not isItemOnPosition(position, itemForge.base) then
                    Game.createItem(Upgrade_System_itemForge.base, 1, position)
                    local anvil = Game.createItem(Upgrade_System_itemForge.anvil, 1, position)
                    if anvil then
                        anvil:setActionId(100)
                        anvil:setUniqueId(Upgrade_System_config.forge)
                    end
                elseif value == 4 and not isItemOnPosition(position, Upgrade_System_itemForge.basin) then
                    Game.createItem(Upgrade_System_itemForge.basin, 1, position)
                elseif value == 5 and not isItemOnPosition(position, Upgrade_System_itemForge.basetwo) then
                    local anvil = Game.createItem(Upgrade_System_itemForge.anvil, 1, position)
                    if anvil then
                        anvil:setActionId(100)
                        anvil:setUniqueId(Upgrade_System_config.forge)
                    end
                elseif value == 0 then
                    local topItems = Tile(position):getItems()
                    for _, item in ipairs(topItems) do
                        if item:getId() == Upgrade_System_itemForge.basetwo or item:getId() == Upgrade_System_itemForge.basin then
                            item:remove()
                        end
                    end
                end
            end
        end
    end

    -- Direção fixa sem necessidade de pairs
    local direction = "anvilpositions"
    
    -- Mantém o pairs aqui pois é necessário para o Upgrade_System_forge
    for _, wallPosition in pairs(Upgrade_System_forge[direction]) do
        local baseConfig = {
            {2, 0, 2},
            {2, 8, 2},
            {4, 3, 4},
            {0, 0, 0}
        }
        createForgeBase(baseConfig, direction, Upgrade_System_itemForge, wallPosition)
    end

    return true
end

upgradeStartup:register()
dofile("data-otservbr-global/scripts/custom_underfox/upgradeSystem/upgrade_system_lib.lua")
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

        if direction == "north" then
            xOffset = -1
            yOffset = 2
        elseif direction == "south" then
            xOffset = -1
            yOffset = 1
        elseif direction == "east" then
            xOffset = -2
            yOffset = 1
        elseif direction == "west" then
            xOffset = -1
            yOffset = 1
        end

        for i, row in ipairs(baseConfig) do
            for j, value in ipairs(row) do
                local position = Position(wallPosition.x + j - 1 + xOffset, wallPosition.y - i + 1 + yOffset, wallPosition.z)
                
                -- Checa apenas se os itens na posição fazem parte de itemForge
                if value == 2 and not isItemOnPosition(position, Upgrade_System_itemForge.basetwo) then
                    Game.createItem(Upgrade_System_itemForge.basetwo, 1, position)
                elseif value == 3 and not isItemOnPosition(position, itemForge.base) then
                    Game.createItem(Upgrade_System_itemForge.base, 1, position)
                    Game.createItem(Upgrade_System_itemForge.anvil, 1, position)
                elseif value == 4 and not isItemOnPosition(position, Upgrade_System_itemForge.basin) then
                    Game.createItem(Upgrade_System_itemForge.basin, 1, position)
                elseif value == 5 and not isItemOnPosition(position, Upgrade_System_itemForge.basetwo) then
                    Game.createItem(Upgrade_System_itemForge.basetwo, 1, position)
                    Game.createItem(Upgrade_System_itemForge.anvil, 1, position)
                elseif value == 6 and not isItemOnPosition(position, Upgrade_System_itemForge.basintwo) then
                    Game.createItem(Upgrade_System_itemForge.basintwo, 1, position)
                elseif value == 7 and not isItemOnPosition(position, Upgrade_System_itemForge.basintree) then
                    Game.createItem(Upgrade_System_itemForge.basintree, 1, position)
                elseif value == 8 and not isItemOnPosition(position, Upgrade_System_itemForge.basintree) then
                    local tile = Game.createItem(Upgrade_System_itemForge.tile, 1, position)
                    tile:setActionId(Upgrade_System_config.actionId.entranceforge)
                elseif value == 1 and not isItemOnPosition(position, Upgrade_System_itemForge.base) then
                    Game.createItem(Upgrade_System_itemForge.base, 1, position)
                elseif value == 0 then
                    -- Remove apenas os itens que fazem parte do itemForge
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

    local directions = {"north", "south", "east", "west"}

    for _, direction in pairs(directions) do
        for _, wallPosition in pairs(Upgrade_System_forge[direction]) do
            local baseConfig
            if direction == "north" then
                baseConfig = {
                    {2, 0, 2},
                    {2, 8, 2},
                    {4, 3, 4},
                    {0, 0, 0}
                }
            elseif direction == "south" then
                baseConfig = {
                    {0, 0, 0},
                    {4, 3, 4},
                    {2, 8, 2},
                    {2, 0, 2}
                }
            elseif direction == "east" then
                baseConfig = {
                    {1, 1, 4, 0},
                    {0, 8, 5, 0},
                    {1, 1, 4, 0}
                }
            elseif direction == "west" then
                baseConfig = {
                    {0, 4, 1, 1},
                    {0, 8, 0, 0},
                    {0, 4, 1, 1}
                }
            end
            createForgeBase(baseConfig, direction, Upgrade_System_itemForge, wallPosition)
        end
    end

    return true
end

upgradeStartup:register()
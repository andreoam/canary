local config = {
	enableTemples = true,

	Temples = {
		{ fromPos = Position(32727, 31632, 7), toPos = Position(32736, 31639, 7), townId = TOWNS_LIST.AB_DENDRIEL },
		{ fromPos = Position(32358, 31777, 7), toPos = Position(32364, 31787, 7), townId = TOWNS_LIST.CARLIN },
		{ fromPos = Position(32642, 31921, 11), toPos = Position(32656, 31929, 11), townId = TOWNS_LIST.KAZORDOON },
		{ fromPos = Position(32365, 32231, 7), toPos = Position(32374, 32243, 7), townId = TOWNS_LIST.THAIS },
		{ fromPos = Position(32953, 32072, 7), toPos = Position(32963, 32081, 7), townId = TOWNS_LIST.VENORE },
		{ fromPos = Position(33188, 32844, 8), toPos = Position(33201, 32857, 8), townId = TOWNS_LIST.ANKRAHMUN },
		{ fromPos = Position(33208, 31803, 8), toPos = Position(33225, 31819, 8), townId = TOWNS_LIST.EDRON },
		{ fromPos = Position(33018, 31514, 11), toPos = Position(33032, 31531, 11), townId = TOWNS_LIST.FARMINE },
		{ fromPos = Position(33210, 32450, 1), toPos = Position(33217, 32457, 1), townId = TOWNS_LIST.DARASHIA },
		{ fromPos = Position(32313, 32818, 7), toPos = Position(32322, 32830, 7), townId = TOWNS_LIST.LIBERTY_BAY },
		{ fromPos = Position(32590, 32740, 7), toPos = Position(32600, 32750, 7), townId = TOWNS_LIST.PORT_HOPE },
		{ fromPos = Position(32209, 31130, 7), toPos = Position(32215, 31136, 7), townId = TOWNS_LIST.SVARGROND },
		{ fromPos = Position(32785, 31275, 7), toPos = Position(32789, 31279, 7), townId = TOWNS_LIST.YALAHAR },
		{ fromPos = Position(33444, 31313, 9), toPos = Position(33452, 31324, 9), townId = TOWNS_LIST.GRAY_BEACH },
		{ fromPos = Position(33586, 31895, 6), toPos = Position(33602, 31902, 6), townId = TOWNS_LIST.RATHLETON },
		{ fromPos = Position(33510, 32360, 6), toPos = Position(33516, 32365, 6), townId = TOWNS_LIST.ROSHAMUUL },
		{ fromPos = Position(33916, 31474, 5), toPos = Position(33926, 31480, 5), townId = TOWNS_LIST.ISSAVI },
	},

}

local roletaStore = Action()

local function doNotTeleport(player)
	local enabledLocations = {}
	if config.enableTemples then
		table.insert(enabledLocations, "temple")
	end

	local message = "Try to move more to the center of a " .. table.concat(enabledLocations, " or ") .. " to use the spiritual energy for a teleport."
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
end

function roletaStore.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(player:getPosition())
	if not tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasFlag(TILESTATE_HOUSE) or player:isPzLocked() then
		doNotTeleport(player)
		return false
	end

	local playerPos, allowed, townId = player:getPosition(), false, player:getTown():getId()

	if config.enableTemples then
		for _, temple in ipairs(config.Temples) do
			if playerPos:isInRange(temple.fromPos, temple.toPos) then
				allowed, townId = true, temple.townId
				break
			end
		end
	end

	if not allowed then
		doNotTeleport(player)
		return false
	end

	player:setStorageValue(Storage.AdventurersGuild.Stone, townId)
	playerPos:sendMagicEffect(CONST_ME_TELEPORT)

	local destination = Position(31724, 32452, 10)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

roletaStore:id(5958)
roletaStore:register()
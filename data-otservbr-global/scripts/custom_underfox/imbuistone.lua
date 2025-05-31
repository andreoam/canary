-- Função para retirar dinheiro do banco
	function getBankMoney(cid, amount)
		local player = Player(cid)
		if player:getBankBalance() >= amount then
			player:setBankBalance(player:getBankBalance() - amount)
			return true
		end
		return false
	end
	
	-- Configuração dos itens por categoria
	local config = {
		mainTitleMsg = "Imbuing Stone System", 
		mainMsg = "Welcome to the crafting system. Please choose a category.", 
		
		categories = {
			["Support"] = {
				{ item = "Powerful Strike", itemList = {{22728, 5}, {10311, 25}, {11444, 20}}, reqGold = 1000000 }, 
				{ item = "Divine Strike", itemList = {{22728, 10}, {10311, 50}, {11444, 40}}, reqGold = 2000000 },
				{ item = "Powerful Vampirism", itemList = {{9663, 5}, {9633, 15}, {9685, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Vampirism", itemList = {{9663, 10}, {9633, 30}, {9685, 50}}, reqGold = 2000000 },  
				{ item = "Powerful Void", itemList = {{22730, 5}, {20200, 25}, {11492, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Void", itemList = {{22730, 10}, {20200, 50}, {11492, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Featherweight", itemList = {{20205, 5}, {25702, 10}, {25694, 20}}, reqGold = 1000000 }, 
				{ item = "Divine Featherweight", itemList = {{20205, 10}, {25702, 20}, {25694, 40}}, reqGold = 2000000 }, 
				{ item = "Powerful Swiftness", itemList = {{14081, 20}, {10302, 25}, {17458, 15}}, reqGold = 1000000 }, 
				{ item = "Divine Swiftness", itemList = {{14081, 40}, {10302, 50}, {17458, 30}}, reqGold = 2000000 }, 
			},
			["Skill"] = {
				{ item = "Powerful Chop (axe)", itemList = {{21200, 20}, {11447, 25}, {10196, 20}}, reqGold = 1000000 },
				{ item = "Divine Chop (axe)", itemList = {{21200, 40}, {11447, 50}, {10196, 40}}, reqGold = 2000000 },  
				{ item = "Powerful Bash (club)", itemList = {{10405, 10}, {22189, 15}, {9657, 20}}, reqGold = 1000000 }, 
				{ item = "Divine Bash (club)", itemList = {{10405, 20}, {22189, 30}, {9657, 40}}, reqGold = 2000000 }, 
				{ item = "Powerful Precision (distance)", itemList = {{10298, 10}, {18994, 20}, {11464, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Precision (distance)", itemList = {{10298, 20}, {18994, 40}, {11464, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Epiphany (ML)", itemList = {{10309, 15}, {11452, 15}, {9635, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Epiphany (ML)", itemList = {{10309, 30}, {11452, 30}, {9635, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Slash (sword)", itemList = {{9654, 5}, {21202, 25}, {9691, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Slash (sword)", itemList = {{9654, 10}, {21202, 50}, {9691, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Blockade (shield)", itemList = {{20199, 25}, {11703, 25}, {9641, 20}}, reqGold = 1000000 }, 
				{ item = "Divine Blockade (shield)", itemList = {{20199, 50}, {11703, 50}, {9641, 40}}, reqGold = 2000000 }, 
			},
			["Attack"] = {
				{ item = "Powerful Electrify (Energy)", itemList = {{23508, 1}, {21975, 5}, {18993, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Electrify (Energy)", itemList = {{23508, 2}, {21975, 10}, {18993, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Venom (Earth)", itemList = {{21194, 2}, {9640, 20}, {9686, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Venom (Earth)", itemList = {{21194, 4}, {9640, 40}, {9686, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Scorch (Fire)", itemList = {{5954, 5}, {5920, 5}, {9636, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Scorch (Fire)", itemList = {{5954, 10}, {5920, 10}, {9636, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Frost (Ice)", itemList = {{9650, 5}, {21801, 10}, {9661, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Frost (Ice)", itemList = {{9650, 10}, {21801, 20}, {9661, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Reap (Death)", itemList = {{10420, 5}, {9647, 20}, {11484, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Reap (Death)", itemList = {{10420, 10}, {9647, 40}, {11484, 50}}, reqGold = 2000000 }, 
			},
			["Defense"] = {
				{ item = "Powerful Cloud Fabric (Energy)", itemList = {{9665, 10}, {14079, 15}, {9644, 20}}, reqGold = 1000000 }, 
				{ item = "Divine Cloud Fabric (Energy)", itemList = {{9665, 20}, {14079, 30}, {9644, 40}}, reqGold = 2000000 }, 
				{ item = "Powerful Demon Presence (Holy)", itemList = {{10304, 20}, {9638, 25}, {9639, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Demon Presence (Holy)", itemList = {{10304, 40}, {9638, 50}, {9639, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Lich Shroud (Death)", itemList = {{9660, 5}, {22007, 20}, {11466, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Lich Shroud (Death)", itemList = {{9660, 10}, {22007, 40}, {11466, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Snake Skin (Earth)", itemList = {{11702, 10}, {9694, 20}, {17823, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Snake Skin (Earth)", itemList = {{11702, 20}, {9694, 40}, {17823, 50}}, reqGold = 2000000 }, 
				{ item = "Powerful Quara Scale (Ice)", itemList = {{14012, 10}, {10307, 15}, {10295, 25}}, reqGold = 1000000 }, 
				{ item = "Divine Quara Scale (Ice)", itemList = {{14012, 20}, {10307, 30}, {10295, 50}}, reqGold = 2000000 }, 
				{ item = "DPowerful ragon Hide (Fire)", itemList = {{11658, 5}, {16131, 10}, {5877, 20}}, reqGold = 1000000 }, 
				{ item = "Divine Dragon Hide (Fire)", itemList = {{11658, 10}, {16131, 20}, {5877, 40}}, reqGold = 1000000 }, 
			},
		},
		needItems = "You need money in your backpack to make the purchase",
	}
	
	-- Função para adicionar lista de itens ao jogador com quantidades específicas
	local function addItemsToPlayer(player, itemList, amount)
		local inbox = player:getStoreInbox()
		if inbox then
			for _, item in ipairs(itemList) do
				local itemID = item[1]
				local itemQuantity = item[2] * amount / 100  -- Multiplica a quantidade proporcionalmente ao valor de "100"
				inbox:addItem(itemID, itemQuantity)
			end
		end
	end
	
	-- Função para confirmar a compra
	function Player:sendConfirmationWindow(item, category)
		local confirmationWindow = ModalWindow {
			title = "Confirm Purchase",
			message = "You are buying the item " .. item.item .. " for imbue " .. category .. " for the amount of " .. (item.reqGold / 1000000) .. "KK!\n\nIs this correct?",
		}
	
		-- Botão Yes com callback separado
		confirmationWindow:addButton("Yes", function(player)
			local itemAmount = 100
			local requiredGold = item.reqGold * (itemAmount / 100)
		
			if not getBankMoney(player:getId(), requiredGold) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não tem dinheiro suficiente no banco.")
				return true
			end
		
			addItemsToPlayer(player, item.itemList, itemAmount)
			player:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você comprou " .. item.item .. " com sucesso.")
			return true
		end)
	
		-- Botão No com callback separado
		confirmationWindow:addButton("No", function(player)
			player:sendItemSelectionWindow(category)
			return true
		end)
	
		confirmationWindow:setDefaultEnterButton(1)
		confirmationWindow:setDefaultEscapeButton(2)
		confirmationWindow:sendToPlayer(self)
	end
	
	
	-- Segunda janela: Escolha do item apos a categoria
	function Player:sendItemSelectionWindow(category)
		local function buttonCallback(player, button, choice)
			if choice.id then
				local item = config.categories[category][choice.id]
	
				-- Abre a janela de confirma�ao
				player:sendConfirmationWindow(item, category)
			end
		end
	
		-- Modal window design para escolha de itens
		local window = ModalWindow {
			title = "Choose Item from " .. category,
			message = "Please select an item to craft:\n\n",
		}
	
		window:addButton("Buy", buttonCallback)
		window:addButton("Back", function(player) player:sendCategorySelectionWindow() end) -- Botão de voltar
		window:addButton("Exit")
		window:setDefaultEnterButton(1)
		window:setDefaultEscapeButton(2)
	
		for i = 1, #config.categories[category] do
			window:addChoice(config.categories[category][i].item)
		end
	
		window:sendToPlayer(self)
	end            
	
	-- Primeira janela: Escolha da categoria
	function Player:sendCategorySelectionWindow()
		local function categoryCallback(player, button, choice)
			-- Mapeando a escolha de índice para a categoria correta
			local categories = {"Support", "Skill", "Attack", "Defense"}
			local selectedCategory = categories[choice.id]
			player:sendItemSelectionWindow(selectedCategory)
		end
	
		-- Modal window design para escolha de categoria
		local window = ModalWindow {
			title = config.mainTitleMsg,
			message = config.mainMsg .. "\n\n",
		}
	
		-- Adiciona o botão para confirmar
		window:addButton("Select", categoryCallback)
		window:addButton("Exit")
		window:setDefaultEnterButton(1)
		window:setDefaultEscapeButton(0)
	
		-- Adiciona as opções de categoria
		window:addChoice("Support")
		window:addChoice("Skill")
		window:addChoice("Attack")
		window:addChoice("Defense")
	
		window:sendToPlayer(self)
	end
	
	-- ação para o item que abre o sistema de crafting
	local imbuistone = Action()
	function imbuistone.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
		if item:getId() == 28187 then
			player:sendCategorySelectionWindow()  -- Abre a janela de escolha de categoria
			return true
		end
		return false
	end
	
	imbuistone:id(28187) -- Define ID do item que irá abrir o crafting
	imbuistone:register()

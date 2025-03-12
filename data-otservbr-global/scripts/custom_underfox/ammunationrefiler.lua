-- Função para retirar dinheiro do banco
	function getBankMoney(cid, amount)
		local player = Player(cid)
		if player:getBankBalance() >= amount then
			player:setBankBalance(player:getBankBalance() - amount)
			-- Removido: Envio de mensagem sobre a retirada
			return true
		end
		return false
	end
	
	-- Configuração das munições para o crafting
	local config = {
		mainTitleMsg = "Ammunation System", 
		mainMsg = "Welcome to the crafting system. Please choose an item to craft.", 
		craftTitle = "Ammunation System: ", 
		craftMsg = "Here is a list of ammunition you can craft:", 
		needItems = "You need money in your backpack to make the purchase ", 
		ammunition = {
			[1] = { item = "Diamond Arrow", itemID = 35901, reqGold = 5700 },
			[2] = { item = "Spectral Bolt", itemID = 25758, reqGold = 5700 },
		},
	}
	
	-- Função para adicionar munições ao jogador
	local function addAmmunitionToPlayer(player, ammunitionID, amount)
		player:addItem(ammunitionID, amount)
	end
	
	-- Ammunation Crafting Window
	function Player:sendAmmunationCraftWindow(config)
		local function buttonCallback(player, button, choice)
			local ammunition = config.ammunition[choice.id]
			local ammoAmount = 100  -- Padrão para 100 itens
	
			if button.name == "100" then
				ammoAmount = 100
			elseif button.name == "500" then
				ammoAmount = 500
			else
				return
			end
	
			local requiredGold = ammunition.reqGold * (ammoAmount / 100)
	
			-- Verifica se o jogador tem ouro suficiente no banco
			if not getBankMoney(player:getId(), requiredGold) then
				-- Não envia mensagem quando não tem dinheiro
				return false
			end
	
			-- Adiciona as munições ao jogador
			addAmmunitionToPlayer(player, ammunition.itemID, ammoAmount)
	
			player:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
		end
	
		-- Modal window design
		local window = ModalWindow {
			title = config.craftTitle,
			message = config.craftMsg .. "\n\n",
		}
	
		-- Adiciona os botões "100" e "500"
		window:addButton("100", buttonCallback)
		window:addButton("500", buttonCallback)
		window:addButton("Exit")
	
		window:setDefaultEnterButton(0)
		window:setDefaultEscapeButton(2)
	
		for i = 1, #config.ammunition do
			window:addChoice(config.ammunition[i].item)
		end
	
		window:sendToPlayer(self)
	end
	
	-- Ação para o item que abre o sistema de crafting
	local ammunitionrefill = Action()
	function ammunitionrefill.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
		if item:getId() == 60063 then
			player:sendAmmunationCraftWindow(config)  -- Abre diretamente a janela de crafting
			return true
		end
		return false
	end
	
	ammunitionrefill:id(60063) -- Define ID do item que irá abrir o crafting
	ammunitionrefill:register()
	
local calendario = TalkAction("!calendario")

function calendario.onSay(player, words, param)
    -- Exibe uma janela modal com a mensagem
    local window = ModalWindow(1000, "Calendario de Eventos", "Dia 15/11 a 18/11 - Fast Exercise + 20% skill bonus")

    -- Botão para fechar a janela
    window:addButton(100, "Fechar")
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(100)

    -- Abre a janela para o jogador
    window:sendToPlayer(player)

    return true
end

calendario:groupType("normal")
calendario:register()

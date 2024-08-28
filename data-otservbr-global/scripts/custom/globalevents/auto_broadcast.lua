local AutoBroadCast = GlobalEvent("text")
local interval = 5 -- minuts
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {
        "[SEGURANÇA]: Nunca Utilize o mesmo e email e senha de outros OTS",
        "[SISTME DE EVENTOS]: Não esqueça de conferir os eventos ativos em nosso discord, você pode ganhar muitos prêmios",
        "[REWARD]: Digite !reward para receber seu reward diário",
        "[VIP]: Torne-se vip e receba bonus adicionais, alem de ganhar uma nova montaria",
        "[COMMANDS]: Confira todos os comandos disponíves em !commands",
}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_STATUS_WARNING) 
    return true
end
AutoBroadCast:interval(interval * 60 * 1000)
AutoBroadCast:register()
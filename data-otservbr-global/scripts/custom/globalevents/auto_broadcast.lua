local AutoBroadCast = GlobalEvent("text")
local interval = 5 -- minuts
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {
        "[Task System]: Type !task, choose missions or check the status of the current one",
        "[SEGURANÇA]: Nunca Utilize o mesmo e email e senha de outros OTS",
        "[SISTME DE EVENTOS]: Não esqueça de conferir os eventos ativos em nosso discord, você pode ganhar muitos prêmios",
        "[REWARD]: Digite !reward para receber seu reward diário",
        "[VIP]: Torne-se vip e receba bonus adicionais, alem de ganhar uma nova montaria",
        "[DONATE TC]: Aceitamos donates via TC Global, visite nosso site e confira",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_STATUS_WARNING) 
    return true
end
AutoBroadCast:interval(interval * 60 * 1000)
AutoBroadCast:register()
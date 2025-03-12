local vip = TalkAction("!fps")
 
 function vip.onSay(player, words, param)
     player:disconnect()
     return true
 end
 
 vip:groupType("normal")
 vip:register()
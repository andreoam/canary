local fps = TalkAction("!fps")
 
 function fps.onSay(player, words, param)
     player:disconnect()
     return true
 end
 
 fps:groupType("normal")
 fps:register()
function main()
{
variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}

IRC !c ${sWhoIRC} -OgreCommandOB_AP All Nav Potion1 -ntr
Wait 100

; Gett 100 potions each	
IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishPotion "Abyssal Noxious Remedy" 100
Wait 70
IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishPotion "Abyssal Arcane Remedy" 100
Wait 70
IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishPotion "Abyssal Elemental Remedy" 100
Wait 70
IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishPotion "Abyssal Trauma Remedy" 100

}
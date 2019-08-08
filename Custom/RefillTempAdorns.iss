function main()
{
variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}

IRC !c ${sWhoIRC} -OgreCommandOB_AP All Nav Potion1 -ntr
Wait 100

; Gett 5 Temp Adorns each	
IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishTempAdorns "Maintained Machined Injector" 10

}
function main()
{
;variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}
variable string sWhoIRC="All"

;Update Trophy Buff
IRC !c ${sWhoIRC} -OgreCommandOB_AP All Nav Trophy1 -ntr
wait 100
IRC !c ${sWhoIRC} -Special
wait 80

; Arcannase
IRC !c ${sWhoIRC} -OgreCommandOB_AP All Nav Arcannase1 -ntr
Wait 100
IRC !c ${sWhoIRC} -ArcannaseEffigyOfRebirth
Wait 120

; Heartbind
IRC !c ${sWhoIRC} -OgreCommandOB_AP All Nav Heartbind1 -ntr
Wait 50
IRC !c ${sWhoIRC} -Heartstone_RekindleBond

}
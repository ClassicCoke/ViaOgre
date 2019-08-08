function main()
{
variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}

IRC !c ${sWhoIRC} -OgreCommandOB_AP ${Me} Nav Depot1 -ntr
Wait 20
do
	{
	wait 10
	}
	while ${Me.IsMoving}
;Echo ${Me.Archetype}
If ( ${Me.Archetype.Equal["scout"]} || ${Me.Archetype.Equal["fighter"]} )
	{
	IRC !c ${sWhoIRC} -OgreCommandOB_AP ${Me} Quiver
	}
}
function main()
{

variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}
variable string sWho=${Me.Name}
variable int iMaxRaid=${Me.Raid}
variable int iMaxGroup=${Me.GroupCount}
variable int iCounter=0

Echo ${Time.Time24} UpdateRPCRelay Started
If ${iMaxRaid}
	{
	; If in a raid, must iterate all 24 positions
	iMaxRaid:Set[24]
	}
	
Do
	{
	If ${iMaxRaid}
		{
		If ${Me.Raid[${iCounter}](exists)}
			{
			IRC !c ${sWhoIRC} -rsob ${Me.Raid[${iCounter}]} "Custom/UpdateOgreRPC"
			}
		}
		else
		{
		IRC !c ${sWhoIRC} -rsob ${Me.Group[${iCounter}]} "Custom/UpdateOgreRPC"
		}
	iCounter:Inc
	Wait 350
	} 
	While ( ${iCounter} < ${iMaxRaid} ) || ( ${iCounter} < ${iMaxGroup} )
Echo ${Time.Time24} UpdateRPCRelay Complete
}
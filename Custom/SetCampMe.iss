function main( string sWho, bool bJoust)
{
	variable int	iXCord
	variable int	iYCord
	variable int	iZCord
	variable string sWhoIRC

	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWhoIRC:Set["Me"]
		}
		else
		{
		sWhoIRC:Set["All"]
		}
	
    IRC Run script:SetCampMe W:${sWho} JI=${bJoust} WhoIRC=${sWhoIRC}
 	iXCord:Set[${Me.X}]
	iYCord:Set[${Me.Y}]
	iZCord:Set[${Me.Z}]

	IRC !c ${sWhoIRC} -CampSpot ${sWho} 1 125
	IRC !c ${sWhoIRC} -CS_Set_ChangeCampSpot ${sWho} ${iXCord} ${iYCord} ${iZCord}
	If ${bJoust}
		{
		IRC !c ${sWhoIRC} -JoustIn
		}
}

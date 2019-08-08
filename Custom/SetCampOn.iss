function main( string sWho, string sWhoOn)
{
	variable float	fXCord
	variable float	fYCord
	variable float	fZCord
	variable string sWhoIRC

	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWhoIRC:Set["Me"]
		}
		else
		{
		sWhoIRC:Set["All"]
		}
	
    IRC Run script:SetCampOn Who:${sWho} CampOn=${sWhoOn}
 	fXCord:Set[${Actor[${sWhoOn}].X}]
	fYCord:Set[${Actor[${sWhoOn}].Y}]
	fZCord:Set[${Actor[${sWhoOn}].Z}]

	IRC !c ${sWhoIRC} -CampSpot ${sWho} 1 125
	IRC !c ${sWhoIRC} -ccsw ${sWho} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
}

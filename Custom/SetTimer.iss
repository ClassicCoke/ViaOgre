function main(int iLoc, int iTime, string sTimerName, string sWho)
{
	variable string sWhoIRC

	IRC Run script:SetTimer Loc:${iLoc} Time:${iTime} Who:${swho}
	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWhoIRC:Set["Me"]
		}
		else
		{
		sWhoIRC:Set["All"]
		}
	IRC !c ${sWhoIRC} -Timer ${sWho} ${iTime} ${iLoc} ${sTimerName}
}

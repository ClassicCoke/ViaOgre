function main()
{
	variable string sWhoIRC

	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWhoIRC:Set["Me"]
		}
		else
		{
		sWhoIRC:Set["All"]
		}
	IRC !c ${sWhoIRC} -Resume IRW:${Me}
	IRC !c ${sWhoIRC} -LetsGo IRW:${Me}
}

function main()
{
IRC Run script:PactOfTheFireTyrantOff
variable string sWhoIRC

if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
	{
	sWhoIRC:Set["All"]
	}
	else
	{
	sWhoIRC:Set["All"]
	}

IRC !c ${sWhoIRC} -CCStack Healers "Pact of the Fire Tyrant" FALSE TRUE
Wait 30
IRC !c ${sWhoIRC} -CancelMaintainedForWho All "Pact of the Fire Tyrant"
Wait 30

}
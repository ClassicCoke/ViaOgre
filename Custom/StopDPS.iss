function main()
{

IRC Run script:StopDPS
variable string sWhoIRC

if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
	{
	sWhoIRC:Set["Me"]
	}
	else
	{
	sWhoIRC:Set["All"]
	}

IRC !c ${sWhoIRC} -UO All+-Healers checkbox_settings_disablecaststack_combat TRUE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_ca TRUE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_namedca TRUE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_nonnamedca TRUE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_debuff TRUE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_nameddebuff TRUE

IRC !c ${sWhoIRC} -UO All checkbox_settings_rangedattack FALSE
IRC !c ${sWhoIRC} -UO All checkbox_settings_meleeattack FALSE

}

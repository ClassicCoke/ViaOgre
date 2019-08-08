function main()
{

IRC Run script:StartDPS
variable string sWhoIRC

if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
	{
	sWhoIRC:Set["Me"]
	}
	else
	{
	sWhoIRC:Set["All"]
	}

IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_combat FALSE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_ca FALSE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_namedca FALSE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_nonnamedca FALSE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_debuff FALSE
IRC !c ${sWhoIRC} -UO All checkbox_settings_disablecaststack_nameddebuff FALSE

IRC !c ${sWhoIRC} -UO All checkbox_settings_rangedattack TRUE
IRC !c ${sWhoIRC} -UO All checkbox_settings_meleeattack TRUE

}

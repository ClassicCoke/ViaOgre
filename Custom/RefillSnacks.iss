function main()
{
	variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}


	;;Move to Food Depot
	IRC !c ${sWhoIRC} -OgreCommandOB_AP All Nav Food1 -ntr
	Wait 150

	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Atole" 30
	Wait 80
	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Arrowroot" 30
	Wait 80
	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Chebakia" 30
	Wait 80
	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Dolma" 30
	Wait 80
	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Fairy Bread" 30
	Wait 80
	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Jaffa" 30
	Wait 80
	IRC !c ${sWhoIRC} -RSOB All Custom/ReplenishFoodDrink "Tejuino" 30
	Wait 140
	
	IRC RefillSnacks Complete
}
function main()
{
    variable index:item Items
    variable iterator ItemIterator

	variable string sName
	variable string sFood=${Me.Equipment[Food].Name}
	variable string sDrink=${Me.Equipment[Drink].Name}
	variable int iEquippedFoodQty=${Me.Equipment[Food].Quantity}
	variable int iEquippedDrinkQty=${Me.Equipment[Drink].Quantity}
	variable int iFoodQty=0
	variable int iDrinkQty=0

	variable string sIRCUser=${UIElement[${OBUI_textentry_irc_user}].Text}
	variable int iIRCUserLength
	variable int iMaxIRCUserLength=12
	variable int iPad
	variable string sPad

	
	sPad:Set["..............."]
	iIRCUserLength:Set[${sIRCUser.Length}]
	iPad:Set[${Math.Calc[${iMaxIRCUserLength}-${iIRCUserLength}]}]
	sPad:Set[${sPad.Left[${iPad}]}]

	sName:Set[${Me.Name}]
	sName:Concat["..............."]
	sName:Set[${sName.Left[8]}]

	IRC !c ${sWhoIRC} -OgreCommandOB_AP ${Me} Nav Food1 -ntr
	Wait 20
	do
		{
		wait 10
		}
		while ${Me.IsMoving}

	If !${sFood(exists)}
		{
		sFood:Set["N/A"]
		IRC ${sName} has no food equipped...
		}
	If !${sDrink(exists)}
		{
		sDrink:Set["N/A"]
		IRC ${sName} has no Drink equipped...
		}
	
	Echo ${sName} Food : ${sFood}(${iEquippedFoodQty}) 
	Echo ${sName} Drink: ${sDrink}(${iEquippedDrinkQty})
	
	If ${sFood(exists)}
		{
		IRC !c ${sIRCUser} -RSOB ${Me} Custom/ReplenishFoodDrink "${sFood}" 100
		}
	wait 100
	If ${sDrink(exists)}
		{
		IRC !c ${sIRCUser} -RSOB ${Me} Custom/ReplenishFoodDrink "${sDrink}" 100
		}
	wait 100


    Me:QueryInventory[Items, Location =- "Inventory" && ( Name =- "${sDrink}" || Name =- "${sFood}" )]
    Items:GetIterator[ItemIterator]
	; Look for equiped items only if you are below the character resolve check
    if ${ItemIterator:First(exists)}
		{
		do 
			{
			;Continue to Equip Food and Drink until Equipped slots are full
			If (( ${iEquippedFoodQty} < 100 ) && ${ItemIterator.Value.Name.Equal["${sFood}"]}) || (( ${iEquippedDrinkQty} < 100 ) && ${ItemIterator.Value.Name.Equal["${sDrink}"]})
				{
				If ${ItemIterator.Value.Name.Equal["${sFood}"]}
					{
					iEquippedFoodQty:Set[${Math.Calc[${iEquippedFoodQty}+${ItemIterator.Value.Quantity}]}]
					}
				If ${ItemIterator.Value.Name.Equal["${sDrink}"]}
					{
					iEquippedDrinkQty:Set[${Math.Calc[${iEquippedDrinkQty}+${ItemIterator.Value.Quantity}]}]
					}
				Me.Inventory[Query, ID =- "${ItemIterator.Value.ID}"]:Equip
				IRC ${sPad}${Me.Name}Equipping : ${ItemIterator.Value.Location}:${ItemIterator.Value.Name} (${ItemIterator.Value.Quantity})
				}
			}
			while ${ItemIterator:Next(exists)}
		}
	Wait 50	
	If ${sFood(exists)}
		{
		IRC !c ${sIRCUser} -RSOB ${Me} Custom/ReplenishFoodDrink "${sFood}" 100
		}
	wait 100
	If ${sDrink(exists)}
		{
		IRC !c ${sIRCUser} -RSOB ${Me} Custom/ReplenishFoodDrink "${sDrink}" 100
		}
	wait 100
	IRC ${Me} Completed FillFoodDrink
}

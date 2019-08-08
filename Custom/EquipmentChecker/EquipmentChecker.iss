function main(string sSlot, string sMod, float fCheck, float fTeir, bool bLink, int iMaxIRCUserLength)
{
    variable index:item Items
    variable iterator ItemIterator
	variable int iMods=1
	variable int iNumMods=0
	variable float fValue
	variable float fValue1
	variable float fValue2
	variable float fResolve
	variable string sResolve=${Me.GetGameData[Stats.Resolve].Label}
	variable string sName
	variable string sItemName1
	variable string sItemName2
	variable string sLink1
	variable string sLink2
	variable string sDeficit
	variable string sIRCUser=${UIElement[${OBUI_textentry_irc_user}].Text}
	variable int iIRCUserLength
	variable int iPad
	variable string sPad
	variable bool bUpgrade="FALSE"
	variable bool bNotUpgrade="FALSE"
	variable bool bDblUpgrade="FALSE"
	variable bool b2Slots="FALSE"
	
	sResolve:Set[${sResolve.Replace[",",""]}]
	fResolve:Set[${sResolve}]
	sDeficit:Set["......"]
	sDeficit:Concat[${Math.Calc[${fTeir}-${fResolve}].Deci}]
	sDeficit:Set[${sDeficit.Right[6]}]

	sPad:Set["..............."]
	iIRCUserLength:Set[${sIRCUser.Length}]
	iPad:Set[${Math.Calc[${iMaxIRCUserLength}-${iIRCUserLength}]}]
	sPad:Set[${sPad.Left[${iPad}]}]

	sName:Set[${Me.Name}]
	sName:Concat["..............."]
	sName:Set[${sName.Left[8]}]

	If ${sSlot.Equal["activate1"]} || ${sSlot.Equal["ears"]} || ${sSlot.Equal["left_ring"]} || ${sSlot.Equal["left_wrist"]}
		{
		b2Slots:Set[TRUE]
		}

    Me:QueryInventory[Items, Location =- "Equipment"]
    Items:GetIterator[ItemIterator]
	; Look for equiped items only if you are below the character resolve check
    if ${ItemIterator:First(exists)} && (${fTeir} > ${fResolve})
		{
		do 
			{
			if (!${ItemIterator.Value.IsItemInfoAvailable})
				{
				do
					{
					waitframe
					}
					while (!${ItemIterator.Value.IsItemInfoAvailable})
				}
			If ${ItemIterator.Value.ToItemInfo.EquipSlot[1].Equal[${sSlot}]}
				{
				Echo Equipped lot matched slot we are checking ${ItemIterator.Value.ToItemInfo.EquipSlot[1]} - ${sSlot}}
				;Current Item is in slot we are checking
				If ${ItemIterator.Value.ToItemInfo.NumModifiers} > 0 
					{
					iNumMods:Set[${ItemIterator.Value.ToItemInfo.NumModifiers}]
					iMods:Set[1]
					;We have a match on equipment slot to check, we now loop through the modifiers looking for the resolve value for comparasion
					do
						{
						If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["${sMod}"]}
							{
							; We have resolve setting, now to see if it is an upgrade
							fValue:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} < ${fCheck}	
								{
								; We have deteremined the item is an upgrade
								If ${bUpgrade}
									{
									; Second equipped Item found that is an upgrade
									bDblUpgrade:Set["TRUE"]
									sItemName2:Set["${ItemIterator.Value.Name}"]
									Echo 2 - ${ItemIterator.Value.Name}-${sItemName2}
									fValue2:Set[${fValue}]
									sLink2:Set["${ItemIterator.Value.ToLink}"]
									}
									else
									{
									bUpgrade:Set["TRUE"]
									sItemName1:Set["${ItemIterator.Value.Name}"]
									Echo 1 - ${ItemIterator.Value.Name}-${sItemName1}
									fValue1:Set[${fValue}]
									sLink1:Set["${ItemIterator.Value.ToLink}"]
									}
								}
								else
								{
								;Item matched slot but failed to be an upgrade, save for later reporting...
								bNotUpgrade:Set["TRUE"]
								sItemName2:Set["${ItemIterator.Value.Name}"]
								Echo 3 - ${ItemIterator.Value.Name}-${sItemName2}
								fValue2:Set[${fValue}]
								sLink2:Set["${ItemIterator.Value.ToLink}"]
								}
							}
						iMods:Inc
						} 
						while ${iMods} <= ${iNumMods}
					}
				}
			}
			while ${ItemIterator:Next(exists)}
		}
	
	
	If ${bUpgrade}
		{
		If ${b2Slots}
			{
			;Report format for 2 items
			If ${bDblUpgrade} || ${bNotUpgrade}
				{
				; Found 2 items to report on
				If ${fValue1.Int} > ${fValue2.Int}
					{
					; First Item found is better then second one found, so we will flip them in output to IRC
					IRC ${sPad}${sName} [${sDeficit}] R:${fValue2.Int}:${fValue1.Int} - ${sItemName2} --- ${sItemName1}
					}
					else
					{
					; First item found is more of an upgrade or same upgrade as the second item found.
					IRC ${sPad}${sName} [${sDeficit}] R:${fValue1.Int}:${fValue2.Int} - ${sItemName1} --- ${sItemName2}
					}
				}
				else
				{
				;Only found a single item to report when there should have been 2
				IRC ${sPad}${sName} [${sDeficit}] R:00:${fValue1.Int} - Empty --- ${sItemName1}
				}
			}
			else
			{
			; Report format for single item
			IRC ${sPad}${sName} [${sDeficit}] R:${fValue1.Int} - ${sItemName1}
			}
		If ${Me.Raid} && ${bLink}
			{
			; We are in a raid and linking equiped items was turned on
			EQ2Execute /r ${sLink1} ${sLink2}
			}
			else
			{
			If ${Me.Grouped} && ${bLink}
				{
				; We are in a group and linking equiped items was turned on
				EQ2Execute /g ${sLink1} ${sLink2}
				}
			}
		}

}

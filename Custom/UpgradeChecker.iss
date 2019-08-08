    variable(global) 	index:item 	Items
    variable(global) 	iterator 	ItemIterator
	
	variable(global)	float 		fResolve
	variable(global)	float 		fReuseSpeed
	variable(global)	float 		fCastingSpeed
	variable(global)	float 		fMitigationIncrease
	variable(global)	float 		fBlock
	variable(global)	float 		fSpellDoublecast
	variable(global)	float 		fAbilityDoublecast
	variable(global)	float 		fFervor
	variable(global)	int			iAbilityModifier
	variable(global)	bool		bUpgrade
	variable(global)	int			iUpgrades=0
;	variable(global)	bool		bDebug="TRUE"
	variable(global)	bool		bDebug="FALSE"


function main(bool bAdvanced="FALSE")
{

;Scan Inventory looking for Items that can be equipped
	;Check item if usable by current class
	;Identify slot(s) item can be quipped into and scan them to check is item scanned an upgrade
		;If item is an upgrade - Echo out to innerspace console and set boolean for updates found = true
		; be sure to include logic that we only report an item once as being an upgrade
	;Next Item


	
	
	variable 			int 		iMods=1
	variable 			int 		iX=1
	variable 			int 		iTemp
	variable			bool		bClass
	variable			string		sName
	
 

   ;IRC UpgradeChecker Started...
   Echo UpgradeChecker Started...

   Echo ... Class - ${Me.Class}
   Echo ... SubClass - ${Me.SubClass}
   Echo ... Archetype - ${Me.Archetype}
   
   ;Me:QueryInventory[Items, Location =- "Inventory" && Name =- " Earring" ]
   Me:QueryInventory[Items, Location =- "Inventory" ]
   Items:GetIterator[ItemIterator]
   if ${ItemIterator:First(exists)}
		{
		do 
			{
			; Initialize variables to store data regarding item
			bUpgrade:Set["FALSE"]
			bClass:Set["FALSE"]
			fResolve:Set[0]
			fMitigationIncrease:Set[0]
			fBlock:Set[0]
			fSpellDoublecast:Set[0]
			fAbilityDoublecast:Set[0]
			fFervor:Set[0]
			fReuseSpeed:Set[0]
			fCastingSpeed:Set[0]
			iAbilityModifier:Set[0]
			while (!${ItemIterator.Value.IsItemInfoAvailable})
				{
				waitframe
				}
			; Scan through modifiers of item to look up key indicators
			bClass:Set["FALSE"]
			If ${bDebug}
				{
				;Echo Checking Item: ${ItemIterator.Value.Name}
				}
			iX:Set[1]
			While ( ${iX} <= ${ItemIterator.Value.ToItemInfo.NumClasses} ) && !${bClass}
				{
				If ${ItemIterator.Value.ToItemInfo.Class[${iX}].Name.Equal[${Me.Class}]}
					{
					bClass:Set["TRUE"]
					}
				iX:Inc
				}
			If ${ItemIterator.Value.ToItemInfo.NumClasses} <= 0
				{
				bClass:Set["TRUE"]
				}
			iMods:Set[1]
			while ${iMods} <= ${ItemIterator.Value.ToItemInfo.NumModifiers}
				{
				;Echo ..... Looping Through Modifiers  ${iMods}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Resolve"]}
					{
					fResolve:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Mitigation Increase"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fMitigationIncrease}
						{
						fMitigationIncrease:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Block"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fBlock}
						{
						fBlock:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Reuse Speed"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fReuseSpeed}
						{
						fReuseSpeed:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Casting Speed"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fCastingSpeed}
						{
						fCastingSpeed:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Spell Doublecast"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fSpellDoublecast}
						{
						fSpellDoublecast:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Ability Doublecast"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fAbilityDoublecast}
						{
						fAbilityDoublecast:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Fervor"]}
					{
					If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fFervor}
						{
						fFervor:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					}
				If ${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Ability Modifier"]}
					{
					iTemp:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
					If ${iTemp} < 0
						{
						iTemp:Set[${Math.Calc[${iTemp}+65536]}]
						}
					If ${iTemp} > ${iAbilityModifier}
						{
						iAbilityModifier:Set[${iTemp}]
						}
					}
				iMods:Inc
				} 
			If ${bDebug}
				{
				;Echo ...Resolve=${fResolve}
				;Echo ...Mitigation Increase=${fMitigationIncrease}
				;Echo ...Block=${fBlock}
				;Echo ...ReuseSpeed=${fReuseSpeed}
				;Echo ...CastingSpeed=${fCastingSpeed}
				;Echo ...AbilityModifier=${iAbilityModifier}
				}
			; Loop through valid slots
			iX:Set[1]
			While ( ${iX} <= ${ItemIterator.Value.ToItemInfo.NumEquipSlots} ) 
				{
				;Call CheckUpgrade ${ItemIterator.Value.ToItemInfo.EquipSlot[${iX}]} "${sName}" ${fResolve} ${fMitigationIncrease} ${fBlock} ${fReuseSpeed} ${fCastingSpeed} ${iAbilityModifier}
				Call CheckUpgrade ${ItemIterator.Value.ToItemInfo.EquipSlot[${iX}]} ${bLink} ${bAdvanced}
				iX:Inc
				}
			}
			while ${ItemIterator:Next(exists)}
		; No More items to scan
		}
   IRC ${iUpgrades} possible upgrades found on ${Me}
   Echo .
   Echo ${iUpgrades} possible upgrades found on ${Me}
   Echo .
   Echo UpgradeChecker Complete.
   
}




;===================================================================================================================================================================
;
function CheckUpgrade( string sSlot, bool bLink, bool bAdvanced )
{
   variable 	index:item 	EquipedItems
   variable 	iterator 	EquipedIterator
   variable 	index:item 	Bags
   variable 	iterator 	BagIterator

   variable		float 		fEquipResolve
   variable		float 		fEquipReuseSpeed
   variable		float 		fEquipCastingSpeed
   variable		float 		fEquipMitigationIncrease
   variable		float 		fEquipBlock
   variable		float 		fEquipSpellDoublecast
   variable		float 		fEquipAbilityDoublecast
   variable		float 		fEquipFervor
   variable		int			iEquipAbilityModifier

   variable		bool		bResolve
   variable		bool		bReuseSpeed
   variable		bool		bCastingSpeed
   variable		bool		bMitigationIncrease
   variable		bool		bBlock
   variable		bool		bSpellDoublecast
   variable		bool		bAbilityDoublecast
   variable		bool		bFervor
   variable		bool		bAbilityModifier
   variable		bool		bWeapon
   variable		bool		bWieldStyle
   variable		bool		bFighter
   variable		bool		bT1DPS
   variable		bool		bT2DPS
   variable		bool		bHealer
   
   
   variable		int			iMods
   variable		int			iBag
   variable		int			iSlot
   variable 	int 		itemp
   variable 	string 		stemp
   
   Me:QueryInventory[EquipedItems, Location =- "Equipment"]
   EquipedItems:GetIterator[EquipedIterator]
   If ${bDebug}
		{
		Echo Searching ${sSlot} slot(s) for Upgrades
		}
   if ${EquipedIterator:First(exists)}
		{
		do 
			{
			while !${EquipedIterator.Value.IsItemInfoAvailable}
				{
				waitframe
				}
			If ${EquipedIterator.Value.ToItemInfo.EquipSlot[1].Equal[${sSlot}]}
				{
				; Slots match, compare them
				If ${bDebug}
					{
					Echo Checking Equiped Item: ${EquipedIterator.Value.Name}
					}
				fEquipResolve:Set[0]
				fEquipMitigationIncrease:Set[0]
				fEquipBlock:Set[0]
				fEquipSpellDoublecast:Set[0]
				fEquipAbilityDoublecast:Set[0]
				fEquipFervor:Set[0]
				fEquipReuseSpeed:Set[0]
				fEquipCastingSpeed:Set[0]
				iEquipAbilityModifier:Set[0]
				bWeapon:Set["FALSE"]
				bWieldStyle:Set["FALSE"]
				iTemp:Set[0]
				sTemp:Set["n/a"]
				iMods:Set[1]
				If ${EquipedIterator.Value.ToItemInfo.Type.Equal["Weapon"]}
					{
					bWeapon:Set["TRUE"]
					If ${EquipedIterator.Value.ToItemInfo.WieldStyle.Equal[${ItemIterator.Value.ToItemInfo.WieldStyle}]}
						{
						bWieldStype:Set["TRUE"]
						}
					}
				while ${iMods} <= ${EquipedIterator.Value.ToItemInfo.NumModifiers}
					{
					;Echo ..... Looping Through Modifiers  ${iMods}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Resolve"]}
						{
						fEquipResolve:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Mitigation Increase"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipMitigationIncrease}
							{
							fEquipMitigationIncrease:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Block"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipBlock}
							{
							fEquipBlock:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Reuse Speed"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipReusedSpeed}
							{
							fEquipReuseSpeed:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Casting Speed"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipCastingSpeed}
							{
							fEquipCastingSpeed:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Spell Doublecast"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipSpellDoublecast}
							{
							fEquipSpellDoublecast:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Ability Doublecast"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipAbilityDoublecast}
							{
							fEquipAbilityDoublecast:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Fervor"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${fEquipFervor}
							{
							fEquipFervor:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
							}
						}
					If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType.Equal["Ability Modifier"]}
						{
						If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} < 0
							{
							If ${Math.Calc[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}+65536]} > ${iEquipAbilityModifier}
								{
								iEquipAbilityModifier:Set[${Math.Calc[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}+65536]}]
								}
							}
							else
							{
							If ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value} > ${iEquipAbilityModifier}
								{
								iEquipAbilityModifier:Set[${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}]
								}
							}
						If ${bDebug}
							{
							Echo ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].SubType} EAM: ${iEquipAbilityModifier} -- ${EquipedIterator.Value.ToItemInfo.Modifier[${iMods}].Value}
							}
						}
					iMods:Inc
					}
				; compare them
				bResolve:Set["FALSE"]
				bReuseSpeed:Set["FALSE"]
				bCastingSpeed:Set["FALSE"]
				bAbilityModifier:Set["FALSE"]
				bMitigationIncrease:Set["FALSE"]
				bBlock:Set["FALSE"]
				If ${fResolve} > ${fEquipResolve}
					{
					bResolve:Set["TRUE"]
					}
				If ${fReuseSpeed} > ${fEquipReuseSpeed}
					{
					bReuseSpeed:Set["TRUE"]
					}
				If ${fCastingSpeed} > ${fEquipCastingSpeed}
					{
					bCastingSpeed:Set["TRUE"]
					}
				If ${fMitigationIncrease} > ${fEquipMitigationIncrease}
					{
					bMitigationIncrease:Set["TRUE"]
					}
				If ${fSpellDoublecast} > ${fEquipSpellDoublecast}
					{
					bSpellDoublecast:Set["TRUE"]
					}
				If ${fAbilityDoublecast} > ${fEquipAbilityDoublecast}
					{
					bAbilityDoublecast:Set["TRUE"]
					}
				If ${fFervor} > ${fEquipFervor}
					{
					bFervor:Set["TRUE"]
					}
				If ${fBlock} > ${fEquipBlock}
					{
					bBlock:Set["TRUE"]
					}
				If ${iAbilityModifier} > ${iEquipAbilityModifier}
					{
					bAbilityModifier:Set["TRUE"]
					}
				;Well is it an upgrade
				
;--------------------------------------------------------------------------------------------------------------------
; Checks for Fighters
;--------------------------------------------------------------------------------------------------------------------
				bFighter:Set["FALSE"]
				If ${Me.Archetype.Equal["fighter"]}
					{
					;Use Criteria for Fighters
					bFighter:Set["TRUE"]
					If ${bMitigationIncrease}
						{
						bUpgrade:Set["TRUE"]
						}
					If ${bResolve} && ${bBlock} && ( ${fMitigationIncrease} >= ${fEquipMitigationIncrease} )
						{
						bUpgrade:Set["TRUE"]
						}
					If ${bResolve} && ( ${fMitigationIncrease} >= ${fEquipMitigationIncrease} )
						{
						bUpgrade:Set["TRUE"]
						}
					}
;--------------------------------------------------------------------------------------------------------------------
; Checks for T1 DPS
;--------------------------------------------------------------------------------------------------------------------
				bT1DPS:Set[FALSE]
				If ${Me.Class.Equal["sorcerer"]} || ${Me.Class.Equal["summoner"]}
					{
					bT1DPS:Set["TRUE"]
					}
				If ${Me.Class.Equal["predator"]} || ${Me.Class.Equal["animalist"]}
					{
					bT1DPS:Set["TRUE"]
					}
				If ${bT1DPS}
					{
 					;Use Criteria for T1 DPS Classes
					If ${bDebug}
						{
						Echo Checking ${ItemIterator.Value.Name}
						}
					If ${bResolve} && ${bAbilityModifier} && ( ${fReuseSpeed} <= 0  || ${fCastingSpeed} <= 0 )
						{
						If ${bDebug}
							{
							Echo Criteria 1 TRUE
							}
						bUpgrade:Set["TRUE"]
						}
					If ${bAbilityModifier} && ( ${fResolve} >= ${fEquipResolve} )&& ( ${fReuseSpeed} <= 0  || ${fCastingSpeed} <= 0 )
						{
						If ${bDebug}
							{
							Echo Criteria 2 TRUE
							}
						bUpgrade:Set["TRUE"]
						}
					If ${bResolve} && ( ${iEquipAbilityModifier} <= 0 )
						{
						If ${bDebug}
							{
							Echo Criteria 3 TRUE
							}
						bUpgrade:Set["TRUE"]
						}
					If ${sSlot.Equal["waist"]} || ${sSlot.Equal["cloak"]}
						{
						If ${fSpellDoublecast} <= 0
							{
							If ${bDebug}
								{
								Echo Criteria 4 overruled to FALSE
								}
							bUpgrade:Set["FALSE"]
							}
						}
					}
;--------------------------------------------------------------------------------------------------------------------
; Checks for T2 DPS
;--------------------------------------------------------------------------------------------------------------------
				bT2DPS:Set[FALSE]
				If ${Me.Class.Equal["enchanter"]} || ${Me.Class.Equal["bard"]}
					{
					bT2DPS:Set["TRUE"]
					}
				If ${Me.Class.Equal["rogue"]} || ${Me.Class.Equal["druid"]}
					{
					bT2DPS:Set["TRUE"]
					}
				If ${bT2DPS}
					{
					;Use Criteria for T2 DPS Classes
					If ${bResolve} && ${bAbilityModifier} && ( ${fReuseSpeed} <= 0  || ${fCastingSpeed} <= 0 )
						{
						bUpgrade:Set["TRUE"]
						}
					If ${bAbilityModifier} && ( ${fResolve} >= ${fEquipResolve} )&& ( ${fReuseSpeed} <= 0  || ${fCastingSpeed} <= 0 )
						{
						bUpgrade:Set["TRUE"]
						}
					If ${bResolve} && ( ${iEquipAbilityModifier} <= 0 )
						{
						bUpgrade:Set["TRUE"]
						}
					If ${sSlot.Equal["waist"]} || ${sSlot.Equal["cloak"]}
						{
						If ${fSpellDoublecast} <= 0
							{
							bUpgrade:Set["FALSE"]
							}
						}
					}


;--------------------------------------------------------------------------------------------------------------------
; Checks for Shaman and Clerics DPS
;--------------------------------------------------------------------------------------------------------------------
				bHealer:Set[FALSE]
				If ${Me.Class.Equal["shaman"]} || ${Me.Class.Equal["cleric"]}
					{
					bHealer:Set["TRUE"]
					}
				If ${Me.Class.Equal["shaper"]}
					{
					bHealer:Set["TRUE"]
					}
				If ${bHealer}
					{
					If ${bResolve} 
						{
						bUpgrade:Set["TRUE"]
						}
					If ${bBlock} && ( ${fResolve} >= ${fEquipResolve} )
						{
						bUpgrade:Set["TRUE"]
						}
					}

;--------------------------------------------------------------------------------------------------------------------
; Simple mode, just checking for better resolve, or not one of the above advanced options
;--------------------------------------------------------------------------------------------------------------------

				If ${bResolve} && !${bFighter} && !${bT1DPS} && !${bT2DPS} && !${bHealer} 
					{
					bUpgrade:Set["TRUE"]
					}

				If ${bResolve} && !${bAdvanced}
					{
					bUpgrade:Set["TRUE"]
					}


;--------------------------------------------------------------------------------------------------------------------
; Disqualify if weapons are not of same type, Examples 1H vs 2H and Secondary Weapon vs Shield etc.
;--------------------------------------------------------------------------------------------------------------------
				If ${bWeapon} && !${bWieldStyle}
					{
					bUpgrade:Set["FALSE"]
					}
				If !${EquipedIterator.Value.ToItemInfo.Type.Equal[${ItemIterator.Value.ToItemInfo.Type}]}
					{
					bUpgrade:Set["FALSE"]
					}
				If ${EquipedIterator.Value.Name.Find["Planar Ethereal Breastplate"]} || ${EquipedIterator.Value.Name.Find["Planar Ethereal Pauldrons"]}
					{
					If ${fResolve} < 105
						{
						bUpgrade:Set["FALSE"]
						}
					}
;--------------------------------------------------------------------------------------------------------------------
				If ${bUpgrade}
					{
					iBag:Set[0]
					iSlot:Set[0]
					Me:QueryInventory[Bags, ContainerID = "${ItemIterator.Value.InContainerID}"]
					Bags:GetIterator[BagIterator]
					if ${BagIterator:First(exists)}
						{
						iBag:Set[${Math.Calc[${BagIterator.Value.Slot}+1]}]
						iSlot:Set[${Math.Calc[${ItemIterator.Value.Slot}+1]}]
						}
					Echo .
					Echo Possible Upgrade Found (${EquipedIterator.Value.ToItemInfo.EquipSlot[1]}) ${ItemIterator.Value.Name} (Bag:${iBag} Slot:${iSlot}) > ${EquipedIterator.Value.Name}
					Echo ...Resolve............ = ${fResolve} - ${fEquipResolve} 
					Echo ...Mitigation Increase = ${fMitigationIncrease} - ${fEquipMitigationIncrease}
					Echo ...Block.............. = ${fBlock} - ${fEquipBlock}
					Echo ...Reuse Speed........ = ${fReuseSpeed} - ${fEquipReuseSpeed}
					Echo ...Casting Speed...... = ${fCastingSpeed} - ${fEquipCastingSpeed}
					Echo ...Spell Doublecast... = ${fSpellDoublecast} - ${fEquipSpellDoublecast}
					Echo ...Ability Doublecast. = ${fAbilityDoublecast} - ${fEquipAbilityDoublecast}
					Echo ...Fervor............. = ${fFervor} - ${fEquipFervor}
					Echo ...AbilityModifier.... = ${iAbilityModifier} - ${iEquipAbilityModifier}
					iUpgrades:Inc
					}
					else
					{
					If ${bDebug}
						{
						iBag:Set[0]
						iSlot:Set[0]
						Me:QueryInventory[Bags, ContainerID = "${ItemIterator.Value.InContainerID}"]
						Bags:GetIterator[BagIterator]
						if ${BagIterator:First(exists)}
							{
							iBag:Set[${Math.Calc[${BagIterator.Value.Slot}+1]}]
							iSlot:Set[${Math.Calc[${ItemIterator.Value.Slot}+1]}]
							}
						Echo .
						Echo Checking Item (${EquipedIterator.Value.ToItemInfo.EquipSlot[1]}) ${ItemIterator.Value.Name} (Bag:${iBag} Slot:${iSlot}) > ${EquipedIterator.Value.Name}
						Echo ...Resolve............ = ${bResolve} ${fResolve} - ${fEquipResolve} 
						Echo ...Mitigation Increase = ${bMitigationIncrease} ${fMitigationIncrease} - ${fEquipMitigationIncrease}
						Echo ...Block.............. = ${bBlock} ${fBlock} - ${fEquipBlock}
						Echo ...ReuseSpeed......... = ${bReuseSpeed} ${fReuseSpeed} - ${fEquipReuseSpeed}
						Echo ...CastingSpeed....... = ${bCastingSpeed} ${fCastingSpeed} - ${fEquipCastingSpeed}
						Echo ...Spell Doublecast... = ${bSpellDoublecast} ${fSpellDoublecast} - ${fEquipSpellDoublecast}
						Echo ...Ability Doublecast. = ${bAbilityDoublecast} ${fAbilityDoublecast} - ${fEquipAbilityDoublecast}
						Echo ...Fervor............. = ${bFervor} ${fFervor} - ${fEquipFervor}
						Echo ...AbilityModifier.... = ${bAbilityModifier} ${iAbilityModifier} - ${iEquipAbilityModifier}
						}
					}
				}
			}
			while ${EquipedIterator:Next(exists)} && !${bUpgrade}
		}
		else
		{
		; really, there is nothing equipped?
		}
}



	

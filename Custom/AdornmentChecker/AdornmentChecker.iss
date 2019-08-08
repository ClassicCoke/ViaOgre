function main(string sItem, int iMaxIRCUserLength)
{
    variable index:item Items
    variable iterator ItemIterator
    variable index:item Bags
    variable iterator BagIterator
	variable int iFind
	variable int iBag
	variable int iSlot
	variable int iCounter=1
	variable int iX=0
	variable int iXInven=0
	variable int iXEquip=0
	variable int iCInven=0
	variable int iCEquip=0
	variable string sAdorn
	variable int iAdorn=1
	variable int iNumAdorns=0
	variable string sMsg
	variable string sCounter
	variable string sInven
	variable string sEquip
	variable string sCInven
	variable string sCEquip
	variable string sName
	variable string sPad
	variable int iPad
	variable int iIRCUserLength
	variable string sIRCUser=${UIElement[${OBUI_textentry_irc_user}].Text}

	
	sPad:Set["..............."]
	iIRCUserLength:Set[${sIRCUser.Length}]
	iPad:Set[${Math.Calc[${iMaxIRCUserLength}-${iIRCUserLength}]}]
	sPad:Set[${sPad.Left[${iPad}]}]

	; Look for adorns in Inventory by name
	Me:QueryInventory[Items, Location =- "Inventory" && Name =- "${sItem}"]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
		;Scan each item found in Inventory that matches the name
        do
			{
			If ${ItemIterator.Value.Name.Find["Celestial Rune"]}
				{
				;Celestial Adorn Found
				iCInven:Set[${Math.Calc[${iCInven}+${ItemIterator.Value.Quantity}]}]
				}
				else
				{
				;Non Celestial Adorn Found
				iXInven:Set[${Math.Calc[${iXInven}+${ItemIterator.Value.Quantity}]}]
				}
			Me:QueryInventory[Bags, ContainerID = "${ItemIterator.Value.InContainerID}"]
			Bags:GetIterator[BagIterator]
			if ${BagIterator:First(exists)}
				{
				iBag:Set[${Math.Calc[${BagIterator.Value.Slot}+1]}]
				iSlot:Set[${Math.Calc[${ItemIterator.Value.Slot}+1]}]
				Echo Loc:${ItemIterator.Value.Location} Bag:${iBag} Slot:${iSlot} --- Item:${ItemIterator.Value.Name}(${ItemIterator.Value.Quantity}) 
				;Echo --- Adornment Description:${ItemIterator.Value.ToItemInfo.AdornmentDescription}
				}
			iCounter:Inc
			}
			while ${ItemIterator:Next(exists)}
		}

		
	; Look for adornments attached to equiped items
    Me:QueryInventory[Items, Location =- "Equipment"]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
        do
			{
			; Need to verify Item detail data is loaded to search for adornments that are applied to items
			if (!${ItemIterator.Value.IsItemInfoAvailable})
				{
				do
					{
					waitframe
					}
					while (!${ItemIterator.Value.IsItemInfoAvailable})
				}
			; This is the logic used to look for attached adornemnts, only need to do this for items of type Armor, Weapon or Shield
			;ECHO ${Me} --- ${ItemIterator.Value.Name} --- ${ItemIterator.Value.ToItemInfo.Type} --- adorn #${iAdorn}.) ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name}
			If ${ItemIterator.Value.ToItemInfo.Type.Find[Weapon]} || ${ItemIterator.Value.ToItemInfo.Type.Equal[Armor]} || ${ItemIterator.Value.ToItemInfo.Type.Equal[Shield]} && ${ItemIterator.Value.Location.Equal["Equipment"]}
				{
				;Echo Looking for adornments on item: ${ItemIterator.Value.Name}
				iCounter:Inc
				;;  restrict looking at an item only when adornements are attached
				If ${ItemIterator.Value.ToItemInfo.NumAdornmentsAttached} > 0 
					{
					iNumAdorns:Set[${ItemIterator.Value.ToItemInfo.NumAdornmentsAttached}]
					iAdorn:Set[1]
					; Loop through all adronments applied to item
					do
						{
						;Echo ${Me} --- ${ItemIterator.Value.Name} --- adorn #${iAdorn}.) ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name}
						If (${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem}]})
							{
							; Adornment was found matching search criteria
							; Make echo variable for equiped vs found in Inventory
							If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Celestial"]}
								{
								;Celestial Adorn Found
								iCEquip:Inc
								}
								else
								{
								;Non Celestial Adorn Found
								iXEquip:Inc
								}
							Echo Loc:${ItemIterator.Value.ToItemInfo.EquipSlot[1]} --- Item:${ItemIterator.Value.Name} --- Adornment:${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name}
							}
						iAdorn:Inc
						} 
						while ${iAdorn} <= ${iNumAdorns}
					}
				}
			}
			while ${ItemIterator:Next(exists)}
		}
	If ${Me.Name(exists)}
		{
		sName:Set[${Me}]
		sName:Concat["..............."]
		sName:Set[${sName.Left[8]}]

		sCounter:Set["0000"]
		sCounter:Concat[${iCounter}]
		sCounter:Set[${sCounter.Right[4]}]

		sInven:Set["00"]
		sInven:Concat[${iXInven}]
		sInven:Set[${sInven.Right[2]}]

		sEquip:Set["00"]
		sEquip:Concat[${iXEquip}]
		sEquip:Set[${sEquip.Right[1]}]

		sCInven:Set["00"]
		sCInven:Concat[${iCInven}]
		sCInven:Set[${sCInven.Right[2]}]

		sCEquip:Set["00"]
		sCEquip:Concat[${iCEquip}]
		sCEquip:Set[${sCEquip.Right[1]}]

		IRC ${sPad}${sName} I(C/N): ${sCInven} ${sInven} -- E(C/N): ${sCEquip} ${sEquip} -- Search: ${sItem}
		}
}
function main(string sAdornSet, int iMaxIRCUserLength)
{
    variable index:item Items
    variable index:item Bags

    variable iterator ItemIterator
    variable iterator BagIterator

	;variable int iFind
	variable int iBag
	variable int iPad
	variable int iSlot
	variable int iCounter=1
	variable int iX=0
	variable int iIRCUserLength
	
	variable int iXInven1=0
	variable int iXInven2=0
	variable int iXInven3=0

	variable int iXEquip1=0
	variable int iXEquip2=0
	variable int iXEquip3=0

	variable int iCInven1=0
	variable int iCInven2=0
	variable int iCInven3=0

	variable int iCEquip1=0
	variable int iCEquip2=0
	variable int iCEquip3=0

	variable int iAdorn=1
	variable int iNumAdorns=0
	variable string sAdorn
	variable string sCounter

	variable string sInven1
	variable string sInven2
	variable string sInven3
	
	variable string sEquip1
	variable string sEquip2
	variable string sEquip3
	
	variable string sCInven1
	variable string sCInven2
	variable string sCInven3
	
	variable string sCEquip1
	variable string sCEquip2
	variable string sCEquip3

	variable string sName
	variable string sPad

	variable string sItem1="Not Set"
	variable string sItem2="Not Set"
	variable string sItem3="Not Set"

	variable bool bEcho
	variable string sIRCUser=${UIElement[${OBUI_textentry_irc_user}].Text}


	sPad:Set["..............."]
	iIRCUserLength:Set[${sIRCUser.Length}]
	iPad:Set[${Math.Calc[${iMaxIRCUserLength}-${iIRCUserLength}]}]
	sPad:Set[${sPad.Left[${iPad}]}]

	
	
	If ${sAdornSet.Find["Diqu"]}
		{
		sItem1:Set["Life"]
		sItem2:Set["Growth"]
		sItem3:Set["Earth"]
		}

	If ${sAdornSet.Find["Aniquilacion"]}
		{
		sItem1:Set["Destruction"]
		sItem2:Set["Fire"]
		sItem3:Set["Ruin"]
		}
		
	If ${sAdornSet.Find["Paixao"]}
		{
		sItem1:Set["Love"]
		sItem2:Set["Passion"]
		sItem3:Set["Excitement"]
		}

	If ${sAdornSet.Find["Kunnen"]}
		{
		sItem1:Set["Magic"]
		sItem2:Set["Power"]
		sItem3:Set["Thought"]
		}
    
	; Look for adorns in Inventory by name
	;Me:QueryInventory[Items, Name =- ${sItem1} || Name =- ${sItem2} || Name =- ${sItem3} ]
	;Me:QueryInventory[Items, Location =- "Inventory" && (  )]
	Me:QueryInventory[Items, Location =- "Inventory"]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
		;Scan each item found in Inventory that matches the name
        do
			{
			sAdorn:Set[${ItemIterator.Value.Name}]
			;Echo Reviewing ${sAdorn}
			If ( ${sAdorn.Find[${sItem1}]} || ${sAdorn.Find[${sItem2}]} || ${sAdorn.Find[${sItem3}]} ) && ( ${sAdorn.Find["Ascension"]} || ${sAdorn.Find["Firmament"]} || ${sAdorn.Find["Foundation"]} )
				{
				;Echo Match on ${sAdorn}
				If ${sAdorn.Find[${sItem1}]}
					{
					If ${sAdorn.Find["Celestial Rune"]}
						{
						;Celestial Adorn Found
						iCInven1:Set[${Math.Calc[${iCInven1}+${ItemIterator.Value.Quantity}]}]
						}
						else
						{
						;Non Celestial Adorn Found
						iXInven1:Set[${Math.Calc[${iXInven1}+${ItemIterator.Value.Quantity}]}]
						}
					}
				If ${sAdorn.Find[${sItem2}]}
					{
					If ${ItemIterator.Value.Name.Find["Celestial Rune"]}
						{
						;Celestial Adorn Found
						iCInven2:Set[${Math.Calc[${iCInven2}+${ItemIterator.Value.Quantity}]}]
						}
						else
						{
						;Non Celestial Adorn Found
						iXInven2:Set[${Math.Calc[${iXInven2}+${ItemIterator.Value.Quantity}]}]
						}
					}
				If ${sAdorn.Find[${sItem3}]}
					{
					If ${ItemIterator.Value.Name.Find["Celestial Rune"]}
						{
						;Celestial Adorn Found
						iCInven3:Set[${Math.Calc[${iCInven3}+${ItemIterator.Value.Quantity}]}]
						}
						else
						{
						;Non Celestial Adorn Found
						iXInven3:Set[${Math.Calc[${iXInven3}+${ItemIterator.Value.Quantity}]}]
						}
					}
				Me:QueryInventory[Bags, ContainerID = "${ItemIterator.Value.InContainerID}"]
				Bags:GetIterator[BagIterator]
				if ${BagIterator:First(exists)}
					{
					iBag:Set[${Math.Calc[${BagIterator.Value.Slot}+1]}]
					iSlot:Set[${Math.Calc[${ItemIterator.Value.Slot}+1]}]
					Echo Loc:${ItemIterator.Value.Location} Bag:${iBag} Slot:${iSlot} --- Item:${ItemIterator.Value.Name}(${ItemIterator.Value.Quantity}) 
					}
				iCounter:Inc
				}
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
			If ${ItemIterator.Value.ToItemInfo.Type.Find[Weapon]} || ${ItemIterator.Value.ToItemInfo.Type.Equal[Armor]} || ${ItemIterator.Value.ToItemInfo.Type.Equal[Shield]}
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
						; Need to verify Item detail data is loaded to search for adornments that are applied to items
						if (!${ItemIterator.Value.IsItemInfoAvailable})
							{
							do
								{
								waitframe
								}
								while (!${ItemIterator.Value.IsItemInfoAvailable})
							}
						;sAdorn:Set[${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name}]
						;Echo ${Me.Name} - ${ItemIterator.Value.ToItemInfo.Name}
						If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem1}]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem2}]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem3}]}
							{
							; Adornment was found matching search criteria
							; Make echo variable for equiped vs found in Inventory
							bEcho:Set[FALSE]
							If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem1}]} && ( ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Ascension"]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Firmament"]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Foundation"]} )
								{
								If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Celestial Rune"]} 
									{
									;Celestial Adorn Found
									iCEquip1:Inc
									bEcho:Set[TRUE]
									}
									else
									{
									;Non Celestial Adorn Found
									iXEquip1:Inc
									bEcho:Set[TRUE]
									}
								}
							If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem2}]} && ( ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Ascension"]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Firmament"]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Foundation"]} ) 
								{
								If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Celestial Rune"]} 
									{
									;Celestial Adorn Found
									iCEquip2:Inc
									bEcho:Set[TRUE]
									}
									else
									{
									;Non Celestial Adorn Found
									iXEquip2:Inc
									bEcho:Set[TRUE]
									}
								}
							If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find[${sItem3}]} && ( ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Ascension"]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Firmament"]} || ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Foundation"]} )
								{
								If ${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name.Find["Celestial Rune"]} 
									{
									;Celestial Adorn Found
									iCEquip3:Inc
									bEcho:Set[TRUE]
									}
									else
									{
									;Non Celestial Adorn Found
									iXEquip3:Inc
									bEcho:Set[TRUE]
									}
								}
							If ${bEcho}
								{
								Echo Loc:${ItemIterator.Value.ToItemInfo.EquipSlot[1]} --- Item:${ItemIterator.Value.Name} --- Adornment:${ItemIterator.Value.ToItemInfo.Adornment[${iAdorn}].Name}
								}
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
		;IRC ${Me} --- Reviewed ${iCounter} items  --- Inventory:${iXInven} --- Equiped:${iXEquip} --- Search String:${sItem}
		sName:Set[${Me}]
		sName:Concat["..............."]
		sName:Set[${sName.Left[8]}]

		sCounter:Set["0000"]
		sCounter:Concat[${iCounter}]
		sCounter:Set[${sCounter.Right[4]}]

		sInven1:Set["0"]
		sInven1:Concat[${iXInven1}]
		sInven1:Set[${sInven1.Right[1]}]
		sInven2:Set["0"]
		sInven2:Concat[${iXInven2}]
		sInven2:Set[${sInven2.Right[1]}]
		sInven3:Set["0"]
		sInven3:Concat[${iXInven3}]
		sInven3:Set[${sInven3.Right[1]}]

		sEquip1:Set["0"]
		sEquip1:Concat[${iXEquip1}]
		sEquip1:Set[${sEquip1.Right[1]}]
		sEquip2:Set["0"]
		sEquip2:Concat[${iXEquip2}]
		sEquip2:Set[${sEquip2.Right[1]}]
		sEquip3:Set["0"]
		sEquip3:Concat[${iXEquip3}]
		sEquip3:Set[${sEquip3.Right[1]}]

		sCInven1:Set["0"]
		sCInven1:Concat[${iCInven1}]
		sCInven1:Set[${sCInven1.Right[1]}]
		sCInven2:Set["0"]
		sCInven2:Concat[${iCInven2}]
		sCInven2:Set[${sCInven2.Right[1]}]
		sCInven3:Set["0"]
		sCInven3:Concat[${iCInven3}]
		sCInven3:Set[${sCInven3.Right[1]}]
		
		sCEquip1:Set["0"]
		sCEquip1:Concat[${iCEquip1}]
		sCEquip1:Set[${sCEquip1.Right[1]}]
		sCEquip2:Set["0"]
		sCEquip2:Concat[${iCEquip2}]
		sCEquip2:Set[${sCEquip2.Right[1]}]
		sCEquip3:Set["0"]
		sCEquip3:Concat[${iCEquip3}]
		sCEquip3:Set[${sCEquip3.Right[1]}]

		IRC ${sPad}${sName} I(C|N): ${sCInven1} ${sCInven2} ${sCInven3} | ${sInven1} ${sInven2} ${sInven3} --- E(C|N): ${sCEquip1} ${sCEquip2} ${sCEquip3} | ${sEquip1} ${sEquip2} ${sEquip3} --- ${sAdornSet} [${sItem1}/${sItem2}/${sItem3}]
		}
	Echo AdornSet Script Complete
}
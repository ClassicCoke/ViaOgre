function main(string sItem)
{
    variable index:item Items
    variable iterator ItemIterator
    variable index:item Bags
    variable iterator BagIterator
	variable int iBag
	variable int iSlot
	variable int iX
	variable string sValue
    
	Echo ViewItem Started ${sItem}
	; Query for items in Inventory that contain the parameter passed to the script in their name
	Me:QueryInventory[Items, ( Location =- "Equipment" || Location =- "Inventory" ) && Name =- "${sItem}"]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
        do
			{
			; This is to delay until Item Information is passed to client
			Echo  Viewing : ${ItemIterator.Value.Name}
			if (!${ItemIterator.Value.IsItemInfoAvailable})
				{
				do
					{
					waitframe
					}
					while (!${ItemIterator.Value.IsItemInfoAvailable})
				}
			; Query bag details to locate bag number and slot in bag that item was found
			If ${ItemIterator.Value.Location.Find["Inventory"]}
				{
				Me:QueryInventory[Bags, ContainerID = "${ItemIterator.Value.InContainerID}"]
				Bags:GetIterator[BagIterator]
				if ${BagIterator:First(exists)}
					{
					iBag:Set[${Math.Calc[${BagIterator.Value.Slot}+1]}]
					iSlot:Set[${Math.Calc[${ItemIterator.Value.Slot}+1]}]
					Echo Loc:${ItemIterator.Value.Location} Bag:${iBag} Slot:${iSlot} --- Item:${ItemIterator.Value.Name}(${ItemIterator.Value.Quantity}) 
					}
				}
			Echo  --- ID: ${ItemIterator.Value.ID}
			Echo  --- SerialNumber: ${ItemIterator.Value.SerialNumber}
			Echo  --- Name: ${ItemIterator.Value.Name}
			Echo  --- Food or Drink: ${ItemIterator.Value.IsFoodOrDrink}
			Echo  --- Location: ${ItemIterator.Value.Location}
			Echo  --- ToItemInfo.Name: ${ItemIterator.Value.ToItemInfo.Name}
			Echo  --- ToItemInfo.Description: ${ItemIterator.Value.ToItemInfo.Description}
			Echo  --- ToItemInfo.NumClasses: ${ItemIterator.Value.ToItemInfo.NumClasses}
			If ${ItemIterator.Value.ToItemInfo.NumClasses} > 0
				{
				iX:Set[1]
				Do
					{
					Echo  ..--- Class[${iX}].Name: ${ItemIterator.Value.ToItemInfo.Class[${iX}].Name}
					Echo  ..--- Class[${iX}].Level: ${ItemIterator.Value.ToItemInfo.Class[${iX}].Level}
					iX:Inc
					}
					While ${iX} <= ${ItemIterator.Value.ToItemInfo.NumClasses}
				}
			Echo  --- ToItemInfo.NumEquipSlots: ${ItemIterator.Value.ToItemInfo.NumEquipSlots}
			If ${ItemIterator.Value.ToItemInfo.NumEquipSlots} > 0
				{
				iX:Set[1]
				Do
					{
					Echo  ..--- EquipSlot[${iX}].Name: ${ItemIterator.Value.ToItemInfo.EquipSlot[${iX}]}
					iX:Inc
					}
					While ${iX} <= ${ItemIterator.Value.ToItemInfo.NumEquipSlots}
				}
			Echo  --- ToItemInfo.NumModifiers: ${ItemIterator.Value.ToItemInfo.NumModifiers}
			If ${ItemIterator.Value.ToItemInfo.NumModifiers} > 0
				{
				iX:Set[1]
				Do
					{
					Echo  ..--- Modifier[${iX}].Type: ${ItemIterator.Value.ToItemInfo.Modifier[${iX}].Type}
					Echo  ..--- Modifier[${iX}].SubType: ${ItemIterator.Value.ToItemInfo.Modifier[${iX}].SubType} (${ItemIterator.Value.ToItemInfo.Modifier[${iX}].Value})
					sValue:Set[${ItemIterator.Value.ToItemInfo.Modifier[${iX}].Value}]
					Echo sValue : ${sValue}
					iX:Inc
					}
					While ${iX} <= ${ItemIterator.Value.ToItemInfo.NumModifiers}
				}
			Echo  --- ToItemInfo.Type: ${ItemIterator.Value.ToItemInfo.Type}
			Echo  --- ToItemInfo.DamageType: ${ItemIterator.Value.ToItemInfo.DamageType}
			Echo  --- ToItemInfo.NumEffects: ${ItemIterator.Value.ToItemInfo.NumEffects}
			If ${ItemIterator.Value.ToItemInfo.NumEffects} > 0
				{
				iX:Set[1]
				Do
					{
					Echo  ..--- EffectName[${iX}]: ${ItemIterator.Value.ToItemInfo.EffectName[${iX}]}
					Echo  ..--- EffectDescription[${iX}]: ${ItemIterator.Value.ToItemInfo.EffectDescription[${iX}]}
					iX:Inc
					}
					While ${iX} <= ${ItemIterator.Value.ToItemInfo.NumEffects}
				}
			Echo  --- ToItemInfo.NumEffectStrings: ${ItemIterator.Value.ToItemInfo.NumEffectStrings}
			If ${ItemIterator.Value.ToItemInfo.NumEffectStrings} > 0
				{
				iX:Set[1]
				Do
					{
					;Echo  ..--- EffectString[${iX}].Name: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].Name}
					;Echo  ..--- EffectString[${iX}].SerialMumber: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].SerialMumber}
					;Echo  ..--- EffectString[${iX}].Description: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].Description}
					;Echo  ..--- EffectString[${iX}].UsedCapacity: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].UsedCapacity}
					;Echo  ..--- EffectString[${iX}].TotalCapacity: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].TotalCapacity}
					;Echo  ..--- EffectString[${iX}].Market: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].Market}
					Echo  ..--- EffectString[${iX}].Text: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].Text}
					Echo  ..--- EffectString[${iX}].IndentLevel: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].IndentLevel}
					;Echo  ..--- EffectString[${iX}].: ${ItemIterator.Value.ToItemInfo.EffectString[${iX}].}
					iX:Inc
					}
					While ${iX} <= ${ItemIterator.Value.ToItemInfo.NumEffectStrings}
				}
			Echo  --- ToItemInfo.NumAdornmentsAttached: ${ItemIterator.Value.ToItemInfo.NumAdornmentsAttached}
			If ${ItemIterator.Value.ToItemInfo.NumAdornmentsAttached} > 0
				{
				iX:Set[1]
				Do
					{
					Echo  ..--- EffectString[${iX}].Name: ${ItemIterator.Value.ToItemInfo.Adornment[${iX}].Name}
					Echo  ..--- EffectString[${iX}].LinkID: ${ItemIterator.Value.ToItemInfo.Adornment[${iX}].LinkID}
					Echo  ..--- EffectString[${iX}].IconID: ${ItemIterator.Value.ToItemInfo.Adornment[${iX}].IconID}
					iX:Inc
					}
					While ${iX} <= ${ItemIterator.Value.ToItemInfo.NumAdornmentsAttached}
				}
			}
			while ${ItemIterator:Next(exists)}
		}
		else
		{
		Echo No items found matching ${sItem}
		}
	Echo ViewItem Complete
}
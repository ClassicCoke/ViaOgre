function main(string sItem)
{
    variable index:item Items
    variable iterator ItemIterator
    variable index:item Bags
    variable iterator BagIterator
	variable int iBag
	variable int iSlot
	variable int iX=0

	
    Me:QueryInventory[Items, Name =- "${sItem}"]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
        do
			{
            iX:Set[${Math.Calc[${iX}+${ItemIterator.Value.Quantity}]}]
			Me:QueryInventory[Bags, ContainerID = "${ItemIterator.Value.InContainerID}"]
			Bags:GetIterator[BagIterator]
			if ${BagIterator:First(exists)}
				{
				iBag:Set[${Math.Calc[${BagIterator.Value.Slot}+1]}]
				iSlot:Set[${Math.Calc[${ItemIterator.Value.Slot}+1]}]
				Echo ${Me} found ${ItemIterator.Value.Quantity} of (${ItemIterator.Value.Name}) in ${ItemIterator.Value.Location} Bag:${iBag} Slot:${iSlot}  
				}
			}
			while ${ItemIterator:Next(exists)}
		}
	If ${Me.Name(exists)}
		{
		IRC Found ${iX} (${sItem}) on ${Me}
		}
}
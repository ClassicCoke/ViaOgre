function main(string sPotion, int iMax)
{
    variable index:item Items
    variable iterator ItemIterator
    variable int Counter = 1
    variable int x
	variable int iQty = 0
	variable int iTot = 0
	
    Me:QueryInventory[Items, Name =- "${sPotion}" && Location == "Inventory" && Quantity > 1]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
        do
			{
			iTot:Set[${Math.Calc[${iTot}+${ItemIterator.Value.Quantity}]}]
			Counter:Inc
			}
		while ${ItemIterator:Next(exists)}
		}
	If ${iTot} < ${iMax}
		{
		if ${Actor[Poison, Potion, & Totem Depot](exists)}
			{
			if ${Actor[Poison, Potion, & Totem Depot].Distance} < 11.5
				{
		
				Actor[Poison, Potion, & Totem Depot]:DoubleClick
				Wait 20
				iQty:Set[${Math.Calc[${iMax}-${iTot}]}]
				If ${ContainerWindow.Item[${sPotion}].Quantity} >= ${iQty}
					{
					ContainerWindow:RemoveItem[${ContainerWindow.Item[${sPotion}].ID},${iQty}]
					iTot:Set[${Math.Calc[${iTot}+${iQty}]}]
					Wait 20
					}
					else
					{
					IRC Depot does not have enough ${sPotion} to top off ${Me}
					}
				EQ2UIPage[Inventory,container].Child[button,Container.WindowFrame.Close]:LeftClick
				}
				else
				{
				IRC Hmph! ${Me} is too far from the depot!
				}
			}
			else
			{
			IRC Hmph! ${Me} is confused - there is not a depot nearby!
			}
		}
	IRC ${Me} has ${iTot} ${sPotion}
}
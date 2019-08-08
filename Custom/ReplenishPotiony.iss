function main(string sPotion)
{
    variable index:item Items
    variable iterator ItemIterator
;;	variable string sPotion = "Abyssal Noxious Remedy"
    variable int Counter = 1
    variable int x
	variable int iMax = 200
	variable int iQty
	
    Me:QueryInventory[Items, Name =- "${sPotion}" && Location == "Inventory" && Quantity > 1]
    Items:GetIterator[ItemIterator]
	IRC Running Inventory for ${sPotion}
    if ${ItemIterator:First(exists)}
    {
        do
        {
            IRC "${Counter}. ${ItemIterator.Value.Name} [${ItemIterator.Value.Location}] [Qty: ${ItemIterator.Value.Quantity}]"
			If ${ItemIterator.Value.Quantity} < 200
			   {
			   Actor[Poison, Potion, & Totem Depot]:DoubleClick
			   Wait 20
			   iQty:Set[${Math.Calc[${iMax}-${ItemIterator.Value.Quantity}]}]
			   IRC Grabbing ${iQty} from Depot
			   ContainerWindow:RemoveItem[${ContainerWindow.Item[${sPotion}].ID},${iQty}]
			   Wait 20
			   EQ2UIPage[Inventory,container].Child[button,Container.WindowFrame.Close]:LeftClick
			   }

			Counter:Inc
        }
        while ${ItemIterator:Next(exists)}
    }
	else
	{
	   Actor[Poison, Potion, & Totem Depot]:DoubleClick
	   Wait 20
	   IRC Grabbing ${iMax} from Depot
	   ContainerWindow:RemoveItem[${ContainerWindow.Item[${sPotion}].ID},${iMax}]
	   Wait 20
	   EQ2UIPage[Inventory,container].Child[button,Container.WindowFrame.Close]:LeftClick
	}
}
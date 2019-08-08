function main(string sAdorn)
{
    variable index:item Items
    variable iterator ItemIterator


    Me:QueryInventory[Items, Location =- "Inventory" && Name =- "${sAdorn}"]
    Items:GetIterator[ItemIterator]
	If ${ItemIterator:First(exists)}
		{
		Me.Inventory[Query, ID =- "${ItemIterator.Value.ID}"]:Use
		IRC ${Me} is applying ${ItemIterator.Value.Name} to ${Me.Equipment[Waist].Name}
		wait 5
		Me.Equipment[Waist]:ReclaimAdornments
		}
}

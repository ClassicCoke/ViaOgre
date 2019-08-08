function main()
{
	Me.Inventory[Query, Name =- "Atole"]:Use
	Wait 20
	Me.Inventory[Query, Name =- "Arrowroot"]:Use
	Wait 20
	Me.Inventory[Query, Name =- "Chebakia"]:Use
	Wait 20
	Me.Inventory[Query, Name =- "Dolma"]:Use
	Wait 20
	Me.Inventory[Query, Name =- "Fairy Bread"]:Use
	Wait 20
	Me.Inventory[Query, Name =- "Jaffa"]:Use
	Wait 20
	Me.Inventory[Query, Name =- "Tejuino"]:Use
	Wait 50

	IRC ${Me.Name} Consume Snacks Complete
}
function main()
{
    variable index:item Items
    variable iterator ItemIterator
	variable int iObsidian=0
	variable int iEarthen=0
	variable int iZephyren=0
	variable int iChoice=0
	variable bool bMaxEarthen="FALSE"
	variable bool bMaxObsidian="FALSE"
	variable bool bMaxZephyren="FALSE"
	variable bool bEarthen="FALSE"
	variable bool bObsidian="FALSE"
	variable bool bZephyren="FALSE"
	
	
    Me:QueryInventory[Items, Name =- "Celestial"]
    Items:GetIterator[ItemIterator]
    if ${ItemIterator:First(exists)}
		{
        do
			{
            If ${ItemIterator.Value.Name.Find["Obsidian Ore"]}
				{
				iObsidian:Set[${Math.Calc[${iObsidian}+${ItemIterator.Value.Quantity}]}]
				}
            If ${ItemIterator.Value.Name.Find["Earthen Ore"]}
				{
				iEarthen:Set[${Math.Calc[${iEarthen}+${ItemIterator.Value.Quantity}]}]
				}
            If ${ItemIterator.Value.Name.Find["Zephyren Crystal"]}
				{
				iZephyren:Set[${Math.Calc[${iZephyren}+${ItemIterator.Value.Quantity}]}]
				}
			}
			while ${ItemIterator:Next(exists)}
		}
	If ${iEarthen} >= 50
		{
		bMaxEarthen:Set["TRUE"]
		}
	If ${iObsidian} >= 50
		{
		bMaxObsidian:Set["TRUE"]
		}
	If ${iZephyren} >= 50
		{
		bMaxZephyren:Set["TRUE"]
		}
	If (( ${iEarthen} >= ${iObsidian} || ${bMaxObsidian} ) && ( ${iEarthen} >= ${iZephyren} || ${bMaxZephyren} ) && ( ${iEarthen} < 50 ))
		{
		bEarthen:Set["TRUE"]
		}
	If (( ${iObsidian} >= ${iEarthen} || ${bMaxEarthen} ) && ( ${iObsidian} >= ${iZephyren} || ${bMaxZephyren} ) && ( ${iObsidian} < 50 ))
		{
		bObsidian:Set["TRUE"]
		}
	If (( ${iZephyren} >= ${iEarthen} || ${bMaxEarthen} ) && ( ${iZephyren} >= ${iObsidian} || ${bMaxObsidian} ) && ( ${iZephyren} < 50 ))
		{
		bZephyren:Set["TRUE"]
		}




	iChoice:Set[1]
	IF !${bMaxEarthen} 
		{
		iChoice:Set[1]
		}
	IF !${bMaxObsidian} 
		{
		iChoice:Set[2]
		}
	IF !${bMaxZephyren} 
		{
		iChoice:Set[3]
		}
	If ${bEarthen}
		{
		iChoice:Set[1]
		}
	If ${bObsidian}
		{
		iChoice:Set[2]
		}
	If ${bZephyren}
		{
		iChoice:Set[3]
		}

	If ${Me.Inventory["Elemental Ores"].Index}
		{
		eq2execute inventory unpack ${Me.Inventory["Elemental Ores"].Index}
		Wait 5
		If ${iChoice} > 0
			{
			OgreBotAPI:AcceptReward[${Me.Name},${iChoice}]
			IRC Found Earthen:${iEarthen} -- Obsidian:${iObsidian} -- Zephyren:${iZephyren} --- Selected[${iChoice}] ${Me.Name}
			}
		}
		else
		{
		;IRC No Ores found to Unpack ${Me.Name}
		IRC Found Earthen:${iEarthen} -- Obsidian:${iObsidian} -- Zephyren:${iZephyren} --- Selected[${iChoice}] ${Me.Name} |${bEarthen}|${bMaxEarthen}|${bObsidian}|${bMaxObsidian}|${bZephyren}|${bMaxZephyren}
		}
}
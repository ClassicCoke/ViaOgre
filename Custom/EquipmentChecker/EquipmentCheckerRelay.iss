function main()

{
	; Load from UI Window
	variable string sSlot
	variable string sMod="Resolve"
	variable int iCharacterResolveSelection=${UIElement[${EQ2CharResolveID}].Selection}
	variable float fCheck=${UIElement[${EQ2ItemResolveID}].Text}
	;variable float fTeir=${UIElement[${EQ2CharResolveID}].Item}
	variable float fTeir=0
	variable bool bLink="FALSE"
	variable int iMaxIRCUserLength=12
	variable string sForWho
	; End load from UI Window

	
	;Determine ForWho Value
	sForWho:Set[""]
	if ${UIElement[${EQ2ShowFighterID}].Checked}
		{
		IRC Fighter Checked
		If ${sForWho.Length}
			{
			sForWho:Concat["|fighter"]
			}
			Else
			{
			sForWho:Set["fighter"]
			}
		}
	if ${UIElement[${EQ2ShowScoutID}].Checked}
		{
		IRC Scout Checked
		If ${sForWho.Length}
			{
			sForWho:Concat["|scout"]
			}
			Else
			{
			sForWho:Set["scout"]
			}
		}
	if ${UIElement[${EQ2ShowMageID}].Checked}
		{
		IRC Mage Checked
		If ${sForWho.Length}
			{
			sForWho:Concat["|mage"]
			}
			Else
			{
			sForWho:Set["mage"]
			}
		}
	if ${UIElement[${EQ2ShowHealerID}].Checked}
		{
		IRC Healer Checked
		If ${sForWho.Length}
			{
			sForWho:Concat["|priest"]
			}
			Else
			{
			sForWho:Set["priest"]
			}
		}
	if ${UIElement[${EQ2ShowAllID}].Checked}
		{
		IRC All Checked
		sForWho:Set["All"]
		}
	
		
	
	
	;Determine Max Character Resolve
	If ${iCharacterResolveSelection.Equal[1]}
		{
		fTeir:Set[1310]
		}
	If ${iCharacterResolveSelection.Equal[2]}
		{
		fTeir:Set[1610]
		}
	If ${iCharacterResolveSelection.Equal[3]}
		{
		fTeir:Set[1725]
		}
	If ${iCharacterResolveSelection.Equal[4]}
		{
		fTeir:Set[1790]
		}
	If ${iCharacterResolveSelection.Equal[5]}
		{
		fTeir:Set[1910]
		}
	If ${iCharacterResolveSelection.Equal[6]}
		{
		fTeir:Set[2032]
		}
	If ${iCharacterResolveSelection.Equal[7]}
		{
		fTeir:Set[2112]
		}
	If ${iCharacterResolveSelection.Equal[8]}
		{
		fTeir:Set[2273]
		}
	If ${iCharacterResolveSelection.Equal[9]}
		{
		fTeir:Set[2395]
		}
	If ${iCharacterResolveSelection.Equal[10]}
		{
		fTeir:Set[9000]
		}
	
	;Determine which Equipment Slot
	sSlot:Set["N/A"]
	if ${UIElement[${EQ2CharmID}].Checked}
		{
		sSlot:Set["activate1"]
		}
	if ${UIElement[${EQ2EarID}].Checked}
		{
		sSlot:Set["ears"]
		}
	if ${UIElement[${EQ2NeckID}].Checked}
		{
		sSlot:Set["neck"]
		}
	if ${UIElement[${EQ2RingID}].Checked}
		{
		sSlot:Set["left_ring"]
		}
	if ${UIElement[${EQ2WristID}].Checked}
		{
		sSlot:Set["left_wrist"]
		}
	if ${UIElement[${EQ2CloakID}].Checked}
		{
		sSlot:Set["cloak"]
		}
	if ${UIElement[${EQ2WaistID}].Checked}
		{
		sSlot:Set["waist"]
		}
	if ${UIElement[${EQ2HeadID}].Checked}
		{
		sSlot:Set["head"]
		}
	if ${UIElement[${EQ2ShoulderID}].Checked}
		{
		sSlot:Set["shoulders"]
		}
	if ${UIElement[${EQ2ChestID}].Checked}
		{
		sSlot:Set["chest"]
		}
	if ${UIElement[${EQ2ForearmID}].Checked}
		{
		sSlot:Set["forearms"]
		}
	if ${UIElement[${EQ2HandID}].Checked}
		{
		sSlot:Set["hands"]
		}
	if ${UIElement[${EQ2LegID}].Checked}
		{
		sSlot:Set["legs"]
		}
	if ${UIElement[${EQ2FeetID}].Checked}
		{
		sSlot:Set["feet"]
		}
	if ${UIElement[${EQ2PrimaryID}].Checked}
		{
		sSlot:Set["primary"]
		}
	if ${UIElement[${EQ2SecondaryID}].Checked}
		{
		sSlot:Set["secondary"]
		}
	if ${UIElement[${EQ2RangedID}].Checked}
		{
		sSlot:Set["ranged"]
		}
	
	IRC !c All -RSOB ${sForWho} Custom/EquipmentChecker/EquipmentChecker ${sSlot} Resolve ${fCheck.Deci} ${fTeir.Int} ${bLink} ${iMaxIRCUserLength} ${iCharacterResolveSelection}
}

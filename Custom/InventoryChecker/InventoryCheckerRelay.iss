function main()

{
	; Load from UI Window
	variable string sItem=${UIElement[${EQ2ItemInventoryItemID}].Text}
	; End load from UI Window

	variable int iMaxIRCUserLength=12
	variable string sForWho="All"

	
	IRC !c All -RSOB ${sForWho} Custom/InventoryChecker/InventoryChecker "${sItem}" ${iMaxIRCUserLength}
}

function main()

{
	; Load from UI Window
	variable string sSlot
	variable string sMod="Resolve"
	variable float fCheck
	variable float fTeir
	variable bool bLink
	variable int iMaxIRCUserLength=12
	; End load from UI Window

	if ${UIElement[${ChkBoxHead}].Checked}
		{
		sSlot:Set["head"]
		}
	
	IRC Slot:${sSlot} fCheck:${fCheck} fTier:${fTeir} bLink:${bLink} IRCUserLength:${iMaxIRCUserLength}
	
}

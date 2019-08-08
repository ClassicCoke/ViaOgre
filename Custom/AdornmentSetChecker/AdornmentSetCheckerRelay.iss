function main()

{
	; Load from UI Window
	variable string sSet
	variable string sForWho="All"
	variable int iMaxIRCUserLength=12
	; End load from UI Window

	
	
	;Determine which Adornment Set
	sSet:Set["N/A"]
	if ${UIElement[${EQ2AniquilacionID}].Checked}
		{
		sSet:Set["Aniquilacion"]
		}
	if ${UIElement[${EQ2ZouKunnenID}].Checked}
		{
		sSet:Set["Zou Kunnen"]
		}
	if ${UIElement[${EQ2PaixaoID}].Checked}
		{
		sSet:Set["Paixao"]
		}
	if ${UIElement[${EQ2PingyuanDiquID}].Checked}
		{
		sSet:Set["Pingyuan Diqu"]
		}
	
	IRC !c All -RSOB ${sForWho} Custom/AdornmentSetChecker/AdornmentSetChecker "${sSet}" ${iMaxIRCUserLength}
}

function main(string s1, string s2, string s3, string s4, string s5, string s6, string s7, string s8, string s9, string s10, string s11)
{

	if !${gsCFW(exists)}
		{
		; Declare Globals
		declarevariable gsCFW string globalkeep
		declarevariable gsMT string globalkeep
		declarevariable gsOT string globalkeep
		declarevariable gsMA string globalkeep
		declarevariable gsOFollow string globalkeep
		declarevariable gsMisc1 string globalkeep
		declarevariable gsMisc2 string globalkeep
		declarevariable gsMisc3 string globalkeep
		declarevariable gsMisc4 string globalkeep
		declarevariable gsMisc5 string globalkeep
		declarevariable gsMisc6 string globalkeep
		; Seed Globals
		gsCFW:Set[${s1}]
		gsMT:Set[${s2}]
		gsOT:Set[${s3}]
		gsMA:Set[${s4}]
		gsOFollow:Set[${s5}]
		gsMisc1:Set[${s6}]
		gsMisc2:Set[${s7}]
		gsMisc3:Set[${s8}]
		gsMisc4:Set[${s9}]
		gsMisc5:Set[${s10}]
		gsMisc6:Set[${s11}]
		}

	ui -reload -skin ${ISXOgre.SkinName} "${LavishScript.HomeDirectory}/Scripts/Custom/Globals/SetGlobalsXML.xml"
}
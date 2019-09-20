variable settingsetref setProfileList 
variable string GlobalProfiles="${LavishScript.HomeDirectory}/Scripts/Custom/Globals/GlobalProfiles.xml"



function main()
{
	if !${gsCFW(exists)}
		{
		; Declare Globals if not already defined
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
		Call LoadGlobals "Group"
		Echo ${Me} - Globals Initialized
		}
	Echo ${Me} - Globals Already Exist, Skipping load from XML
}


function InitGlobals()
	{
	;// Clear then Load LavishSettings to make sure it's clean.
	LavishSettings[Globals]:Clear
	LavishSettings:AddSet[Globals]
	LavishSettings[Globals]:Import[${GlobalProfiles}]
	LavishSettings[Globals]:AddSet[ProfileList]
	setProfileList:Set[${LavishSettings[Globals].FindSet[ProfileList]}]
	}

function LoadGlobals(string ProfileName)
	{
	call InitGlobals
	setProfileList:Set[${setProfileList.FindSet[${ProfileName}]}]
	variable iterator Iterator
	setProfileList:GetSettingIterator[Iterator]
	if ${Iterator:First(exists)}
		{
		do
			{
			Echo ${Iterator.Key} = ${Iterator.Value.String.Escape}
			switch ${Iterator.Key}
				{	
				case CFW
					gsCFW:Set[${Iterator.Value.String.Escape}]
					break
				case MT
					gsMT:Set[${Iterator.Value.String.Escape}]
					break
				case OT
					gsOT:Set[${Iterator.Value.String.Escape}]
					break
				case MA
					gsMA:Set[${Iterator.Value.String.Escape}]
					break
				case OFollow
					gsOFollow:Set[${Iterator.Value.String.Escape}]
					break
				case Misc1
					gsMisc1:Set[${Iterator.Value.String.Escape}]
					break
				case Misc2
					gsMisc2:Set[${Iterator.Value.String.Escape}]
					break
				case Misc3
					gsMisc3:Set[${Iterator.Value.String.Escape}]
					break
				case Misc4
					gsMisc4:Set[${Iterator.Value.String.Escape}]
					break
				case Misc5
					gsMisc5:Set[${Iterator.Value.String.Escape}]
					break
				case Misc6
					gsMisc6:Set[${Iterator.Value.String.Escape}]
					break
				default
					OgreConsole:Message["Globals Parser: Unknown Key encountered: ${Iterator.Key}"]
					break
				}
			}
			while ${Iterator:Next(exists)}
		}
	}

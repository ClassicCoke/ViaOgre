

variable settingsetref setProfileList 
variable string GlobalProfiles="${LavishScript.HomeDirectory}/Scripts/Custom/Globals/GlobalProfiles.xml"



function main()
{

Call LoadGlobals "Group"

Echo ${Me} - Load Globals Complete (Place Holder)
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
					UIElement[SetGlobals].FindChild[Globals].FindChild[CFW]:SetText[${Iterator.Value.String.Escape}]
					break
				case MT
					UIElement[SetGlobals].FindChild[Globals].FindChild[MainTank]:SetText[${Iterator.Value.String.Escape}]
					break
				case OT
					UIElement[SetGlobals].FindChild[Globals].FindChild[OffTank]:SetText[${Iterator.Value.String.Escape}]
					break
				case MA
					UIElement[SetGlobals].FindChild[Globals].FindChild[MainAssist]:SetText[${Iterator.Value.String.Escape}]
					break
				case OFollow
					UIElement[SetGlobals].FindChild[Globals].FindChild[OgreFollow]:SetText[${Iterator.Value.String.Escape}]
					break
				case Misc1
					UIElement[SetGlobals].FindChild[Globals].FindChild[Misc1]:SetText[${Iterator.Value.String.Escape}]
					break
				case Misc2
					UIElement[SetGlobals].FindChild[Globals].FindChild[Misc2]:SetText[${Iterator.Value.String.Escape}]
					break
				case Misc3
					UIElement[SetGlobals].FindChild[Globals].FindChild[Misc3]:SetText[${Iterator.Value.String.Escape}]
					break
				case Misc4
					UIElement[SetGlobals].FindChild[Globals].FindChild[Misc4]:SetText[${Iterator.Value.String.Escape}]
					break
				case Misc5
					UIElement[SetGlobals].FindChild[Globals].FindChild[Misc5]:SetText[${Iterator.Value.String.Escape}]
					break
				case Misc6
					UIElement[SetGlobals].FindChild[Globals].FindChild[Misc6]:SetText[${Iterator.Value.String.Escape}]
					break
				default
					OgreConsole:Message["Globals Parser: Unknown Key encountered: ${Iterator.Key}"]
					break
				}
			}
			while ${Iterator:Next(exists)}
		}
	}

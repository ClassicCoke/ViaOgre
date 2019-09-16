

variable settingsetref setProfileList 
variable string GlobalProfiles="${LavishScript.HomeDirectory}/Scripts/Custom/Globals/GlobalProfiles.xml"



function main()
{

Call SaveGlobals "Group"

Echo ${Me} - Save Globals Complete
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

function SaveGlobals(string ProfileName)
	{
	call InitGlobals	
	setProfileList:AddSet[${ProfileName}]
	setProfileList:Set[${setProfileList.FindSet[${ProfileName}]}]
	
	setProfileList:AddSetting[CFW,${UIElement[SetGlobals].FindChild[Globals].FindChild[CFW].Text.Escape}]
	setProfileList:AddSetting[MT,${UIElement[SetGlobals].FindChild[Globals].FindChild[MainTank].Text.Escape}]
	setProfileList:AddSetting[OT,${UIElement[SetGlobals].FindChild[Globals].FindChild[OffTank].Text.Escape}]
	setProfileList:AddSetting[MA,${UIElement[SetGlobals].FindChild[Globals].FindChild[MainAssist].Text.Escape}]
	setProfileList:AddSetting[OFollow,${UIElement[SetGlobals].FindChild[Globals].FindChild[OgreFollow].Text.Escape}]
	setProfileList:AddSetting[Misc1,${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc1].Text.Escape}]
	setProfileList:AddSetting[Misc2,${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc2].Text.Escape}]
	setProfileList:AddSetting[Misc3,${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc3].Text.Escape}]
	setProfileList:AddSetting[Misc4,${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc4].Text.Escape}]
	setProfileList:AddSetting[Misc5,${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc5].Text.Escape}]
	setProfileList:AddSetting[Misc6,${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc6].Text.Escape}]

	LavishSettings[Globals]:Export[${GlobalProfiles}]
	}

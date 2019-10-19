function main(string _NamedNPC)
{
    Call LoadOgreInstanceHelper
    Call LoadOgreUtilities

    Call KillNamed "${_NamedNPC}" "TRUE"
}
/*==================================================================================================================*/
#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/PolarBearUtilities.iss"
function:bool LoadOgreInstanceHelper()
{
	ogre instance_helpers
	wait 5
	Obj_CreateInstance_Helpers:Create[${Script.Filename},Obj_OgreIH,${Args.ExpandComma}]
	wait 5
}
/*==================================================================================================================*/
function:bool LoadOgreUtilities()
{
	ogre utilities
	wait 5
	Obj_CreateOgreUtilities:CreateOgreUtilities[${Script.Filename},Obj_OgreUtilities,${Args.ExpandComma}]
	wait 5
}
/*==================================================================================================================*/
function:bool KillNamed(string _sNamedNPC, bool _bJoust)
{
    variable float fHeading
    variable float fHeadingNew

	call OCMessage "Killing ${_sNamedNPC}"
    ;; Pre Pull Actions
    If ${_bJoust}
    {
        OgreBotAPI:UplinkOptionChange["scout","checkbox_settings_movemelee","TRUE","TRUE"]
        OgreBotAPI:UplinkOptionChange["scout","checkbox_settings_movebehind","TRUE","TRUE"]
    }
    Ob_AutoTarget:AddActor["${_sNamedNPC}",0,FALSE,TRUE]
	call Obj_OgreUtilities.PreCombatBuff 8

   
    runscript "Custom/SetCampOn" "IGW:${Me}" "${_sNamedNPC}"
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	Actor[Name,"${_sNamedNPC}"]:DoTarget
	Actor[Name,"${_sNamedNPC}"]:DoFace
    call Obj_OgreUtilities.HandleWaitForGroupDistance 3
    Wait 5
    fHeading:Set[${Me.Heading}]
    runscript "Custom/SetCampByClass" "TRUE" "TRUE" "Mage|Scout|Healer" "20" "TRUE" "Warlock|Enchanter" "12" "FALSE"
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
    While ${Me.InCombat} || ${Me.IsMoving}
    {
        wait 25
        If !${Me.IsMoving}
        {
            fHeadingNew:Set[${Me.Heading}]
            Echo ${Time} OldHeading:${fHeading} NewHeading:${fHeadingNew}
            If ${fHeadingNew} > 330 && ${fHeading} < 30
            {
                ;; New and Old headings are on oppisite sides of 0 with new heading in the high range
                fHeadingNew:Set[${Math.Calc[${fHeadingNew}-360]}]
            }
            If ${fHeading} > 330 && ${fHeadingNew} < 30
            {
                ;; New and Old headings are on oppisite sides of 0 with new heading in the low range
                fHeadingNew:Set[${Math.Calc[${fHeadingNew}+360]}]
            }
            If !((${Math.Calc[${fHeading}-30]} < ${fHeadingNew}) && (${Math.Calc[${fHeading}+30]} > ${fHeadingNew}))
            {
                ;; Heading changed by more than 30 degrees, need to reposition the party
            	call OCMessage "Changing combat location, mob shifted"
                fHeading:Set[${Me.Heading}]
                runscript "Custom/SetCampByClass" "TRUE" "TRUE" "Mage|Scout|Healer" "20" "TRUE" "Warlock|Enchanter" "12" "FALSE"
                call Obj_OgreUtilities.HandleWaitForCampSpot 10
            }
        }
    }
    
    ;; Post Combat Cleanup
    wait 20
	Ob_AutoTarget:Clear
    If ${_bJoust}
    {
        OgreBotAPI:UplinkOptionChange["scout","checkbox_settings_movemelee","FALSE","TRUE"]
        OgreBotAPI:UplinkOptionChange["scout","checkbox_settings_movebehind","FALSE","TRUE"]
    }
}
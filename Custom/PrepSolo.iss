function main()
{

variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}
variable string sZone


IRC ${Me} Started PrepSolo
;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;
; 
;    
;IRC !c ${sWhoIRC} -Travel IGW:${Me} "the Great Library" FALSE
;sZone:Set[${Zone.Name}]
;While !${sZone.Find["the Great Library"]}
;	{
;	wait 10
;	}
;Wait 50

;Zone Reset All
IRC !c ${sWhoIRC} -ZoneResetAll IGW:${Me}
Wait 30


IRC !c ${sWhoIRC} -ChangeZoneTo IGW:${Me} ${Me}
Wait 30
IRC !c ${sWhoIRC} -MakeLeader IGW:${Me} ${Me}
Wait 20

; Move to portal pad
IRC !c ${sWhoIRC} -DoNotMove ${Me} -OgreCommandOB_AP ${Me} Nav "Teleporter to Elemental Portal Gallery" -ntr
wait 20
While ${Me.IsMoving}
	{
	Wait 10
	}
IRC !c ${sWhoIRC} -Special ${Me}
Wait 30
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${Me} Nav -loc 749.7 411 -368.8 -ntr
wait 20
While ${Me.IsMoving}
	{
	Wait 10
	}
Actor[Vazgron]:DoTarget
wait 15
Actor[Vazgron]:DoFace
wait 15
Actor[Vazgron]:DoubleClick
wait 35
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 30
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${Me} Nav -loc 731.07 411.87 -340.67 -ntr
wait 30
While ${Me.IsMoving}
	{
	Wait 10
	}
IRC !c ${sWhoIRC} -Special ${Me}
Wait 30
IRC !c ${sWhoIRC} -ZoneDoorForWho ${Me} 7
Wait 30
while !${Me.InGameWorld}
	{
	wait 10
	}
IRC ${Me} Completed PrepSolo

}
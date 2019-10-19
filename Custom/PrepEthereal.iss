function main()
{

variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}
variable string sZone


IRC ${Me} Started PrepEthereal

;Zone Reset All
IRC !c ${sWhoIRC} -ZoneResetAll IGW:${Me}
Wait 30


; Move to portal pad
IRC !c ${sWhoIRC} -DoNotMove ${Me} -OgreCommandOB_AP ${Me} Nav "Teleporter to Elemental Portal Gallery" -ntr
wait 20
While ${Me.IsMoving}
	{
	Wait 10
	}
IRC !c ${sWhoIRC} -Special ${Me}
Wait 30
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${Me} Nav -loc 752.737122 411.093536 -369.198761 -ntr
wait 20
While ${Me.IsMoving}
	{
	Wait 10
	}

;; Get all Solo Quests
Actor["Vazgron the Loremonger"]:DoTarget
wait 15
Actor["Vazgron the Loremonger"]:DoFace
wait 15
Actor["Vazgron the Loremonger"]:DoubleClick
wait 25
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 30

;; Get all Herioc Quests
Actor["Researcher Tulvina"]:DoTarget
wait 15
Actor["Researcher Tulvina"]:DoFace
wait 15
Actor["Researcher Tulvina"]:DoubleClick
wait 25
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 30

;; Get all Daily Double Quests
Actor["Quillion Frain"]:DoTarget
wait 15
Actor["Quillion Frain"]:DoFace
wait 15
Actor["Quillion Frain"]:DoubleClick
wait 25
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 25
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 15
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 15
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 25
IRC !c ${sWhoIRC} -ConversationBubble ${Me} 2
wait 30

IRC ${Me} Completed PrepEthereal

}
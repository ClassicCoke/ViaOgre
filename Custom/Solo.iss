function main()
{

variable string sWhoIRC=${UIElement[${OBUI_textentry_irc_user}].Text}
variable string sTarget
variable bool bNamed1="FALSE"
variable bool bNamed2="FALSE"
variable bool bNamed3="FALSE"
variable bool bTrash="TRUE"

variable index:actor Actors
variable index:ability MyAbilities

variable iterator ActorIterator
variable iterator MyAbilitiesIterator

; First set of Trash:a summoned pyromaton
; Second set of Trash:a summoned pyrelord
; Third set of Trash:a Doomfire guardian
; Fourth set of Trash:a greater summoned pyromaton

; First Named:Wrath of Ro
; Second Named:Retribution of Ro
; Named Boss:Vengeance of Ro
; Portal Key:Krel-Ariak

IRC !c ${sWhoIRC} -ShareQuestsForZone ${Me} 
Wait 50
IRC !c ${sWhoIRC} -UO IGW:${Me} checkbox_settings_autotargetwhenhated TRUE TRUE
Wait 2
IRC !c ${sWhoIRC} -UO IGW:${Me} checkbox_settings_ignoretargettoattackhealthcheck TRUE TRUE
Wait 2
IRC !c ${sWhoIRC} -UO IGW:${Me}  checkbox_settings_movemelee FALSE TRUE
Wait 2
IRC !c ${sWhoIRC} -UO IGW:${Me}  checkbox_settings_movebehind FALSE TRUE
Wait 2
IRC !c ${sWhoIRC} -UO IGW:${Me} checkbox_settings_facenpc TRUE TRUE
Wait 2
IRC !c ${sWhoIRC} -UO IGW:${Me} checkbox_settings_movetoarea TRUE TRUE
wait 10

OgreBotAPI:UplinkOptionChange["All","checkbox_autotarget_enabled","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_enable","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_adepts","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_masters","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_ancients","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_illegiblescrolls","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_loottradables","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_looteverything","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_smartassign","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptloot","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_loot","TRUE","TRUE"]

OgreBotAPI:ChangeLootOptions["All","LeaderOnlyLoot"]
wait 30

IRC !c ${sWhoIRC} -Resume IGW:${Me} 
wait 10

IRC !c ${sWhoIRC} -Assist ${Me} IGWBN:${Me} 
wait 10

bTrash:Set["TRUE"]
While !${bNamed1} && ${bTrash}
	{
	EQ2:QueryActors[Actors, Name  =- "a summoned pyromaton" && Distance <= 100 && !IsDead ]
	Actors:GetIterator[ActorIterator]
	if ${ActorIterator:First(exists)}
		{
		; Kill Trash to Spawn Wrath of Ro
;		IRC ${Me} is killing Trash to spawn Wrath of Ro - First Named
		Actor[ID,${ActorIterator.Value.ID}]:DoTarget
		While !${Me.Target(exists)}
			{
			wait 5
			}
		IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc ${ActorIterator.Value.X.Deci} ${ActorIterator.Value.Y.Deci} ${ActorIterator.Value.Z.Deci} -ptd 20 -tr
		Wait 50
		While ${Me.InCombat} || ${Me.IsMoving}
			{
			Wait 10
			If ${Actor[Query,Name =- "Wrath of Ro"](exists)} && !${bNamed1}
				{
				Actor[Name,"Wrath of Ro"]:DoTarget
				bNamed1:Set["TRUE"]
				wait 50
				}
			}
		Wait 20
		}
		else
		{
		bTrash:Set["FALSE"]
		}
	}
;Trash has been cleared, see if Wrath of Ro is still alive
If !${bNamed1}
	{
	Wait 100
	EQ2:QueryActors[Actors, Name  =- "Wrath of Ro" && Distance <= 150 && !IsDead ]
	Actors:GetIterator[ActorIterator]
	if ${ActorIterator:First(exists)}
		{
		Actor[ID,${ActorIterator.Value.ID}]:DoTarget
		While !${Me.Target(exists)}
			{
			wait 5
			}
		IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc ${ActorIterator.Value.X.Deci}, ${ActorIterator.Value.Y.Deci}, ${ActorIterator.Value.Z.Deci} -ptd 20 -tr
		Wait 50
		While ${Me.InCombat} || ${Me.IsMoving}
			{
			Wait 10
			}
		}
   }
Wait 60
EQ2Execute summon
wait 10
OgreBotAPI:ResetActorsLooted["All"]
Wait 60



; Move to Lower Level Ringed Event Fight
EQ2:QueryActors[Actors, Name  =- "Krel-Ariak" && Distance <= 300 ]
Actors:GetIterator[ActorIterator]
if ${ActorIterator:First(exists)}
	{
	IRC ${Me} is moving to the Lower Level Ring Event
	IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc 412.87 -11.57 -305.92 -ntr
	Wait 30
	}
	else
	{
	; Krel is not found, Retribution of Ro is already dead, go straight to Portal
	bNamed2:Set["TRUE"]
	}

While ${Me.InCombat} || ${Me.IsMoving} || !${bNamed2} 
	{
	Wait 10
	If ${Actor[Query,Name =- "Retribution of Ro"](exists)}
		{
		Actor[Name,"Retribution of Ro"]:DoTarget
		bNamed2:Set["TRUE"]
		wait 50
		}
	}
Wait 60
EQ2Execute summon
wait 10
OgreBotAPI:ResetActorsLooted["All"]
Wait 60



;Move to Portal
wait 100
IRC ${Me} is moving to the portal to get to the upper level
IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc 457.47 -16.60 -374.65 -ptd 6 -ntr 
Wait 30
While ${Me.IsMoving}
	{
	Wait 5
	}
Wait 100



; Upper Level

IRC !c ${sWhoIRC} -Assist ${Me} IGWBN:${Me} 
wait 10

EQ2:QueryActors[Actors, Name  =- "a greater summoned pyromaton" && Distance <= 100 && !IsDead ]
Actors:GetIterator[ActorIterator]
if ${ActorIterator:First(exists)}
	{
	; Kill Trash to start Upper Ring Event
	Actor[ID,${ActorIterator.Value.ID}]:DoTarget
	While !${Me.Target(exists)}
		{
		wait 5
		}
	IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc ${ActorIterator.Value.X.Deci} ${ActorIterator.Value.Y.Deci} ${ActorIterator.Value.Z.Deci} -ptd 20 -tr
	Wait 50
	While ${Me.InCombat} || ${Me.IsMoving}
		{
		Wait 10
		If ${Actor[Query,Name =- "Vengeance of Ro"](exists)} && !${bNamed3}
			{
			Actor[Name,"Vengeance of Ro"]:DoTarget
			bNamed3:Set["TRUE"]
			}
		}
	}
	else
	{
	IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc 363.84 15.22 -213.91 -ntr
	Wait 25
	While ${Me.IsMoving}
		{
		wait 5
		}
	Wait 20
	}


; Move to Upper Level Ringed Event Fight
IRC ${Me} is moving to the Upper Level Ring Event
IRC !c ${sWhoIRC} -OgreCommandOB_AP IGW:${Me} Nav -loc 404.77 18.51 -244.74 -ntr
Wait 25
While ${Me.IsMoving}
	{
	Wait 5
	}
IRC !c ${sWhoIRC} -CampSpot IGW:${Me} 1 125
IRC !c ${sWhoIRC} -ccsw IGW:${Me} 404.77 18.51 -244.74
While ${Me.InCombat} || ${Me.IsMoving} || !${bNamed3}
	{
	Wait 10
	If ${Actor[Query,Name =- "Vengeance of Ro"](exists)} && !${bNamed3}
		{
		Actor[Name,"Vengeance of Ro"]:DoTarget
		bNamed3:Set["TRUE"]
		wait 15
		IRC !c ${sWhoIRC} -ccsw IGW:${Me} 383.95 20.26 -202.04
		}
	}
Wait 60
EQ2Execute summon
wait 10
OgreBotAPI:ResetActorsLooted["All"]
Wait 60

IRC ${Me} has confirmed Vengeance of Ro has been killed - Third Named
IRC ${Me} is preparing to call back to the Guild Hall

wait 100

;Call to Guild Hall  3266969222
Me:QueryAbilities[MyAbilities, ID =- "3266969222"]
MyAbilities:GetIterator[MyAbilitiesIterator]
if ${MyAbilitiesIterator:First(exists)}
    {
	do
		{
		; Waiting for Vall to Guild Hall to be ready to cast
		wait 10
		}
		while !${MyAbilitiesIterator.Value.IsReady}
	}
IRC !c ${sWhoIRC} -CastAbility IGW:${Me} "Call to Guild Hall"
Wait 80
do
	{
	wait 10
	}
	while !${Me.InGameWorld}

;Reload Bot to remove settings

IRC ${Me} Completed Solo Script

}
function main()
{

variable string sWhoIRC="Bossman"
variable string sWho=${Me.Name}

variable index:ability MyAbilities
variable iterator MyAbilitiesIterator


; Move to Guild Strategist	
IRC !c ${sWhoIRC} -DoNotMove
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${sWho} Nav Strategist1 -ntr
Wait 20
do
	{
	wait 10
	}
	while ${Me.IsMoving}

; Use Guild Flag
IRC !c ${sWhoIRC} -UseFlag
Wait 100
;
; Look for popup to select zone
;
do
	{
	wait 10
	}
	while !${Me.InGameWorld}

	
	
; Run Ogre RPC
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${sWho} RPC
Wait 200
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${sWho} end RPC



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
IRC !c ${sWhoIRC} -CastAbility ${sWho} "Call to Guild Hall"
Wait 80
do
	{
	wait 10
	}
	while !${Me.InGameWorld}


	
; Move to staging area
IRC !c ${sWhoIRC} -OgreCommandOB_AP ${sWho} Nav Stage1 -ntr

}
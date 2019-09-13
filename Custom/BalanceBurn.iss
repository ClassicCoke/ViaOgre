function main(int iBal)
{

variable index:actor Actors
variable iterator ActorIterator

variable int iVar
variable bool bComplete

IRC ${Me} is Running BalanceBurn ${iBal}

While !${bComplete} || ${Me.InCombat}
	{
	If ${Me.InCombat}
		{
		EQ2:QueryActors[Actors, ThreatToMe > 0 && Distance <= 30 && !IsDead ]
		Actors:GetIterator[ActorIterator]
		if ${ActorIterator:First(exists)}
			{
			;iVar:Set[${Math.Calc[${Me.Target.Health}+${iBal}]}]
			Do 
				{
				; Loop through all actors that hate me
				If  ${Math.Calc[${Me.Target.Health}+${iBal}]} < ${ActorIterator.Value.Health}
					{
					Actor[ID,${ActorIterator.Value.ID}]:DoTarget
					IRC ${Me} is switching targets to ${ActorIterator.Value.Name}
					; We are in combat and switched a target, set to true so we can end script at end of fight.
					bComplete:Set["TRUE"]
					}
				}
				While ${ActorIterator:Next(exists)}
			}
		}
	Wait 10
	}
IRC ${Me} has stopped BalanceBurn
}



function main(int minThreat=50)
{
	
	if ${Me.Target(exists)}
	{		
	
		/*
		;;echo Target: ${Me.Target.Name}
		variable int myThreat=${Me.GetGameData["Target.Threat"].Label}
		variable int myThreat2=${Me.GetGameData["Target.SecondaryThreat"].Label}
		
		echo ${Me.Name} ${Me.Target.Name} -> ${myThreat} ${Me.Target.Target.Name} -> ${Me.Target.Target.ThreatToMe}
		echo ${Me.Target.Target.ThreatToMe}
		echo ${Me.Target.Target.ThreatToNext}
		echo ${Me.Name} ${myThreat} ${myThreat2}
		*/
				
		variable string message="${Me.Name.Left[5]}"
		switch ${Me.Archetype}
		{
			case fighter
				minThreat:Set[-1]
				;;message:Set["** ${Me.Name}"]
				break
			default
				;;message:Set["${Me.Name}"]
				break
		}
		
		;; directly targeting
		if ${Me.Target.ThreatToMe} > ${minThreat}
		{		
			message:Set["${message} ${Me.Target.Name} -> ${Me.Target.ThreatToMe}"]
			

			
			variable int threatToPet=${Me.Target.ThreatToPet}
			if ${threatToPet} > 0
			{
				message:Set["${message}(${threatToPet})"]
			}
			
			if ${Me.Target.ThreatToMe} >= 100
			{
				message:Set["** ${message} **"]
			}
			else
			{
				message:Set["   ${message}"]
			}
			
			variable int sThreat=${Me.GetGameData["Target.SecondaryThreat"].Label}
			if ${sThreat} > 0
			{
				message:Set["${message} ${sThreat}"]
			}			
			
			irc "${message}"
		}		
		else
		{
			;;  implied target
			if ${Me.Target.Target(exists)}
			{
				if ${Me.Target.Target.ThreatToMe} > ${minThreat}
				{ 
					message:Set["${message} ${Me.Target.Target.Name} -> ${Me.Target.Target.ThreatToMe}"]
										
					variable int threatToPet2=${Me.Target.Target.ThreatToPet}
					if ${threatToPet2} > 0
					{
						message:Set["${message}(${threatToPet2})"]
					}
					
					if ${Me.Target.Target.ThreatToMe} >= 100
					{
						message:Set["** ${message} **"]
					}			
					else
					{
						message:Set["   ${message}"]
					}					
					
					variable int sThreat2=${Me.GetGameData["Target.Target.SecondaryThreat"].Label}
					if ${sThreat2} > 0
					{
						message:Set["${message} ${sThreat2}"]
					}
					
					irc "${message}"
				}
			}				
		}
		
		
	}
	else
	{
		irc "${Me.Name.Left[5]} --NO TARGET--"
	}	
}



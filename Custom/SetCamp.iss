function main(int iMages, int iHealers, int iScouts, int iFighters, bool bJoust)
{
	variable int	iXCord
	variable int	iYCord
	variable int	iZCord
	variable string sWho

	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWho:Set["Me"]
		}
		else
		{
		sWho:Set["All"]
		}
	
    IRC Run script:SetCamp M=${iMages} H=${iHealers} S=${iScouts} F=${iFighters} JI=${bJoust} Who=${sWho}
;;	iXCord:Set[${Me.X}]
;;	iYCord:Set[${Me.Y}]
;;	iZCord:Set[${Me.Z}]
;;	IRC "Me=${Me.Name} x:${iXCord} y:${iYCord} z:${iZCord}"
;;	If ${Me.Target(exists)}
;;		{
;;		IRC "My Target=${Me.Target.Name}"
;;		}
;;		else
;;		{
;;		IRC "${Me.Name} has no Target"
;;		}
;;
	IRC !c ${sWho} -CampSpot All+-${Me.Name} 1 125
;; Set Fighters
	iXCord:Set[${Math.Calc[${Me.X}-(${iFighters}*${Math.Sin[${Me.Heading}]})]}]
	iYCord:Set[${Me.Y}]
	iZCord:Set[${Math.Calc[${Me.Z}-(${iFighters}*${Math.Cos[${Me.Heading}]})]}]
	IRC !c ${sWho} -CS_Set_ChangeCampSpot Fighters+-${Me.Name} ${iXCord} ${iYCord} ${iZCord}
	
;; Set Healers
	iXCord:Set[${Math.Calc[${Me.X}-(${iHealers}*${Math.Sin[${Me.Heading}]})]}]
	iYCord:Set[${Me.Y}]
	iZCord:Set[${Math.Calc[${Me.Z}-(${iHealers}*${Math.Cos[${Me.Heading}]})]}]
	IRC !c ${sWho} -CS_Set_ChangeCampSpot Healers ${iXCord} ${iYCord} ${iZCord}

;; Set Scouts
	If ${Me.Target(exists)}
		{
;;		IRC My Target=${Me.Target.Name}
		iXCord:Set[${Math.Calc[${Me.Target.X}-(${iScouts}*${Math.Sin[${Me.Heading}]})]}]
		iYCord:Set[${Me.Target.Y}]
		iZCord:Set[${Math.Calc[${Me.Target.Z}-(${iScouts}*${Math.Cos[${Me.Heading}]})]}]
		}
		else
		{
;;		IRC ${Me.Name} has no Target
		iXCord:Set[${Math.Calc[${Me.X}-(${iScouts}*${Math.Sin[${Me.Heading}]})]}]
		iYCord:Set[${Me.Y}]
		iZCord:Set[${Math.Calc[${Me.Z}-(${iScouts}*${Math.Cos[${Me.Heading}]})]}]
		}
	IRC !c ${sWho} -CS_Set_ChangeCampSpot Scouts ${iXCord} ${iYCord} ${iZCord}

;; Set Mages
	If ${Me.Target(exists)}
		{
;;		IRC My Target=${Me.Target.Name}
		iXCord:Set[${Math.Calc[${Me.Target.X}-(${iMages}*${Math.Sin[${Me.Heading}]})]}]
		iYCord:Set[${Me.Target.Y}]
		iZCord:Set[${Math.Calc[${Me.Target.Z}-(${iMages}*${Math.Cos[${Me.Heading}]})]}]
		}
		else
		{
;;		IRC ${Me.Name} has no Target
		iXCord:Set[${Math.Calc[${Me.X}-(${iMages}*${Math.Sin[${Me.Heading}]})]}]
		iYCord:Set[${Me.Y}]
		iZCord:Set[${Math.Calc[${Me.Z}-(${iMages}*${Math.Cos[${Me.Heading}]})]}]
		}
	IRC !c ${sWho} -CS_Set_ChangeCampSpot Mages ${iXCord} ${iYCord} ${iZCord}
	If ${bJoust}
		{
		IRC !c ${sWho} -JoustIn Scout|Inquisitor|Warden
		}
}

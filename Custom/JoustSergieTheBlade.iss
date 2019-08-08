function main()
{

	variable string sWho="All"

	variable int	iXCord1=155
	variable int	iYCord1=159
	variable int	iZCord1=-50
	variable int	iZCordTank1=-40

	variable int	iXCord2=155
	variable int	iYCord2=159
	variable int	iZCord2=-140
	variable int	iZCordTank2=-150

	variable int	iMyZCord=${Me.Z}
	variable int	iMyZCordCheck=0
	


	IRC Jousting Sergie The Blade
	IRC !c ${sWho} -CampSpot All 3 150
	IRC !c ${sWho} -joustout
	iMyZCordCheck:Set[${Math.Calc[${iMyZCord}+100]}]
	If ${iMyZCordCheck} < 0
		{
		;; Joust to Camp Spot 1
		Wait 5
		IRC !c ${sWho} -CS_Set_ChangeCampSpot all+-fighter ${iXCord1} ${iYCord1} ${iZCord1}
		IRC !c ${sWho} -CS_Set_ChangeCampSpot fighter ${iXCord1} ${iYCord1} ${iZCordTank1}
		Wait 5
		}
		else
		{
		;; Joust to Camp Spot 2
		IRC !c ${sWho} -CS_Set_ChangeCampSpot all+-fighter ${iXCord2} ${iYCord2} ${iZCord2}
		IRC !c ${sWho} -CS_Set_ChangeCampSpot fighter ${iXCord2} ${iYCord2} ${iZCordTank2}
		Wait 5
		}
	wait 200
	IRC !c ${sWho} -joustin scout
	
}

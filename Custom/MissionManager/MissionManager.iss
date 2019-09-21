function main()
{

	variable bool bMission=${UIElement[MissionManager].FindChild[cbHerioc].Checked}
	variable bool bDailyDbl=${UIElement[MissionManager].FindChild[cbDaily].Checked}
	variable bool bWeekly=${UIElement[MissionManager].FindChild[cbWeekly].Checked}
	variable bool bRaid=${UIElement[MissionManager].FindChild[cbRaid].Checked}

    IRC !c Bossman -rsob ${Me} Custom/DeleteMissions ${bMission} ${bDailyDbl} ${bWeekly} ${bRaid}
}
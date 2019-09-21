function main( bool bMission, bool bDailyDbl, bool bWeekly, bool bRaid )
{

	variable index:quest Quests
	variable iterator AQ
    variable int NumQuests
    variable int Counter = 0
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Active Quests
    NumQuests:Set[${QuestJournalWindow.NumActiveQuests}]
    
    if (${NumQuests} < 1)
    {
        echo "No active quests found."
        return
    }
        
    QuestJournalWindow:GetActiveQuests[Quests]
    Quests:GetIterator[AQ]
    if ${AQ:First(exists)}
		{
        do
			{
            ;echo "-----"
            ;echo "-- ${AQ.Value.Name}"
            ;echo "-- ID: ${AQ.Value.ID}"
            ;echo "-- Level: ${AQ.Value.Level}"
            ;echo "-- Category: ${AQ.Value.Category}"
            ;echo "-- Current Zone: ${AQ.Value.CurrentZone}"
			If ${bMission} && ${AQ.Value.Category.Find["Mission"]} && !${AQ.Value.Category.Find["Weekly"]} && ${AQ.Value.Name.Find["Study of"]}
				{
				; It is a normal mission
				Counter:Inc
				OgreBotAPI:DeleteQuest["IRW:${Me}","${AQ.Value.Name}"]
				Wait 30
				}
			If ${bDailyDbl} && ${AQ.Value.Category.Find["Mission"]} && !${AQ.Value.Category.Find["Weekly"]} && ${AQ.Value.Name.Find["Elements of"]}
				{
				; It is a Daily Double
				Counter:Inc
				OgreBotAPI:DeleteQuest["IRW:${Me}","${AQ.Value.Name}"]
				Wait 30
				}
			If ${bWeekly} && ${AQ.Value.Category.Find["Mission"]} && ${AQ.Value.Category.Find["Weekly"]} && !${AQ.Value.Name.Find["Raid I"]}
				{
				; It is a Weekly Mission
				Counter:Inc
				OgreBotAPI:DeleteQuest["IRW:${Me}","${AQ.Value.Name}"]
				Wait 30
				}
			If ${bRaid} && ${AQ.Value.Category.Find["Mission"]} && ${AQ.Value.Category.Find["Weekly"]} && ${AQ.Value.Name.Find["Raid I"]}
				{
				; It is a Raid Mission
				Counter:Inc
				OgreBotAPI:DeleteQuest["IRW:${Me}","${AQ.Value.Name}"]
				Wait 30
				}
			}
			while ${AQ:Next(exists)}
		}
	IRC ${Me} Quests Deleted: ${Counter}
}
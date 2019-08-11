function main()
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
			If (${AQ.Value.Category.Find["Mission"]} && (!${AQ.Value.Category.Find["Weekly"]} || ${AQ.Value.Name.Find["Raid I"]}))
				{
				Counter:Inc
				OgreBotAPI:DeleteQuest["${Me}","${AQ.Value.Name}"]
				Wait 30
				}
			}
			while ${AQ:Next(exists)}
		}
	IRC ${Me} Quests Deleted: ${Counter}
}
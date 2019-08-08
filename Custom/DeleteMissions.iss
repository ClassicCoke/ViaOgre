function main()
{

	variable index:quest Quests
	variable iterator AQ
    variable int NumQuests
    variable int Counter = 1
    
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
            If ${AQ.Value.Category.Find["Mission"]} && !${AQ.Value.Category.Find["Weekly"]}
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
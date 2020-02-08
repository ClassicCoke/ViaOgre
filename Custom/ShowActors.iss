function main()
{

    variable index:actor Actors
    variable iterator ActorIterator

    Echo ========================================================================================
    Echo ${Time} Scanning Actors 
	EQ2:QueryActors[Actors, Distance <= 100 && !InMyGroup]
	;EQ2:QueryActors[Actors, Distance <= 100]
	Actors:GetIterator[ActorIterator]
	if ${ActorIterator:First(exists)}
	{
        do
        {
            Echo Actor:${ActorIterator.Value.Name} (${ActorIterator.Value.Distance.Deci})
            Echo ...Type:${ActorIterator.Value.Type} 
            Echo ....Loc:${ActorIterator.Value.Loc}
        }
        While ${ActorIterator:Next(exists)}
	}
}
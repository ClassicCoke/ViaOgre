



variable(script) int delay=3

function main()
{
  echo [${Time}] OnZoning...${Zone.Name}
  call setup
  switch ${Session}
  {
    case is1
	call setupMain
	break
	
	default
	call setupOthers
	break
  }
  
	variable string zoneType
	call checkZone	
	zoneType:Set[${Return}]
  
	echo [${Time}] Zone: ${zoneType}
  
	switch ${zoneType}
	{
	   case Guildhall
	   case Raid
	   case ExpertRaid
	   case MythicRaid
	   case Heroic
	   case ExpertHeroic
	   case ExpertEvent
	   case EventHeroic
	   case Solo
	   case AdvancedSolo	   
	   case Duo
		 call privateZone
		 break
	
	  default
		call publicZone
		break
	}
  
	echo [${Time}] OnZoning...${Zone.Name}...Done
}


function publicZone() 
{
	echo You are in an public zone!
	OgreBotAPI:Pause["${Me}"]		
}

function privateZone()
{
	echo You are in a private zone!
	OgreBotAPI:Resume["${Me}"]
}

function setup()
{
}


function setupOthers()
{
	radar off
	OgreBotAPI:CancelMaintained["Summon Artisan's Gathering Goblin"]
	OgreBotAPI:CancelMaintained["Summon Artisan's Pack Pony"]
}

function setupMain()
{
	radar on
	OgreBotAPI:CancelMaintained["Summon Artisan's Gathering Goblin"]
	OgreBotAPI:CancelMaintained["Summon Artisan's Pack Pony"]
	
	
}


function checkZone()
{		
	variable(local) string guildhall="${Me.Guild}'s Guild Hall"
	
	if ${Zone.Name.Equal[${guildhall}]}
	{
		return "Guildhall"
	}
	
	if ${Zone.Name.Find["[Solo]"]} != NULL
	{
		return "Solo"
	}	
	if ${Zone.Name.Find["[Advanced Solo]"]} != NULL
	{
		return "AdvancedSolo"
	}	
	if ${Zone.Name.Find["[Duo]"]} != NULL
	{
		return "Duo"
	}
	
	
	if ${Zone.Name.Find["[Heroic]"]} != NULL
	{
		return "Heroic"
	}
	if ${Zone.Name.Find["[Expert]"]}
	{
		return "ExpertHeroic"
	}
	if ${Zone.Name.Find["[Expert Event]"]}
	{
		return "ExpertEvent"
	}
	if ${Zone.Name.Find["[Event Heroic]"]}
	{
		return "EventHeroic"
	}
	
	
	if ${Zone.Name.Find["[Public]"]}
	{
		return "PublicQuest"
	}
	if ${Zone.Name.Find["[Public Quest]"]}
	{
		return "PublicQuest"
	}
	
	
	if ${Zone.Name.Find["[Raid]"]}
	{
		return "Raid"
	}
	if ${Zone.Name.Find["[Expert-Raid]"]}
	{
		return "ExpertRaid"
	}
	if ${Zone.Name.Find["[Mythic Raid]"]}
	{
		return "MythicRaid"
	}
		
	return ${Zone.Name}
}

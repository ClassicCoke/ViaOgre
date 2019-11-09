

variable int realDelay=0

function main(int delay, string buff)
{
	echo Canceling ${buff} in ${delay}s
	realDelay:Set[${delay}*10]
	timedcommand ${delay} OgreBotAPI:CancelMaintained["${buff}"]
}



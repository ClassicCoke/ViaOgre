function main( bool bJoustIn=FALSE, int iDelay=0)
{

IRC !c -JoustOut
If bJoustIn
	{
	wait iDelay
	IRC !c -JoustIn
	}
}


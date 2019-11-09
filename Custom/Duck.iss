




function main(int delay=70, string forWho)
{
    oc !c -Crouch ${forWho}
	timedcommand ${delay} oc !c -Jump ${forWho}
}



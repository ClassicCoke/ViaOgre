function main()
{

If ${Me.Raid}
	{
	IRC !c All -OgreFollow IRW:${Me} ${Me} 3 200 FALSE
	Wait 5
;--------------------------------------------------------------------------------
	;IRC !c All -OgreFollow IGW:Sayra Sayra 2 200 FALSE
	;IRC !c All -OgreFollow IGW:Jenmanii Beardicus 2 200 FALSE
	;IRC !c All -OgreFollow IGW:Jenmanii Rosewind 2 200 FALSE
	;Wait 5
;--------------------------------------------------------------------------------
	;IRC !c All -OgreFollow IGW:Bandar Ghrack 2 200 FALSE
	;IRC !c All -OgreFollow IGW:Bandar Islind 2 200 FALSE
	;IRC !c All -OgreFollow IGWBN:Jacobie Jacobie 2 200 FALSE
	;Wait 5
;--------------------------------------------------------------------------------
	;IRC !c All -OgreFollow IGW:Esteii Thanelo 2 200 FALSE
	;IRC !c All -OgreFollow IGW:Esteii Beardicus 2 200 FALSE
	;IRC !c All -OgreFollow IGW:Fagann Fagann 2 200 FALSE
	}
	else
	{
	IRC !c All -OgreFollow IGW:${Me} ${Me} 3 200 FALSE
	}
}

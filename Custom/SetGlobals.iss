variable(globalkeep)	string	gsCFW
variable(globalkeep)	string	gsMT
variable(globalkeep)	string	gsOT
variable(globalkeep)	string	gsMA
variable(globalkeep)	string	gsOFollow

variable(globalkeep)	string	gsMisc1
variable(globalkeep)	string	gsMisc2
variable(globalkeep)	string	gsMisc3
variable(globalkeep)	string	gsMisc4
variable(globalkeep)	string	gsMisc5
variable(globalkeep)	string	gsMisc6


function main(string sAction, string s1, string s2, string s3, string s4, string s5, string s6, string s7, string s8, string s9, string s10, string s11)
{
	IRC Run script:SetCustomGlobals
	If ${sAction.Find["Delete"]}
		{
		deletevariable gsCFW
		IRC Ghrack removed CustomGlobals
		}
		else
		{
		gsCFW:Set[${s1}]
		gsMT:Set[${s2}]
		gsOT:Set[${s3}]
		gsMA:Set[${s4}]
		gsOFollow:Set[${s5}]
		gsMisc1:Set[${s6}]
		gsMisc2:Set[${s7}]
		gsMisc3:Set[${s8}]
		gsMisc4:Set[${s9}]
		gsMisc5:Set[${s10}]
		gsMisc6:Set[${s11}]
		IRC ..${Me} - gsCFW:${gsCFW1}
		IRC ..${Me} - gsMT:${gsMT}
		IRC ..${Me} - gsOT:${gsOT}
		IRC ..${Me} - gsMA:${gsMA}
		IRC ..${Me} - gsOFollow:${gsOFollow}
		IRC ..${Me} - gsMisc1:${gsMisc1}
		IRC ..${Me} - gsMisc2:${gsMisc2}
		IRC ..${Me} - gsMisc3:${gsMisc3}
		IRC ..${Me} - gsMisc4:${gsMisc4}
		IRC ..${Me} - gsMisc5:${gsMisc5}
		IRC ..${Me} - gsMisc6:${gsMisc6}
		IRC Ghrack setup CustomGlobals
		}
}
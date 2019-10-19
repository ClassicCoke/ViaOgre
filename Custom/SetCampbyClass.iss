function main(bool bFront, bool bJoust, string sWho1, int iWho1, bool bTank1, string sWho2, int iWho2, bool bTank2, string sWho3, int iWho3, bool bTank3, string sWho4, int iWho4, bool bTank4, string sWho5, int iWho5, bool bTank5, string sWho6, int iWho6, bool bTank6 )
{
	variable float	fHeading
	variable string sWhoIRC
	variable string sCSWho

	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWhoIRC:Set["Me"]
		}
		else
		{
		sWhoIRC:Set["All"]
		}

	sCSWho:Set["${sWho1}"]
	If ${sWho2.Length} > 1
		sCSWho:Concat["|${sWho2}"]
	If ${sWho3.Length} > 1
		sCSWho:Concat["|${sWho3}"]
	If ${sWho4.Length} > 1
		sCSWho:Concat["|${sWho4}"]
	If ${sWho5.Length} > 1
		sCSWho:Concat["|${sWho5}"]
	If ${sWho6.Length} > 1
		sCSWho:Concat["|${sWho6}"]

    IRC Run script:SetCampByClass MyFront=${bFront} JI=${bJoust} 1=${sWho1}(${iWho1}) 2=${sWho2}(${iWho2}) 3=${sWho3}(${iWho3}) 4=${sWho4}(${iWho4}) 5=${sWho5}(${iWho5}) 6=${sWho6}(${iWho6}) 
	IRC !c ${sWhoIRC} -CS_ClearRelative
	IRC !c ${sWhoIRC} -CampSpot ${sCSWho} 1 125

	;; Establish Heading
	fHeading:Set[${Me.Heading}]
	If !${bFront}
	{
		fHeading:Set[${Math.Calc[${fHeading}-180]}]
		If ${fHeading} < 0
		{
			fHeading:Set[${Math.Calc[${fHeading}+360]}]
		}
	}

	;; Set Campspots
	call SetCamp ${sWhoIRC} ${bTank1} ${sWho1} ${iWho1} ${fHeading}
	call SetCamp ${sWhoIRC} ${bTank2} ${sWho2} ${iWho2} ${fHeading}
	call SetCamp ${sWhoIRC} ${bTank3} ${sWho3} ${iWho3} ${fHeading}
	call SetCamp ${sWhoIRC} ${bTank4} ${sWho4} ${iWho4} ${fHeading}
	call SetCamp ${sWhoIRC} ${bTank5} ${sWho5} ${iWho5} ${fHeading}
	call SetCamp ${sWhoIRC} ${bTank6} ${sWho6} ${iWho6} ${fHeading}

	;; Check if want to Joust in 	
	If ${bJoust}
	{
		wait 15
		IRC !c ${sWho} -JoustIn scout
	}
}

function:bool SetCamp(string _sWhoIRC, bool _bTank, string _sWho, int _iWho, float _fHeading)
{	
	variable float	fXCord
	variable float	fYCord
	variable float	fZCord

	;;IRC SetCamp ${_sWho}(${_iWho})
	If ${_bTank}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${_iWho}*${Math.Sin[${_fHeading}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${_iWho}*${Math.Cos[${_fHeading}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${_iWho}*${Math.Sin[${_fHeading}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${_iWho}*${Math.Cos[${_fHeading}]})]}]
		}
	If ${_sWho.Length}>1
	{
		;Echo ${Time}: ${_sWho}(${_sWho.Length})
		IRC !c ${_sWhoIRC} -CS_Set_ChangeCampSpot ${_sWho} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
	}
}
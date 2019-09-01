function main(  bool bFront, bool bJoust, string sWho1, int iWho1, bool bTank1, string sWho2, int iWho2, bool bTank2, string sWho3, int iWho3, bool bTank3, string sWho4, int iWho4, bool bTank4, string sWho5, int iWho5, bool bTank5, string sWho6, int iWho6, bool bTank6 )
{
	variable float	fXCord
	variable float	fYCord
	variable float	fZCord
	variable float	fFace
	variable string sWho

	if ${UIElement[${MCPUIIRCMeOnlyID}].Checked}
		{
		sWho:Set["Me"]
		}
		else
		{
		sWho:Set["All"]
		}
    IRC Run script:SetCampByClass MyFront=${bFront} JI=${bJoust} 1=${sWho1}(${iWho1}) 2=${sWho2}(${iWho2}) 3=${sWho3}(${iWho3}) 4=${sWho4}(${iWho4}) 5=${sWho5}(${iWho5}) 6=${sWho6}(${iWho6}) 
	IRC !c ${sWho} -CS_ClearRelative
	IRC !c ${sWho} -CampSpot All+-${Me.Name} 1 125



	fFace:Set[${Me.Heading}]
	If !${bFront}
		{
		fFace:Set[${Math.Calc[${fFace}-180]}]
		If ${fFace} < 0
			{
			fFace:Set[${Math.Calc[${fFace}+360]}]
			}
		}


;; Set 1
	If ${bTank1}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${iWho1}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${iWho1}*${Math.Cos[${fFace}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${iWho1}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${iWho1}*${Math.Cos[${fFace}]})]}]
		}
	IRC !c ${sWho} -CS_Set_ChangeCampSpot ${sWho1} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}


;; Set 2
	If ${bTank2}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${iWho2}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${iWho2}*${Math.Cos[${fFace}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${iWho2}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${iWho2}*${Math.Cos[${fFace}]})]}]
		}
	If ${sWho2.Length} > 0
		{
		IRC !c ${sWho} -CS_Set_ChangeCampSpot ${sWho2} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
		}


;; Set 3
	If ${bTank3}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${iWho3}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${iWho3}*${Math.Cos[${fFace}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${iWho3}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${iWho3}*${Math.Cos[${fFace}]})]}]
		}
	If ${sWho3.Length} > 0
		{
		IRC !c ${sWho} -CS_Set_ChangeCampSpot ${sWho3} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
		}


;; Set 4
	If ${bTank4}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${iWho4}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${iWho4}*${Math.Cos[${fFace}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${iWho4}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${iWho4}*${Math.Cos[${fFace}]})]}]
		}
	If ${sWho4.Length} > 0
		{
		IRC !c ${sWho} -CS_Set_ChangeCampSpot ${sWho4} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
		}


;; Set 5
	If ${bTank5}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${iWho5}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${iWho5}*${Math.Cos[${fFace}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${iWho5}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${iWho5}*${Math.Cos[${fFace}]})]}]
		}
	If ${sWho5.Length} > 0
		{
		IRC !c ${sWho} -CS_Set_ChangeCampSpot ${sWho5} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
		}


;; Set 6
	If ${bTank6}
		{
		;; Set coords based on tanks location
		fXCord:Set[${Math.Calc[${Me.X}-(${iWho6}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Y}]
		fZCord:Set[${Math.Calc[${Me.Z}-(${iWho6}*${Math.Cos[${fFace}]})]}]
		}
		else
		{
		;; Set coords based on the tanks targeted location
		fXCord:Set[${Math.Calc[${Me.Target.X}-(${iWho6}*${Math.Sin[${fFace}]})]}]
		fYCord:Set[${Me.Target.Y}]
		fZCord:Set[${Math.Calc[${Me.Target.Z}-(${iWho6}*${Math.Cos[${fFace}]})]}]
		}
	If ${sWho6.Length} > 0
		{
		IRC !c ${sWho} -CS_Set_ChangeCampSpot ${sWho6} ${fXCord.Centi} ${fYCord.Centi} ${fZCord.Centi}
		}



;; Check if want to Joust in 	
	If ${bJoust}
		{
		IRC !c ${sWho} -JoustIn Scout|Inquisitor|Warden
		}
}

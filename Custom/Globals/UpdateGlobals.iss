function main()
{

variable	string	sCFW=${UIElement[SetGlobals].FindChild[Globals].FindChild[CFW].Text.Escape}
variable	string	sMT=${UIElement[SetGlobals].FindChild[Globals].FindChild[MainTank].Text.Escape}
variable	string	sOT=${UIElement[SetGlobals].FindChild[Globals].FindChild[OffTank].Text.Escape}
variable	string	sMA=${UIElement[SetGlobals].FindChild[Globals].FindChild[MainAssist].Text.Escape}
variable	string	sOFollow=${UIElement[SetGlobals].FindChild[Globals].FindChild[OgreFollow].Text.Escape}
variable	string	sMisc1=${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc1].Text.Escape}
variable	string	sMisc2=${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc2].Text.Escape}
variable	string	sMisc3=${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc3].Text.Escape}
variable	string	sMisc4=${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc4].Text.Escape}
variable	string	sMisc5=${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc5].Text.Escape}
variable	string	sMisc6=${UIElement[SetGlobals].FindChild[Globals].FindChild[Misc6].Text.Escape}


gsCFW:Set[${sCFW.Escape}]
gsMT:Set[${sMT.Escape}]
gsOT:Set[${sOT.Escape}]
gsMA:Set[${sMA.Escape}]
gsOFollow:Set[${sOFollow.Escape}]
gsMisc1:Set[${sMisc1.Escape}]
gsMisc2:Set[${sMisc2.Escape}]
gsMisc3:Set[${sMisc3.Escape}]
gsMisc4:Set[${sMisc4.Escape}]
gsMisc5:Set[${sMisc5.Escape}]
gsMisc6:Set[${sMisc6.Escape}]

IRC ${Me} has updated Globals
}
/*
	OgreFillQuiver V 1.05
		- Fills your ammo container with the correct ammo

	v 1.05
		- Increased delays slightly to avoid getting an extra stack, and some how having the window open up after you close it.
	v 1.04
		- Fills from your inventory, then from an ammo depot (if available)
	v 1.03
		- minor fixes
	v 1.02
		- Added a check/delay that should make it more reliable when running the first time.
		- Removed bag toggle, as that seemed to have no effect.
	v 1.01
		- Added check for sacks in addition to pouches

*/
#include "${LavishScript.HomeDirectory}/Scripts/eq2ogrecommon/EQ2OgreBagManager.inc"

function main(int _FromBag, int _ToBag)
{
	variable bool bArrows=FALSE
	variable bool bShurikens=FALSE
  variable string sShurikenName="Cadmium shuriken"
  variable string sArrowName="Entwood Flight Crossbow Bolt"
  variable string sAmmoToUse
	variable int VarCopy
	variable int ContainerCounter=0
	variable int x=0
	variable int _ToBagID
	variable int _BagID
	variable int _FromSlot
	variable int _ToSlot
	/*
	EQ2Execute togglebags
	wait 10
	EQ2Execute togglebags
	OgreBagInfoOb:UpdateInfo
	*/
	_ToBagID:Set[${OgreBagInfoOb.BagInformation[7,2]}]
	_BagID:Set[${OgreBagInfoOb.BagInformation[7,1]}]

	;// echo ${Me.Inventory[id,${OgreBagInfoOb.BagInformation[7,2]}].Name} ** ${OgreBagInfoOb.BagInformation[7,2]} * ${OgreBagInfoOb.BagInformation[7,3]}
	;// echo ${Me.Inventory[id,${OgreBagInfoOb.BagInformation[1,2]}].Name} ** ${OgreBagInfoOb.BagInformation[1,2]} * ${OgreBagInfoOb.BagInformation[1,3]}
	if ${Me.Inventory[id,${OgreBagInfoOb.BagInformation[7,2]}].Name.Find[quiver](exists)}
  {
		bArrows:Set[TRUE]
    sAmmoToUse:Set["${sArrowName}"]
  }
	elseif ${Me.Inventory[id,${OgreBagInfoOb.BagInformation[7,2]}].Name.Find[pouch](exists)} || ${Me.Inventory[id,${OgreBagInfoOb.BagInformation[7,2]}].Name.Find[sack](exists)}
  {
		bShurikens:Set[TRUE]
    sAmmoToUse:Set["${sShurikenName}"]
  }
	else
	{
		echo Unable to determine if you use Arrows or Shurikens.
		return
	}
	if ${Me.Inventory[ID,${_ToBagID}].EmptySlots} == 0
		wait 10
    ;// echo if ${Me.Inventory[ID,${_ToBagID}].EmptySlots} == 0
	_ToSlot:Set[${Me.Inventory[ID,${_ToBagID}].NextSlotOpen}]
    ;// Check inventory first
	while ${ContainerCounter:Inc}<=6
	{
		x:Set[0]
		;// echo while ${x}<=${OgreBagInfoOb.BagSize[${ContainerCounter}]} && ${Me.Inventory[ID,${_ToBagID}].EmptySlots} > 0 
		if ${OgreBagInfoOb.BagSize[${ContainerCounter}]} <= 0 || ${String[${Me.Inventory[ID,${_ToBagID}].EmptySlots}].Equal[NULL]}
			wait 10
		;// echo while ${x}<=${OgreBagInfoOb.BagSize[${ContainerCounter}]} && ${Me.Inventory[ID,${_ToBagID}].EmptySlots} > 0 
		while ${x:Inc}<=${OgreBagInfoOb.BagSize[${ContainerCounter}]} && ${Me.Inventory[ID,${_ToBagID}].EmptySlots} > 0 
		{
			
			VarCopy:Set[${OgreBagInfoOb.BagContents[${ContainerCounter},${x}]}]
			if ${Me.Inventory[id,${VarCopy}].Name.Equal[NULL]} || ${Me.Inventory[id,${VarCopy}].Name.Length} == 0
				wait 10
			
			if ${bArrows} && ${Me.Inventory[id,${VarCopy}].Name.Find[arrow](exists)} || ${bShurikens} && ${Me.Inventory[id,${VarCopy}].Name.Find[shuriken](exists)} 
			{
				Me.Inventory[id,${VarCopy}]:Move[${_ToSlot},${_BagID}]
				if ${Me.InCombat}
					wait 20
				else
					wait 10
				_ToSlot:Set[${Me.Inventory[ID,${_ToBagID}].NextSlotOpen}]
				
			}
		}
	}
  ;// Check if we're in a guild hall and use the depot if exists
  variable int iStackSize
  if ${Me.Inventory[ID,${_ToBagID}].EmptySlots} > 0 && ${Zone.ShortName.Find[guildhall](exists)}
  {
    if ${Actor[ammo depot](exists)}
    {
      if ${Actor[ammo depot].Distance} < 11.5
      {
        Actor[ammo depot]:DoubleClick
        wait 20 ${ContainerWindow(exists)}
        wait 5
        while ${Me.Inventory[ID,${_ToBagID}].EmptySlots} > 0 && ${ContainerWindow.Item[${sAmmoToUse}].Quantity} > 0
        {
          iStackSize:Set[${ContainerWindow.Item[${sAmmoToUse}].Quantity}]
          if ${iStackSize} > 200
              iStackSize:Set[200]
          ;// echo ${Time}: ContainerWindow:RemoveItem[${ContainerWindow.Item[${sAmmoToUse}].ID},${iStackSize}]
          ContainerWindow:RemoveItem[${ContainerWindow.Item[${sAmmoToUse}].ID},${iStackSize}]
          wait 10
          if ${Me.Inventory[ID,${_ToBagID}].EmptySlots}
          	noop
          wait 10
        }
				;// Close depot
				wait 40
				EQ2UIPage[Inventory,container].Child[button,Container.WindowFrame.Close]:LeftClick
      }
      else
      {
          echo ${Time}: Your depot is too far away ( ${Actor[ammo depot].Distance} ). It has to be less than 11.5 meters. Stop worrying about decorating your hall, and move it to the entry way.
      }
    } 
    else
    {
        echo ${Time}: No Ammo depot. Stop being difficult and get an ammo depot.
    }
  }
}

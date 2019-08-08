function main(int loops=10)
{
   variable int counter=0
   Actor[Barnaby]:DoTarget
   wait 5
   Actor[Barnaby]:DoubleClick
   wait 5
   while ${loops} >= ${counter:Inc}
   {
      Vendor.Item[minor lapis lazuli transmuter's stone]:Buy[1]
      wait 5
      ChoiceWindow:DoChoice1
	  wait 5
   }
}
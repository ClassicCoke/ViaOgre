function main()
{
eq2execute "/r <=== Ascensions Off"
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_autocomplete_ascensioncombos","FALSE","TRUE"]
OgreBotAPI:ChangeCastStackListBoxItemByTag["All","ASC","FALSE","FALSE","TRUE"]
}






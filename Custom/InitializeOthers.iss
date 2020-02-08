function main()
{

eq2execute "/r_performance 6"
eq2execute "cl_max_framerate 17"
eq2execute "cl_show_distance_meter true"
eq2execute "show_combatbubbles false"
eq2execute "combatbubble_show_third_party_damage false"
eq2execute "cl_logchat false"

OgreBotAPI:UplinkOptionChange["All","checkbox_load_radaron","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_load_radaroff","TRUE","TRUE"]
IRC !c Bossman -OgreCommandOB_AP ${Me} end OSA
wait 5
IRC !c Bossman -OgreCommandOB_AP ${Me} end MCP
}

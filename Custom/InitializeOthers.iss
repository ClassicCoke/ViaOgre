function main()
{

eq2execute "/r_performance 6"
eq2execute "cl_max_framerate 17"
OgreBotAPI:UplinkOptionChange["All","checkbox_load_radaron","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_load_radaroff","TRUE","TRUE"]
IRC !c Bossman -OgreCommandOB_AP ${Me} end OSA
wait 5
IRC !c Bossman -OgreCommandOB_AP ${Me} end MCP
}

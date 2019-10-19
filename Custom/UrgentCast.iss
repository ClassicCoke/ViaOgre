function main( string sWho, string sCast )
{
eq2execute /cancel_spellcast
Wait 2
OgreBotAPI:CastAbility[${sWho}, ${sCast}]
}
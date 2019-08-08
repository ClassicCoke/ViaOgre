function main( string sWho, string sCast )
{
;eq2execute /cancel_spellcast
OgreBotAPI:CastAbility[${sWho}, ${sCast}]
}
function main( string sMe )
{

;-------------------------------------------------------------------------------------------------------
; Settings Tab Column 1
;CastStack Stuff
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_buffs","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_cure","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_heal","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_powerheal","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_res","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_combat","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_ca","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_namedca","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_nonnamedca","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_debuff","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_nameddebuff","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablecaststack_items","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_forcenamedcatab","FALSE","TRUE"]
;    Healers Only
OgreBotAPI:UplinkOptionChange["Healers","checkbox_settings_cancelabilitiestogroupcure","TRUE","TRUE"]
;Simple Loot Options
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptloot","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_loot","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}|scout","checkbox_settings_loot","TRUE","TRUE"]


;-------------------------------------------------------------------------------------------------------
; Settings Tab Column 2

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_facenpc","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_settings_facenpc","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_rangedattack","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_meleeattack","TRUE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_movemelee","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["scouts|warden|inquisitor","checkbox_settings_movemelee","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_settings_movemelee","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_movebehind","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["scouts|warden|inquisitor","checkbox_settings_movebehind","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_settings_movebehind","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_moveinfront","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_turnoffattack","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_settings_turnoffattack","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_ignoremovetoattackhealthcheck","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["scout","checkbox_settings_ignoremovetoattackhealthcheck","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_ignoretargettoattackhealthcheck","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_encountersmartnukes","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_aesmartnukes","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_movetoarea","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_assist","TRUE","TRUE"]

;-------------------------------------------------------------------------------------------------------
; Settings Tab Column 3

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptres","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_autofollow","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enableannouncetab","TRUE","TRUE"]


OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enablealiases","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_autoattacktiming","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_waitforautoattack","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_handle_hq_earring","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_summon_familiar","TRUE","TRUE"]


;-------------------------------------------------------------------------------------------------------
; Settings Tab Column 4

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_raidoptions","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_raidoptionslimited","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_grindoptions","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptinvites","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptnochoicerewards","TRUE","TRUE"]

OgreBotAPI:UplinkOptionChange["All+-fighter","checkbox_settings_autotargetwhenhated","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["fighter|${sMe}","checkbox_settings_autotargetwhenhated","TRUE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_display_ethereal_mission_info","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_settings_display_ethereal_mission_info","TRUE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_autoshare_missions","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_autocomplete_ascensioncombos","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_ascension_embargo_and_combos","TRUE","TRUE"]

OgreBotAPI:UplinkOptionChange["priest","checkbox_settings_ascension_embargo_and_combos","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_show_surge_messages","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enable_abilityrotate","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disable_bulwark_of_order","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disable_bulwark_of_order_defensives","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enable_cd_t4_weapons","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_accept_zonein_confirmation","TRUE","TRUE"]

;-------------------------------------------------------------------------------------------------------
; Setup Tab

OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_percenttoattack",99,"FALSE"]
OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_moveintoattackrangehealthpercent",99,"FALSE"]
OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_petpercenttoattack",100,"FALSE"]

OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_powertousecas",2,"FALSE"]
OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_healthtousecas",2,"FALSE"]

OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_reswaittimer",2,"FALSE"]
OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_pbaetargets",3,"FALSE"]
OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_encountertargets",2,"FALSE"]

OgreBotAPI:ChangeOgreBotUIOption["All","textentry_setup_moveintomeleerangemaxdistance",200,"FALSE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_setup_broadcasttellstouplink","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["ALL","checkbox_setup_broadcastguildtouplink","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_setup_broadcastguildtouplink","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_setup_receivetellsfromuplink","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_setup_receivetellsfromuplink","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_setup_playsoundonreceivetellsfromuplink","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_setup_playsoundonreceivetellsfromuplink","TRUE","TRUE"]

;-------------------------------------------------------------------------------------------------------
; Settings 2 Tab

OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enable_chatevents","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enable_spawnevents","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enable_despawnevents","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_doho","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_crowdcontrol","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disableabilitycollisionchecks","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disablemercsupport","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptraidreadychecks","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_acceptdungeonfinderisready","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disable_precast","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disable_postcast","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_disableogrefly","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enablepvp","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_donotacceptquests","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_donotcheckresearchonload","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_donotcheckmounttrainingonload","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_skipcutscenes","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_cancelinvisaftercombat","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_noinviscasting","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enablepetsindropdowns","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_donotsendpettoattack","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_enablequestcompare","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_settings_castwhilemoving","FALSE","TRUE"]

;-------------------------------------------------------------------------------------------------------
; Loot Tab
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_ffaaccept","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_ffalooteverything","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lottoaccept","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lottodecline","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_nbgaccept","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_nbggreed","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_nbgdecline","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_enable","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_adepts","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_masters","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_ancients","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_illegiblescrolls","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_loottradables","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_looteverything","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_loot_lo_smartassign","FALSE","TRUE"]

OgreBotAPI:UplinkOptionChange["All","checkbox_loot_confirmnotrade","TRUE","TRUE"]


;-------------------------------------------------------------------------------------------------------
; Auto Target Tab
OgreBotAPI:UplinkOptionChange["All+-fighter","checkbox_autotarget_enabled","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["fighter","checkbox_autotarget_enabled","TRUE","TRUE"]

;-------------------------------------------------------------------------------------------------------
; On Load Tab

OgreBotAPI:UplinkOptionChange["All","checkbox_load_radaron","FALSE","TRUE"]
OgreBotAPI:UplinkOptionChange["All","checkbox_load_radaroff","TRUE","TRUE"]
OgreBotAPI:UplinkOptionChange["${sMe}","checkbox_load_radaron","TRUE","TRUE"]


;IRC ${Me} -- Initialize Ogre Settings Complete
}

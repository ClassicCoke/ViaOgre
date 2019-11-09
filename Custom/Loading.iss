



#include "CONSTS"
#include "Utilities"


function main()
{
	Log() Loading Start...
	Log() Session: ${Session}
	wait 60
	call setupUI
	call setupGraphics
	call setupLogging
	Log() Loading Done
}


function setupUI()
{
	;  UIElement -list
	UIElement[ogremcp]:SetFadeAlpha[0.45]
	UIElement[ogremcp]:SetAlpha[1]
	UIElement[ogremcp]:SetFadeDelay[2500]

	UIElement[eq2ogreosaxml]:SetFadeAlpha[0.25]
	UIElement[eq2ogreosaxml]:SetAlpha[1]
	UIElement[eq2ogreosaxml]:SetFadeDelay[2500]
	
	UIElement[ogreminiuixml]:SetFadeAlpha[0.25]
	UIElement[ogreminiuixml]:SetAlpha[1]
	UIElement[ogreminiuixml]:SetFadeDelay[2500]
}

function setupLogging()
{
	variable bool isMain
	call isMainSession
	isMain:Set[${Return}
	
	if ${isMain}
	{
		; eq2execute log on
	}
	else
	{
		; eq2execute log off
	}
}


function setupGraphics()
{
	variable bool isMain
	call isMainSession
	isMain:Set[${Return}]
	
	eq2execute cl_multicore 0
	eq2execute combatbubble_show_third_party_damage false
	eq2execute suspend_mount_mode 2
	
	if ${isMain}
	{
		eq2execute cl_max_framerate 60
		eq2execute combat_filter 0
	}
	else
	{
		eq2execute cl_max_framerate 30
		eq2execute r_performance 6
		eq2execute combat_filter 3
	}
}







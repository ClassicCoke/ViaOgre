

variable(script) int delay=3

function main()
{
  echo [${Time}] OnLoading...
  call setup
  switch ${Session}
  {
    case is1
	call setupMain
	break
	
	default
	call setupOthers
	break
  }
	echo [${Time}] OnLoading...Done
}


function setup()
{
	echo Setup
	UIElement[ogremcp]:SetFadeAlpha[0.45]
	UIElement[ogremcp]:SetAlpha[1]
	UIElement[ogremcp]:SetFadeDelay[2500]

	UIElement[eq2ogreosaxml]:SetFadeAlpha[0.25]
	UIElement[eq2ogreosaxml]:SetAlpha[1]
	UIElement[eq2ogreosaxml]:SetFadeDelay[2500]
	
	UIElement[ogreminiuixml]:SetFadeAlpha[0.25]
	UIElement[ogreminiuixml]:SetAlpha[1]
	UIElement[ogreminiuixml]:SetFadeDelay[2500]
	
	UIElement[ogreconsolexml]:SetFadeAlpha[0.5]
	UIElement[ogreconsolexml]:SetAlpha[1]
	UIElement[ogreconsolexml]:SetFadeDelay[2500]
	
	eq2execute cl_multicore 0
	wait ${delay}
	eq2execute combatbubble_show_third_party_damage false
	wait ${delay}
	eq2execute suspend_mount_mode 2
}


function setupMain()
{
	echo Main
	ogre irc uplink
	wait ${delay}
	eq2execute cl_max_framerate 60
	wait ${delay}
	eq2execute combat_filter 0
	wait ${delay}
	
	UIElement[radar window]:SetX[1800]
	UIElement[radar window]:SetY[215]
	wait ${delay}
	UIElement[ogremcp]:SetX[700]
	UIElement[ogremcp]:SetY[218]
	wait ${delay}
	UIElement[ogreminiuixml]:SetX[1028]
	UIElement[ogreminiuixml]:SetY[476]
	wait ${delay}
	UIElement[eq2ogreosaxml]:SetX[700]
	UIElement[eq2ogreosaxml]:SetY[476]
	wait ${delay}
	UIElement[ogreconsolexml]:SetX[550]
	UIElement[ogreconsolexml]:SetY[653]
	UIElement[ogreconsolexml]:SetWidth[1250]
	UIElement[ogreconsolexml]:SetHeight[245]
	wait ${delay}
	UIElement[uixml]:SetX[600]
	UIElement[uixml]:SetY[850]
}

function setupOthers()
{
	echo Others
	eq2execute cl_max_framerate 30
	wait ${delay}
	eq2execute r_performance 6
	wait 20
	eq2execute combat_filter 3
	
	wait ${delay}
	UIElement[ogreminiuixml]:SetX[1558]
	UIElement[ogreminiuixml]:SetY[70]
	wait ${delay}
	UIElement[uixml]:SetX[380]
	UIElement[uixml]:SetY[218]
}



///saves current config settings

ini_open("config.ini");

//NEW settings
//Part 2 Check
ini_write_real("Part2Check","Check",1);

//Sound
ini_write_real("Sound","Mute_music",global.muteMusic);
ini_write_real("Sound","Volume_level",global.volumeLevel);
ini_write_real("Sound","Sound_level",global.soundLevel);
ini_write_real("Sound","Music_level",global.musicLevel);

//Visual
ini_write_real("Visual","Fullscreen_mode",global.fullscreenMode);
ini_write_real("Visual","Smoothing_mode",global.smoothingMode);
ini_write_real("Visual","Vsync_mode",global.vsyncMode);
ini_write_real("Visual","windowScale",global.windowScale);
ini_write_real("Visual","lowFX",global.lowFX);
ini_write_real("Visual","simpleLock",global.simpleLock);
ini_write_real("Visual","pauseStyle",global.pauseStyle);

//Colorblind
for(var i = 0; i < key_TYPES; i += 1){
    ini_write_real("Colors","darkTone"+string(i),global.darkTone[i]);
    ini_write_real("Colors","mainTone"+string(i),global.mainTone[i]);
    ini_write_real("Colors","highTone"+string(i),global.highTone[i]);
}
//ADD: Door Colors (10 cols: 6 + RGB + Brown. Excluded: Master, Glitch, Pure, Stone)
ini_write_real("Colorblind","useSymbols",global.useSymbols);
ini_write_real("Colorblind","doHighlight",global.doHighlight);
ini_write_real("Colorblind","filter",global.filter);

//Accessibility
ini_write_real("Accessibility","hideTime",global.hideTime);
ini_write_real("Accessibility","runSwitch",global.runSwitch);
ini_write_real("Accessibility","fullJumps",global.fullJumps);
ini_write_real("Accessibility","allUnlock",global.allUnlock);
ini_write_real("Accessibility","fastAnims",global.fastAnims);

//keyboard controls (ADD NEW ONES!)
ini_write_real("Controls","Left",global.leftButton[0]);
ini_write_real("Controls","Right",global.rightButton[0]);
ini_write_real("Controls","Up",global.upButton[0]);
ini_write_real("Controls","Down",global.downButton[0]);
ini_write_real("Controls","Jump",global.jumpButton[0]);
ini_write_real("Controls","Undo",global.shootButton[0]);
ini_write_real("Controls","Restart",global.restartButton[0]);
ini_write_real("Controls","Skip",global.skipButton[0]);
ini_write_real("Controls","Pause",global.pauseButton[0]);
ini_write_real("Controls","Camera",global.camButton[0]);
ini_write_real("Controls","Action",global.masButton[0]);
ini_write_real("Controls","Leave",global.leaveButton[0]);
ini_write_real("Controls","Warp",global.warpButton[0]);
ini_write_real("Controls","Special",global.specialButton[0]);
//ini_write_real("Controls","Mute",global.muteButton[0]);
ini_write_real("Controls","Runswitch",global.rsButton[0]);
ini_write_real("Controls","Run",global.runButton[0]);
ini_write_real("Controls","Walk",global.walkButton[0]);
ini_write_real("Controls","Select",global.selButton[0]);
ini_write_real("Controls","Interact",global.intrButton[0]);
//"Skip" is Lens of Truth (S)
//"Camera" (C) now doubles as the Hide Message button (was H)
//ADD: Exit Level Hotkey (Backspace)
//ADD: Warp Rod (W)
//ADD: Mute Music Hotkey (M)
//ADD: Auto-run Hotkey (E)
//ADD: Consult Hint or other special function (Q) EVEN IF IT GOES UNUSED
//(REMEMBER TO UPDATE CONTROLLER BINDS BELOW TOO)

if (global.controllerEnabled)
{
    //controller options
    ini_write_real("Controller","Index",global.controllerIndex);
    ini_write_real("Controller","Left",global.leftButton[1]);
    ini_write_real("Controller","Right",global.rightButton[1]);
    ini_write_real("Controller","Up",global.upButton[1]);
    ini_write_real("Controller","Down",global.downButton[1]);
    ini_write_real("Controller","Jump",global.jumpButton[1]);
    ini_write_real("Controller","Undo",global.shootButton[1]);
    ini_write_real("Controller","Restart",global.restartButton[1]);
    ini_write_real("Controller","Skip",global.skipButton[1]);
    ini_write_real("Controller","Pause",global.pauseButton[1]);
    ini_write_real("Controller","Camera",global.camButton[1]);
    ini_write_real("Controller","Action",global.masButton[1]);
    ini_write_real("Controller","Leave",global.leaveButton[1]);
    ini_write_real("Controller","Warp",global.warpButton[1]);
    ini_write_real("Controller","Special",global.specialButton[1]);
    //ini_write_real("Controls","Mute",global.muteButton[1]);
    ini_write_real("Controller","Runswitch",global.rsButton[1]);
    ini_write_real("Controller","Run",global.runButton[1]);
    ini_write_real("Controller","Walk",global.walkButton[1]);
    ini_write_real("Controller","Select",global.selButton[1]);
    ini_write_real("Controller","Interact",global.intrButton[1]);
}

ini_close();

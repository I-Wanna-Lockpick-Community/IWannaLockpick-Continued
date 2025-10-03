///loads config settings, sets default config if it doesn't exist

ini_open("config.ini");

//settings
//Part 2 check only important in objWorld Game Start

//Sound
global.muteMusic = ini_read_real("Sound","Mute_music",false);
global.soundLevel = clamp(floor(ini_read_real("Sound","Sound_level",80)),0,100);
global.musicLevel = clamp(floor(ini_read_real("Sound","Music_level",80)),0,100);
global.volumeLevel = clamp(floor(ini_read_real("Sound","Volume_level",30)),0,100);
audio_master_gain(global.volumeLevel/100);
    
//Visual
global.fullscreenMode = ini_read_real("Visual","Fullscreen_mode",false);
window_set_fullscreen(global.fullscreenMode);

global.smoothingMode = ini_read_real("Visual","Smoothing_mode",false);

global.vsyncMode = ini_read_real("Visual","Vsync_mode",false);
if (global.vsyncMode){   //only need to set vsync mode if it's on since it's off by default
    scrSetVsync();
}

global.windowScale = ini_read_real("Visual","windowScale",1);
global.lowFX = ini_read_real("Visual","lowFX",false);
global.simpleLock = ini_read_real("Visual","simpleLock",false);
global.pauseStyle = ini_read_real("Visual","pauseStyle",0);

//Colors
for(var i = 0; i < key_TYPES; i += 1){
    global.darkTone[i] = ini_read_real("Colors","darkTone"+string(i),-1);
    global.mainTone[i] = ini_read_real("Colors","mainTone"+string(i),-1);
    global.highTone[i] = ini_read_real("Colors","highTone"+string(i),-1);
}
if global.darkTone[0] == -1{//Set default colors
    setColorsDefault();
}
//Colorblind
global.useSymbols = ini_read_real("Colorblind","useSymbols",0);
global.doHighlight = ini_read_real("Colorblind","doHighlight",0);
global.filter = ini_read_real("Colorblind","filter",0);

//Accessibility
global.hideTime = ini_read_real("Accessibility","hideTime",1);
global.runSwitch = ini_read_real("Accessibility","runSwitch",0);
global.fullJumps = ini_read_real("Accessibility","fullJumps",0);
global.allUnlock = ini_read_real("Accessibility","allUnlock",0);
global.fastAnims = ini_read_real("Accessibility","fastAnims",0);

//keyboard controls
global.leftButton[0] = ini_read_real("Controls","Left",vk_left);
global.rightButton[0] = ini_read_real("Controls","Right",vk_right);
global.upButton[0] = ini_read_real("Controls","Up",vk_up);
global.downButton[0] = ini_read_real("Controls","Down",vk_down);
global.jumpButton[0] = ini_read_real("Controls","Jump",vk_space);
global.shootButton[0] = ini_read_real("Controls","Undo",ord("Z"));
global.restartButton[0] = ini_read_real("Controls","Restart",ord("R"));
global.skipButton[0] = ini_read_real("Controls","Skip",ord("S"));
global.pauseButton[0] = ini_read_real("Controls","Pause",vk_escape);//Used to be P
global.camButton[0] = ini_read_real("Controls","Camera",ord("C"));
global.masButton[0] = ini_read_real("Controls","Action",ord("X"));
global.leaveButton[0] = ini_read_real("Controls","Leave",vk_backspace);
global.warpButton[0] = ini_read_real("Controls","Warp",ord("W"));
global.specialButton[0] = ini_read_real("Controls","Special",ord("A"));
global.rsButton[0] = ini_read_real("Controls","Runswitch",ord("E"));
global.runButton[0] = ini_read_real("Controls","Run",vk_shift);
global.walkButton[0] = ini_read_real("Controls","Walk",vk_control);
global.selButton[0] = ini_read_real("Controls","Select",vk_space);
global.intrButton[0] = ini_read_real("Controls","Interact",vk_up);

//menu keys (not rebindable)
global.menuLeftButton[0] = vk_left;
global.menuRightButton[0] = vk_right;
global.menuUpButton[0] = vk_up;
global.menuDownButton[0] = vk_down;
global.menuAcceptButton[0] = vk_space;
global.menuBackButton[0] = ord("Z");
global.menuOptionsButton[0] = vk_enter;

if (global.controllerEnabled)
{
    //controller options
    global.controllerIndex = ini_read_real("Controller", "Index", -1); //-1 means no controller
    global.leftButton[1] = ini_read_real("Controller","Left",gp_padl);
    global.rightButton[1] = ini_read_real("Controller","Right",gp_padr);
    global.upButton[1] = ini_read_real("Controller","Up",gp_padu);
    global.downButton[1] = ini_read_real("Controller","Down",gp_padd);
    global.jumpButton[1] = ini_read_real("Controller","Jump",gp_face1);
    global.shootButton[1] = ini_read_real("Controller","Undo",gp_face3);
    global.restartButton[1] = ini_read_real("Controller","Restart",gp_face4);
    global.skipButton[1] = ini_read_real("Controller","Skip",gp_shoulderr);
    global.pauseButton[1] = ini_read_real("Controller","Pause",gp_start);
    global.camButton[1] = ini_read_real("Controller","Camera",gp_shoulderlb);
    global.masButton[1] = ini_read_real("Controller","Action",gp_face2);
    global.leaveButton[1] = ini_read_real("Controller","Leave",gp_shoulderrb);
    global.warpButton[1] = ini_read_real("Controller","Warp",gp_select);
    global.specialButton[1] = ini_read_real("Controller","Special",gp_shoulderl);
    global.rsButton[1] = ini_read_real("Controller","Runswitch",gp_stickr);
    global.runButton[1] = ini_read_real("Controller","Run",gp_padu);
    global.walkButton[1] = ini_read_real("Controller","Walk",gp_padd);
    global.selButton[1] = ini_read_real("Controls","Select",gp_face1);
    global.intrButton[1] = ini_read_real("Controls","Interact",gp_padu);
}

//menu buttons (not rebindable)
global.menuLeftButton[1] = gp_padl;
global.menuRightButton[1] = gp_padr;
global.menuUpButton[1] = gp_padu;
global.menuDownButton[1] = gp_padd;
global.menuAcceptButton[1] = gp_face1;
global.menuBackButton[1] = gp_face2;
global.menuOptionsButton[1] = gp_select;

ini_close();

scrSaveConfigNew();    //save config in case something changed

///setColorsDefault();
//Sets the color settings to a slightly brighter setting.
//Also recalibrates the colorblind options menu.
//Special thanks to Chrisay for providing this palette.

//Gold
global.highTone[color_MASTER] = make_color_rgb(231,191,152);
global.mainTone[color_MASTER] = make_color_rgb(214,143,73);
global.darkTone[color_MASTER] = make_color_rgb(156,96,35);
//White + Pure
global.highTone[color_WHITE] = make_color_rgb(237,234,231);
global.mainTone[color_WHITE] = make_color_rgb(214,207,201);
global.darkTone[color_WHITE] = make_color_rgb(187,174,164);
global.highTone[color_PURE] = make_color_rgb(237,234,231);
global.mainTone[color_PURE] = make_color_rgb(214,207,201);
global.darkTone[color_PURE] = make_color_rgb(187,174,164);
//Orange
global.highTone[color_ORANGE] = make_color_rgb(231,191,152);
global.mainTone[color_ORANGE] = make_color_rgb(214,143,73);
global.darkTone[color_ORANGE] = make_color_rgb(156,96,35);
//Purple
global.highTone[color_PURPLE] = make_color_rgb(191,164,219);
global.mainTone[color_PURPLE] = make_color_rgb(143,95,192);
global.darkTone[color_PURPLE] = make_color_rgb(96,54,137);
//Red
global.highTone[color_RED] = make_color_rgb(235,55,55);
global.mainTone[color_RED] = make_color_rgb(161,27,27);
global.darkTone[color_RED] = make_color_rgb(107,13,13);
//Green
global.highTone[color_GREEN] = make_color_rgb(112,207,136);
global.mainTone[color_GREEN] = make_color_rgb(53,159,80);
global.darkTone[color_GREEN] = make_color_rgb(27,80,40);
//Blue
global.highTone[color_BLUE] = make_color_rgb(135,149,184);
global.mainTone[color_BLUE] = make_color_rgb(95,113,160);
global.darkTone[color_BLUE] = make_color_rgb(58,70,101);
//Pink
global.highTone[color_PINK] = make_color_rgb(228,175,202);
global.mainTone[color_PINK] = make_color_rgb(207,112,159);
global.darkTone[color_PINK] = make_color_rgb(175,58,117);
//Cyan
global.highTone[color_CYAN] = make_color_rgb(138,202,248);
global.mainTone[color_CYAN] = make_color_rgb(80,175,209);
global.darkTone[color_CYAN] = make_color_rgb(53,117,146);
//Black
global.highTone[color_BLACK] = make_color_rgb(85,75,64);
global.mainTone[color_BLACK] = make_color_rgb(54,48,41);
global.darkTone[color_BLACK] = make_color_rgb(24,21,18);
//Brown
global.highTone[color_BROWN] = make_color_rgb(170,96,21);
global.mainTone[color_BROWN] = make_color_rgb(112,64,16);
global.darkTone[color_BROWN] = make_color_rgb(56,32,7);
//Glitch
global.highTone[color_GLITCH] = make_color_rgb(120,190,0);
global.mainTone[color_GLITCH] = make_color_rgb(180,150,0);
global.darkTone[color_GLITCH] = make_color_rgb(220,110,0);
//Stone
global.highTone[color_STONE] = make_color_rgb(150,160,165);
global.mainTone[color_STONE] = make_color_rgb(100,115,120);
global.darkTone[color_STONE] = make_color_rgb(60,75,80);
//Dynamite
global.highTone[color_DYNAMITE] = make_color_rgb(209,136,102);
global.mainTone[color_DYNAMITE] = make_color_rgb(211,71,40);
global.darkTone[color_DYNAMITE] = make_color_rgb(122,49,23);
//Maroon
global.highTone[color_MAROON] = make_color_rgb(107,32,32);
global.mainTone[color_MAROON] = make_color_rgb(70,20,21);
global.darkTone[color_MAROON] = make_color_rgb(46,12,12);
//Forest
global.highTone[color_FOREST] = make_color_rgb(29,92,44);
global.mainTone[color_FOREST] = make_color_rgb(22,59,33);
global.darkTone[color_FOREST] = make_color_rgb(10,43,20);
//Navy
global.highTone[color_NAVY] = make_color_rgb(32,50,107);
global.mainTone[color_NAVY] = make_color_rgb(24,37,82);
global.darkTone[color_NAVY] = make_color_rgb(16,24,51);
// @addcolor if no animation

//Options menu
with oOptionHandle{
    var _c = colorShow[curColorEdit];
    cHighR = color_get_red(global.highTone[_c]);
    cHighG = color_get_green(global.highTone[_c]);
    cHighB = color_get_blue(global.highTone[_c]);
    cMainR = color_get_red(global.mainTone[_c]);
    cMainG = color_get_green(global.mainTone[_c]);
    cMainB = color_get_blue(global.mainTone[_c]);
    cDarkR = color_get_red(global.darkTone[_c]);
    cDarkG = color_get_green(global.darkTone[_c]);
    cDarkB = color_get_blue(global.darkTone[_c]);
}

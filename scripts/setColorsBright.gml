///setColorsDefault();
//Sets the color settings to a slightly brighter setting.
//Also recalibrates the colorblind options menu.
//Special thanks to Chrisay for providing this palette.

//Gold
global.highTone[key_MASTER] = make_color_rgb(231,191,152);
global.mainTone[key_MASTER] = make_color_rgb(214,143,73);
global.darkTone[key_MASTER] = make_color_rgb(156,96,35);
//White + Pure
global.highTone[key_WHITE] = make_color_rgb(237,234,231);
global.mainTone[key_WHITE] = make_color_rgb(214,207,201);
global.darkTone[key_WHITE] = make_color_rgb(187,174,164);
global.highTone[key_PURE] = make_color_rgb(237,234,231);
global.mainTone[key_PURE] = make_color_rgb(214,207,201);
global.darkTone[key_PURE] = make_color_rgb(187,174,164);
//Orange
global.highTone[key_ORANGE] = make_color_rgb(231,191,152);
global.mainTone[key_ORANGE] = make_color_rgb(214,143,73);
global.darkTone[key_ORANGE] = make_color_rgb(156,96,35);
//Purple
global.highTone[key_PURPLE] = make_color_rgb(191,164,219);
global.mainTone[key_PURPLE] = make_color_rgb(143,95,192);
global.darkTone[key_PURPLE] = make_color_rgb(96,54,137);
//Red
global.highTone[key_RED] = make_color_rgb(235,55,55);
global.mainTone[key_RED] = make_color_rgb(161,27,27);
global.darkTone[key_RED] = make_color_rgb(107,13,13);
//Green
global.highTone[key_GREEN] = make_color_rgb(112,207,136);
global.mainTone[key_GREEN] = make_color_rgb(53,159,80);
global.darkTone[key_GREEN] = make_color_rgb(27,80,40);
//Blue
global.highTone[key_BLUE] = make_color_rgb(135,149,184);
global.mainTone[key_BLUE] = make_color_rgb(95,113,160);
global.darkTone[key_BLUE] = make_color_rgb(58,70,101);
//Pink
global.highTone[key_PINK] = make_color_rgb(228,175,202);
global.mainTone[key_PINK] = make_color_rgb(207,112,159);
global.darkTone[key_PINK] = make_color_rgb(175,58,117);
//Cyan
global.highTone[key_CYAN] = make_color_rgb(138,202,248);
global.mainTone[key_CYAN] = make_color_rgb(80,175,209);
global.darkTone[key_CYAN] = make_color_rgb(53,117,146);
//Black
global.highTone[key_BLACK] = make_color_rgb(85,75,64);
global.mainTone[key_BLACK] = make_color_rgb(54,48,41);
global.darkTone[key_BLACK] = make_color_rgb(24,21,18);
//Brown
global.highTone[key_BROWN] = make_color_rgb(170,96,21);
global.mainTone[key_BROWN] = make_color_rgb(112,64,16);
global.darkTone[key_BROWN] = make_color_rgb(56,32,7);
//Glitch
global.highTone[key_GLITCH] = make_color_rgb(120,190,0);
global.mainTone[key_GLITCH] = make_color_rgb(180,150,0);
global.darkTone[key_GLITCH] = make_color_rgb(220,110,0);
//Stone
global.highTone[key_STONE] = make_color_rgb(150,160,165);
global.mainTone[key_STONE] = make_color_rgb(100,115,120);
global.darkTone[key_STONE] = make_color_rgb(60,75,80);
//Dynamite
global.highTone[key_DYNAMITE] = make_color_rgb(209,136,102);
global.mainTone[key_DYNAMITE] = make_color_rgb(211,71,40);
global.darkTone[key_DYNAMITE] = make_color_rgb(122,49,23);
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

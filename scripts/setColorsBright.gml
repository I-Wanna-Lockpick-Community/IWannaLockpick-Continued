///setColorsDefault();
//Sets the color settings to a slightly brighter setting.
//Also recalibrates the colorblind options menu.
//Special thanks to Chrisay for providing this palette.

//Gold
global.highTone[0] = make_color_rgb(231,191,152);
global.mainTone[0] = make_color_rgb(214,143,73);
global.darkTone[0] = make_color_rgb(156,96,35);
//White + Pure
global.highTone[1] = make_color_rgb(237,234,231);
global.mainTone[1] = make_color_rgb(214,207,201);
global.darkTone[1] = make_color_rgb(187,174,164);
global.highTone[11] = make_color_rgb(237,234,231);
global.mainTone[11] = make_color_rgb(214,207,201);
global.darkTone[11] = make_color_rgb(187,174,164);
//Orange
global.highTone[2] = make_color_rgb(231,191,152);
global.mainTone[2] = make_color_rgb(214,143,73);
global.darkTone[2] = make_color_rgb(156,96,35);
//Purple
global.highTone[3] = make_color_rgb(191,164,219);
global.mainTone[3] = make_color_rgb(143,95,192);
global.darkTone[3] = make_color_rgb(96,54,137);
//Red
global.highTone[4] = make_color_rgb(235,55,55);
global.mainTone[4] = make_color_rgb(161,27,27);
global.darkTone[4] = make_color_rgb(107,13,13);
//Green
global.highTone[5] = make_color_rgb(112,207,136);
global.mainTone[5] = make_color_rgb(53,159,80);
global.darkTone[5] = make_color_rgb(27,80,40);
//Blue
global.highTone[6] = make_color_rgb(135,149,184);
global.mainTone[6] = make_color_rgb(95,113,160);
global.darkTone[6] = make_color_rgb(58,70,101);
//Pink
global.highTone[7] = make_color_rgb(228,175,202);
global.mainTone[7] = make_color_rgb(207,112,159);
global.darkTone[7] = make_color_rgb(175,58,117);
//Cyan
global.highTone[8] = make_color_rgb(138,202,248);
global.mainTone[8] = make_color_rgb(80,175,209);
global.darkTone[8] = make_color_rgb(53,117,146);
//Black
global.highTone[9] = make_color_rgb(85,75,64);
global.mainTone[9] = make_color_rgb(54,48,41);
global.darkTone[9] = make_color_rgb(24,21,18);
//Brown
global.highTone[10] = make_color_rgb(170,96,21);
global.mainTone[10] = make_color_rgb(112,64,16);
global.darkTone[10] = make_color_rgb(56,32,7);
//Copy
global.highTone[12] = make_color_rgb(120,190,0);
global.mainTone[12] = make_color_rgb(180,150,0);
global.darkTone[12] = make_color_rgb(220,110,0);
//Stone
global.highTone[13] = make_color_rgb(150,160,165);
global.mainTone[13] = make_color_rgb(100,115,120);
global.darkTone[13] = make_color_rgb(60,75,80);
//Dynamite
global.highTone[14] = make_color_rgb(209,136,102);
global.mainTone[14] = make_color_rgb(211,71,40);
global.darkTone[14] = make_color_rgb(122,49,23);
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

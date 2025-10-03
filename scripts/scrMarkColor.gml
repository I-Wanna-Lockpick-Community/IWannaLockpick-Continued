///scrMarkColor(colorID);
//Returns a color based on what "color preset type" a pencilmark uses.
//The first few correspond to key colors, then there are some constants.

switch argument0{
    case 0:
        markCol = global.mainTone[key_WHITE];
        markOut = getMarkOutColor(markCol);
    break;
    case 1:
        markCol = global.mainTone[key_ORANGE];
        markOut = getMarkOutColor(markCol);
    break;
    case 2:
        markCol = global.mainTone[key_PURPLE];
        markOut = getMarkOutColor(markCol);
    break;
    case 3:
        markCol = global.mainTone[key_PINK];
        markOut = getMarkOutColor(markCol);
    break;
    case 4:
        markCol = global.mainTone[key_CYAN];
        markOut = getMarkOutColor(markCol);
    break;
    case 5:
        markCol = global.mainTone[key_BLACK];
        markOut = getMarkOutColor(markCol);
    break;
    case 6:
        markCol = global.mainTone[key_RED];
        markOut = getMarkOutColor(markCol);
    break;
    case 7:
        markCol = global.mainTone[key_GREEN];
        markOut = getMarkOutColor(markCol);
    break;
    case 8:
        markCol = global.mainTone[key_BLUE];
        markOut = getMarkOutColor(markCol);
    break;
    case 9:
        markCol = global.mainTone[key_BROWN];
        markOut = getMarkOutColor(markCol);
    break;
    //Preset colors: RGBCMY,W,B
    case 10:
        markCol = make_color_rgb(255,0,0);
        markOut = getMarkOutColor(markCol);
    break;
    case 11:
        markCol = make_color_rgb(0,255,0);
        markOut = getMarkOutColor(markCol);
    break;
    case 12:
        markCol = make_color_rgb(0,0,255);
        markOut = getMarkOutColor(markCol);
    break;
    case 13:
        markCol = make_color_rgb(0,255,255);
        markOut = getMarkOutColor(markCol);
    break;
    case 14:
        markCol = make_color_rgb(255,0,255);
        markOut = getMarkOutColor(markCol);
    break;
    case 15:
        markCol = make_color_rgb(255,255,0);
        markOut = getMarkOutColor(markCol);
    break;
    case 16:
        markCol = c_white;
        markOut = c_black;
    break;
    case 17:
        markCol = c_black;
        markOut = c_white;
		// @addcolor pencilmark color
    break;
    default:
        markCol = c_white;
        markOut = c_black;
    break;
}
return markCol;

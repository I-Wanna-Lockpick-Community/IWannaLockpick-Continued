//Code to determine whether to draw as positive or negative:
//If real part != 0, sign = sign(real). Else, sign = sign(imaginary).
//What about complex numbers? Well, I'll let combo doors handle them...
//However, I might eventually add code to re-adjust the imaginary sign to compensate for negative real, positive imaginary...

//Quick abort
if global.complexMode == 0 && copies == 0{//Don't draw the frames if there are no real copies
    scrComboDrawIm();//Funnily enough, this particular script is compatible with simple doors!
    exit;
}
if global.complexMode == 1 && icopies == 0{//Don't draw the frames if there are no imaginary copies
    scrComboDrawIm();
    exit;
}

//Determines image index for door frame
var dIndex = 0;
var tempPow = 0;
if count > 0 || type == 1{//Positive doors or blank doors
    tempPow = 0;
}else if count < 0{//Negative doors
    tempPow = 2;
}else{//Switch to imaginary heuristic
    if icount > 0{//Positive imaginary
        tempPow = 1;
    }else{//Negative imaginary
        tempPow = 3;
    }
}
tempPow = (tempPow + iPow) mod 4;
if tempPow <= 1{dIndex = 0;}else{dIndex = 5;}//+ and +i are positive, - and -i are negative
var fakeCount = 0;
if count != 0{fakeCount = abs(count);}
if icount != 0{fakeCount = abs(icount);}
var fakeString = string(fakeCount);

//Door Frame
//Edges
if w > 1{
    draw_sprite_part_ext(sprDoorBig,dIndex,16,0,16,16,x+16,y,(w-1)*2,1,c_white,1);
    draw_sprite_part_ext(sprDoorBig,dIndex,16,48,16,16,x+16,y+32*h-16,(w-1)*2,1,c_white,1);
}
if h > 1{
    draw_sprite_part_ext(sprDoorBig,dIndex,0,16,16,16,x,y+16,1,(h-1)*2,c_white,1);
    draw_sprite_part_ext(sprDoorBig,dIndex,48,16,16,16,x+32*w-16,y+16,1,(h-1)*2,c_white,1);
}
//Corners
draw_sprite_part_ext(sprDoorBig,dIndex,0,0,16,16,x,y,1,1,c_white,1);
draw_sprite_part_ext(sprDoorBig,dIndex,48,0,16,16,x+32*w-16,y,1,1,c_white,1);
draw_sprite_part_ext(sprDoorBig,dIndex,0,48,16,16,x,y+32*h-16,1,1,c_white,1);
draw_sprite_part_ext(sprDoorBig,dIndex,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c_white,1);
///Symbol
switch tempPow{
    case 0://Positive
        if type == 0{//Normal
            switch fakeCount{
                case 1:
                    draw_sprite(sprSymbols,0,x,y);
                break;
                case 2:
                case 3:
                    draw_set_font(fTalk);
                    draw_set_color(make_color_rgb(44,32,20));
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_center);
                    draw_text(x+16*w,y+16*h-1-8,fakeString);
                    draw_set_color(c_white);
                    draw_sprite(sprLock2,2,x,y);
                break;
                default:
                    var drawLockW = 8;//Width of the lock symbol
                    draw_set_font(fTalk);
                    var drawLockTextW = string_width(fakeString);
                    var drawLockStringLength = drawLockW + drawLockTextW + 4;//4 is a horizontal separation constant
                    var drawLockLeftOffset = ceil(drawLockStringLength/2)+12;
                    var drawDoorMid = x+16*w;
                    var drawLockLeftX = drawDoorMid - drawLockLeftOffset;
                    draw_sprite(sprSymbols,0,drawLockLeftX,y+16*(h-1));
                    draw_set_color(make_color_rgb(44,32,20));
                    draw_set_halign(fa_left);
                    draw_set_valign(fa_center);
                    draw_text(drawLockLeftX+24-1,y+16*h-1,fakeString);//11 is the specific adjustment constant
                    draw_set_color(c_white);
                break;
            }
        }
        if type == 2{//Blast
            draw_sprite(sprSymbols,2,x+16*(w-1),y+16*(h-1));
        }
        if type == 3{//Equals
            draw_sprite(sprSymbols,4,x+16*(w-1),y+16*(h-1));
        }
    break;
    case 1://Positive i
        if type == 0{
            switch fakeCount{
                case 1:
                    draw_sprite(sprSymbols,1,x+16*(w-1),y+16*(h-1));
                break;
                case 2:
                case 3:
                    draw_set_font(fTalk);
                    draw_set_color(make_color_rgb(44,32,20));
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_center);
                    draw_text(x+16*w,y+16*h-1-8,fakeString);
                    draw_set_color(c_white);
                    draw_sprite(sprLock2i,2,x,y);
                break;
                default:
                    draw_set_font(fTalk);
                    draw_set_color(make_color_rgb(44,32,20));
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_center);
                    draw_text(x+16*w-1,y+16*h-1,fakeString+"i");
                    draw_set_color(c_white);
                break;
            }
        }
        if type == 2{//I-Blast
            draw_sprite(sprSymbols,3,x+16*(w-1),y+16*(h-1));
        }
        if type == 3{//Equals
            draw_sprite(sprSymbols,4,x+16*(w-1),y+16*(h-1));
        }
    break;
    case 2://Negative
        if type == 0{//Normal
            switch fakeCount{
                case 1:
                    draw_sprite(sprSymbols,5,x,y);
                break;
                case 2:
                case 3:
                    draw_set_font(fTalk);
                    draw_set_color(make_color_rgb(235,223,211));
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_center);
                    draw_text(x+16*w,y+16*h-1-8,fakeString);
                    draw_set_color(c_white);
                    draw_sprite(sprLock2,3,x,y);
                break;
                default:
                    var drawLockW = 8;//Width of the lock symbol
                    draw_set_font(fTalk);
                    var drawLockTextW = string_width(fakeString);
                    var drawLockStringLength = drawLockW + drawLockTextW + 4;//4 is a horizontal separation constant
                    var drawLockLeftOffset = ceil(drawLockStringLength/2)+12;
                    var drawDoorMid = x+16*w;
                    var drawLockLeftX = drawDoorMid - drawLockLeftOffset;
                    draw_sprite(sprSymbols,5,drawLockLeftX,y+16*(h-1));
                    draw_set_color(make_color_rgb(235,223,211));
                    draw_set_halign(fa_left);
                    draw_set_valign(fa_center);
                    draw_text(drawLockLeftX+24-1,y+16*h-1,fakeString);//11 is the specific adjustment constant
                    draw_set_color(c_white);
                break;
            }
        }
        if type == 2{//N-Blast
            draw_sprite(sprSymbols,6,x+16*(w-1),y+16*(h-1));
        }
        if type == 3{//N-Equals (I mean...I guess this won't really matter)
            draw_sprite(sprSymbols,8,x+16*(w-1),y+16*(h-1));
        }
    break;
    case 3://Negative i
        if type == 0{
            switch fakeCount{
                case 1:
                    draw_sprite(sprSymbols,9,x+16*(w-1),y+16*(h-1));
                break;
                case 2:
                case 3:
                    draw_set_font(fTalk);
                    draw_set_color(make_color_rgb(235,223,211));
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_center);
                    draw_text(x+16*w,y+16*h-1-8,fakeString);
                    draw_set_color(c_white);
                    draw_sprite(sprLock2i,3,x,y);
                break;
                default:
                    draw_set_font(fTalk);
                    draw_set_color(make_color_rgb(235,223,211));
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_center);
                    draw_text(x+16*w-1,y+16*h-1,fakeString+"i");
                    draw_set_color(c_white);
                break;
            }
        }
        if type == 2{//NI-Blast
            draw_sprite(sprSymbols,7,x+16*(w-1),y+16*(h-1));
        }
        if type == 3{//Equals
            draw_sprite(sprSymbols,8,x+16*(w-1),y+16*(h-1));
        }
    break;
}

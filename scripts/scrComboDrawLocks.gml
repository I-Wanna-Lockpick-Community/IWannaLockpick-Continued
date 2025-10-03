//First, set up the draw variables for any numerical locks
draw_set_font(fTalk);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for(var i = 0; i < lockCount; i += 1){
    var _lockSpr = lock[i,6];
    if global.simpleLock{
        switch _lockSpr{
            case sprLock1A:
                _lockSpr = sprLockAny;
            break;
            case sprLock2H:
            case sprLock3H:
                _lockSpr = sprLockAnyH;
            break;
            case sprLock2V:
            case sprLock3V:
                _lockSpr = sprLockAnyV;
            break;
            case sprLock4A:
            case sprLock5A:
            case sprLock6A:
                _lockSpr = sprLockAnyM;
            break;
            case sprLock6B:
            case sprLock8A:
            case sprLock12A:
                _lockSpr = sprLockAnyL;
            break;
            case sprLock24A:
                _lockSpr = sprLockAnyXL;
            break;
        }
    }
    var tempX = x+lock[i,4];
    var tempY = y+lock[i,5];
    var tempXMid = sprite_get_width(lock[i,6])*.5;
    var tempYMid = sprite_get_height(lock[i,6])*.5;
    //Start with x position, backtrack by the origin position, then go to the middle of the sprite, then -16.
    var tempXSymbol = tempX - sprite_get_xoffset(lock[i,6]) + tempXMid - 16;
    var tempYSymbol = tempY - sprite_get_yoffset(lock[i,6]) + tempYMid - 16;
    //Count stuff
    var fakeCount = 0;
    if lock[i,1] != 0{fakeCount = abs(lock[i,1]);}
    if lock[i,2] != 0{fakeCount = abs(lock[i,2]);}
    var fakeString = string(fakeCount);
    switch iPow{
        case 0://i^0 = Multiply by 1
            var needR = lock[i,1];
            var needI = lock[i,2];
        break;
        case 1://i^1 = Multiply by i
            var needR = -lock[i,2];
            var needI = lock[i,1];
        break;
        case 2://i^2 = Multiply by -1
            var needR = -lock[i,1];
            var needI = -lock[i,2];
        break;
        case 3://i^3 = Multiply by -i
            var needR = lock[i,2];
            var needI = -lock[i,1];
        break;
    }
    //Really the main thing here is just determining whether to draw with positive or negative colors.
    //We'll leave the structure in to add singular complex locks but we'll skip over actually implementing them for now...
    //Plus, there's merit in reducing the number of types and squeezing real and imaginary into the same type, right?
    var _lockNega = 0;
    var _lockImaginary = 0;
    if needR > 0 || lock[i,3] == 1{//Positive/blank
        _lockNega = 0;
    }else if needR < 0{//Negative
        _lockNega = 1;
    }else{
        _lockImaginary = 1;
        if needI > 0{
            _lockNega = 0;
        }else{
            _lockNega = 1;
        }
    }
    if _lockNega == 0 || lock[i,3] == 1{//Positive count or blank lock
        draw_set_color(make_color_rgb(44,32,20));
        draw_sprite_ext(_lockSpr,0,tempX,tempY,1,1,0,c_white,1);
        switch lock[i,3]{//If the type isn't normal or blank, draw a symbol
            case 2://blast
                if needR > 0{
                    draw_sprite(sprSymbols,2,tempX,tempY);
                }
                if needI > 0{
                    draw_sprite(sprSymbols,3,tempX,tempY);
                }
            break;
            case 3://equal
                draw_sprite(sprSymbols,4,tempX,tempY);
            break;
        }
        if _lockSpr == sprLockAny || _lockSpr == sprLockAnyM || _lockSpr == sprLockAnyL || _lockSpr == sprLockAnyXL || _lockSpr == sprLockAnyH{
            if lock[i,3] == 0{//For the 3 blank locks, simply draw the number of keys needed
                var tempOffsetX = sprite_get_width(_lockSpr)/2-sprite_get_xoffset(_lockSpr);
                var tempOffsetY = sprite_get_height(_lockSpr)/2-sprite_get_yoffset(_lockSpr);
                var tempLockString = string(abs(needR)); if needI != 0{tempLockString = string(abs(needI))+"i";}
                draw_text(tempX+tempOffsetX,tempY+tempOffsetY,tempLockString);
            }
        }else if _lockSpr == sprLockAnyV{
            var tempOffsetX = sprite_get_width(_lockSpr)/2-sprite_get_xoffset(_lockSpr);
            var tempOffsetY = sprite_get_height(_lockSpr)/2-sprite_get_yoffset(_lockSpr);
            var tempLockString = string(abs(needR));
            if needI == 0{
                draw_text(tempX+tempOffsetX+1,tempY+tempOffsetY,tempLockString);
            }else{
                var tempLockString = string(abs(needI));
                draw_text(tempX+tempOffsetX+1,tempY+tempOffsetY-8,tempLockString);
                draw_text(tempX+tempOffsetX,tempY+tempOffsetY+8,"i");
            }
        }
    }else{//Negative count
        draw_set_color(make_color_rgb(235,223,211));
        draw_sprite_ext(_lockSpr,1,tempX,tempY,1,1,0,c_white,1);
        switch lock[i,3]{
            case 2://blast
                if needR < 0{
                    draw_sprite(sprSymbols,6,tempX,tempY);
                }
                if needI < 0{
                    draw_sprite(sprSymbols,7,tempX,tempY);
                }
            break;
            case 3://equal
                draw_sprite(sprSymbols,8,tempX,tempY);
            break;
        }
        if _lockSpr == sprLockAny || _lockSpr == sprLockAnyM || _lockSpr == sprLockAnyL || _lockSpr == sprLockAnyXL || _lockSpr == sprLockAnyH{
            if lock[i,3] == 0{//For the 3 blank locks, simply draw the number of keys needed
                var tempOffsetX = sprite_get_width(_lockSpr)/2-sprite_get_xoffset(_lockSpr);
                var tempOffsetY = sprite_get_height(_lockSpr)/2-sprite_get_yoffset(_lockSpr);
                var tempLockString = string(abs(needR)); if needI != 0{tempLockString = string(abs(needI))+"i";}
                draw_text(tempX+tempOffsetX,tempY+tempOffsetY,tempLockString);
            }
        }else if _lockSpr == sprLockAnyV{
            var tempOffsetX = sprite_get_width(_lockSpr)/2-sprite_get_xoffset(_lockSpr);
            var tempOffsetY = sprite_get_height(_lockSpr)/2-sprite_get_yoffset(_lockSpr);
            var tempLockString = string(abs(needR));
            if needI == 0{
                draw_text(tempX+tempOffsetX+1,tempY+tempOffsetY,tempLockString);
            }else{
                var tempLockString = string(abs(needI));
                draw_text(tempX+tempOffsetX+1,tempY+tempOffsetY-8,tempLockString);
                draw_text(tempX+tempOffsetX,tempY+tempOffsetY+8,"i");
            }
        }
    }
}
draw_set_color(c_white);

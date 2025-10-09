///scrDrawDoorLock(color,count,icount,type,xRel,yRel,sprite); 
// rewritten to work with both simple doors and combo doors
// we use the sprLockAnys for borders (for nonpredefined) and for fills

var color = argument0;
var mainTone = global.mainTone[color];
var count = argument1;
var icount = argument2;
var type = argument3;
var xRel = argument4 + x;
var yRel = argument5 + y;
var sprite = argument6;

// draw lock fill
var width = sprite_get_width(sprite);
var height  = sprite_get_height(sprite);
var offsetX = sprite_get_xoffset(sprite);
var offsetY = sprite_get_yoffset(sprite);

// get lock size
var fillSprite = sprite;
var isPredefinedSprite = false;
var verticalText = false;
switch sprite {
    case sprLock1A:
        if global.simpleLock { sprite = sprLockAnyS; }
        else { isPredefinedSprite = true; }
        fillSprite = sprLockAnyS;
    break;
    case sprLock2V:
    case sprLock3V:
        if global.simpleLock { sprite = sprLockAnyV; }
        else { isPredefinedSprite = true; }
        fillSprite = sprLockAnyV;
        verticalText = true;
    break;
    case sprLock2H:
    case sprLock3H:
        if global.simpleLock { sprite = sprLockAnyH; }
        else { isPredefinedSprite = true; }
        fillSprite = sprLockAnyH;
    break;
    case sprLock4A:
    case sprLock5A:
    case sprLock6A:
        if global.simpleLock { sprite = sprLockAnyM; }
        else { isPredefinedSprite = true; }
        fillSprite = sprLockAnyM;
    break;
    case sprLock4B:
    case sprLock5B:
    case sprLock6B:
    case sprLock8A:
    case sprLock12A:
        if global.simpleLock { sprite = sprLockAnyL; }
        else { isPredefinedSprite = true; }
        fillSprite = sprLockAnyL;
    break;
    case sprLock24A:
        if global.simpleLock { sprite = sprLockAnyXL; }
        else { isPredefinedSprite = true; }
        fillSprite = sprLockAnyXL;
    break;
}

switch color {
    case color_MASTER:
        draw_sprite_ext(sprDGoldGrad,floor(goldIndex),xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
    break;
    case color_PURE:
        draw_sprite_ext(sprDPureGrad,floor(goldIndex),xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
    break;
    case color_STONE:
        draw_sprite_ext(sprDStoneTexture,0,xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
    break;
    case color_GLITCH:
        shader_set(shdRainbowStripe2);
        draw_sprite_ext(fillSprite,2,xRel,yRel,1,1,0,mainTone,1);
        shader_reset();
        if glitchMimic != color_GLITCH {
            var index = 3;
            mainTone = c_white;
            switch glitchMimic {
                case color_MASTER: index = 4; break;
                case color_PURE: index = 5; break;
                case color_STONE: index = 6; break;
                default:
                    mainTone = global.mainTone[glitchMimic];
                break;
            }
            draw_sprite_ext(fillSprite,index,xRel,yRel,1,1,0,mainTone,1);
        }
    break;
    default:
        draw_sprite_ext(fillSprite,2,xRel,yRel,1,1,0,mainTone,1);
    break;
}

var index = 0;
if count < 0 || icount < 0 {index = 1}
if isPredefinedSprite {
    // the imaginary sprites; only matters for sprites for predefined lock amounts
    if icount > 0 {index = 2}
    else if icount < 0 {index = 3}
}
draw_sprite(sprite,index,xRel,yRel);

switch type {
    case lock_NORMAL:
        if !isPredefinedSprite { // draw numbers
            index = 0;
            draw_set_color(make_color_rgb(44,32,20));
            if count < 0 || icount < 0 {
                index = 5;
                draw_set_color(make_color_rgb(235,223,211));    
            }

            draw_set_font(fTalk);
            var numbers = string(abs(count) + abs(icount));
            if numbers == "1" { numbers = ""; }
            var lockOffsetX = 0;
            var lockOffsetY = 0;
            var lockSymbol = false;
            if count != 0 {
                if abs(count) == 1 || sprite != sprLockAnyS {
                    lockSymbol = true;
                    if verticalText { lockOffsetY = -16; } // offset text start for lock symbol
                    else { lockOffsetX = 12; }
                }
            } else if icount != 0 {
                numbers += "i";
            }

            var startX = floor((width - string_width(numbers) - lockOffsetX)/2) + xRel - offsetX; // i have no idea why this 4 is needed
            var startY = floor((height - lockOffsetY)/2) + yRel - offsetY;
            // number
            draw_set_halign(fa_left);
            draw_set_valign(fa_center);
            if icount != 0 { // offset the number to the right one more pixel if it isnt imaginary, because of inaccurate text widths or something
                draw_text(startX+lockOffsetX+1,startY+lockOffsetY-1,numbers);
            } else {
                draw_text(startX+lockOffsetX,startY+lockOffsetY-1,numbers);
            }
            draw_set_color(c_white);

            // lock symbol
            if lockSymbol {
                if verticalText { // calculate lock startX seperately;
                    lockOffsetX = 12;
                    startX = floor((width - lockOffsetX)/2) + xRel - offsetX;
                    startY += 3; // basegame consistency
                }
                draw_sprite(sprSymbols,index,startX-10,startY-16);
            }
        }
    break;
    case lock_BLAST:
        index = 2;
        if count < 0 {index = 6}
        else if icount > 0 {index = 3}
        else if icount < 0 {index = 7}
        draw_sprite(sprSymbols,index,xRel+width/2-9,yRel+height/2-9);
    break;
    case lock_ALL:
        draw_sprite(sprSymbols,4,xRel+width/2-9,yRel+height/2-9);
}
draw_set_color(c_white);

///scrDrawDoorLock(color,count,icount,type,xRel,yRel,sprite); 
// rewritten to work with both simple doors and combo doors
// we use the sprLockAnys for borders (for nonpredefined) and for fills

var color = argument0;
var mainTone = global.mainTone[color];
var count;
var icount
var type = argument3;
var xRel = argument4 + x;
var yRel = argument5 + y;
var sprite = argument6;

if object_index == oGate {
    count = argument1;
    icount = argument2;
} else if global.complexMode == 0 {
    if copies > 0 {count = argument1; icount = argument2;}
    else {count = -argument1; icount = -argument2;}
} else {
    if icopies > 0 {count = -argument2; icount = argument1;}
    else {count = argument2; icount = -argument1;}
}

var width = sprite_get_width(sprite);
var height = sprite_get_height(sprite);

var fillSprite = sprite;
var isPredefinedSprite = false;
var verticalText = false;

var offsetX = sprite_get_xoffset(sprite);
var offsetY = sprite_get_yoffset(sprite);

if sprite == sprLockAny {
    width = w*32-14;
    height = h*32-14;
    if w == 1 {
        verticalText = true;
    }
    offsetX = -7;
    offsetY = -7;
}

// get lock size
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

// draw lock fill
switch color {
    case color_MASTER:
        draw_sprite_ext(sprDGoldGrad,floor(goldIndex)%4,xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
    break;
    case color_PURE:
        draw_sprite_ext(sprDPureGrad,floor(goldIndex)%4,xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
    break;
    case color_STONE:
        draw_sprite_ext(sprDStoneTexture,0,xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
        // @addcolor if door image/animation
    break;
    case color_DYNAMITE:
        draw_sprite_ext(sprDDynaTexture,floor(goldIndex),xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1);
        // @addcolor if door image/animation
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
                case color_DYNAMITE: index = 7; break;
                // @addcolor if door image/animation
                default:
                    mainTone = global.mainTone[glitchMimic];
                break;
            }
            draw_sprite_ext(fillSprite,index,xRel,yRel,1,1,0,mainTone,1);
        }
    break;
    default:
        if sprite == sprLockAny {
            // arbitrary size lock fill
            draw_sprite_ext(fillSprite,2,xRel-offsetX+1,yRel-offsetY+1,(width-2)/64,(height-2)/64,0,mainTone,1);
        } else {
            draw_sprite_ext(fillSprite,2,xRel,yRel,1,1,0,mainTone,1);
        }
    break;
}

// draw lock frame
var index = 0;
if count < 0 || icount < 0 {index = 1}
if isPredefinedSprite {
    // the imaginary sprites; only matters for sprites for predefined lock amounts
    if icount > 0 {index = 2}
    else if icount < 0 {index = 3}
    if type == lock_EXACT {index += 4} // ehehe i love how i can do this
}
if sprite == sprLockAny { // arbitrary size lock
    // corners
    draw_sprite_part(sprite,index,0,0,16,16,xRel,yRel);
    draw_sprite_part(sprite,index,48,0,16,16,xRel+width-2,yRel);
    draw_sprite_part(sprite,index,0,48,16,16,xRel,yRel+height-2);
    draw_sprite_part(sprite,index,48,48,16,16,xRel+width-2,yRel+height-2);
    // edges
    if w > 1 {
        draw_sprite_part_ext(sprite,index,16,0,32,16,xRel+16,yRel,(width-18)/32,1,c_white,1);
        draw_sprite_part_ext(sprite,index,16,48,32,16,xRel+16,yRel+height-2,(width-18)/32,1,c_white,1);
    }
    if h > 1 {
        draw_sprite_part_ext(sprite,index,0,16,16,32,xRel,yRel+16,1,(height-18)/32,c_white,1);
        draw_sprite_part_ext(sprite,index,48,16,16,32,xRel+width-2,yRel+16,1,(height-18)/32,c_white,1);
    }
} else {
    draw_sprite(sprite,index,xRel,yRel);
}

switch type {
    case lock_NORMAL:
    case lock_EXACT:
        if !isPredefinedSprite { // draw numbers
            index = 0;
            if type == lock_EXACT {index = 19;}
            draw_set_color(make_color_rgb(44,32,20));
            if count < 0 || icount < 0 {
                index = 5;
                if type == lock_EXACT {index = 21;}
                draw_set_color(make_color_rgb(235,223,211));
            }

            draw_set_font(fTalk);
            var numbers = string(abs(count) + abs(icount));
            if numbers == "1" { numbers = ""; }
            var lockOffsetX = 0;
            var lockOffsetY = 0;
            var lockSymbol = false;
            if type == lock_NORMAL {
                if count != 0 {
                    if abs(count) == 1 || sprite != sprLockAnyS {
                        lockSymbol = true;
                        if verticalText { lockOffsetY = -16; } // offset text start for lock symbol
                        else { lockOffsetX = 12; }
                    }
                } else if icount != 0 {
                    numbers += "i";
                }
            } else {
                lockSymbol = true;
                if verticalText { lockOffsetY = -16; } // offset text start for lock symbol
                else { lockOffsetX = 12; }
                if icount != 0 { // exact lock imaginary symbol
                    index += 1;
                }
            }

            var startX = floor((width - string_width(numbers) - lockOffsetX)/2) + xRel - offsetX; // i have no idea why this 4 is needed
            var startY = floor((height - lockOffsetY)/2) + yRel - offsetY;
            // number
            draw_set_halign(fa_left);
            draw_set_valign(fa_center);
            if icount == 0 || type == lock_EXACT { // offset the number to the right one more pixel if it isnt imaginary, because of inaccurate text widths or something
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

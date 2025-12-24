///scrDrawDoorLock(color,count,icount,type,xRel,yRel,sprite,exactI/isPartial,denom,idenom,negated,armament,ipow,onlyFill); 
// rewritten to work with both simple doors and combo doors
// we use the sprLockAnys for borders (for nonpredefined) and for fills

var color = argument0;
var mainTone = global.mainTone[color];
var count = rotateR(argument1,argument2,argument12);
var icount = rotateI(argument1,argument2,argument12);
var type = argument3;
var xRel = argument4 + x;
var yRel = argument5 + y;
var sprite = argument6;
var exactI = type == lock_EXACT && argument7;
var isPartial = type != lock_EXACT && argument7;
var denom = rotateR(argument8,argument9,argument12);
var idenom = rotateI(argument8,argument9,argument12);;
var negated = argument10;
var armament = argument11;

var width = sprite_get_width(sprite);
var height = sprite_get_height(sprite);

var backSprite = sprite;
var isPredefinedSprite = false;
var verticalText = false;

var offsetX = sprite_get_xoffset(sprite);
var offsetY = sprite_get_yoffset(sprite);

var hasILockTexture = false; // indicates that the given sprite has predefined i lock textures so that exact knows how much to offset by 

if sprite == sprLockAny {
    if object_index == oRemoteLock {
        width = w;
        height = h;
    } else {
        width = w*32-14;
        height = h*32-14;
    }
    if w == 1 {
        verticalText = true;
    }
}

var negatedOffsetX = 0; // rotation pivot point is the origin, so we need to add sprite width and height to it
var negatedOffsetY = 0;
var rotation = 0; // upside down if negated
var iChar = "i"; // rotate the i to a !
if negated {
    rotation = 180;
    negatedOffsetX = width;
    negatedOffsetY = height;
    iChar = "!";
}

// get lock size
switch sprite {
    case sprLock1A:
        if global.simpleLock { sprite = sprLockAnyS; }
        else { isPredefinedSprite = true; }
        backSprite = sprLockAnyS;
        hasILockTexture = true;
    break;
    case sprLock2V:
    case sprLock3V:
        if global.simpleLock { sprite = sprLockAnyV; }
        else { isPredefinedSprite = true; }
        backSprite = sprLockAnyV;
        verticalText = true;
        hasILockTexture = true;
    break;
    case sprLock2H:
    case sprLock3H:
        if global.simpleLock { sprite = sprLockAnyH; }
        else { isPredefinedSprite = true; }
        backSprite = sprLockAnyH;
        hasILockTexture = true;
    break;
    case sprLock4A:
    case sprLock5A:
    case sprLock6A:
        if global.simpleLock { sprite = sprLockAnyM; }
        else { isPredefinedSprite = true; }
        backSprite = sprLockAnyM;
    break;
    case sprLock4B:
    case sprLock5B:
    case sprLock6B:
    case sprLock8A:
    case sprLock12A:
        if global.simpleLock { sprite = sprLockAnyL; }
        else { isPredefinedSprite = true; }
        backSprite = sprLockAnyL;
    break;
    case sprLock24A:
        if global.simpleLock { sprite = sprLockAnyXL; }
        else { isPredefinedSprite = true; }
        backSprite = sprLockAnyXL;
    break;
}

if argument12 != 0 && object_index == oDoorCombo {
    sprite = backSprite;
}

// draw lock fill
switch color {
    case color_MASTER:
        draw_sprite_ext(sprDGoldGrad,floor(global.goldIndex)%4,xRel-offsetX+negatedOffsetX,yRel-offsetY+negatedOffsetY,width/64,height/64,rotation,c_white,1);
    break;
    case color_PURE:
        draw_sprite_ext(sprDPureGrad,floor(global.goldIndex)%4,xRel-offsetX+negatedOffsetX,yRel-offsetY+negatedOffsetY,width/64,height/64,rotation,c_white,1);
    break;
    case color_STONE:
        draw_sprite_ext(sprDStoneTexture,0,xRel-offsetX,yRel-offsetY,width/64,height/64,0,c_white,1); // noone will notice if its not rotated
    break;
    case color_DYNAMITE:
        // hmm cant really rotate this; shouldnt matter too much though
        for(var i = 0; i+1 < height/64; i++) {
            draw_sprite_ext(sprDDynaTexture,floor(global.goldIndex),xRel-offsetX,yRel-offsetY+i*64,width/64,1,0,c_white,1);
        }
        draw_sprite_part_ext(sprDDynaTexture,floor(global.goldIndex),0,0,64,height-i*64,xRel-offsetX,yRel-offsetY+i*64,width/64,1,c_white,1)
        // @addcolor if door image/animation
    break;
    case color_GLITCH:
        setShdEffects(color_GLITCH);
        draw_rectangle_colour(xRel-offsetX+2,yRel-offsetY+2,xRel-offsetX+width-3,yRel-offsetY+height-3,mainTone,mainTone,mainTone,mainTone,false);
        shader_reset();
        var effectiveGlitchMimic = scrEffectiveColor(color_GLITCH,false,true);
        if effectiveGlitchMimic != color_GLITCH {
            var index = 0;
            mainTone = c_white;
            switch effectiveGlitchMimic {
                case color_MASTER: index = 1; break;
                case color_PURE: index = 2; break;
                case color_STONE: index = 3; break;
                case color_DYNAMITE: index = 4; break;
                case color_SILVER: index = 5; break;
                // @addcolor if door image/animation
                default:
                    mainTone = global.mainTone[effectiveGlitchMimic];
                break;
            }
            if backSprite == sprLockAny {
                scrDrawNinePatch(backSprite,index,xRel-offsetX+negatedOffsetX,yRel-offsetY+negatedOffsetY,width,height,9,9,true,mainTone,1,true,0);
            } else {
                draw_sprite_ext(backSprite,index,xRel+negatedOffsetX,yRel+negatedOffsetY,1,1,0,mainTone,1);
            }
        }
    break;
    case color_SILVER:
        draw_sprite_ext(sprDSilverTexture,floor(global.goldIndex)%4,xRel-offsetX+negatedOffsetX,yRel-offsetY+negatedOffsetY,width/64,height/64,rotation,c_white,1);
    break;
    default:
        draw_rectangle_colour(xRel-offsetX+2,yRel-offsetY+2,xRel-offsetX+width-3,yRel-offsetY+height-3,mainTone,mainTone,mainTone,mainTone,false);
        scrDrawDoorAura(color == color_ICE, color == color_MUD, color == color_GRAFFITI,xRel-offsetX,yRel-offsetY,width,height);
    break;
}

if argument13 {return 0;}

// draw lock frame
var index = 0;
if type == lock_BLAST && (denom != 0 || idenom != 0) {
    if (count == 0 && denom == 0 && idenom < 0) ||
        (icount == 0 && idenom == 0 && denom < 0) {
            index = 1;
        }
} else if count < 0 || icount < 0 {index = 1}
if negated {index += 2}

scrDrawNinePatch(sprLockFrame,index,xRel-offsetX,yRel-offsetY,width,height,9,9,false,c_white,1,false);

// draw predefined lock sprite
if isPredefinedSprite {
    index = 0;
    var lockColor = make_color_rgb(44,32,20);
    if count < 0 || icount < 0 { lockColor = make_color_rgb(235,223,211); }
    if icount != 0 { index = 1; }
    if type == lock_EXACT {
        if hasILockTexture {index += 2}
        else {index += 1}
    }
    if negated {
        negatedOffsetX -= 2*offsetX;
        negatedOffsetY -= 2*offsetY;
    }
    draw_sprite_ext(sprite,index,xRel+negatedOffsetX,yRel+negatedOffsetY,1,1,rotation,lockColor,1);
}

draw_set_halign(fa_left);

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
                    numbers += iChar;
                }
            } else {
                lockSymbol = true;
                if verticalText { lockOffsetY = -16; } // offset text start for lock symbol
                else { lockOffsetX = 12; }
                if icount != 0 { // exact lock imaginary symbol
                    index += 1;
                }
            }

            var startX = floor((width - string_width(numbers) - lockOffsetX)/2) + xRel - offsetX;
            var startY = floor((height - lockOffsetY)/2) + yRel - offsetY;
            // number
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
                if negated { draw_sprite_ext(sprSymbols,index,startX+22,startY+16,1,1,180,c_white,1); }
                else { draw_sprite(sprSymbols,index,startX-10,startY-16); }
            }
        }
    break;
    case lock_BLAST:
    case lock_ALL:
        draw_set_font(fTalk);
        draw_set_valign(fa_bottom);
        var nipow = 0;
        if ((denom != 0) != (idenom != 0)) && (count == 0 || icount == 0) {
            if idenom > 0 {nipow = 3;}
            else if denom < 0 {nipow = 2;}
            else if idenom < 0 {nipow = 1;}
        }
        var numerator = strComplex(rotateR(count,icount,nipow),rotateI(count,icount,nipow));
        if numerator == "1" {numerator = "";}

        var symbolOffsetX = 10;
        var strWidth = string_width(numerator) + symbolOffsetX;
        var startX = xRel + round((width - strWidth)/2) - offsetX;
        var startY = yRel + round((height + 14)/2) - offsetY;

        if isPartial {
            var denominator = strComplex(rotateR(denom,idenom,nipow),rotateI(denom,idenom,nipow));
            var denomWidth = string_width(denominator);
            var denomStartX = xRel + round((width - denomWidth)/2) - offsetX;
            var denomStartY = startY + 10;
            startY -= 10;
            draw_text(denomStartX,denomStartY,denominator);

            var lineWidth = max(strWidth,denomWidth);
            var lineStartX = xRel + round((width-lineWidth)/2) - offsetX;
            var lineStartY = yRel + startY+2 - offsetY;
            draw_rectangle(lineStartX,lineStartY,lineStartX+lineWidth,lineStartY+2,false);
        }

        draw_text(startX,startY,numerator);

        var index = 4;
        if type == lock_BLAST {
            switch nipow {
                case 0: index = 2; break;
                case 3: index = 3; break;
                case 2: index = 6; break;
                case 1: index = 7; break;
            }
        }
        draw_sprite(sprSymbols,index,startX+strWidth-symbolOffsetX/2-16,startY-7-16);
    /*
        if denom == 0 && idenom == 0 {
            index = 2;
            if count < 0 {index = 6}
            else if icount > 0 {index = 3}
            else if icount < 0 {index = 7}
            draw_sprite(sprSymbols,index,xRel+width/2-9,yRel+height/2-9); // 180deg symmetrical; no rotation needed
            break;
        } else {
            if icount == 0 && idenom == 0 && denom < 0 { index = 6 } // negative real
            else if count == 0 && denom == 0 {
                if idenom > 0 { index = 3 }  // positive imaginary
                else { index = 7 } // negative imaginary
            } else { index = 2 } // anything complex or positive
        }
    case lock_ALL:
        if denom == 0 && idenom == 0 {
            draw_sprite(sprSymbols,4,xRel+width/2-9,yRel+height/2-9); // 180deg symmetrical; no rotation needed
            break;
        }
        // partial blast/all draw code
        if type == lock_ALL { index = 4; }
        draw_set_font(fTalk);
        xRel -= offsetX;
        yRel -= offsetY;
        var numbersCount = "";
        var numbersDenom = "";
        draw_set_colour(make_colour_rgb(44,32,20));
        // display count and denom divided by the ipow
        if index == 6 { // negative
            count = -count; denom = -denom;
            icount = 0; idenom = 0;
            draw_set_colour(make_colour_rgb(235,223,211))
        } else if index == 3 { // imaginary
            count = icount; denom = idenom;
            icount = 0; idenom = 0;
        } else if index == 7 { // negative imaginary
            count = -icount; denom = -idenom;
            icount = 0; idenom = 0;
            draw_set_colour(make_colour_rgb(235,223,211))
        }

        if icount == 0 { numbersCount = string(count); }
        else {
            if count == 0 { numbersCount = string(icount)+iChar; }
            else if icount > 0 { numbersCount = string(count)+"+"+string(icount)+iChar; }
            else { numbersCount = string(count)+string(icount)+iChar; }
        }
        if numbersCount == "1" { numbersCount = ""; }
        if idenom == 0 { numbersDenom = string(denom); }
        else {
            if denom == 0 { numbersDenom = string(idenom)+iChar; }
            else if idenom > 0 { numbersDenom = string(denom)+"+"+string(idenom)+iChar; }
            else { numbersDenom = string(denom)+string(idenom)+iChar; }
        }

        var strwidth = string_width(numbersCount)
        if strwidth > 0 {strwidth += 2;}

        draw_set_valign(fa_bottom);

        draw_text(xRel+width/2-3-ceil(strwidth/2),yRel+height-16-10,numbersCount)
        if negated { draw_sprite_ext(sprSymbols,index,xRel+width/2+16+floor(strwidth/2),yRel+height/2-8+16,1,1,180,c_white,1); }
        else { draw_sprite(sprSymbols,index,xRel+width/2-16+floor(strwidth/2),yRel+height/2-8-16); }
        draw_text(xRel+width/2-floor(string_width(numbersDenom)/2),yRel+height-8,numbersDenom)

        var linewidth = max(string_width(numbersCount)+9, string_width(numbersDenom))
        draw_rectangle(xRel+floor((width-linewidth)/2),yRel+height/2-1,xRel+floor((width+linewidth)/2),yRel+height/2,false)
        */
    break;
}
draw_set_color(c_white);

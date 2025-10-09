///scrDrawDoorSpend(colorSpend);
//Draws the spend fill of the door, and nothing else.
//TODO: Add Stone glitch lock sprites and draw code
//Main body fill
var baseColorSpend = argument0;

var highTone = c_white;
var mainTone = c_white;
var darkTone = c_white;

if baseColorSpend == color_MASTER{
    draw_sprite_ext(sprDGoldGrad,floor(goldIndex),x,y,w/2,h/2,0,c_white,1);
}else if baseColorSpend == color_PURE{
    draw_sprite_ext(sprDPureGrad,floor(goldIndex),x,y,w/2,h/2,0,c_white,1);
}else if baseColorSpend == color_STONE{
    draw_sprite_ext(sprDStoneTexture,0,x,y,w*.5,h*.5,0,c_white,1);
}else{
    highTone = global.highTone[baseColorSpend];
    mainTone = global.mainTone[baseColorSpend];
    darkTone = global.darkTone[baseColorSpend];

    if baseColorSpend == color_GLITCH{
        shader_set(shdRainbowStripe2);
    }
    //Corner Fills
    draw_sprite_part_ext(sprDoorBig,4,0,0,16,16,x,y,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,4,48,0,16,16,x+32*w-16,y,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,4,0,48,16,16,x,y+32*h-16,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,4,48,48,16,16,x+32*w-16,y+32*h-16,1,1,mainTone,1);
    //Fill
    draw_sprite_part_ext(sprDoorBig,4,16,16,16,16,x+8,y+8,w*2-1,h*2-1,mainTone,1);
    //Edge Fills
    if w>1{
        draw_sprite_part_ext(sprDoorBig,1,16,0,16,16,x+16,y,(w-1)*2,1,highTone,1);
        draw_sprite_part_ext(sprDoorBig,3,16,48,16,16,x+16,y+32*h-16,(w-1)*2,1,darkTone,1);
    }
    if h>1{
        draw_sprite_part_ext(sprDoorBig,2,0,16,16,16,x,y+16,1,(h-1)*2,mainTone,1);
        draw_sprite_part_ext(sprDoorBig,2,48,16,16,16,x+32*w-16,y+16,1,(h-1)*2,mainTone,1);
    }
    //Corner Fills
    draw_sprite_part_ext(sprDoorBig,1,0,0,16,16,x,y,1,1,highTone,1);
    draw_sprite_part_ext(sprDoorBig,1,48,0,16,16,x+32*w-16,y,1,1,highTone,1);
    draw_sprite_part_ext(sprDoorBig,2,0,0,16,16,x,y,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,2,48,0,16,16,x+32*w-16,y,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,2,0,48,16,16,x,y+32*h-16,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,2,48,48,16,16,x+32*w-16,y+32*h-16,1,1,mainTone,1);
    draw_sprite_part_ext(sprDoorBig,3,0,48,16,16,x,y+32*h-16,1,1,darkTone,1);
    draw_sprite_part_ext(sprDoorBig,3,48,48,16,16,x+32*w-16,y+32*h-16,1,1,darkTone,1);
    if baseColorSpend == color_GLITCH{
        shader_reset();
    }
}
//For Glitch Doors, draw an extra part
if baseColorSpend == color_GLITCH && glitchMimic != color_GLITCH {
    var _gSprite;

    highTone = c_white;
    mainTone = c_white;
    darkTone = c_white;

    if glitchMimic == color_MASTER{
        _gSprite = sprDoorGlitchGold;
    }else if glitchMimic == color_PURE{
        _gSprite = sprDoorGlitchPure;
    }else if glitchMimic == color_STONE{
        _gSprite = sprDoorGlitchStone;
    } else {//Flat color door
        _gSprite = sprDoorGlitch;
        highTone = global.highTone[glitchMimic];
        mainTone = global.mainTone[glitchMimic];
        darkTone = global.darkTone[glitchMimic];
    }
    //Now the fun stuff.
    //Corner Inner
    draw_sprite_part_ext(_gSprite,4,0,0,16,16,x,y,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,4,48,0,16,16,x+32*w-16,y,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,4,0,48,16,16,x,y+32*h-16,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,4,48,48,16,16,x+32*w-16,y+32*h-16,1,1,mainTone,1);
    //Edge Inner
    for(var i = 0; i<(2*(w-1)); i+=1){
        draw_sprite_part_ext(_gSprite,4,16,0,16,16,x+16*(i+1),y,1,1,mainTone,1);
        draw_sprite_part_ext(_gSprite,4,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,mainTone,1);
    }
    for(var i = 0; i<(2*(h-1)); i+=1){
        draw_sprite_part_ext(_gSprite,4,0,16,16,16,x,y+16*(i+1),1,1,mainTone,1);
        draw_sprite_part_ext(_gSprite,4,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,mainTone,1);
    }
    //Fill (We use normal fill this time because the doors are drawn differently
    for(var ix = 0; ix<(2*w-3); ix+=1){
        for(var iy = 0; iy<(2*h-3); iy+=1){
            draw_sprite_part_ext(_gSprite,4,16,16,32,32,x+32+16*(ix-1),y+32+16*(iy-1),1,1,mainTone,1);
        }
    }
    //Edges
    for(var i = 0; i<(2*(w-1)); i+=1){
        draw_sprite_part_ext(_gSprite,0,16,0,16,16,x+16*(i+1),y,1,1,highTone,1);
        draw_sprite_part_ext(_gSprite,2,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,darkTone,1);
    }
    for(var i = 0; i<(2*(h-1)); i+=1){
        draw_sprite_part_ext(_gSprite,1,0,16,16,16,x,y+16*(i+1),1,1,mainTone,1);
        draw_sprite_part_ext(_gSprite,1,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,mainTone,1);
    }
    //Corners
    draw_sprite_part_ext(_gSprite,0,0,0,16,16,x,y,1,1,highTone,1);
    draw_sprite_part_ext(_gSprite,0,48,0,16,16,x+32*w-16,y,1,1,highTone,1);
    draw_sprite_part_ext(_gSprite,1,0,0,16,16,x,y,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,1,48,0,16,16,x+32*w-16,y,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,1,0,48,16,16,x,y+32*h-16,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,1,48,48,16,16,x+32*w-16,y+32*h-16,1,1,mainTone,1);
    draw_sprite_part_ext(_gSprite,2,0,48,16,16,x,y+32*h-16,1,1,darkTone,1);
    draw_sprite_part_ext(_gSprite,2,48,48,16,16,x+32*w-16,y+32*h-16,1,1,darkTone,1);
}

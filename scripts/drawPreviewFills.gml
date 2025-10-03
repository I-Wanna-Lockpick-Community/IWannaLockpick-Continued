//TODO: Add Stone glitch lock sprites and draw code
//Main body fill
var effectiveColor = colorSpend;
if colorSpend == color_MASTER{
    draw_sprite_ext(sprDGoldGrad,floor(goldIndex),salDX,salDY,salW/2,salH/2,0,c_white,1);
}else if colorSpend == color_PURE{
    draw_sprite_ext(sprDPureGrad,floor(goldIndex),salDX,salDY,salW/2,salH/2,0,c_white,1);
}else if colorSpend == color_STONE{
    draw_sprite_ext(sprDStoneTexture,0,salDX,salDY,salW*.5,salH*.5,0,c_white,1);
}else{
    if colorSpend == color_GLITCH{
        shader_set(shdRainbowStripe2);
    }
    //Corner Fills
    draw_sprite_part_ext(sprDoorBig,4,0,0,16,16,salDX,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,4,48,0,16,16,salDX+32*salW-16,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,4,0,48,16,16,salDX,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,4,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c5,1);
    //Fill
    draw_sprite_part_ext(sprDoorBig,4,16,16,16,16,salDX+8,salDY+8,salW*2-1,salH*2-1,c5,1);
    //Edge Fills
    if salW>1{
        draw_sprite_part_ext(sprDoorBig,1,16,0,16,16,salDX+16,salDY,(salW-1)*2,1,c4,1);
        draw_sprite_part_ext(sprDoorBig,3,16,48,16,16,salDX+16,salDY+32*salH-16,(salW-1)*2,1,c6,1);
    }
    if salH>1{
        draw_sprite_part_ext(sprDoorBig,2,0,16,16,16,salDX,salDY+16,1,(salH-1)*2,c5,1);
        draw_sprite_part_ext(sprDoorBig,2,48,16,16,16,salDX+32*salW-16,salDY+16,1,(salH-1)*2,c5,1);
    }
    //Corner Fills
    draw_sprite_part_ext(sprDoorBig,1,0,0,16,16,salDX,salDY,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,1,48,0,16,16,salDX+32*salW-16,salDY,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,2,0,0,16,16,salDX,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,0,16,16,salDX+32*salW-16,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,0,48,16,16,salDX,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,3,0,48,16,16,salDX,salDY+32*salH-16,1,1,c6,1);
    draw_sprite_part_ext(sprDoorBig,3,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c6,1);
    if colorSpend == color_GLITCH{
        shader_reset();
    }
}
//For glitch Doors, draw an extra part
if colorSpend == color_GLITCH && glitchMimic != color_GLITCH{
    var _gSprite;
    if glitchMimic == color_MASTER{
        _gSprite = sprDoorGlitchGold;
        c4 = c_white;c5 = c_white;c6 = c_white;
    }else if glitchMimic == color_PURE{
        _gSprite = sprDoorGlitchPure;
        c4 = c_white;c5 = c_white;c6 = c_white;
    }else if glitchMimic == color_STONE{
        _gSprite = sprDoorGlitchStone;
        c4 = c_white;c5 = c_white;c6 = c_white;
    }else{//Flat color door
        _gSprite = sprDoorGlitch;
        colorSpend = glitchMimic;
        scrColorDoor2();
    }
    //Now the fun stuff.
    //Corner Inner
    draw_sprite_part_ext(_gSprite,4,0,0,16,16,salDX,salDY,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,4,48,0,16,16,salDX+32*salW-16,salDY,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,4,0,48,16,16,salDX,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,4,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c5,1);
    //Edge Inner
    for(var i = 0; i<(2*(salW-1)); i+=1){
        draw_sprite_part_ext(_gSprite,4,16,0,16,16,salDX+16*(i+1),salDY,1,1,c5,1);
        draw_sprite_part_ext(_gSprite,4,16,48,16,16,salDX+16*(i+1),salDY+32*salH-16,1,1,c5,1);
    }
    for(var i = 0; i<(2*(salH-1)); i+=1){
        draw_sprite_part_ext(_gSprite,4,0,16,16,16,salDX,salDY+16*(i+1),1,1,c5,1);
        draw_sprite_part_ext(_gSprite,4,48,16,16,16,salDX+32*salW-16,salDY+16*(i+1),1,1,c5,1);
    }
    //Fill (We use normal fill this time because the doors are drawn differently
    for(var ix = 0; ix<(2*salW-3); ix+=1){
        for(var iy = 0; iy<(2*salH-3); iy+=1){
            draw_sprite_part_ext(_gSprite,4,16,16,32,32,salDX+32+16*(ix-1),salDY+32+16*(iy-1),1,1,c5,1);
        }
    }
    //Edges
    for(var i = 0; i<(2*(salW-1)); i+=1){
        draw_sprite_part_ext(_gSprite,0,16,0,16,16,salDX+16*(i+1),salDY,1,1,c4,1);
        draw_sprite_part_ext(_gSprite,2,16,48,16,16,salDX+16*(i+1),salDY+32*salH-16,1,1,c6,1);
    }
    for(var i = 0; i<(2*(salH-1)); i+=1){
        draw_sprite_part_ext(_gSprite,1,0,16,16,16,salDX,salDY+16*(i+1),1,1,c5,1);
        draw_sprite_part_ext(_gSprite,1,48,16,16,16,salDX+32*salW-16,salDY+16*(i+1),1,1,c5,1);
    }
    //Corners
    draw_sprite_part_ext(_gSprite,0,0,0,16,16,salDX,salDY,1,1,c4,1);
    draw_sprite_part_ext(_gSprite,0,48,0,16,16,salDX+32*salW-16,salDY,1,1,c4,1);
    draw_sprite_part_ext(_gSprite,1,0,0,16,16,salDX,salDY,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,1,48,0,16,16,salDX+32*salW-16,salDY,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,1,0,48,16,16,salDX,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,1,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,2,0,48,16,16,salDX,salDY+32*salH-16,1,1,c6,1);
    draw_sprite_part_ext(_gSprite,2,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c6,1);
    //Reset colors...
    colorSpend = effectiveColor;
    scrComboCFunc();
}
//SPEND FILL DRAWING ALL DONE!
//Lock Preview
if (state == 5 || state == 6) && salvageLock = -1{
    draw_sprite_ext(sprBlockWhite,0,salDX,salDY,salW,salH,0,c_white,previewA);
}
//Individual Lock Fills
for(var i = 0; i < salvageLockCount; i += 1){
    if lock[i,0] == color_MASTER{//Holy crap, cropping the lock sprites came in clutch
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = salDX+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = salDY+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprDGoldGrad,floor(goldIndex),tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    }else if lock[i,0] == color_PURE{
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = salDX+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = salDY+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprDPureGrad,floor(goldIndex),tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    }else if lock[i,0] == color_STONE{
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = salDX+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = salDY+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprDStoneTexture,0,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    }else if lock[i,0] == color_GLITCH{
        shader_set(shdRainbowStripe2);
        draw_sprite_ext(lock[i,6],2,salDX+lock[i,4],salDY+lock[i,5],1,1,0,make_color_rgb(180,150,0),1);
        shader_reset();
        if glitchMimic == color_MASTER{
            draw_sprite_ext(lock[i,6],4,salDX+lock[i,4],salDY+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic == color_PURE{
            draw_sprite_ext(lock[i,6],5,salDX+lock[i,4],salDY+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic == color_STONE{
            draw_sprite_ext(lock[i,6],6,salDX+lock[i,4],salDY+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic != color_GLITCH{
            draw_sprite_ext(lock[i,6],3,salDX+lock[i,4],salDY+lock[i,5],1,1,0,scrGetLockColor(lock[i,0]),1);
        }
    }else{
        draw_sprite_ext(lock[i,6],2,salDX+lock[i,4],salDY+lock[i,5],1,1,0,scrGetLockColor(lock[i,0]),1);
    }
    if (state == 5 || state == 6) && salvageLock == i{
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = salDX+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = salDY+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprBlockWhite,0,tempX,tempY,tempW/32,tempH/32,0,c_white,previewA);
    }
}
draw_set_color(c_white); 

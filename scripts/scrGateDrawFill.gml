///scrGateDrawFill();
//Individual Lock Fills
for(var i = 0; i < lockCount; i += 1){
    if lock[i,0] == color_MASTER{//Holy crap, cropping the lock sprites came in clutch
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = x+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = y+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprDGoldGrad,floor(goldIndex)%4,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    }else if lock[i,0] == color_PURE{
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = x+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = y+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprDPureGrad,floor(goldIndex)%4,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    }else if lock[i,0] == color_STONE{
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = x+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = y+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        draw_sprite_ext(sprDStoneTexture,0,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    }else if lock[i,0] == color_DYNAMITE{
        var tempW = sprite_get_width(lock[i,6]);
        var tempH = sprite_get_height(lock[i,6]);
        var tempX = x+lock[i,4]-sprite_get_xoffset(lock[i,6]);
        var tempY = y+lock[i,5]-sprite_get_yoffset(lock[i,6]);
        for(var i = 0; i < tempH/64; i++) {
            draw_sprite_ext(sprDDynaTexture,floor(goldIndex),tempX,tempY+i*64,tempW/64,1,0,c_white,1);
        }
        draw_sprite_part_ext(sprDDynaTexture,floor(goldIndex),tempX,tempY+i*64,tempW,tempH-i*64,tempX,tempY+i*64,tempW/64,1,c_white,1)
        // @addcolor if door image/animation
    }else if lock[i,0] == color_GLITCH{
        shader_set(shdRainbowStripe2);
        draw_sprite_ext(lock[i,6],2,x+lock[i,4],y+lock[i,5],1,1,0,make_color_rgb(180,150,0),1);
        shader_reset();
        if glitchMimic == color_MASTER{
            draw_sprite_ext(lock[i,6],4,x+lock[i,4],y+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic == color_PURE{
            draw_sprite_ext(lock[i,6],5,x+lock[i,4],y+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic == color_STONE{
            draw_sprite_ext(lock[i,6],6,x+lock[i,4],y+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic == color_DYNAMITE{
            draw_sprite_ext(lock[i,6],7,x+lock[i,4],y+lock[i,5],1,1,0,c_white,1);
        }else if glitchMimic != color_GLITCH{
            draw_sprite_ext(lock[i,6],3,x+lock[i,4],y+lock[i,5],1,1,0,scrGetLockColor(lock[i,0]),1);
            // @addcolor if door image/animation
        }
    }else{
        draw_sprite_ext(lock[i,6],2,x+lock[i,4],y+lock[i,5],1,1,0,scrGetLockColor(lock[i,0]),1);
    }
}
draw_set_color(c_white); 

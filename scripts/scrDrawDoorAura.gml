///scrDrawDoorAura(frozen,crumbled,painted,xRel,yRel,width,height);
var xPos = argument3;
var yPos = argument4;
var width = argument5;
var height = argument6;
if argument1{
    if width == 32 && height == 32{
        draw_sprite(sprDirt,0,xPos,yPos);
    }
    if width == 32 && height == 64{
        draw_sprite(sprDirt1x2,0,xPos,yPos);
    }
    if width == 64 && height == 64{
        draw_sprite(sprDirt2x2,0,xPos,yPos);
    }
}
if argument2{
    draw_set_blend_mode(bm_add);
    if width == 32 && height == 32{
        draw_sprite_ext(sprSol,1,xPos,yPos,1,1,0,make_color_rgb(255,255,255),1);
    }
    if width == 32 && height == 64{
        draw_sprite_ext(sprSol1x2,1,xPos,yPos,1,1,0,make_color_rgb(255,255,255),1);
    }
    if width == 64 && height == 64{
        draw_sprite_ext(sprSol2x2,1,xPos,yPos,1,1,0,make_color_rgb(255,255,255),1);
    }
    draw_set_blend_mode(bm_normal);
}
if argument0{
    if width == 32 && height == 32{
        draw_sprite(sprIce,0,xPos,yPos);
    } else if width == 32 && height == 64{
        draw_sprite(sprIce1x2,0,xPos,yPos);
    } else if width == 64 && height == 64{
        draw_sprite(sprIce2x2,0,xPos,yPos);
    } else if width == 96 && height == 64{
        draw_sprite(sprIce3x2,0,xPos,yPos);
    } else {
        shader_set(shdRainbowStripe2);
        shader_set_uniform_f(global.shaderMode,color_ICE);
        shader_set_uniform_f(global.frozenUniPos,xPos,yPos);
        shader_set_uniform_f(global.frozenUniSize,width,height);
        draw_rectangle(xPos,yPos,xPos+width-1,yPos+height-1,false);        
    }
}
shader_reset();
draw_set_blend_mode(bm_normal);

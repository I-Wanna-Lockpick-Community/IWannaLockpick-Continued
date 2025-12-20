///scrDrawDoorAura(frozen,crumbled,painted,xRel,yRel,width,height);
var xPos = argument3;
var yPos = argument4;
var width = argument5;
var height = argument6;
if argument1{
    if width == 32 && height == 32{
        draw_sprite(sprDirt,0,xPos,yPos);
    } else if width == 32 && height == 64{
        draw_sprite(sprDirt1x2,0,xPos,yPos);
    } else if width == 64 && height == 64{
        draw_sprite(sprDirt2x2,0,xPos,yPos);
    } else {
        setShdEffects(color_GREEN);
        shader_set_uniform_f(global.shaderUniPos,xPos,yPos);
        shader_set_uniform_f(global.shaderUniSize,width,height);
        draw_rectangle(xPos,yPos,xPos+width-1,yPos+height-1,false);        
    }
    shader_reset();
}
if argument2{
    draw_set_blend_mode(bm_add);
    if width == 32 && height == 32{
        draw_sprite_ext(sprSol,1,xPos,yPos,1,1,0,make_color_rgb(255,255,255),1);
    } else if width == 32 && height == 64{
        draw_sprite_ext(sprSol1x2,1,xPos,yPos,1,1,0,make_color_rgb(255,255,255),1);
    } else if width == 64 && height == 64{
        draw_sprite_ext(sprSol2x2,1,xPos,yPos,1,1,0,make_color_rgb(255,255,255),1);
    } else {
        setShdEffects(color_BLUE);
        shader_set_uniform_f(global.shaderUniPos,xPos,yPos);
        shader_set_uniform_f(global.shaderUniSize,width,height);
        shader_set_uniform_f(global.shaderUniTile,1);
        var uvInfo = sprite_get_uvs(sprSolRepeat, 0);
        shader_set_uniform_f(global.shaderUniUVPos,uvInfo[0],uvInfo[1]);
        shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[2],uvInfo[3]);
        shader_set_uniform_f(global.shaderUniSpriteSize,128,128);
        draw_sprite_ext(sprSolRepeat,0,xPos,yPos,width/128,height/128,0,c_white,1);  
    }
    draw_set_blend_mode(bm_normal);
    shader_reset();
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
        setShdEffects(color_RED);
        shader_set_uniform_f(global.shaderUniPos,xPos,yPos);
        shader_set_uniform_f(global.shaderUniSize,width,height);
        draw_rectangle(xPos,yPos,xPos+width-1,yPos+height-1,false);        
    }
}
shader_reset();
draw_set_blend_mode(bm_normal);

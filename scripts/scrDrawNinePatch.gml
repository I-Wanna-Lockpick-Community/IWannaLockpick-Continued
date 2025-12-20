//scrDrawNinePatch(sprite,index,xPos,yPos,width,height,cornerWidth,cornerHeight,drawCenter,colour,alpha,tile,(shaderMode));
// draws a nine patch rect
// stretches by default; set tile to true if you want it to tile
// shaderMode is optional, and should only be given if you are using tile
// if shaderMode is given then the shader will be set and reset automatically. otherwise you can do that manually, but note that the shader uniforms will be messed up
// tiling only works with an image whose mask has been set to full image, because of the uv shenanigans we pull

var width = argument[4];
var height = argument[5];

var sW = sprite_get_width(argument[0]);
var sH = sprite_get_height(argument[0]);

var cW = argument[6];
var cH = argument[7];

// edge width and height
var eW = sW - 2*cW
var eH = sH - 2*cH

var xPos = argument[2];
var yPos = argument[3];

// corners
draw_sprite_part_ext(argument[0],argument[1],0,    0,    cW,cH,xPos,         yPos,          1,1,argument[9],argument[10]);
draw_sprite_part_ext(argument[0],argument[1],sW-cW,0,    cW,cH,xPos+width-cW,yPos,          1,1,argument[9],argument[10]);
draw_sprite_part_ext(argument[0],argument[1],0,    sH-cH,cW,cH,xPos,         yPos+height-cH,1,1,argument[9],argument[10]);
draw_sprite_part_ext(argument[0],argument[1],sW-cH,sH-cH,cW,cH,xPos+width-cW,yPos+height-cH,1,1,argument[9],argument[10]);

if argument[11] {
    if argument_count > 12 {setShdEffects(argument[12]);}
    shader_set_uniform_f(global.shaderUniPos,xPos,yPos);
    shader_set_uniform_f(global.shaderUniSize,width,height);
    shader_set_uniform_f(global.shaderUniTile,1);
    var uvInfo = sprite_get_uvs(argument[0],argument[1]);
    var uvScale = (uvInfo[2]-uvInfo[0])/(sW*uvInfo[6]);
    if uvInfo[6] != 1 || uvInfo[7] != 1 {
        // empty space on the edges have been cut off in the texture atlas; uv positions are inaccurate
        // im not sure if the spaces around are guaranteed to be empty
        // if not you can do it the other way
        uvInfo[0] -= uvInfo[4]*uvScale;
        uvInfo[1] -= uvInfo[5]*uvScale;
        uvInfo[2] += (1-uvInfo[6]-(uvInfo[4]/sW))*sW*uvScale;
        uvInfo[3] += (1-uvInfo[7]-(uvInfo[5]/sH))*sH*uvScale;
    }
}
// edges
if width > 2*cW {
    if argument[11] {
        shader_set_uniform_f(global.shaderUniPos,xPos+cW,yPos);
        shader_set_uniform_f(global.shaderUniUVPos,uvInfo[0]+uvScale*cW,uvInfo[1]);
        shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[2]-uvScale*cW,uvInfo[1]+uvScale*cH);
        shader_set_uniform_f(global.shaderUniSpriteSize,eW,cH);
    }
    draw_sprite_part_ext(argument[0],argument[1],cW,0,eW,cH,xPos+cW,yPos,(width-2*cW)/eW,1,argument[9],argument[10]);
    if argument[11] {
        shader_set_uniform_f(global.shaderUniPos,xPos+cW,yPos+height-cH);
        shader_set_uniform_f(global.shaderUniUVPos,uvInfo[0]+uvScale*cW,uvInfo[3]-uvScale*cH);
        shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[2]-uvScale*cW,uvInfo[3]);
    }
    draw_sprite_part_ext(argument[0],argument[1],cW,sH-cH,eW,cH,xPos+cW,yPos+height-cH,(width-2*cW)/eW,1,argument[9],argument[10]);
}
if height > 2*cH {
    if argument[11] {
        shader_set_uniform_f(global.shaderUniPos,xPos,yPos+cH);
        shader_set_uniform_f(global.shaderUniUVPos,uvInfo[0],uvInfo[1]+uvScale*cH);
        shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[0]+uvScale*cW,uvInfo[3]-uvScale*cH);
        shader_set_uniform_f(global.shaderUniSpriteSize,cW,eH);
    }
    draw_sprite_part_ext(argument[0],argument[1],0,cH,cW,eH,xPos,yPos+cH,1,(height-2*cH)/eH,argument[9],argument[10]);
    if argument[11] {
        shader_set_uniform_f(global.shaderUniPos,xPos+width-cW,yPos+cH);
        shader_set_uniform_f(global.shaderUniUVPos,uvInfo[2]-uvScale*cW,uvInfo[1]+uvScale*cH);
        shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[2],uvInfo[3]-uvScale*cH);
    }
    draw_sprite_part_ext(argument[0],argument[1],sW-cW,cH,cW,eH,xPos+width-cW,yPos+cH,1,(height-2*cH)/eH,argument[9],argument[10]);
}
// center
if argument[8] {
    if argument[11] {
        shader_set_uniform_f(global.shaderUniPos,xPos+cW,yPos+cH);
        shader_set_uniform_f(global.shaderUniUVPos,uvInfo[0]+uvScale*cW,uvInfo[1]+uvScale*cH);
        shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[2]-uvScale*cW,uvInfo[3]-uvScale*cH);
        shader_set_uniform_f(global.shaderUniSpriteSize,eW,eH);
    }
    draw_sprite_part_ext(argument[0],argument[1],cW,cH,eW,eH,xPos+cW,yPos+cH,(width-2*cW)/eW,(height-2*cH)/eH,argument[9],argument[10]);
}
if argument_count > 12 {
    shader_reset();
}

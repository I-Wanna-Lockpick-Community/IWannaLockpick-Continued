//setShdTile(sprite,index,shaderMode,xPos,yPos,width,height);
// turns on tiling for the whole sprite; suitable for most uses
setShdEffects(argument2);
shader_set_uniform_f(global.shaderUniPos,argument3,argument4);
shader_set_uniform_f(global.shaderUniSize,argument5,argument6);
shader_set_uniform_f(global.shaderUniTile,1);
var uvInfo = sprite_get_uvs(argument0,argument1);
shader_set_uniform_f(global.shaderUniUVPos,uvInfo[0],uvInfo[1]);
shader_set_uniform_f(global.shaderUniUVEnd,uvInfo[2],uvInfo[3]);
shader_set_uniform_f(global.shaderUniSpriteSize,sprite_get_width(argument0),sprite_get_height(argument0));

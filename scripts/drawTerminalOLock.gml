///drawTerminalOLock(i,lX,lY,lC);
var i = argument0;
var lX = argument1;
var lY = argument2;
var lC = argument3;
if oCol[i] == color_MASTER{
    var tempW = sprite_get_width(sprLockAnyS);
    var tempH = sprite_get_height(sprLockAnyS);
    var tempX = lX-sprite_get_xoffset(sprLockAnyS);
    var tempY = lY-sprite_get_yoffset(sprLockAnyS);
    draw_sprite_ext(sprDGoldGrad,floor(global.goldIndex)%4,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if oCol[i] == color_PURE{
    var tempW = sprite_get_width(sprLockAnyS);
    var tempH = sprite_get_height(sprLockAnyS);
    var tempX = lX-sprite_get_xoffset(sprLockAnyS);
    var tempY = lY-sprite_get_yoffset(sprLockAnyS);
    draw_sprite_ext(sprDPureGrad,floor(global.goldIndex)%4,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if oCol[i] == color_DYNAMITE{
    var tempW = sprite_get_width(sprLockAnyS);
    var tempH = sprite_get_height(sprLockAnyS);
    var tempX = lX-sprite_get_xoffset(sprLockAnyS);
    var tempY = lY-sprite_get_yoffset(sprLockAnyS);
    draw_sprite_ext(sprDDynaTexture,floor(global.goldIndex),tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    // TODO::tile this instead of stretching
    // @addcolor if door image/animation
}else if oCol[i] == color_STONE{
    var tempW = sprite_get_width(sprLockAnyS);
    var tempH = sprite_get_height(sprLockAnyS);
    var tempX = lX-sprite_get_xoffset(sprLockAnyS);
    var tempY = lY-sprite_get_yoffset(sprLockAnyS);
    draw_sprite_ext(sprDStoneTexture,0,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if oCol[i] == color_GLITCH{
    shader_set(shdEffects);
    shader_set_uniform_f(global.shaderMode,color_GLITCH);
    draw_sprite_ext(sprLockAnyS,2,lX,lY,1,1,0,make_color_rgb(180,150,0),1);
    shader_reset();
}else{//Normal key color
    draw_sprite_ext(sprLockAnyS,2,lX,lY,1,1,0,lC,1);
}
//Lock
var lInd = 0;
if global.omegaKey[oCol[i]]{
    lInd = 1;
}
draw_sprite(sprLockAnyS,lInd,lX,lY);
draw_sprite(sprSymbols,17+lInd,lX,lY);

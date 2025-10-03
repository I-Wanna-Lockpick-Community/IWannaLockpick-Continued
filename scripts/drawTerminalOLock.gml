///drawTerminalOLock(i,lX,lY,lC);
var i = argument0;
var lX = argument1;
var lY = argument2;
var lC = argument3;
if oCol[i] == key_MASTER{
    var tempW = sprite_get_width(sprLockAny);
    var tempH = sprite_get_height(sprLockAny);
    var tempX = lX-sprite_get_xoffset(sprLockAny);
    var tempY = lY-sprite_get_yoffset(sprLockAny);
    draw_sprite_ext(sprDGoldGrad,floor(goldIndex),tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if oCol[i] == key_PURE{
    var tempW = sprite_get_width(sprLockAny);
    var tempH = sprite_get_height(sprLockAny);
    var tempX = lX-sprite_get_xoffset(sprLockAny);
    var tempY = lY-sprite_get_yoffset(sprLockAny);
    draw_sprite_ext(sprDPureGrad,floor(goldIndex),tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if oCol[i] == key_STONE{
    var tempW = sprite_get_width(sprLockAny);
    var tempH = sprite_get_height(sprLockAny);
    var tempX = lX-sprite_get_xoffset(sprLockAny);
    var tempY = lY-sprite_get_yoffset(sprLockAny);
    draw_sprite_ext(sprDStoneTexture,0,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if oCol[i] == key_GLITCH{
    shader_set(shdRainbowStripe2);
    draw_sprite_ext(sprLockAny,2,lX,lY,1,1,0,make_color_rgb(180,150,0),1);
    shader_reset();
}else{//Normal key color
    draw_sprite_ext(sprLockAny,2,lX,lY,1,1,0,lC,1);
}
//Lock
var lInd = 0;
if global.omegaKey[oCol[i]]{
    lInd = 1;
}
draw_sprite(sprLockAny,lInd,lX,lY);
draw_sprite(sprSymbols,17+lInd,lX,lY);

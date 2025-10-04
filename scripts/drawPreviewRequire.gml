var tempW = 32*salW - 14;
var tempH = 32*salH - 14;
var tempX = salDX+7;
var tempY = salDY+7;
if color == color_MASTER{
    draw_sprite_ext(sprDGoldGrad,floor(goldIndex)%4,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if color == color_PURE{
    draw_sprite_ext(sprDPureGrad,floor(goldIndex)%4,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if color == color_STONE{
    draw_sprite_ext(sprDStoneTexture,0,tempX,tempY,tempW/64,tempH/64,0,c_white,1);
}else if color == color_DYNAMITE{
    draw_sprite_ext(sprDDynaTexture,floor(goldIndex),tempX,tempY,tempW/64,tempH/64,0,c_white,1);
    // TODO::tile this instead of stretching
    // @addcolor if door image/animation
}else if color == color_GLITCH{
    scrColorDoorArg(color_GLITCH);
    shader_set(shdRainbowStripe2);
    draw_sprite_part_ext(sprDoorBig,4,16,16,16,16,salDX+8,salDY+8,salW*2-1,salH*2-1,c2,1);
    shader_reset();
    scrColorDoor();
    scrColorDoor2();
}else{
    draw_sprite_part_ext(sprDoorBig,4,16,16,16,16,salDX+8,salDY+8,salW*2-1,salH*2-1,c2,1);
}

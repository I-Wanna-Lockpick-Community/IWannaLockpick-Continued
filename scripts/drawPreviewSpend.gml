///Draws the spend fill of the door, and nothing else.
if colorSpend == key_MASTER{
    draw_sprite_ext(sprDGoldGrad,floor(goldIndex),salDX,salDY,salW*.5,salH*.5,0,c_white,1);
}else if colorSpend == key_PURE{
    draw_sprite_ext(sprDPureGrad,floor(goldIndex),salDX,salDY,salW*.5,salH*.5,0,c_white,1);
}else if colorSpend == key_STONE{
    draw_sprite_ext(sprDStoneTexture,0,salDX,salDY,salW*.5,salH*.5,0,c_white,1);
}else if colorSpend == key_GLITCH{
    scrColorDoorArg(key_GLITCH);
    shader_set(shdRainbowStripe2);
    
    //Edges
    if salW>1{
        draw_sprite_part_ext(sprDoorBig,1,16,0,16,16,salDX+16,salDY,(salW-1)*2,1,c4,1);
        draw_sprite_part_ext(sprDoorBig,3,16,48,16,16,salDX+16,salDY+32*salH-16,(salW-1)*2,1,c6,1);
    }
    if salH>1{
        draw_sprite_part_ext(sprDoorBig,2,0,16,16,16,salDX,salDY+16,1,(salH-1)*2,c5,1);
        draw_sprite_part_ext(sprDoorBig,2,48,16,16,16,salDX+32*salW-16,salDY+16,1,(salH-1)*2,c5,1);
    }
    //Corners
    draw_sprite_part_ext(sprDoorBig,1,0,0,16,16,salDX,salDY,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,1,48,0,16,16,salDX+32*salW-16,salDY,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,2,0,0,16,16,salDX,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,0,16,16,salDX+32*salW-16,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,0,48,16,16,salDX,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,3,0,48,16,16,salDX,salDY+32*salH-16,1,1,c6,1);
    draw_sprite_part_ext(sprDoorBig,3,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c6,1);
    
    shader_reset();
    scrColorDoor();
    scrColorDoor2();
}else{
    //Edges
    if salW>1{
        draw_sprite_part_ext(sprDoorBig,1,16,0,16,16,salDX+16,salDY,(salW-1)*2,1,c4,1);
        draw_sprite_part_ext(sprDoorBig,3,16,48,16,16,salDX+16,salDY+32*salH-16,(salW-1)*2,1,c6,1);
    }
    if salH>1{
        draw_sprite_part_ext(sprDoorBig,2,0,16,16,16,salDX,salDY+16,1,(salH-1)*2,c5,1);
        draw_sprite_part_ext(sprDoorBig,2,48,16,16,16,salDX+32*salW-16,salDY+16,1,(salH-1)*2,c5,1);
    }
    //Corners
    draw_sprite_part_ext(sprDoorBig,1,0,0,16,16,salDX,salDY,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,1,48,0,16,16,salDX+32*salW-16,salDY,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,2,0,0,16,16,salDX,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,0,16,16,salDX+32*salW-16,salDY,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,0,48,16,16,salDX,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,3,0,48,16,16,salDX,salDY+32*salH-16,1,1,c6,1);
    draw_sprite_part_ext(sprDoorBig,3,48,48,16,16,salDX+32*salW-16,salDY+32*salH-16,1,1,c6,1);
}

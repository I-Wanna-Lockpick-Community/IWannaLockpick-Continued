///scrDrawDoorFrame(positive);

//Edges
if w > 1{
    draw_sprite_part_ext(sprDoorFrame,argument0,16,0,16,16,x+16,y,(w-1)*2,1,c_white,1);
    draw_sprite_part_ext(sprDoorFrame,argument0,16,48,16,16,x+16,y+32*h-16,(w-1)*2,1,c_white,1);
}
if h > 1{
    draw_sprite_part_ext(sprDoorFrame,argument0,0,16,16,16,x,y+16,1,(h-1)*2,c_white,1);
    draw_sprite_part_ext(sprDoorFrame,argument0,48,16,16,16,x+32*w-16,y+16,1,(h-1)*2,c_white,1);
}
//Corners
draw_sprite_part_ext(sprDoorFrame,argument0,0,0,16,16,x,y,1,1,c_white,1);
draw_sprite_part_ext(sprDoorFrame,argument0,48,0,16,16,x+32*w-16,y,1,1,c_white,1);
draw_sprite_part_ext(sprDoorFrame,argument0,0,48,16,16,x,y+32*h-16,1,1,c_white,1);
draw_sprite_part_ext(sprDoorFrame,argument0,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c_white,1);

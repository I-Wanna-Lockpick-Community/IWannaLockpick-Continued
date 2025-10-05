///Draws the spend fill of the door, and nothing else.
//Edges
if w>1{
    draw_sprite_part_ext(sprDoorBig,1,16,0,16,16,x+16,y,(w-1)*2,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,3,16,48,16,16,x+16,y+32*h-16,(w-1)*2,1,c6,1);
}
if h>1{
    draw_sprite_part_ext(sprDoorBig,2,0,16,16,16,x,y+16,1,(h-1)*2,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,16,16,16,x+32*w-16,y+16,1,(h-1)*2,c5,1);
}
/*for(var i = 0; i<(2*(w-1)); i+=1){
    draw_sprite_part_ext(sprDoorBig,1,16,0,16,16,x+16*(i+1),y,1,1,c4,1);
    draw_sprite_part_ext(sprDoorBig,3,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,c6,1);
}
for(var i = 0; i<(2*(h-1)); i+=1){
    draw_sprite_part_ext(sprDoorBig,2,0,16,16,16,x,y+16*(i+1),1,1,c5,1);
    draw_sprite_part_ext(sprDoorBig,2,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,c5,1);
}*/
//Corners
draw_sprite_part_ext(sprDoorBig,1,0,0,16,16,x,y,1,1,c4,1);
draw_sprite_part_ext(sprDoorBig,1,48,0,16,16,x+32*w-16,y,1,1,c4,1);
draw_sprite_part_ext(sprDoorBig,2,0,0,16,16,x,y,1,1,c5,1);
draw_sprite_part_ext(sprDoorBig,2,48,0,16,16,x+32*w-16,y,1,1,c5,1);
draw_sprite_part_ext(sprDoorBig,2,0,48,16,16,x,y+32*h-16,1,1,c5,1);
draw_sprite_part_ext(sprDoorBig,2,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c5,1);
draw_sprite_part_ext(sprDoorBig,3,0,48,16,16,x,y+32*h-16,1,1,c6,1);
draw_sprite_part_ext(sprDoorBig,3,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c6,1);

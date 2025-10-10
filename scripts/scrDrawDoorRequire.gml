///Draws the require fill of the door, and nothing else.
//Edges
/*if w>1{
    draw_sprite_part_ext(sprDoorSpend,3,16,0,16,16,x+16,y,(w-1)*2,1,c2,1);
    draw_sprite_part_ext(sprDoorSpend,3,16,48,16,16,x+16,y+32*h-16,(w-1)*2,1,c2,1);
}
if h>1{
    draw_sprite_part_ext(sprDoorSpend,3,0,16,16,16,x,y+16,1,(h-1)*2,c2,1);
    draw_sprite_part_ext(sprDoorSpend,3,48,16,16,16,x+32*w-16,y+16,1,(h-1)*2,c2,1);
}*/
/*for(var i = 0; i<(2*(w-1)); i+=1){
    draw_sprite_part_ext(sprDoorSpend,3,16,0,16,16,x+16*(i+1),y,1,1,c2,1);
    draw_sprite_part_ext(sprDoorSpend,3,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,c2,1);
}
for(var i = 0; i<(2*(h-1)); i+=1){
    draw_sprite_part_ext(sprDoorSpend,3,0,16,16,16,x,y+16*(i+1),1,1,c2,1);
    draw_sprite_part_ext(sprDoorSpend,3,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,c2,1);
}*/
//Middle
draw_sprite_part_ext(sprDoorSpend,3,16,16,16,16,x+8,y+8,w*2-1,h*2-1,c2,1);
/*for(var ix = 0; ix<(2*w-3); ix+=1){
    for(var iy = 0; iy<(2*h-3); iy+=1){
        draw_sprite_part_ext(sprDoorSpend,3,16,16,32,32,x+32+16*(ix-1),y+32+16*(iy-1),1,1,c2,1);
    }
}*/
//Corners
/*draw_sprite_part_ext(sprDoorSpend,3,0,0,16,16,x,y,1,1,c2,1);
draw_sprite_part_ext(sprDoorSpend,3,48,0,16,16,x+32*w-16,y,1,1,c2,1);
draw_sprite_part_ext(sprDoorSpend,3,0,48,16,16,x,y+32*h-16,1,1,c2,1);
draw_sprite_part_ext(sprDoorSpend,3,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c2,1);*/

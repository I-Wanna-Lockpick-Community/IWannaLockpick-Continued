//- Frame -
//Edges
for(var i = 0; i<(2*(w-1)); i+=1){
    draw_sprite_part_ext(sprDoorFrame,2,16,0,16,16,x+16*(i+1),y,1,1,global.doorCol1,1);
    draw_sprite_part_ext(sprDoorFrame,4,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,global.doorCol3,1);
}
for(var i = 0; i<(2*(h-1)); i+=1){
    draw_sprite_part_ext(sprDoorFrame,3,0,16,16,16,x,y+16*(i+1),1,1,global.doorCol2,1);
    draw_sprite_part_ext(sprDoorFrame,3,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,global.doorCol2,1);
}
//Corners (Needs some extra since there's more image indices now
draw_sprite_part_ext(sprDoorFrame,2,0,0,16,16,x,y,1,1,global.doorCol1,1);
draw_sprite_part_ext(sprDoorFrame,2,48,0,16,16,x+32*w-16,y,1,1,global.doorCol1,1);
draw_sprite_part_ext(sprDoorFrame,3,0,0,16,16,x,y,1,1,global.doorCol2,1);
draw_sprite_part_ext(sprDoorFrame,3,48,0,16,16,x+32*w-16,y,1,1,global.doorCol2,1);
//Bottom corners
draw_sprite_part_ext(sprDoorFrame,4,0,48,16,16,x,y+32*h-16,1,1,global.doorCol3,1);
draw_sprite_part_ext(sprDoorFrame,4,48,48,16,16,x+32*w-16,y+32*h-16,1,1,global.doorCol3,1);
draw_sprite_part_ext(sprDoorFrame,3,0,48,16,16,x,y+32*h-16,1,1,global.doorCol2,1);
draw_sprite_part_ext(sprDoorFrame,3,48,48,16,16,x+32*w-16,y+32*h-16,1,1,global.doorCol2,1);

//No lock draws yet although I would like it. I don't wanna make a bunch of new lock sprites...

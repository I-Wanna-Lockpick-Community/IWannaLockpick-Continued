x += 112; y += 32; w = 2; h = 2;
color = color_BLACK; colorSpend = color_BLACK;
scrColorDoor(); scrColorDoor2();
c4 = c_gray;
c5 = c_dkgray;
c6 = c_black;
c2 = c5;
scrDrawDoorSpend(colorSpend); scrDrawDoorRequire();
//FRAME
//Determines image index for door frame
var dIndex = 0;
var tempPow = 2;
if tempPow <= 1{dIndex = 6;}else{dIndex = 7;}//+ and +i are positive, - and -i are negative

//Edges
scrComboDrawIm();
/*if w > 1{
    draw_sprite_part_ext(sprDoorBig,dIndex,16,0,16,16,x+16,y,(w-1)*2,1,c_white,1);
    draw_sprite_part_ext(sprDoorBig,dIndex,16,48,16,16,x+16,y+32*h-16,(w-1)*2,1,c_white,1);
}
if h > 1{
    draw_sprite_part_ext(sprDoorBig,dIndex,0,16,16,16,x,y+16,1,(h-1)*2,c_white,1);
    draw_sprite_part_ext(sprDoorBig,dIndex,48,16,16,16,x+32*w-16,y+16,1,(h-1)*2,c_white,1);
}
//Corners
draw_sprite_part_ext(sprDoorBig,dIndex,0,0,16,16,x,y,1,1,c_white,1);
draw_sprite_part_ext(sprDoorBig,dIndex,48,0,16,16,x+32*w-16,y,1,1,c_white,1);
draw_sprite_part_ext(sprDoorBig,dIndex,0,48,16,16,x,y+32*h-16,1,1,c_white,1);
draw_sprite_part_ext(sprDoorBig,dIndex,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c_white,1);*/
//END OF FRAME

//LOCKS
var lMX = x+w*16;
var lMY = y+h*16;
draw_set_color(make_color_hsv(hue,255,255));
draw_set_font(fMiniLevel);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(lMX,lMY-12,string(oCount));
draw_text(lMX,lMY+12,"Ω");
draw_set_color(c_white);
/*for(var i = 0; i < 14; i += 1){
    var lC = scrGetLockColor(oCol[i]);
    var ia = 0 + 360*.618*i;
    var lX = lMX - 16 + lengthdir_x(16+i*4,ia);
    var lY = lMY - 16 + lengthdir_y(16+i*4,ia);
    drawTerminalOLock(i,lX,lY,lC);
}*/

//Reset proportions
x -= 112; y -= 32; w = 3; h = 4;

x -= 32; y -= 176; w = 5; h = 5;
color = color_BLACK; colorSpend = color_BLACK;
scrColorDoor(); scrColorDoor2();
c4 = make_color_hsv(hue,180,255);
c5 = make_color_hsv(hue,230,200);
c6 = make_color_hsv(hue,255,80);
c2 = c5;
scrDrawDoorSpend(colorSpend); scrDrawDoorRequire();
//FRAME
//Determines image index for door frame
var dIndex = 0;
var tempPow = 2;
if tempPow <= 1{dIndex = 6;}else{dIndex = 7;}//+ and +i are positive, - and -i are negative

//Edges
if w > 1{
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
draw_sprite_part_ext(sprDoorBig,dIndex,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c_white,1);
//END OF FRAME

//LOCKS
var lMX = x+w*16;
var lMY = y+h*16;
/*for(var i = 0; i < 14; i += 1){
    var lC = scrGetLockColor(oCol[i]);
    var ia = 0 + 360*.618*i;
    var lX = lMX - 16 + lengthdir_x(16+i*4,ia);
    var lY = lMY - 16 + lengthdir_y(16+i*4,ia);
    drawTerminalOLock(i,lX,lY,lC);
}*/
//Lines
for(var i = 0; i < 3; i += 1){
    var ia = 90 + 360*i/3;
    var lX = lMX + lengthdir_x(20,ia);
    var lY = lMY + lengthdir_y(20,ia);
    var lX2 = lMX + lengthdir_x(20,ia+360/3);
    var lY2 = lMY + lengthdir_y(20,ia+360/3);
    draw_set_color(c4);
    draw_line_width(lX+1,lY+1,lX2+1,lY2+1,3);
    draw_set_color(c6);
    draw_line_width(lX,lY,lX2,lY2,3);
    draw_set_color(c_white);
}
for(var i = 3; i < 3+5; i += 1){
    var ia = 270 + 360*(i-3)/5;
    var lX = lMX + lengthdir_x(42,ia);
    var lY = lMY + lengthdir_y(42,ia);
    var lX2 = lMX + lengthdir_x(42,ia+360/5);
    var lY2 = lMY + lengthdir_y(42,ia+360/5);
    draw_set_color(c4);
    draw_line_width(lX+1,lY+1,lX2+1,lY2+1,3);
    draw_set_color(c6);
    draw_line_width(lX,lY,lX2,lY2,3);
    draw_set_color(c_white);
}
for(var i = 8; i < 8+6; i += 1){
    var ia = 90 + 360*(i-8)/6;
    var lX = lMX + lengthdir_x(64,ia);
    var lY = lMY + lengthdir_y(64,ia);
    var lX2 = lMX + lengthdir_x(64,ia+360/6);
    var lY2 = lMY + lengthdir_y(64,ia+360/6);
    draw_set_color(c4);
    draw_line_width(lX+1,lY+1,lX2+1,lY2+1,3);
    draw_set_color(c6);
    draw_line_width(lX,lY,lX2,lY2,3);
    draw_set_color(c_white);
}
//Locks
for(var i = 0; i < 3; i += 1){
    var lC = scrGetLockColor(oCol[i]);
    var ia = 90 + 360*i/3;
    var lX = lMX - 16 + lengthdir_x(20,ia);
    var lY = lMY - 16 + lengthdir_y(20,ia);
    drawTerminalOLock(i,lX,lY,lC);
    var lX2 = lMX - 16 + lengthdir_x(20,ia+360/3);
    var lY2 = lMY - 16 + lengthdir_y(20,ia+360/3);
}
for(var i = 3; i < 3+5; i += 1){
    var lC = scrGetLockColor(oCol[i]);
    var ia = 270 + 360*(i-3)/5;
    var lX = lMX - 16 + lengthdir_x(42,ia);
    var lY = lMY - 16 + lengthdir_y(42,ia);
    drawTerminalOLock(i,lX,lY,lC);
}
for(var i = 8; i < 8+6; i += 1){
    var lC = scrGetLockColor(oCol[i]);
    var ia = 90 + 360*(i-8)/6;
    var lX = lMX - 16 + lengthdir_x(64,ia);
    var lY = lMY - 16 + lengthdir_y(64,ia);
    drawTerminalOLock(i,lX,lY,lC);
}

//Reset proportions
x += 32; y += 176; w = 3; h = 4;

//scrDrawNinePatchStretch(sprite,index,xPos,yPos,width,height,cornerWidth,cornerHeight,drawCenter,colour,alpha);
// draws a nine patch rect, by stretching

var width = argument4;
var height = argument5;

var sW = sprite_get_width(argument0);
var sH = sprite_get_height(argument0);

var cW = argument6;
var cH = argument7;

// edge width and height
var eW = sW - 2*cW
var eH = sH - 2*cH

var xPos = argument2;
var yPos = argument3;

// corners
draw_sprite_part_ext(argument0,argument1,0,    0,    cW,cH,xPos,         yPos,          1,1,argument9,argument10);
draw_sprite_part_ext(argument0,argument1,sW-cW,0,    cW,cH,xPos+width-cW,yPos,          1,1,argument9,argument10);
draw_sprite_part_ext(argument0,argument1,0,    sH-cH,cW,cH,xPos,         yPos+height-cH,1,1,argument9,argument10);
draw_sprite_part_ext(argument0,argument1,sW-cH,sH-cH,cW,cH,xPos+width-cW,yPos+height-cH,1,1,argument9,argument10);
// edges
if width > 2*cW {
    draw_sprite_part_ext(argument0,argument1,cW,0,    eW,cH,xPos+cW,yPos,          (width-2*cW)/eW,1,argument9,argument10);
    draw_sprite_part_ext(argument0,argument1,cW,sH-cH,eW,cH,xPos+cW,yPos+height-cH,(width-2*cW)/eW,1,argument9,argument10);
}
if height > 2*cH {
    draw_sprite_part_ext(argument0,argument1,0,    cH,cW,eH,xPos,      yPos+cH,1,(height-2*cH)/eH,argument9,argument10);
    draw_sprite_part_ext(argument0,argument1,sW-cW,cH,cW,eH,xPos+width-cW,yPos+cH,1,(height-2*cH)/eH,argument9,argument10);
}
// center
if argument8 {
    draw_sprite_part_ext(argument0,argument1,cW,cH,eW,eH,xPos+cW,yPos+cH,(width-2*cW)/eW,(height-2*cH)/eH,argument9,argument10);
}

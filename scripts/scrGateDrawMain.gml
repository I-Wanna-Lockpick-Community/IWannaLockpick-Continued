///scrGateDrawMain();
//Very similar to Combo Doors, but simplified in a lot of parts.

//PRELIM
goldIndex = (goldIndex + goldSpd) mod 4;
dynaIndex = (dynaIndex + goldSpd) mod 12;

//FILL
for(var ix = 0; ix < w; ix += 1){
    for(var iy = 0; iy < h; iy += 1){
        if ix<(w-.5) && iy<(h-.5){
            draw_sprite_ext(sprGateCheckers,0,x+32*ix,y+32*iy,1,1,0,c_white,image_alpha);
        }else if ix==(w-.5) && iy<(h-.5){
            draw_sprite_ext(sprGateCheckers,1,x+32*ix,y+32*iy,1,1,0,c_white,image_alpha);
        }else if ix<(w-.5) && iy==(h-.5){
            draw_sprite_ext(sprGateCheckers,2,x+32*ix,y+32*iy,1,1,0,c_white,image_alpha);
        }else if ix==(w-.5) && iy==(h-.5){
            draw_sprite_ext(sprGateCheckers,3,x+32*ix,y+32*iy,1,1,0,c_white,image_alpha);
        }
    }
}
scrGateDrawFill();

//FRAME (Left Right Up Down)
draw_sprite_ext(sprGateOutline,0,x+32*w,y,1,h*2,0,outCol,1);
draw_sprite_ext(sprGateOutline,1,x-16,y,1,h*2,0,outCol,1);
draw_sprite_ext(sprGateOutline,2,x,y+32*h,w*2,1,0,outCol,1);
draw_sprite_ext(sprGateOutline,3,x,y-16,w*2,1,0,outCol,1);

//LOCKS
iPow = 0;
scrComboDrawLocks();

draw_set_color(c_white);
draw_set_alpha(1);

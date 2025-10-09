///scrDrawDoorAura();

if aura[1]{
    if w==1 && h==1{
        draw_sprite(sprDirt,0,x,y);
    }
    if w==1 && h==2{
        draw_sprite(sprDirt1x2,0,x,y);
    }
    if w==2 && h==2{
        draw_sprite(sprDirt2x2,0,x,y);
    }
}
if aura[2]{
    draw_set_blend_mode(bm_add);
    if w==1 && h==1{
        draw_sprite_ext(sprSol,1,x,y,1,1,0,make_color_rgb(255,255,255),1);
    }
    if w==1 && h==2{
        draw_sprite_ext(sprSol1x2,1,x,y,1,1,0,make_color_rgb(255,255,255),1);
    }
    if w==2 && h==2{
        draw_sprite_ext(sprSol2x2,1,x,y,1,1,0,make_color_rgb(255,255,255),1);
    }
    draw_set_blend_mode(bm_normal);
}
if aura[0]{
    if w==1 && h==1{
        draw_sprite(sprIce,0,x,y);
    }
    if w==1 && h==2{
        draw_sprite(sprIce1x2,0,x,y);
    }
    if w==2 && h==2{
        draw_sprite(sprIce2x2,0,x,y);
    }
    if w==3 && h==2{
        draw_sprite(sprIce3x2,0,x,y);
    }
}

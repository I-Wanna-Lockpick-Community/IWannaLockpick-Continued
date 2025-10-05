///drawKeyFlash();
//Draws the flashing key when picked up with the INF property
if whiteFlash > 0{//White flashing key
    fog_trick(c_white,whiteFlash);
    switch type{
        case key_NORMAL:
        case key_SIGNFLIP:
        case key_POSROTOR:
        case key_NEGROTOR:
            if color == color_MASTER{
                draw_sprite_ext(sprKMaster,0,x,y,1,1,0,c_white,whiteFlash);
            } else if color == color_SILVER{
                draw_sprite_ext(sprKSilver,0,x,y,1,1,0,c_white,whiteFlash);
                // @addcolor if nonstandard key shape
            }else{
                draw_sprite_ext(sprKey,5,x,y,1,1,0,c_white,whiteFlash);
            }
        break;
        case key_EXACT:
            if color == color_MASTER{
                draw_sprite_ext(sprKMasterAbs,0,x,y,1,1,0,c_white,whiteFlash);
            else if color == color_SILVER{
                draw_sprite_ext(sprKMasterAbs,0,x,y,1,1,0,c_white,whiteFlash);
                // @addcolor if nonstandard key shape
            }else{
                draw_sprite_ext(sprKeyAbs,6,x,y,1,1,0,c_white,whiteFlash);
            }
        break;
        case key_STAR:
            draw_sprite_ext(sprKMasterStar,0,x,y,1,1,0,c_white,whiteFlash);
        break;
        case key_UNSTAR:
            draw_sprite_ext(sprKMasterStar2,0,x,y,1,1,0,c_white,whiteFlash);
        break;
    }
    fog_trick();
    whiteFlash = max(whiteFlash-.1,0);
}

///drawKeyFlash();
//Draws the flashing key when picked up with the INF property
if whiteFlash > 0{//White flashing key
    fog_trick(c_white,whiteFlash);
    switch type{
        case 0:
        case 5://signflip
        case 6://i+
        case 7://i-
            if color == color_MASTER{
                draw_sprite_ext(sprKMaster,0,x,y,1,1,0,c_white,whiteFlash);
            } else if color == color_SILVER{
                draw_sprite_ext(sprKSilver,0,x,y,1,1,0,c_white,whiteFlash);
            }else{
                draw_sprite_ext(sprKey,5,x,y,1,1,0,c_white,whiteFlash);
            }
        break;
        case 1://exact
            if color == color_MASTER {
                draw_sprite_ext(sprKMasterAbs,0,x,y,1,1,0,c_white,whiteFlash);
            } else if color == color_SILVER{
                draw_sprite_ext(sprKMasterAbs,0,x,y,1,1,0,c_white,whiteFlash);
            }else{
                draw_sprite_ext(sprKeyAbs,6,x,y,1,1,0,c_white,whiteFlash);
            }
        break;
        case 3://star
            draw_sprite_ext(sprKMasterStar,0,x,y,1,1,0,c_white,whiteFlash);
        break;
        case 4://unstar
            draw_sprite_ext(sprKMasterStar2,0,x,y,1,1,0,c_white,whiteFlash);
        break;
    }
    fog_trick();
    whiteFlash = max(whiteFlash-.1,0);
}

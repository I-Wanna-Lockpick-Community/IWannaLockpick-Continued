if glitchMimic == color_MASTER{
    //Change these in I Wanna Lockpick because the types are shifted
    if type == 0 || type == 5 || type == 6 || type == 7{//Normal
        draw_sprite(sprKMasterGlitch,0,x,y);
    }else if type == 1{//Exact
        draw_sprite(sprKMasterGlitch,1,x,y);
    }else if type == 3{//Star
        draw_sprite(sprKMasterGlitch,2,x,y);
    }else{//Unstar
        draw_sprite(sprKMasterGlitch,3,x,y);
    }
}else if glitchMimic == color_PURE{
    //Change these in I Wanna Lockpick because the types are shifted
    if type == 0 || type == 5 || type == 6 || type == 7{//Normal
        draw_sprite(sprKPureGlitch,0,x,y);
    }else if type == 1{//Exact
        draw_sprite(sprKPureGlitch,1,x,y);
    }else if type == 3{//Star
        draw_sprite(sprKPureGlitch,2,x,y);
    }else{//Unstar
        draw_sprite(sprKPureGlitch,3,x,y);
    }
}else if glitchMimic == color_STONE{
    //Change these in I Wanna Lockpick because the types are shifted
    if type == 0 || type == 5 || type == 6 || type == 7{//Normal
        draw_sprite(sprKStoneGlitch,0,x,y);
    }else if type == 1{//Exact
        draw_sprite(sprKStoneGlitch,1,x,y);
    }else if type == 3{//Star
        draw_sprite(sprKStoneGlitch,2,x,y);
    }else{//Unstar
        draw_sprite(sprKStoneGlitch,3,x,y);
    }
}else if glitchMimic == color_DYNAMITE{
    //Change these in I Wanna Lockpick because the types are shifted
    if type == 0 || type == 5 || type == 6 || type == 7{//Normal
        draw_sprite(sprKDynamiteGlitch,0,x,y);
    }else if type == 1{//Exact
        draw_sprite(sprKDynamiteGlitch,1,x,y);
    }else if type == 3{//Star
        draw_sprite(sprKDynamiteGlitch,2,x,y);
    }else{//Unstar
        draw_sprite(sprKDynamiteGlitch,3,x,y);
    }
    // @addcolor if key image/animation
}else{//Normal keys
    var _cstored = color;
    color = glitchMimic;
    scrColorKey();
    draw_sprite_ext(sprite_index,4,x,y,1,1,0,blend,1);
    color = _cstored;
    scrColorKey();
}

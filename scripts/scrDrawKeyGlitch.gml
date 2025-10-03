if colorCopy == key_MASTER{
	// @addcolor if anim
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
}else if colorCopy == key_PURE{
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
}else if colorCopy == key_STONE{
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
	// @addcolor if key image/animation
}else{//Normal keys
    var _cstored = color;
    color = colorCopy;
    scrColorKey();
    draw_sprite_ext(sprite_index,4,x,y,1,1,0,blend,1);
    color = _cstored;
    scrColorKey();
}

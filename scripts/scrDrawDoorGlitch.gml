///scrDrawDoorGlitch(isSpend);
var _gSprite;
if argument0{//Draw the spend (back) sprite
    if colorCopy == key_MASTER{
        _gSprite = sprDoorGlitchGold;
        c4 = c_white;c5 = c_white;c6 = c_white;
    }else if colorCopy == key_PURE{
        _gSprite = sprDoorGlitchPure;
        c4 = c_white;c5 = c_white;c6 = c_white;
    }else if colorCopy == key_STONE{
        _gSprite = sprDoorGlitchStone;
        c4 = c_white;c5 = c_white;c6 = c_white;
    }else{//Flat color door
        _gSprite = sprDoorGlitch;
        scrColorDoorArg(colorCopy);
    }
    //Edges
    for(var i = 0; i<(2*(w-1)); i+=1){
        draw_sprite_part_ext(_gSprite,0,16,0,16,16,x+16*(i+1),y,1,1,c4,1);
        draw_sprite_part_ext(_gSprite,2,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,c6,1);
    }
    for(var i = 0; i<(2*(h-1)); i+=1){
        draw_sprite_part_ext(_gSprite,1,0,16,16,16,x,y+16*(i+1),1,1,c5,1);
        draw_sprite_part_ext(_gSprite,1,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,c5,1);
    }
    //Corners
    draw_sprite_part_ext(_gSprite,0,0,0,16,16,x,y,1,1,c4,1);
    draw_sprite_part_ext(_gSprite,0,48,0,16,16,x+32*w-16,y,1,1,c4,1);
    draw_sprite_part_ext(_gSprite,1,0,0,16,16,x,y,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,1,48,0,16,16,x+32*w-16,y,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,1,0,48,16,16,x,y+32*h-16,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,1,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c5,1);
    draw_sprite_part_ext(_gSprite,2,0,48,16,16,x,y+32*h-16,1,1,c6,1);
    draw_sprite_part_ext(_gSprite,2,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c6,1);
}else{//Draw the require (front) sprite
    if colorCopy == key_MASTER{
        _gSprite = sprDoorGlitchGold;
        c1 = c_white;c2 = c_white;c3 = c_white;
    }else if colorCopy == key_PURE{
        _gSprite = sprDoorGlitchPure;
        c1 = c_white;c2 = c_white;c3 = c_white;
    }else if colorCopy == key_STONE{
        _gSprite = sprDoorGlitchStone;
        c1 = c_white;c2 = c_white;c3 = c_white;
		// @addcolor if door image/animation
    }else{//Flat color door
        _gSprite = sprDoorGlitch;
        scrColorDoorArg(colorCopy);
    }
    //Edges
    for(var i = 0; i<(2*(w-1)); i+=1){
        draw_sprite_part_ext(_gSprite,3,16,0,16,16,x+16*(i+1),y,1,1,c2,1);
        draw_sprite_part_ext(_gSprite,3,16,48,16,16,x+16*(i+1),y+32*h-16,1,1,c2,1);
    }
    for(var i = 0; i<(2*(h-1)); i+=1){
        draw_sprite_part_ext(_gSprite,3,0,16,16,16,x,y+16*(i+1),1,1,c2,1);
        draw_sprite_part_ext(_gSprite,3,48,16,16,16,x+32*w-16,y+16*(i+1),1,1,c2,1);
    }
    //Middle
    for(var ix = 0; ix<(2*w-3); ix+=1){
        for(var iy = 0; iy<(2*h-3); iy+=1){
            draw_sprite_part_ext(_gSprite,3,16,16,32,32,x+32+16*(ix-1),y+32+16*(iy-1),1,1,c2,1);
        }
    }
    //Corners
    draw_sprite_part_ext(_gSprite,3,0,0,16,16,x,y,1,1,c2,1);
    draw_sprite_part_ext(_gSprite,3,48,0,16,16,x+32*w-16,y,1,1,c2,1);
    draw_sprite_part_ext(_gSprite,3,0,48,16,16,x,y+32*h-16,1,1,c2,1);
    draw_sprite_part_ext(_gSprite,3,48,48,16,16,x+32*w-16,y+32*h-16,1,1,c2,1);
}

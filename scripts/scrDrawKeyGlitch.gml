var index = 0;
switch type {
    case key_EXACT: index = 1; break;
    case key_STAR: index = 2; break;
    case key_UNSTAR: index = 3; break;
    case key_CURSE: index = 4; break;
    case key_UNCURSE: index = 5; break;
}
switch glitchMimic {
    case color_MASTER: draw_sprite(sprKMasterGlitch,index,x,y); break;
    case color_PURE: draw_sprite(sprKPureGlitch,index,x,y); break;
    case color_STONE: draw_sprite(sprKStoneGlitch,index,x,y); break;
    case color_DYNAMITE: draw_sprite(sprKDynamiteGlitch,index,x,y); break;
    case color_ICE: draw_sprite(sprKIceGlitch,index,x,y); break;
    case color_MUD: draw_sprite(sprKMudGlitch,index,x,y); break;
    case color_GRAFFITI: draw_sprite(sprKGraffitiGlitch,index,x,y); break;
    // @addcolor if key image/animation
    default: draw_sprite_ext(sprite_index,4,x,y,1,1,0,global.mainTone[glitchMimic],1); break;
}

var auraPlayNoise = 0;
if objPlayer.aura[0] == 1 && aura[0] == 1 && !hasColor(color_MAROON){ //Red key
    aura[0] = 0;
    auraPlayNoise = 1;
    debrisColor = color_WHITE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == 1 && aura[1] == 1 && !hasColor(color_FOREST){ //Green key
    aura[1] = 0;
    auraPlayNoise = 1;
    debrisColor = color_BROWN;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == 1 && aura[2] == 1 && !hasColor(color_NAVY){ //Blue key
    aura[2] = 0;
    auraPlayNoise = 1;
    debrisColor = color_ORANGE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if object_index == oRemoteLock && armament {return 0;}
//Dark auras
if objPlayer.aura[0] == -1 && aura[0] == 0 && !hasColor(color_RED) && !isAllColor(color_ICE){ //Maroon key
    show_debug_message(isAllColor(color_ICE))
    aura[0] = 1;
    auraPlayNoise = 1;
    debrisColor = color_WHITE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == -1 && aura[1] == 0 && !hasColor(color_GREEN) && !isAllColor(color_MUD){ //Forest key
    aura[1] = 1;
    auraPlayNoise = 1;
    debrisColor = color_BROWN;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == -1 && aura[2] == 0 && !hasColor(color_BLUE) && !isAllColor(color_GRAFFITI){ //Navy key
    aura[2] = 1;
    auraPlayNoise = 1;
    debrisColor = color_ORANGE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if auraPlayNoise{
    scrPlaySoundExt(sndCrumble,1,1,false);
}

if object_index == oDoorCombo {debrisColor = baseColorSpend;}
else {debrisColor = baseColor;}

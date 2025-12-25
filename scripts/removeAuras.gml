var auraPlayNoise = 0;
var noColorSpend = object_index == oRemoteLock;
if objPlayer.aura[0] == 1 && aura[0] == 1 && (color != color_MAROON && (noColorSpend || colorSpend != color_MAROON) && glitchMimic != color_MAROON){ //Red key
    aura[0] = 0;
    auraPlayNoise = 1;
    debrisColor = color_WHITE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == 1 && aura[1] == 1 && (color != color_FOREST && (noColorSpend || colorSpend != color_FOREST) && glitchMimic != color_FOREST){ //Green key
    aura[1] = 0;
    auraPlayNoise = 1;
    debrisColor = color_BROWN;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == 1 && aura[2] == 1 && (color != color_NAVY && (noColorSpend || colorSpend != color_NAVY) && glitchMimic != color_NAVY){ //Blue key
    aura[2] = 0;
    auraPlayNoise = 1;
    debrisColor = color_ORANGE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if object_index == oRemoteLock && armament {return 0;}
//Dark auras
if objPlayer.aura[0] == -1 && aura[0] != 1 && (color != color_RED && (noColorSpend || colorSpend != color_RED) && glitchMimic != color_RED){ //Maroon key
    aura[0] = 1;
    auraPlayNoise = 1;
    debrisColor = color_WHITE;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == -1 && aura[1] != 1 && (color != color_GREEN && (noColorSpend || colorSpend != color_GREEN) && glitchMimic != color_GREEN){ //Forest key
    aura[1] = 1;
    auraPlayNoise = 1;
    debrisColor = color_BROWN;
    event_user(0);
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == -1 && aura[2] != 1 && (color != color_BLUE && (noColorSpend || colorSpend != color_BLUE) && glitchMimic != color_BLUE){ //Navy key
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
debrisColor = baseColor;

var auraPlayNoise = 0;
if objPlayer.aura[0] == 1 && aura[0] == 1 && (color != color_MAROON && colorSpend != color_MAROON && glitchMimic != color_MAROON){ //Red key
    aura[0] = 0;
    auraPlayNoise = 1;
    var colorOld = color;
    color = color_WHITE;
    scrColorDoor();
    event_user(0);
    color = colorOld;
    scrColorDoor();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == 1 && aura[1] == 1 && (color != color_FOREST && colorSpend != color_FOREST && glitchMimic != color_FOREST){ //Green key
    aura[1] = 0;
    auraPlayNoise = 1;
    var colorOld = color;
    color = color_BROWN;
    scrColorDoor();
    event_user(0);
    color = colorOld;
    scrColorDoor();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == 1 && aura[2] == 1 && (color != color_NAVY && colorSpend != color_NAVY && glitchMimic != color_NAVY){ //Blue key
    aura[2] = 0;
    auraPlayNoise = 1;
    var colorOld = color;
    color = color_ORANGE;
    scrColorDoor();
    event_user(0);
    color = colorOld;
    scrColorDoor();
    brownNearPlayer = 1;
    undoBUFFER();
}
//Dark auras
if objPlayer.aura[0] == -1 && aura[0] != 1 && (color != color_RED && colorSpend != color_RED && glitchMimic != color_RED){ //Maroon key
    aura[0] = 1;
    auraPlayNoise = 1;
    var colorOld = color;
    color = color_WHITE;
    scrColorDoor();
    event_user(0);
    color = colorOld;
    scrColorDoor();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == -1 && aura[1] != 1 && (color != color_GREEN && colorSpend != color_GREEN && glitchMimic != color_GREEN){ //Forest key
    aura[1] = 1;
    auraPlayNoise = 1;
    var colorOld = color;
    color = color_BROWN;
    scrColorDoor();
    event_user(0);
    color = colorOld;
    scrColorDoor();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == -1 && aura[2] != 1 && (color != color_BLUE && colorSpend != color_BLUE && glitchMimic != color_BLUE){ //Navy key
    aura[2] = 1;
    auraPlayNoise = 1;
    var colorOld = color;
    color = color_ORANGE;
    scrColorDoor();
    event_user(0);
    color = colorOld;
    scrColorDoor();
    brownNearPlayer = 1;
    undoBUFFER();
}
if auraPlayNoise{
    scrPlaySoundExt(sndCrumble,1,1,false);
}

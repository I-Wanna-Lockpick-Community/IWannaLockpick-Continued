var auraE; //auraE is short for Aura Eligibility
for (var i = 0; i < 6; i+=1) {
    auraE[i] = 1;
}

//Immunities to the auras of..
//Red
if colorSpend == color_MAROON || glitchMimic == color_MAROON{auraE[0] = 0}
for(var i = 0; i < lockCount; i += 1){if lock[i,0] == color_MAROON{auraE[0] = 0}}
//Green
if colorSpend == color_FOREST || glitchMimic == color_FOREST{auraE[1] = 0}
for(var i = 0; i < lockCount; i += 1){if lock[i,0] == color_FOREST{auraE[1] = 0}}
//Blue
if colorSpend == color_NAVY || glitchMimic == color_NAVY{auraE[2] = 0}
for(var i = 0; i < lockCount; i += 1){if lock[i,0] == color_NAVY{auraE[2] = 0}}
//Maroon
if colorSpend == color_RED || glitchMimic == color_RED{auraE[3] = 0}
for(var i = 0; i < lockCount; i += 1){if lock[i,0] == color_RED{auraE[3] = 0}}
//Forest
if colorSpend == color_GREEN || glitchMimic == color_GREEN{auraE[4] = 0}
for(var i = 0; i < lockCount; i += 1){if lock[i,0] == color_GREEN{auraE[4] = 0}}
//Navy
if colorSpend == color_BLUE || glitchMimic == color_BLUE{auraE[5] = 0}
for(var i = 0; i < lockCount; i += 1){if lock[i,0] == color_BLUE{auraE[5]= 0}}

//Rest of the script, light auras
var auraPlayNoise = 0;
if objPlayer.aura[0] == 1 && aura[0] == 1 && auraE[0] != 0{ //Red
    aura[0] = 0;
    auraPlayNoise = 1;
    var colorOld = colorSpend;
    colorSpend = color_WHITE;
    scrComboCFunc();
    event_user(0);
    colorSpend = colorOld;
    scrComboCFunc();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == 1 && aura[1] == 1 && auraE[1] != 0{ //Green
    aura[1] = 0;
    auraPlayNoise = 1;
    var colorOld = colorSpend;
    colorSpend = color_BROWN;
    scrComboCFunc();
    event_user(0);
    colorSpend = colorOld;
    scrComboCFunc();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == 1 && aura[2] == 1 && auraE[2] != 0{ //Blue
    aura[2] = 0;
    auraPlayNoise = 1;
    var colorOld = colorSpend;
    colorSpend = color_ORANGE;
    scrComboCFunc();
    event_user(0);
    colorSpend = colorOld;
    scrComboCFunc();
    brownNearPlayer = 1;
    undoBUFFER();
}
//Dark auras
if objPlayer.aura[0] == -1 && aura[0] != 1 && auraE[3] != 0{ //Maroon
    aura[0] = 1;
    auraPlayNoise = 1;
    var colorOld = colorSpend;
    colorSpend = color_WHITE;
    scrComboCFunc();
    event_user(0);
    colorSpend = colorOld;
    scrComboCFunc();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[1] == -1 && aura[1] != 1 && auraE[4] != 0{ //Forest
    aura[1] = 1;
    auraPlayNoise = 1;
    var colorOld = colorSpend;
    colorSpend = color_BROWN;
    scrComboCFunc();
    event_user(0);
    colorSpend = colorOld;
    scrComboCFunc();
    brownNearPlayer = 1;
    undoBUFFER();
}
if objPlayer.aura[2] == -1 && aura[2] != 1 && auraE[5] != 0{ //Navy
    aura[2] = 1;
    auraPlayNoise = 1;
    var colorOld = colorSpend;
    colorSpend = color_ORANGE;
    scrComboCFunc();
    event_user(0);
    colorSpend = colorOld;
    scrComboCFunc();
    brownNearPlayer = 1;
    undoBUFFER();
}
if auraPlayNoise{
    scrPlaySoundExt(sndCrumble,1,1,false);
}

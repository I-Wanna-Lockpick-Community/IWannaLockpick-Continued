var auraPlayNoise = 0;
if objPlayer.aura[0] == 1 && aura[0] == 1{
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
if objPlayer.aura[1] == 1 && aura[1] == 1{
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
if objPlayer.aura[2] == 1 && aura[2] == 1{
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
if objPlayer.aura[0] == -1 && aura[0] != 1{
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
if objPlayer.aura[1] == -1 && aura[1] != 1{
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
if objPlayer.aura[2] == -1 && aura[2] != 1{
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

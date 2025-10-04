var auraPlayNoise = 0;
if objPlayer.curseMode == 1 && cursed != objPlayer.curseColor && cursed != color_PURE
&& !(color == objPlayer.curseColor && colorSpend == objPlayer.curseColor){
    cursed = objPlayer.curseColor;
    var colorOld = color;
    var colorOld2 = colorSpend;
    color = objPlayer.curseColor;
    colorSpend = objPlayer.curseColor;
    scrColorDoor();
    scrColorDoor2();
    color = colorOld;
    colorSpend = colorOld2;
    scrPlaySoundExt(sndCopy1,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if objPlayer.curseMode == -1 && cursed == objPlayer.curseColor {
    cursed = -1;
    scrColorDoor();
    scrColorDoor2();
    scrPlaySoundExt(sndCopy2,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}

if cursed != -1 && cursed != color_PURE {
    effectiveColor = cursed;
    effectiveColorSpend = cursed;
}else{
    effectiveColor = color;
    effectiveColorSpend = colorSpend;
}

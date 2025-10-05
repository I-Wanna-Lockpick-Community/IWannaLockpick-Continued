if effectiveColor == color_PURE || effectiveColorSpend == color_PURE {exit;}
var auraPlayNoise = 0;
if objPlayer.curseMode == 1 && cursed != objPlayer.curseColor && cursed != color_PURE
&& !(color == objPlayer.curseColor && colorSpend == objPlayer.curseColor) {
    cursed = objPlayer.curseColor;
    if cursed != color_PURE {
        var colorOld = color;
        var colorOld2 = colorSpend;
        color = cursed;
        colorSpend = cursed;
        effectiveColor = cursed;
        effectiveColorSpend = cursed;
        scrColorDoor();
        scrColorDoor2();
        color = colorOld;
        colorSpend = colorOld2;
    } else {
        scrColorDoor();
        scrColorDoor2();
    }
    scrPlaySoundExt(sndCopy1,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if objPlayer.curseMode == -1 && cursed == objPlayer.curseColor {
    cursed = -1;
    effectiveColor = color;
    effectiveColorSpend = colorSpend;
    scrColorDoor();
    scrColorDoor2();
    scrPlaySoundExt(sndCopy2,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}
if effectiveColor == color_GLITCH {
    effectiveColor = glitchMimic;
}
if effectiveColorSpend == color_GLITCH {
    effectiveColorSpend = glitchMimic;
}

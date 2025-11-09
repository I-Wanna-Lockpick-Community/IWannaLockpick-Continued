if hasColor(color_PURE) {exit;}
if objPlayer.curseMode == 1 && cursed != objPlayer.curseColor && cursed != color_PURE
&& !(color == objPlayer.curseColor && colorSpend == objPlayer.curseColor) {
    cursed = objPlayer.curseColor;
    scrPlaySoundExt(sndCopy1,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if objPlayer.curseMode == -1 && cursed == objPlayer.curseColor {
    cursed = -1;
    scrPlaySoundExt(sndCopy2,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}

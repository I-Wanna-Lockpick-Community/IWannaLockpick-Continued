if hasColor(color_PURE) {exit;}
var willCurse = objPlayer.curseMode == 1 && (!cursed || (cursed != objPlayer.curseColor));
var willCurseRedundant = willCurse && isAllColor(objPlayer.curseColor);
if willCurse && !willCurseRedundant {
    cursed = objPlayer.curseColor;
    scrPlaySoundExt(sndCopy1,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if cursed && (willCurseRedundant || (objPlayer.curseMode == -1 && cursed == objPlayer.curseColor)) {
    cursed = -1;
    scrPlaySoundExt(sndCopy2,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}

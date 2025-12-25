if hasColor(color_PURE) {exit;}
var willCurse = objPlayer.curseMode == 1 && ((cursed == -1) || (cursed != objPlayer.curseColor && cursed != color_PURE));
var willCurseRedundant = willCurse && isAllColor(objPlayer.curseColor);
if willCurse && !willCurseRedundant {
    cursed = objPlayer.curseColor;
    scrPlaySoundExt(sndCopy1,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if cursed && (willCurseRedundant || (objPlayer.curseMode == -1 && cursed == objPlayer.curseColor)) {
    if willCurseRedundant {
        cursed = objPlayer.curseColor;
        scrPlaySoundExt(sndCopy1,1,1,false);
    } else {
        cursed = -1;
        scrPlaySoundExt(sndCopy2,1,1,false);
    }
    event_user(3);
    cursed = -1;
    brownNearPlayer = 1;
    undoBUFFER();
}

//Before the rest of this code is run, first:
if colorSpend == color_PURE {exit;}
if glitchMimic == color_PURE {exit;}
for(var i = 0; i < lockCount; i += 1){
    if lock[i,0] == color_PURE{
        exit;
    }
}
var curseRedundant = 1;
if colorSpend == objPlayer.curseColor{
    for(var i = 0; i < lockCount; i += 1){
        if lock[i,0] != objPlayer.curseColor{
            curseRedundant = 0;
        }
    }   
}else{
    curseRedundant = 0;
}
var auraPlayNoise = 0;
if objPlayer.curseMode == 1 && cursed != objPlayer.curseColor && !curseRedundant && cursed != color_PURE {//Add redundancy heuristic if everything is already brown
    cursed = objPlayer.curseColor;
        if cursed != color_PURE {
        var colorOld = colorSpend;
        colorSpend = objPlayer.curseColor;
        scrComboCFunc();
        colorSpend = colorOld;
        scrPlaySoundExt(sndCopy1,1,1,false);
    } else {
        scrComboCFunc();
        scrPlaySoundExt(sndCopy2,1,1,false);
    }
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if objPlayer.curseMode == -1 && cursed == objPlayer.curseColor {
    cursed = -1;
    scrComboCFunc();
    scrPlaySoundExt(sndCopy2,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}

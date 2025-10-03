//Before the rest of this code is run, first:
if colorSpend == key_PURE {exit;}
if colorGlitch == key_PURE {exit;}
for(var i = 0; i < lockCount; i += 1){
    if lock[i,0] == key_PURE{
        exit;
    }
}
var brownRedundant = 1;
if colorSpend == key_BROWN{
    for(var i = 0; i < lockCount; i += 1){
        if lock[i,0] != key_BROWN{
            brownRedundant = 0;
        }
    }
}else{
    brownRedundant = 0;
}
var auraPlayNoise = 0;
if objPlayer.brownMode == 1 && browned == 0 && !brownRedundant{//Add redundancy heuristic if everything is already brown
    browned = 1;
    var colorOld = colorSpend;
    colorSpend = key_BROWN;
    scrComboCFunc();
    colorSpend = colorOld;
    scrPlaySoundExt(sndCopy1,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if objPlayer.brownMode == -1 && browned == 1{
    browned = 0;
    scrComboCFunc();
    scrPlaySoundExt(sndCopy2,1,1,false);
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}

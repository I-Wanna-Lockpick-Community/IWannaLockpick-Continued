if color == key_PURE || colorSpend == key_PURE || (((color == key_GLITCH) || (colorSpend == key_GLITCH)) && colorGlitch == key_PURE) {exit;}
var auraPlayNoise = 0;
if objPlayer.brownMode == 1 && browned == 0 && !(color == key_BROWN && colorSpend == key_BROWN){
    browned = 1;
    var colorOld = color;
    var colorOld2 = colorSpend;
    color = key_BROWN;
    colorSpend = key_BROWN;
    scrColorDoor();
    scrColorDoor2();
    color = colorOld;
    colorSpend = colorOld2;
    scrPlaySoundExt(sndCopy1,1,1,false);
    /*var bPart = instance_create(x+16*w,y+16*h,oBrownParticle);
    bPart.mode = 0; bPart.scale = .4 * max(w,h);
    bPart = instance_create(x+16*w,y+16*h,oBrownParticle);
    bPart.mode = 0; bPart.scale = .2 * max(w,h);*/
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}else if objPlayer.brownMode == -1 && browned == 1{
    browned = 0;
    scrColorDoor();
    scrColorDoor2();
    scrPlaySoundExt(sndCopy2,1,1,false);
    /*var bPart = instance_create(x+16*w,y+16*h,oBrownParticle);
    bPart.mode = 1; bPart.scale = .4 * max(w,h);
    bPart = instance_create(x+16*w,y+16*h,oBrownParticle);
    bPart.mode = 1; bPart.scale = .2 * max(w,h);*/
    event_user(3);
    brownNearPlayer = 1;
    undoBUFFER();
}

if browned{
    tempColor = key_BROWN;
    tempSpend = key_BROWN;
}else{
    tempColor = color;
    tempSpend = colorSpend;
}

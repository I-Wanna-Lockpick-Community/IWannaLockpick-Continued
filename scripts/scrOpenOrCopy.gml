//scrOpenOrCopy();
if aura[0] || aura[1] || aura[2] {
    scrPlaySoundExt(sndCrumble,1,1,false);
} else if object_index == oDoorCombo {
    scrPlaySoundExt(sndComboOpen,1,1,false);
} else if type == lock_BLAST {
    scrPlaySoundExt(sndBlast,1,1,false);
} else if cursed == color_MASTER || (color == color_MASTER && colorSpend == color_MASTER && (cursed == -1 || cursed == color_PURE)){
    scrPlaySoundExt(sndMasterUnlock,1,1,false);
} else {
    scrPlaySoundExt(sndOpen,1,1,false);
}

if object_index != oDoorCombo {
    //Slowstopping
    scrPlayerDownStop();
}
if iPow == 0{//Real +
    if copies > 0{copies -= 1;}
}else if iPow == 1{//Im +
    if icopies > 0{icopies -= 1;}
}else if iPow == 2{//Real -
    if copies < 0{copies += 1;}
}else{//Im -
    if icopies < 0{icopies += 1;}
}
if copies == 0 && icopies == 0{//DESTROY
    solid = 0; visible = 0; active = 0;
    for(var i = 0; i < remoteLocks; i += 1) {
        with remoteLock[i] { event_user(1); }
    }
    if global.salvageActive{
        event_user(5);
        scrSaveSalvage(global.salvageID,id);
    }else{//Normal door open
        event_user(0);
        var playerOnTop = place_meeting(x,y-1,objPlayer);
        //instance_destroy();
        if playerOnTop{
            with objPlayer{
                if place_free(x,y+1){
                    djump = 0;
                    if recentJump{
                        vspeed *= .45;
                    }
                }
            }
        }
    }
}else{
    event_user(2);
}
undoBUFFER();

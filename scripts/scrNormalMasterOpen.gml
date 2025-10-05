///scrNormalMasterOpen();

// to determine which animation and sound(s) to play
var openedForwards = false;
var openedBackwards = false;

if abs(objPlayer.masterMode) == 1 && global.key[color_MASTER] != 0{ //Real Master Spending
    addComplexKeys(color_MASTER,0,-sign(objPlayer.masterMode),0,0);
    copies -= sign(objPlayer.masterMode);
    if sign(copies) == -sign(objPlayer.masterMode) {
        openedBackwards = true;
    }else{
        openedForwards = true;
    }
    objPlayer.masterMode = 0;
    objPlayer.masterCycle = 0;
} else if abs(objPlayer.masterMode) == 2 && global.ikey[color_MASTER] != 0{ //Imaginary Master Spending
    addComplexKeys(color_MASTER,0,0,-sign(objPlayer.masterMode),0);
    icopies -= sign(objPlayer.masterMode);
    if sign(icopies) == -sign(objPlayer.masterMode) {
        openedBackwards = true;
    }else{
        openedForwards = true;
    }
    objPlayer.masterMode = 0;
    objPlayer.masterCycle = 0;
}

if copies == 0 && icopies == 0{
    scrPlaySoundExt(sndMasterUnlock,1,1,false);
    if global.salvageActive{
        event_user(5);
        scrSaveSalvage(global.salvageID,id);
    }else{
        event_user(0);
    }
    visible=0;solid=0;active=0;
} else {
    if openedForwards {
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        event_user(2);
    } else if openedBackwards {
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
}

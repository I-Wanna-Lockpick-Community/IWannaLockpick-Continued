///scrNormalMasterOpen();
if objPlayer.masterMode == 1 && global.key[color_MASTER] > 0{//Positive Master Spending
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
	addComplexKeys(color_MASTER,0,-1,0,0);
    copies -= 1;
    if copies == 0 && icopies == 0{//DESTROY OBJECT
        visible=0;solid=0;active=0;
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        if global.salvageActive{
            event_user(5);
            scrSaveSalvage(global.salvageID,id);
        }else{
            event_user(0);
        }
    }else if copies >= 0{//Still has + copies or 0 and imaginary copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        event_user(2);
    }else{//(Now) has negative copies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
	return true;
}else if objPlayer.masterMode == -1 && global.key[color_MASTER] < 0{
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
	addComplexKeys(color_MASTER,0,1,0,0);
    copies += 1;
    if copies == 0 && icopies == 0{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        if global.salvageActive{
            event_user(5);
            scrSaveSalvage(global.salvageID,id);
        }else{
            event_user(0);
        }
        visible=0;solid=0;active=0;
    }else if copies <= 0{//Still has - copies or 0 and imaginary copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        event_user(2);
    }else{//(Now) has positive copies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
	return true;
}else if objPlayer.masterMode == 2 && global.ikey[color_MASTER] > 0{//Positive IMaster Spending
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
	addComplexKeys(color_MASTER,0,0,-1,0);
    icopies -= 1;
    if copies == 0 && icopies == 0{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        if global.salvageActive{
            event_user(5);
            scrSaveSalvage(global.salvageID,id);
        }else{
            event_user(0);
        }
        visible=0;solid=0;active=0;
    }else if icopies >= 0{//Still has + icopies or 0 and real copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        event_user(2);
    }else{//(Now) has negative icopies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
	return true;
}else if objPlayer.masterMode == -2 && global.ikey[color_MASTER] < 0{
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
	addComplexKeys(color_MASTER,0,0,1,0);
    icopies += 1;
    if copies == 0 && icopies == 0{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        if global.salvageActive{
            event_user(5);
            scrSaveSalvage(global.salvageID,id);
        }else{
            event_user(0);
        }
        visible=0;solid=0;active=0;
    }else if icopies <= 0{//Still has - icopies or 0 and real copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        //scrBroadcastCopy(tempSpend,glitchMimic);
        event_user(2);
    }else{//(Now) has positive icopies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
	return true;
}
return false;

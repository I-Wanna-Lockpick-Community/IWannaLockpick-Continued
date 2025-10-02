///scrKinaMasterOpen();
if objPlayer.masterMode == 1 && global.key[key_MASTER] > 0{//Positive Master Spending
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
    addComplexKeys(key_MASTER,0,-1,0,0);
    copies -= 1;
    if copies == 0 && icopies == 0{//DESTROY OBJECT (THIS IS THE BIG ONE)
        active=0;
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        event_user(0);
        event_user(4);
    }else if copies >= 0{//Still has + copies or 0 and imaginary copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        event_user(2);
    }else{//(Now) has negative copies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
}else if objPlayer.masterMode == -1 && global.key[key_MASTER] < 0{
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
    addComplexKeys(key_MASTER,0,1,0,0);
    copies += 1;
    if copies == 0 && icopies == 0{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        active=0;
        event_user(0);
        event_user(4);
    }else if copies <= 0{//Still has - copies or 0 and imaginary copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        event_user(2);
    }else{//(Now) has positive copies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
}else if objPlayer.masterMode == 2 && global.ikey[key_MASTER] > 0{//Positive IMaster Spending
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
	addComplexKeys(key_MASTER,0,0,-1,0);
    icopies -= 1;
    if copies == 0 && icopies == 0{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        active=0;
        event_user(0);
        event_user(4);
    }else if icopies >= 0{//Still has + icopies or 0 and real copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        event_user(2);
    }else{//(Now) has negative icopies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
}else if objPlayer.masterMode == -2 && global.ikey[key_MASTER] < 0{
    objPlayer.masterMode = 0;
	objPlayer.masterCycle = 0;
    addComplexKeys(key_MASTER,0,0,1,0);
    icopies += 1;
    if copies == 0 && icopies == 0{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        active=0;
        event_user(0);
        event_user(4);
    }else if icopies <= 0{//Still has - icopies or 0 and real copies
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
        event_user(2);
    }else{//(Now) has positive icopies
        scrPlaySoundExt(sndMasterRelock,1,1,false);
        event_user(1);
    }
}

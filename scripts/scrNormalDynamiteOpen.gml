///scrNormalDynamiteOpen();

var didOpen = false;
var openedForwards = false;
var openedBackwards = false;
if global.key[key_DYNAMITE] > 0{ // Positive Dynamite Spending
    var openCount;
	if copies > 0 {
		openCount = min(copies, global.key[key_DYNAMITE]);
		openedForwards = true;
	} else {
		openCount = global.key[key_DYNAMITE];
		openedBackwards = true;
	}
	if !global.star[key_DYNAMITE] {
        addComplexKeys(key_DYNAMITE,0,-openCount,0,0);
    }
    copies -= openCount;
	didOpen = true;
} else if global.key[key_DYNAMITE] < 0 { // Negative Dynamite Spending
	var openCount;
	if copies < 0 {
		openCount = min(-copies, -global.key[key_DYNAMITE]);
		openedForwards = true;
	} else {
		openCount = -global.key[key_DYNAMITE];
		openedBackwards = true;
	}
    if !global.star[key_DYNAMITE]{
        addComplexKeys(key_DYNAMITE,0,openCount,0,0);
    }
    copies += openCount;
	didOpen = true;
}

if global.ikey[key_DYNAMITE] > 0{ // Positive iDynamite Spending
    var openCount;
	if icopies > 0 {
		openCount = min(icopies, global.ikey[key_DYNAMITE]);
		openedForwards = true;
	} else {
		openCount = global.ikey[key_DYNAMITE];
		openedBackwards = true;
	}
	if !global.star[key_DYNAMITE] {
        addComplexKeys(key_DYNAMITE,0,0,-openCount,0);
    }
    icopies -= openCount;
	didOpen = true;
} else if global.ikey[key_DYNAMITE] < 0 { // Negative iDynamite Spending
	var openCount;
	if icopies < 0 {
		openCount = min(-icopies, -global.ikey[key_DYNAMITE]);
		openedForwards = true;
		
	} else {
		openCount = -global.ikey[key_DYNAMITE];
		openedBackwards = true;
	}
    if !global.star[key_DYNAMITE] {
        addComplexKeys(key_DYNAMITE,0,0,openCount,0);
    }
    icopies += openCount;
	didOpen = true;
}

if didOpen {
	if copies == 0 && icopies == 0 {//DESTROY OBJECT
        visible=0;solid=0;active=0;
        scrPlaySoundExt(sndDeltaruneExplosion,1,1,false);
        //scrBroadcastCopy(tempSpend,colorCopy);
        if global.salvageActive{
            event_user(5);
            scrSaveSalvage(global.salvageID,id);
        } else {
            event_user(0);
        }
    } else {
		if openedForwards {
			scrPlaySoundExt(sndDeltaruneExplosion,1,1,false);
			//scrBroadcastCopy(tempSpend,colorCopy);
			event_user(2);
		}
		if openedBackwards {
			scrPlaySoundExt(sndAntiExplode,1,1,false);
        	if !openedForwards {
				event_user(1);
			}
		}
	}
}

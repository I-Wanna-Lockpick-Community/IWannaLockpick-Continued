///scrNormalDynamiteOpen();

// to determine which animation and sound(s) to play
var openedForwards = false;
var openedBackwards = false;

if global.key[key_DYNAMITE] == 0 && global.ikey[key_DYNAMITE] == 0 {
	return false;
}
if (sign(global.key[key_DYNAMITE]) == sign(copies) || copies == 0) && abs(global.key[key_DYNAMITE]) >= abs(copies)
&& (sign(global.ikey[key_DYNAMITE]) == sign(icopies) || icopies == 0) && abs(global.ikey[key_DYNAMITE]) >= abs(icopies) {
	// if the door can open, open it
	var openCount = sign(global.key[key_DYNAMITE]) * min(abs(copies), abs(global.key[key_DYNAMITE]));
	copies -= openCount;
	addComplexKeys(key_DYNAMITE,0,-openCount,0,0);
	var iopenCount = sign(global.ikey[key_DYNAMITE]) * min(abs(icopies), abs(global.ikey[key_DYNAMITE]));
	icopies -= iopenCount;
	addComplexKeys(key_DYNAMITE,0,0,-iopenCount,0);
	openedForwards = true;
} else {
	// otherwise, spend all keys
	if sign(global.key[key_DYNAMITE]) == sign(copies) && copies != 0 {
		openedForwards = true;
		if abs(global.key[key_DYNAMITE]) > abs(copies) {
			openedBackwards = true;
		}
	} else {
		openedBackwards = true;
	}
	if sign(global.ikey[key_DYNAMITE]) == sign(icopies) && icopies != 0 {
		openedForwards = true;
		if abs(global.ikey[key_DYNAMITE]) > abs(icopies) {
			openedBackwards = true;
		}
	} else {
		openedBackwards = true;
	}
	copies -= global.key[key_DYNAMITE];
	global.key[key_DYNAMITE] = 0;
	icopies -= global.ikey[key_DYNAMITE];
	global.ikey[key_DYNAMITE] = 0;
}

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
return true;

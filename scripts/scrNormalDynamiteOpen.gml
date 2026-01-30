///scrNormalDynamiteOpen();

// to determine which animation and sound(s) to play
var openedForwards = false;
var openedBackwards = false;

if (sign(global.key[color_DYNAMITE,2]) == sign(copies[2]) || (copies[0] == 0 && copies[1] == 0)) && ((global.key[color_DYNAMITE,0] > copies[0]) || (global.key[color_DYNAMITE,0] == copies[0] && global.key[color_DYNAMITE,1] > copies[1]))
&& (sign(global.ikey[color_DYNAMITE,2]) == sign(icopies[2]) || (icopies[0] == 0 && icopies[1] == 0)) && ((global.ikey[color_DYNAMITE,0] > icopies[0]) || (global.ikey[color_DYNAMITE,0] == icopies[0] && global.ikey[color_DYNAMITE,1] > icopies[1])) {
    // if the door can open, open it
    // tomorrow me, finish this and fix the rest of the scripts. also add fraction support to copies - Something
    var abskey = global.key[color_DYNAMITE];
    abskey[2] = abs(abskey[2]);
    var openCount = sign(global.key[color_DYNAMITE,2]) * min(scrMakeFraction(copies[0],copies[1],abs(copies[2])), abskey);
    scrSubFraction(copies, openCount);
    if (!global.star[color_DYNAMITE]) { addComplexKeys(color_DYNAMITE,-openCount,0,0); }
    var absikey = global.ikey[color_DYNAMITE];
    absikey[2] = abs(absikey[2]);
    var iopenCount = sign(global.ikey[color_DYNAMITE,2]) * min(scrMakeFraction(icopies[0],icopies[1],abs(icopies[2])), absikey);
    scrSubFraction(icopies, iopenCount);
    if (!global.star[color_DYNAMITE]) { addComplexKeys(color_DYNAMITE,0,-iopenCount,0); }
    openedForwards = true;
} else {
    // otherwise, spend all keys
    if sign(global.key[color_DYNAMITE]) == sign(copies) && copies != 0 {
        openedForwards = true;
        if abs(global.key[color_DYNAMITE]) > abs(copies) {
            openedBackwards = true;
        }
    } else {
        openedBackwards = true;
    }
    if sign(global.ikey[color_DYNAMITE]) == sign(icopies) && icopies != 0 {
        openedForwards = true;
        if abs(global.ikey[color_DYNAMITE]) > abs(icopies) {
            openedBackwards = true;
        }
    } else {
        openedBackwards = true;
    }
    copies -= global.key[color_DYNAMITE];
    if (!global.star[color_DYNAMITE]) { global.key[color_DYNAMITE] = 0; }
    icopies -= global.ikey[color_DYNAMITE];
    if (!global.star[color_DYNAMITE]) { global.ikey[color_DYNAMITE] = 0; }
}

if copies == 0 && icopies == 0 {//DESTROY OBJECT
    visible=0;solid=0;active=0;
    scrPlaySoundExt(sndDeltaruneExplosion,1,1,false);
    explosion = instance_create(x+w*16, y+h*16, oDynamiteExplosion)
    explosion.sprite_index = sprExplosion;
    if global.salvageActive{
        event_user(5);
        scrSaveSalvage(global.salvageID,id);
    } else {
    event_user(0);
    }
} else {
    if openedForwards {
        scrPlaySoundExt(sndDeltaruneExplosion,1,1,false);
        event_user(2);
        explosion = instance_create(x+w*16, y+h*16, oDynamiteExplosion)
        explosion.sprite_index = sprExplosion;
    }
    if openedBackwards {
        scrPlaySoundExt(sndAntiExplode,1,1,false);
        if !openedForwards {
            event_user(1);
            explosion = instance_create(x+w*16, y+h*16, oDynamiteExplosion);
            explosion.sprite_index = sprNegativeExplosion;
        }
    }
}

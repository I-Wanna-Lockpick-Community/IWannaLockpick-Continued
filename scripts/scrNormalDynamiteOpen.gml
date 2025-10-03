///scrNormalDynamiteOpen();

// to determine which animation and sound(s) to play
var openedForwards = false;
var openedBackwards = false;

if global.key[color_DYNAMITE] == 0 && global.ikey[color_DYNAMITE] == 0 {
return false;
}
if (sign(global.key[color_DYNAMITE]) == sign(copies) || copies == 0) && abs(global.key[color_DYNAMITE]) >= abs(copies)
&& (sign(global.ikey[color_DYNAMITE]) == sign(icopies) || icopies == 0) && abs(global.ikey[color_DYNAMITE]) >= abs(icopies) {
// if the door can open, open it
var openCount = sign(global.key[color_DYNAMITE]) * min(abs(copies), abs(global.key[color_DYNAMITE]));
copies -= openCount;
addComplexKeys(color_DYNAMITE,0,-openCount,0,0);
var iopenCount = sign(global.ikey[color_DYNAMITE]) * min(abs(icopies), abs(global.ikey[color_DYNAMITE]));
icopies -= iopenCount;
addComplexKeys(color_DYNAMITE,0,0,-iopenCount,0);
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
global.key[color_DYNAMITE] = 0;
icopies -= global.ikey[color_DYNAMITE];
global.ikey[color_DYNAMITE] = 0;
}

if copies == 0 && icopies == 0 {//DESTROY OBJECT
visible=0;solid=0;active=0;
scrPlaySoundExt(sndDeltaruneExplosion,1,1,false);
//scrBroadcastCopy(effectiveColorSpend,glitchMimic);
if global.salvageActive{
event_user(5);
scrSaveSalvage(global.salvageID,id);
} else {
event_user(0);
}
} else {
if openedForwards {
scrPlaySoundExt(sndDeltaruneExplosion,1,1,false);
//scrBroadcastCopy(effectiveColorSpend,glitchMimic);
event_user(2);
explosion = instance_create(objPlayer.x+10, objPlayer.y+10, oDynaExplosion)
explosion.sprite_index = sprExplo
}
if openedBackwards {
scrPlaySoundExt(sndAntiExplode,1,1,false);
if !openedForwards {
event_user(1);
explosion = instance_create(objPlayer.x+10, objPlayer.y+10, oDynaExplosion)
explosion.sprite_index = sprNegativeExplo
}
}
}
return true;

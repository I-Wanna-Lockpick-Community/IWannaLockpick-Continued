//scrCheckKeys();
// checks key related variables

for (var i=0; i<COLORS; i+=1) { global.gateArmament[i] = 0; }
with oGate {
    if place_meeting(x,y,objPlayer) {
        for (var i=0; i<lockCount; i+=1) {
            if lock[i,11] {global.gateArmament[scrLockEffectiveColor(i,false)] = 1;}
        }
    }
}

//RGB auras
var redmaroon = scrSubFraction(global.key[color_RED], global.key[color_MAROON])
if !global.gateArmament[color_RED] && (redmaroon[0] >= 1 && redmaroon[2] > 0) && global.key[color_RED,2] > 0{
    aura[0] = 1;
}else if !global.gateArmament[color_MAROON] && (redmaroon[0] >= 1 && redmaroon[2] < 0) && global.key[color_MAROON,2] > 0{
    aura[0] = -1; 
}else{
    aura[0] = 0;
}
var greenforest = scrSubFraction(global.key[color_GREEN], global.key[color_FOREST])
if !global.gateArmament[color_GREEN] && (greenforest[0] >= 5 && greenforest[2] > 0) && global.key[color_GREEN,2] > 0{
    aura[1] = 1;
}else if !global.gateArmament[color_FOREST] && (greenforest[0] >= 5 && greenforest[2] < 0) && global.key[color_FOREST,2] > 0{
    aura[1] = -1; 
}else{
    aura[1] = 0;
}
var bluenavy = scrSubFraction(global.key[color_BLUE], global.key[color_NAVY])
if !global.gateArmament[color_BLUE] && (bluenavy[0] >= 3 && bluenavy[2] > 0) && global.key[color_BLUE,2] > 0{
    aura[2] = 1;
}else if !global.gateArmament[color_NAVY] && (bluenavy[0] >= 3 && bluenavy[2] < 0) && global.key[color_NAVY,2] > 0{
    aura[2] = -1;
}else{
    aura[2] = 0;
}

var highestSeen = scrToFraction(0);
curseMode = 0;
curseColor = -1;
for (var color=0;color<COLORS;color+=1) {
    var keycolor = global.key[color]
    if !global.curse[color] || (keycolor[0] == 0 && keycolor[1] == 0) || global.gateArmament[color] {
        continue;
    }
    if keycolor[0] == highestSeen[0] && keycolor[1] == highestSeen[1] {
        // tie
        curseMode = 0;
        curseColor = -1;
    } else if (keycolor[0] > highestSeen[0]) || (keycolor[0] == highestSeen[0] && keycolor[1]*highestSeen[2] > highestSeen[1]*abs(keycolor[2])) {
        highestSeen[0] = keycolor[0];
        highestSeen[1] = keycolor[1];
        highestSeen[2] = abs(keycolor[2]);
        curseMode = sign(keycolor[2]);
        curseColor = color;
    }
}

useMasterCheck();

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
if !global.gateArmament[color_RED] && global.key[color_RED] - global.key[color_MAROON] >= 1 && global.key[color_RED] > 0{
    aura[0] = 1;
}else if !global.gateArmament[color_MAROON] && global.key[color_RED] - global.key[color_MAROON] <= -1 && global.key[color_MAROON] > 0{
    aura[0] = -1; 
}else{
    aura[0] = 0;
}
if !global.gateArmament[color_GREEN] && global.key[color_GREEN] - global.key[color_FOREST] >= 5 && global.key[color_GREEN] > 0{
    aura[1] = 1;
}else if !global.gateArmament[color_FOREST] && global.key[color_GREEN] - global.key[color_FOREST] <= -5 && global.key[color_FOREST] > 0{
    aura[1] = -1; 
}else{
    aura[1] = 0;
}
if !global.gateArmament[color_BLUE] && global.key[color_BLUE] - global.key[color_NAVY] >= 3 && global.key[color_BLUE] > 0{
    aura[2] = 1;
}else if !global.gateArmament[color_NAVY] && global.key[color_BLUE] - global.key[color_NAVY] <= -3 && global.key[color_NAVY] > 0{
    aura[2] = -1;
}else{
    aura[2] = 0;
}

var highestSeen = 0;
curseMode = 0;
curseColor = -1;
for (var color=0;color<COLORS;color+=1) {
    if !global.curse[color] || global.key[color] == 0 || global.gateArmament[color] {
        continue;
    }
    if abs(global.key[color]) == highestSeen {
        // tie
        curseMode = 0;
        curseColor = -1;
    } else if abs(global.key[color]) > highestSeen {
        highestSeen = abs(global.key[color]);
        curseMode = sign(global.key[color]);
        curseColor = color;
    }
}

useMasterCheck();

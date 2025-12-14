//scrLockEffectiveColor(index);
// returns the effective color of a lock; used for calculations
// distinct from the door since you might want locks to behave differently (eg. armaments)
var color = lock[argument0,0];
if object_index != oGate && cursed != -1 && cursed != color_PURE && !lock[argument0,11] {
    color = cursed;
    if color == color_GLITCH { color = curseGlitchMimic; }
} else if color == color_GLITCH { color = lock[argument0,12]; }
if argument1 && !hasColor(color_PURE) {
    var auraType;
    var auraCount = 0; //Amount of auras on the door
    if aura[0] {auraCount++; auraType = color_ICE}
    if aura[1] {auraCount++; auraType = color_MUD}
    if aura[2] {auraCount++; auraType = color_GRAFFITI}
    if auraCount != 1 { return color; }
    return auraType;
}
return color;

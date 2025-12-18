//scrEffectiveColor(color,considerAurabreakers,isLock);
// returns the effective color; used for calculations
var color = argument0;
if cursed != -1 && cursed != color_PURE && !(argument2 && armament) {
    color = cursed;
    if color == color_GLITCH { color = curseGlitchMimic; }
} else if color == color_GLITCH {
    if argument2 && object_index != oRemoteLock { color = lockGlitchMimic; }
    else { color = glitchMimic; }
}
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

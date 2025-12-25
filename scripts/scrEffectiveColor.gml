//scrEffectiveColor(color,considerAurabreakers,isLock,(armament));
// armament is only necessary if its a lock
// returns the effective color; used for calculations
var color = argument[0];
if object_index != oGate && cursed != -1 && cursed != color_PURE && !(argument[2] && argument[3]) {
    color = cursed;
    if color == color_GLITCH { color = curseGlitchMimic; }
} else if color == color_GLITCH {
    if argument[2] && object_index != oRemoteLock {
        if object_index == oDoorCombo || object_index == oGate {
            if argument[3] { color = armamentGlitchMimic; }
            else { color = glitchMimic; }
        }
        else { color = lockGlitchMimic; }
    } else { color = glitchMimic; }
}
if argument[1] && !hasColor(color_PURE) && !(argument[2] && argument[3]) {
    var auraType;
    var auraCount = 0; //Amount of auras on the door
    if aura[0] {auraCount++; auraType = color_ICE}
    if aura[1] {auraCount++; auraType = color_MUD}
    if aura[2] {auraCount++; auraType = color_GRAFFITI}
    if auraCount != 1 { return color; }
    return auraType;
}
return color;

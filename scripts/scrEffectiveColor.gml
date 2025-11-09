//scrEffectiveColor(color,considerAurabreakers);
// returns the effective color; used for calculations
var color = argument0;
if cursed != -1 && cursed != color_PURE { color = cursed; }
if color == color_GLITCH { color = glitchMimic; }
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

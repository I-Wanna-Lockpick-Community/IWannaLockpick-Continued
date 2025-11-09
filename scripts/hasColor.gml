//hasColor(color);
// returns if the color is present on the door
if scrEffectiveColor(colorSpend) == argument0 { return true; }
if object_index == oDoorSimple || object_get_parent(object_index) == oDoorSimple {
    if scrEffectiveColor(color) == argument0 { return true; }
} else {
    for(var i = 0; i < lockCount; i += 1) {
        if scrLockEffectiveColor(i) == argument0 {
            return true;
        }
    }
}
return false;
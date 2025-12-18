//hasColor(color);
// returns if the color is present on the door
if object_index != oRemoteLock && scrEffectiveColor(colorSpend,false,false) == argument0 { return true; }
if object_index == oDoorSimple || object_index == oRemoteLock || object_get_parent(object_index) == oDoorSimple {
    if scrEffectiveColor(color,false,true) == argument0 { return true; }
} else {
    for(var i = 0; i < lockCount; i += 1) {
        if scrLockEffectiveColor(i,false) == argument0 {
            return true;
        }
    }
}
return false;

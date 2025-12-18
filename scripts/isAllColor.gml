//isAllColor(color);
// returns if the door is fully that color
if (object_index == oDoorSimple || object_get_parent(object_index) == oDoorSimple) {return color == argument0 && colorSpend == argument0;}
else if object_index == oRemoteLock { return color == argument0; }
else if object_index == oDoorCombo {
    if colorSpend != argument0 { return false; }
    for(var i = 0; i < lockCount; i += 1){
        if lock[i,0] != argument0 { return false; }
    }
}
return true;

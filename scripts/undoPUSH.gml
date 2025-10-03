///The main script for pushing a game state, "saving it" in the undo stack.
/* Things to save:
1. Player x/y
2. Key Counts, Ordinals, and Stars for every key color (Excluding stone keys)
3. Keys: Collected, Glitch Color
4. Doors: Opened, 3 Auras, Browned, Copies, Glitch Color
5. Combo Doors: Opened, 3 Auras, Browned, Copies, Glitch Color*/

undoPos += 1;
recentPush = 1;//Indicates a push was done recently

//Player
var _utmp, _utmp2, _utmp3, _inst, _bin, _digit;
//For salvage system
if instance_exists(oSalvageIn){
    if global.salvageActive && global.salvageID == -1{
        ds_stack_push(undoStack,1024);
    }else if !global.salvageActive{
        ds_stack_push(undoStack,512);
    }else{
        ds_stack_push(undoStack,global.salvageID);
    }
}
if instance_exists(objPlayer){
    _utmp = objPlayer.x;
    _utmp2 = objPlayer.y;
}else if instance_exists(objPlayerStart){
    _utmp = objPlayerStart.x+17;
    _utmp2 = objPlayerStart.y+23;
}else{
    _utmp = room_width/2;
    _utmp2 = room_height/2;
}
ds_stack_push(undoStack,_utmp,_utmp2);
//To save 1 push, combine x and y into a 32-bit or 64-bit number.

//Key Counts, Ordinals, and Stars
for(var i = 0; i < 16; i+=1){
    _utmp = global.key[i];
    _utmp2 = global.ikey[i];
    //_utmp3 = global.star[i];
    ds_stack_push(undoStack,_utmp,_utmp2);
}
_bin = 0; _digit = 1;
for(var i = 0; i < 16; i+=1){
    _bin += _digit*global.star[i]; _digit *= 2;
}
ds_stack_push(undoStack,_bin);
//If we don't end up using certain key colors, can save 2 pushes per color.
//Additionally, we could try to combine key and ikey (and maybe star) into the same push.
//This would mean 33 pushes -> 29 pushes -> 14 pushes. Key counter max = 2147483647.

//MAIN OBJECT VARIABLES
for(var i = 0; i < instSize; i += 1){
    _inst = instArray[i];
    _bin = 0; _digit = 1;
    if _inst.object_index == oKina{
        _bin += _digit*_inst.active; _digit *= 2;
        _bin += _digit*_inst.browned; _digit *= 2;
        if _inst.copies >= 0{_bin += _digit;} _digit *= 2;
        for(var ii = 0; ii < 26; ii += 1){
            _bin += _digit*numBinDigit(_inst.copies,ii); _digit *= 2;
        }
        if _inst.icopies >= 0{_bin += _digit;} _digit *= 2;
        for(var ii = 0; ii < 26; ii += 1){
            _bin += _digit*numBinDigit(_inst.icopies,ii); _digit *= 2;
        }
        ds_stack_push(undoStack,_bin);
    }else if _inst.object_index == oGate{
        ds_stack_push(undoStack,_inst.colorGlitch);
    }else if _inst.object_index == oDoorCombo{
        _bin += _digit*_inst.active; _digit *= 2;
        _bin += _digit*_inst.aura[0]; _digit *= 2;
        _bin += _digit*_inst.aura[1]; _digit *= 2;
        _bin += _digit*_inst.aura[2]; _digit *= 2;
        _bin += _digit*_inst.browned; _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,3); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,2); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,1); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,0); _digit *= 2;
        if _inst.copies >= 0{_bin += _digit;} _digit *= 2;
        for(var ii = 0; ii < 26; ii += 1){
            _bin += _digit*numBinDigit(_inst.copies,ii); _digit *= 2;
        }
        if _inst.icopies >= 0{_bin += _digit;} _digit *= 2;
        for(var ii = 0; ii < 26; ii += 1){
            _bin += _digit*numBinDigit(_inst.icopies,ii); _digit *= 2;
        }
        ds_stack_push(undoStack,_bin);
        //Saves 9 bits of bool and 64 bits of copies. Can be 9 bools, 27 copies, 27 icopies. Won't be reached ingame.
    }else if object_get_parent(_inst.object_index) == oKeyBulk{
        _bin += _digit*_inst.active; _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,3); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,2); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,1); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,0);
        //ds_stack_push(undoStack,_inst.active,_inst.colorGlitch);
        ds_stack_push(undoStack,_bin);
        //Saves a 5-byte number storing both the active bool and colorGlitch.
    }else if object_get_parent(_inst.object_index) == oDoorSimple || _inst.object_index == oDoorSimple{
        _bin += _digit*_inst.active; _digit *= 2;
        _bin += _digit*_inst.aura[0]; _digit *= 2;
        _bin += _digit*_inst.aura[1]; _digit *= 2;
        _bin += _digit*_inst.aura[2]; _digit *= 2;
        _bin += _digit*_inst.browned; _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,3); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,2); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,1); _digit *= 2;
        _bin += _digit*numBinDigit(_inst.colorGlitch,0); _digit *= 2;
        if _inst.copies >= 0{_bin += _digit;} _digit *= 2;
        for(var ii = 0; ii < 26; ii += 1){
            _bin += _digit*numBinDigit(_inst.copies,ii); _digit *= 2;
        }
        if _inst.icopies >= 0{_bin += _digit;} _digit *= 2;
        for(var ii = 0; ii < 26; ii += 1){
            _bin += _digit*numBinDigit(_inst.icopies,ii); _digit *= 2;
        }
        //ds_stack_push(undoStack,_inst.active,_inst.aura[0],_inst.aura[1],_inst.aura[2],_inst.browned,_inst.copies,_inst.colorGlitch);
        ds_stack_push(undoStack,_bin);
        //Saves 9 bits of bool and 64 bits of copies. Can be 9 bools, 27 copies, 27 icopies. Won't be reached ingame.
    }else if _inst.object_index == oSalvageIn{
        ds_stack_push(undoStack,_inst.active);
    }
}
//Currently, we have 2+33+K+2D pushes per call/state change.
//The absolute ideal is 1+14+K+D pushes per call/state change.

show_debug_message(string(ds_stack_size(undoStack))+" elements in undo stack");

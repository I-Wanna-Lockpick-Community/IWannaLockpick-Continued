///The main script for popping a game state from the Undo Stack, and setting object variables based on what data it retrieves.
/* Things to pop: RIGHT TO LEFT, BOTTOM TO TOP
5. Player x/y
4. Key Counts, Ordinals, and Stars for every key color (Excluding stone keys)
3. Keys: Collected, Copy Color
2. Doors: Opened, 3 Auras, Browned, Copies, Copy Color
1. Combo Doors: Opened, 3 Auras, Browned, Copies, Copy Color*/
var _inst, _bin, _tmp, _digit;

saveBuffered = 0;
undoPos = max(undoPos - 1,0);
recentPush = 0;

//MAIN OBJECT VARIABLES
for(var i = instSize-1; i >= 0; i -= 1){
    _inst = instArray[i];
    _bin = 0;
    _digit = 1;
    _tmp = 0;
    if _inst.object_index == oSalvageIn{
        _inst.active = ds_stack_pop(undoStack);
    }
    if _inst.object_index == oKina{
        _bin = ds_stack_pop(undoStack);
        _inst.browned = numBinDigit(_bin,1);
        _inst.active = numBinDigit(_bin,0);
        //Copies
        _tmp = 0; _digit = 1;
        for(var ii = 0; ii < 26; ii += 1){
            _tmp += _digit*numBinDigit(_bin,ii+3); _digit *= 2;//Subtract 7 from bit positions
        }
        _inst.copies = _tmp;
        if numBinDigit(_bin,2) == 0{_inst.copies *= -1;}
        _tmp = 0; _digit = 1;
        for(var ii = 0; ii < 26; ii += 1){
            _tmp += _digit*numBinDigit(_bin,ii+30); _digit *= 2;
        }
        _inst.icopies = _tmp;
        if numBinDigit(_bin,29) == 0{_inst.icopies *= -1;}
        with _inst{
            scrColorDoor(); scrColorDoor2();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
            if browned{
                var colorOld = color;
                var colorOld2 = colorSpend;
                color = key_BROWN;
                colorSpend = key_BROWN;
                scrColorDoor();
                scrColorDoor2();
                color = colorOld;
                colorSpend = colorOld2;
                event_user(3);
            }
        }
    }else if _inst.object_index == oGate{
        _bin = ds_stack_pop(undoStack);
        _inst.colorCopy = _bin;
    }else if _inst.object_index == oDoorCombo{
        _bin = ds_stack_pop(undoStack);
        _tmp += _digit*numBinDigit(_bin,8); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,7); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,6); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,5); _digit *= 2;
        _inst.colorCopy = _tmp;
        _inst.browned = numBinDigit(_bin,4);
        _inst.aura[2] = numBinDigit(_bin,3);
        _inst.aura[1] = numBinDigit(_bin,2);
        _inst.aura[0] = numBinDigit(_bin,1);
        _inst.active = numBinDigit(_bin,0);
        _inst.visible = _inst.active;
        //Copies
        _tmp = 0; _digit = 1;
        for(var ii = 0; ii < 26; ii += 1){
            _tmp += _digit*numBinDigit(_bin,ii+10); _digit *= 2;
        }
        _inst.copies = _tmp;
        if numBinDigit(_bin,9) == 0{_inst.copies *= -1;}
        _tmp = 0; _digit = 1;
        for(var ii = 0; ii < 26; ii += 1){
            _tmp += _digit*numBinDigit(_bin,ii+37); _digit *= 2;
        }
        _inst.icopies = _tmp;
        if numBinDigit(_bin,36) == 0{_inst.icopies *= -1;}
        with _inst{
            scrComboCFunc(); undoReposition();
            if browned{
                var colorOld = colorSpend;
                colorSpend = key_BROWN;
                scrComboCFunc();
                colorSpend = colorOld;
                event_user(3);
            }
        }
    }else if object_get_parent(_inst.object_index) == oKeyBulk{
        _bin = ds_stack_pop(undoStack);
        _tmp += _digit*numBinDigit(_bin,4); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,3); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,2); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,1); _digit *= 2;
        _inst.colorCopy = _tmp;
        _inst.active = numBinDigit(_bin,0);
        _inst.visible = _inst.active;
        with _inst{
            scrColorKey(); undoReposition();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
        }
    }else if object_get_parent(_inst.object_index) == oDoorSimple || _inst.object_index == oDoorSimple{
        //_inst.copies = ds_stack_pop(undoStack);
        _bin = ds_stack_pop(undoStack);
        _tmp += _digit*numBinDigit(_bin,8); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,7); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,6); _digit *= 2;
        _tmp += _digit*numBinDigit(_bin,5); _digit *= 2;
        _inst.colorCopy = _tmp;
        _inst.browned = numBinDigit(_bin,4);
        _inst.aura[2] = numBinDigit(_bin,3);
        _inst.aura[1] = numBinDigit(_bin,2);
        _inst.aura[0] = numBinDigit(_bin,1);
        _inst.active = numBinDigit(_bin,0);
        _inst.visible = _inst.active;
        //Copies
        _tmp = 0; _digit = 1;
        for(var ii = 0; ii < 26; ii += 1){
            _tmp += _digit*numBinDigit(_bin,ii+10); _digit *= 2;
        }
        _inst.copies = _tmp;
        if numBinDigit(_bin,9) == 0{_inst.copies *= -1;}
        _tmp = 0; _digit = 1;
        for(var ii = 0; ii < 26; ii += 1){
            _tmp += _digit*numBinDigit(_bin,ii+37); _digit *= 2;
        }
        _inst.icopies = _tmp;
        if numBinDigit(_bin,36) == 0{_inst.icopies *= -1;}
        with _inst{
            scrColorDoor(); scrColorDoor2(); undoReposition();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
            if browned{
                var colorOld = color;
                var colorOld2 = colorSpend;
                color = key_BROWN;
                colorSpend = key_BROWN;
                scrColorDoor();
                scrColorDoor2();
                color = colorOld;
                colorSpend = colorOld2;
                event_user(3);
            }
        }
    }
}

//Key Counts, Ordinals, and Stars
_bin = ds_stack_pop(undoStack);
for(var i = 16-1; i >= 0; i -= 1){
    global.star[i] = numBinDigit(_bin,i);
}
for(var i = 16-1; i >= 0; i -= 1){
    global.ikey[i] = ds_stack_pop(undoStack);
    global.key[i] = ds_stack_pop(undoStack);
}

//Player
if instance_exists(objPlayer){
    objPlayer.y = ds_stack_pop(undoStack);
    objPlayer.x = ds_stack_pop(undoStack);
    objPlayer.hspeed = 0;
    objPlayer.vspeed = 0;
    objPlayer.masterMode = 0;
    objPlayer.masterCycle = 0;
    objPlayer.downDir = 0;
    objPlayer.downTime = 0;
}else{
    ds_stack_pop(undoStack);
    ds_stack_pop(undoStack);
}

//Salvages, if necessary
if instance_exists(oSalvageIn){
    _bin = ds_stack_pop(undoStack);
    if _bin == 1024{
        global.salvageActive = 1;
        global.salvageID = -1;
    }else if _bin == 512{
        global.salvageActive = 0;
        global.salvageID = -1;
    }else{
        global.salvageActive = 1;
        global.salvageID = _bin;
    }
}

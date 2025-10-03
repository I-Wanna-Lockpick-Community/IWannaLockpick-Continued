///The main script for popping a game state from the Undo Stack, and setting object variables based on what data it retrieves.
/* Things to check to pop:
1. Player position
2. Key Counts and Stars
3. Object instances
    a) Keys: Collected, Glitch Color (technically they all have synchronised glitch but its easier this way)
    b) Doors: Opened, 3 Auras, Browned, Copies, Glitch Color
    c) Gates: Glitch mimic (again, technically always synchronised)
    d) Kina: Opened, Browned, Copies
    e) Salvage point: Interacted
4. Which salvage point is interacted */

// For each change in the stack, find the value to change by going through values in the same order as undoPUSH, and change it.
// We also have to make sure to update the value for it in the array, so that it gets checked correctly for future pushes.
// Slow? Maybe. There's not much to do about it though. Gamemaker can't pass around references to variables :/

undoPos -= 1;

show_debug_message("undo popped");

while true {
    var index = ds_stack_pop(undoStack);
    if index == -1 {
        break;
    }
    var value = ds_stack_pop(undoStack);
    var iter = 0;

    show_debug_message("index " + string(index) + " value " + string(value));

    // 1. Player position
    if index == iter { if instance_exists(objPlayer) { objPlayer.x = value; undoData[index] = value } continue; }
    else if index == iter+1 { if instance_exists(objPlayer) { objPlayer.y = value; undoData[index] = value } continue; }
    iter += 2;

    // 2. Key Counts and Stars
    var willContinue = false; // we want to continue the outer loop, so we break out of the inner one and set this variable to true when we find something
    for (var i = 0; i < COLORS; i+=1) {
        if index == iter { global.key[i] = value; undoData[index] = value; willContinue = true; break; }
        else if index == iter+1 { global.ikey[i] = value; undoData[index] = value; willContinue = true; break; }
        else if index == iter+2 { global.star[i] = value; undoData[index] = value; willContinue = true; break; }
        iter += 3;
    }
    if willContinue { continue; }

    willContinue = false;
    // 3. Object instances
    for (var i = 0; i < instancesCount; i += 1) {
        var instance = instances[i];
        if object_get_parent(instance.object_index) == oKeyBulk {
            // a) Keys: Collected, Glitch Color
            if index == iter { instance.active = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+1 { instance.glitchMimic = value; undoData[index] = value; willContinue = true; break; }
            iter += 2;
        } else if object_get_parent(instance.object_index) == oDoorSimple
        || instance.object_index == oDoorSimple
        || instance.object_index == oDoorCombo {
            // b) Doors: Opened, 3 Auras, Browned, Copies, Glitch Color
            if index == iter { instance.active = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+1 { instance.aura[0] = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+2 { instance.aura[1] = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+3 { instance.aura[2] = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+4 { instance.browned = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+5 { instance.glitchMimic = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+6 { instance.copies = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+7 { instance.icopies = value; undoData[index] = value; willContinue = true; break; }
            iter += 8;
        } else if instance.object_index == oGate {
            // c) Gates: Glitch mimic
            if index == iter { instance.glitchMimic = value; undoData[index] = value; willContinue = true; break; }
            iter += 1;
        } else if instance.object_index == oKina {
            // d) Kina: Opened, Browned, Copies
            if index == iter { instance.active = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+1 { instance.browned = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+2 { instance.copies = value; undoData[index] = value; willContinue = true; break; }
            else if index == iter+3 { instance.icopies = value; undoData[index] = value; willContinue = true; break; }
            iter += 4;
        } else if instance.object_index == oSalvageIn {
            // e) Salvage point: Interacted
            if index == iter { instance.active = value; undoData[index] = value; willContinue = true; break; }
            iter += 1;
        }
    }
    if willContinue { continue; }

    // 4. Which salvage point is interacted
    if instance_exists(oSalvageIn) && index == iter {
        if value == 1024{
            global.salvageActive = 1;
            global.salvageID = -1;
        } else if value == 512 {
            global.salvageActive = 0;
            global.salvageID = -1;
        } else {
            global.salvageActive = 1;
            global.salvageID = value;
        }
        iter += 1;
    }
}

// now, go through everything one last time to update them

if instance_exists(objPlayer) {
    objPlayer.hspeed = 0;
    objPlayer.vspeed = 0;
    objPlayer.masterMode = 0;
    objPlayer.masterCycle = 0;
    objPlayer.downDir = 0;
    objPlayer.downTime = 0;
}

for (var i = 0; i < instancesCount; i += 1) {
    var instance = instances[i];
    if object_get_parent(instance.object_index) == oKeyBulk {
        instance.visible = instance.active;
        with instance {
            scrColorKey(); undoReposition();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
        }
    } else if object_get_parent(instance.object_index) == oDoorSimple
    || instance.object_index == oDoorSimple {
        instance.visible = instance.active;
        with instance {
            scrColorDoor(); scrColorDoor2(); undoReposition();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
            if browned {
                var colorOld = color;
                var colorOld2 = colorSpend;
                color = color_BROWN;
                colorSpend = color_BROWN;
                scrColorDoor();
                scrColorDoor2();
                color = colorOld;
                colorSpend = colorOld2;
                event_user(3);
            }
        }
    } else if instance.object_index == oDoorCombo {
        instance.visible = instance.active;
        with instance {
            scrComboCFunc(); undoReposition();
            if browned {
                var colorOld = colorSpend;
                colorSpend = color_BROWN;
                scrComboCFunc();
                colorSpend = colorOld;
                event_user(3);
            }
        }
    } else if instance.object_index == oKina {
        with instance {
            scrColorDoor(); scrColorDoor2();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
            if browned {
                var colorOld = color;
                var colorOld2 = colorSpend;
                color = color_BROWN;
                colorSpend = color_BROWN;
                scrColorDoor();
                scrColorDoor2();
                color = colorOld;
                colorSpend = colorOld2;
                event_user(3);
            }
        }
    }
}

show_debug_message(string(ds_stack_size(undoStack))+" elements in undo stack");

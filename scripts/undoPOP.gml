///The main script for popping a game state from the Undo Stack, and setting object variables based on what data it retrieves.
/* Things to check to pop:
1. Player position
2. Key Counts, Stars, and Curses
3. Object instances
    a) Keys: Active, Glitch Mimic (technically they all have synchronised glitch but its easier this way)
    b) Doors: Active, 3 Auras, Cursed, Glitch Mimic, Copies
    c) Gates: Glitch Mimic (again, technically always synchronised)
    d) Kina: Active, Cursed, Copies
    e) Salvage point: Interacted
    f) Remote Locks: Active, Satisfied, Cost, Auras, Cursed, Glitch Mimic
4. Which salvage point is interacted */

// For each change in the stack, find the value to change by going through values in the same order as undoPUSH, and change it.
// We also have to make sure to update the value for it in the array, so that it gets checked correctly for future pushes.
// Slow? Maybe. There's not much to do about it though. As far as I know, Gamemaker can't pass around references to variables :/

undoPos -= 1;

show_debug_message("undo popped");

while true {
    index = ds_stack_pop(undoStack);
    if index == -1 {
        break;
    }
    value = ds_stack_pop(undoStack);
    iter = 0;

    show_debug_message("index " + string(index) + " value " + string(value));

    willContinue = false; // we want to continue the outer loop, so we break out of the inner one and set this variable to true when we find something

    // 1. Player position
    if undoPopCheck() {if instance_exists(objPlayer) {objPlayer.x = value;} continue;}
    if undoPopCheck() {if instance_exists(objPlayer) {objPlayer.y = value;} continue;}

    // 2. Key Counts, Stars, and Curses
    for (var i = 0; i < COLORS; i+=1) {
        if undoPopCheck() {global.key[i] = value; break;}
        if undoPopCheck() {global.ikey[i] = value; break;}
        if undoPopCheck() {global.star[i] = value; break;}
        if undoPopCheck() {global.curse[i] = value; break;}
    }
    if willContinue { continue; }

    willContinue = false;
    // 3. Object instances
    for (var i = 0; i < instancesCount; i += 1) {
        var instance = instances[i];
        if object_get_parent(instance.object_index) == oKeyBulk {
            // a) Keys: Active, Glitch Mimic
            if undoPopCheck() {instance.active = value; break;}
            if undoPopCheck() {instance.glitchMimic = value; break;}
        } else if object_get_parent(instance.object_index) == oDoorSimple
        || instance.object_index == oDoorSimple
        || instance.object_index == oDoorCombo {
            // b) Doors: Active, 3 Auras, Cursed, Glitch Mimic, Copies
            if undoPopCheck() {instance.active = value; break;}
            if undoPopCheck() {instance.aura[0] = value; break;}
            if undoPopCheck() {instance.aura[1] = value; break;}
            if undoPopCheck() {instance.aura[2] = value; break;}
            if undoPopCheck() {instance.cursed = value; break;}
            if undoPopCheck() {instance.glitchMimic = value; break;}
            if undoPopCheck() {instance.curseGlitchMimic = value; break;}
            if undoPopCheck() {instance.armamentGlitchMimic = value; break;}
            if undoPopCheck() {instance.copies = value; break;}
            if undoPopCheck() {instance.icopies = value; break;}
        } else if instance.object_index == oGate {
            // c) Gates: Glitch Mimic
            if undoPopCheck() {instance.glitchMimic = value; break;}
        } else if instance.object_index == oKina {
            // d) Kina: Active, Cursed, Copies
            if undoPopCheck() {instance.active = value; break;}
            if undoPopCheck() {instance.cursed = value; break;}
            if undoPopCheck() {instance.copies = value; break;}
            if undoPopCheck() {instance.icopies = value; break;}
        } else if instance.object_index == oSalvageIn {
            // e) Salvage point: Interacted
            if undoPopCheck() {instance.active = value; break;}
        } else if instance.object_index == oRemoteLock {
            // f) Remote Locks: Active, Satisfied, Cost, Auras, Cursed, Glitch Mimic
            if undoPopCheck() {instance.active = value; break;}
            if undoPopCheck() {instance.satisfied = value; break;}
            if undoPopCheck() {instance.rcost = value; break;}
            if undoPopCheck() {instance.icost = value; break;}
            if undoPopCheck() {instance.aura[0] = value; break;}
            if undoPopCheck() {instance.aura[1] = value; break;}
            if undoPopCheck() {instance.aura[2] = value; break;}
            if undoPopCheck() {instance.cursed = value; break;}
            if undoPopCheck() {instance.glitchMimic = value; break;}
            if undoPopCheck() {instance.curseGlitchMimic = value; break;}
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
            undoReposition();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
        }
    } else if object_get_parent(instance.object_index) == oDoorSimple
    || instance.object_index == oDoorSimple {
        instance.visible = instance.active;
        with instance {
            undoReposition();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
            if cursed != -1 {
                event_user(3);
            }
        }
    } else if instance.object_index == oDoorCombo {
        instance.visible = instance.active;
        with instance {
            undoReposition();
            if cursed != -1 {
                event_user(3);
            }
        }
    } else if instance.object_index == oKina {
        with instance {
            scrColorDoor(); scrColorDoor2();
            copyTimer = 0; copyState = 0; copyAlpha = 0; copyDraw = 1;
            if cursed != -1 {
                var colorOld = color;
                var colorOld2 = colorSpend;
                color = cursed;
                colorSpend = cursed;
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

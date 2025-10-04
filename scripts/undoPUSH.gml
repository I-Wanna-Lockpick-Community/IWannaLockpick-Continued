///The main script for pushing a game state, "saving it" in the undo stack.
/* Things to save:
1. Player position
2. Key Counts, Stars, and Curses
3. Object instances
    a) Keys: Collected, Glitch Color (technically they all have synchronised glitch but its easier this way)
    b) Doors: Opened, 3 Auras, cursed, Copies, Glitch Color
    c) Gates: Glitch mimic (again, technically always synchronised)
    d) Kina: Opened, cursed, Copies
    e) Salvage point: Interacted
4. Which salvage point is interacted */

// Find all the changes since the last save, then note them on the stack
// We're storing the state to compare to in a big array, with each value being one index
// We don't have to care as much about efficiency, since we'll only be storing this once instead of every time :)

undoPos += 1;

show_debug_message("undo pushed")

if undoPos != 1 { ds_stack_push(undoStack, -1); } // an index of -1 represents the start of a save

undoPushIndex = 0;
// 1. Player position
if instance_exists(objPlayer) {
    undoPushChange(objPlayer.x);
    undoPushChange(objPlayer.y);
} else if instance_exists(objPlayerStart) {
    undoPushChange(objPlayerStart.x+17);
    undoPushChange(objPlayerStart.y+23);
} else {
    // something is terribly wrong
    undoPushChange(room_width/2);
    undoPushChange(room_height/2);
}
// 2. Key Counts, Stars, and Curses
for (var i = 0; i < COLORS; i+=1) {
    undoPushChange(global.key[i]);
    undoPushChange(global.ikey[i]);
    undoPushChange(global.star[i]);
    undoPushChange(global.curse[i]);
}
//3. Object instances
for (var i = 0; i < instancesCount; i+= 1) {
    var instance = instances[i];
    if object_get_parent(instance.object_index) == oKeyBulk {
        // a) Keys: Collected, Glitch Color
        undoPushChange(instance.active);
        undoPushChange(instance.glitchMimic);
    } else if object_get_parent(instance.object_index) == oDoorSimple
    || instance.object_index == oDoorSimple
    || instance.object_index == oDoorCombo {
        // b) Doors: Opened, 3 Auras, cursed, Copies, Glitch Color
        undoPushChange(instance.active);
        undoPushChange(instance.aura[0]);
        undoPushChange(instance.aura[1]);
        undoPushChange(instance.aura[2]);
        undoPushChange(instance.cursed);
        undoPushChange(instance.glitchMimic);
        undoPushChange(instance.copies);
        undoPushChange(instance.icopies);
    } else if instance.object_index == oGate {
        // c) Gates: Glitch mimic
        undoPushChange(instance.glitchMimic);
    } else if instance.object_index == oKina {
        // d) Kina: Opened, cursed, Copies
        undoPushChange(instance.active);
        undoPushChange(instance.cursed);
        undoPushChange(instance.copies);
        undoPushChange(instance.icopies);
    } else if instance.object_index == oSalvageIn {
        undoPushChange(instance.active);
    }
}
// 4. Which salvage point is interacted
if instance_exists(oSalvageIn){
    if global.salvageActive && global.salvageID == -1{
        undoPushChange(1024);
    } else if !global.salvageActive {
        undoPushChange(512);
    } else {
        undoPushChange(global.salvageID);
    }
}

show_debug_message(string(ds_stack_size(undoStack))+" elements in undo stack");

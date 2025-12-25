///undoPushChange(value);
// Save a single change to the stack if it is different, or initialise the value.

var value = argument0;
if undoPos == 1 {
    // initialise
    undoData[undoPushIndex] = value;
} else if value != undoData[undoPushIndex] {
    // save to stack
    ds_stack_push(undoStack, undoData[undoPushIndex]);
    ds_stack_push(undoStack, undoPushIndex);
    // keep track of the change
    undoData[undoPushIndex] = value;
    //show_debug_message("index " + string(undoPushIndex) + " value " + string(undoData[undoPushIndex]));
}
undoPushIndex += 1;

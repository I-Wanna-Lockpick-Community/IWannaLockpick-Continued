//keyWhiteGetIndex(color,type);
// returns the correct index for sprAllKeysWhite
var color = argument0;
var type = argument1;
if color == color_MASTER {
    if type == key_NORMAL { return 10; }
    else if type == key_EXACT { return 11; }
    else if type == 2 { return 12; }
} else if color == color_DYNAMITE {
    if type == key_NORMAL { return 13; }
}
return type;

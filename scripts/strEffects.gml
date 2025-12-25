//strEffects(cursed,frozen,crumbled,painted,curseGlitchMimic);
var str = ""
if argument0 != -1 {
    str += "#Cursed";
    if argument0 != color_BROWN { str += " " + colName[argument0]; }
    str += "!";
    if argument0 == color_GLITCH { str += " (Mimic: " + colName[argument4] + ")"; }
}
if argument1 { str += "#Frozen! (1xRed)"; }
if argument2 { str += "#Eroded! (5xGreen)"; }
if argument3 { str += "#Painted! (3xBlue)"; }
if str != "" { str = "#- Effects -" + str; }
return str;

//strEffects(browned,frozen,crumbled,painted);
var str = ""
if argument0 { str += "#Cursed!"; }
if argument1 { str += "#Frozen! (1xRed)"; }
if argument2 { str += "#Eroded! (5xGreen)"; }
if argument3 { str += "#Painted! (3xBlue)"; }
if str != "" { str = "#- Effects -" + str; }
return str;

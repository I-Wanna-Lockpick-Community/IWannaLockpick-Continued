//strComplex(real,imag);
// returns a complex number, stringed
var r = "";
var i = "";
if argument0 != 0 { r = string(argument0); }
if argument1 != 0 {
    if argument1 > 0 && argument0 != 0 { i += "+" }
    i += string(argument1) + "i";
}
if argument0 == 0 && argument1 == 0 { return "0"; }
return r + i;

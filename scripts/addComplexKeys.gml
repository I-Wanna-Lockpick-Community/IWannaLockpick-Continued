///addComplexKeys(color,colorCopy,addR,addI,power_of_i);
//Used to be a script called addOrdinalKeys which was far more complex.
//The Ordinal Keys mechanic was scrapped for being confusing, though.
//I think complex keys are a better choice, which is why I replaced all the code.

var _addCol = argument0;
var _ccheck = argument1;
if _addCol == key_COPY {
    _addCol = _ccheck;
}
switch argument4 {
    case 0://i^0 = Multiply by 1
        var open_needR = argument2;
        var open_needI = argument3;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -argument3;
        var open_needI = argument2;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -argument2;
        var open_needI = -argument3;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = argument3;
        var open_needI = -argument2;
    break;
}
if !global.star[_addCol] {
	global.key[_addCol] += open_needR;
	global.ikey[_addCol] += open_needI;
}

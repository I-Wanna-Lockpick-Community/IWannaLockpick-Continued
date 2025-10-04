///addComplexKeys(color,addR,addI,power_of_i);
//Used to be a script called addOrdinalKeys which was far more complex.
//The Ordinal Keys mechanic was scrapped for being confusing, though.
//I think complex keys are a better choice, which is why I replaced all the code.

var color = argument0;

if global.star[color] {
    return false;
}

var count, icount;
switch argument3 {
    case 0://i^0 = Multiply by 1
        count = argument1;
        icount = argument2;
    break;
    case 1://i^1 = Multiply by i
        count = -argument2;
        icount = argument1;
    break;
    case 2://i^2 = Multiply by -1
        count = -argument1;
        icount = -argument2;
    break;
    case 3://i^3 = Multiply by -i
        count = argument2;
        icount = -argument1;
    break;
}

global.key[color] += count;
global.ikey[color] += icount;

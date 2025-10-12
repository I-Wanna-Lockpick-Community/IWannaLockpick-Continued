///scrAddSpendAmt(color,count,icount,type,power_of_i,denom,idenom);
var open_check = argument0;
if open_check == color_GLITCH{
    open_check = glitchMimic;
}
switch argument4{
    case 0://i^0 = Multiply by 1
        var open_needR = argument1;
        var open_needI = argument2;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -argument2;
        var open_needI = argument1;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -argument1;
        var open_needI = -argument2;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = argument2;
        var open_needI = -argument1;
    break;
}
switch argument3 {
    case lock_NORMAL:
    case lock_EXACT:
        spendTotal += open_needR;
        spendITotal += open_needI;
    break;
    case lock_BLANK:
        //Nothing really
    break;
    case lock_BLAST://blast (can accept real or imaginary, but not both)
        if open_needR != 0 {
            spendTotal += global.key[open_check];
        }
        if open_needI != 0 {
            spendITotal += global.ikey[open_check];
        }
    break;
    case lock_ALL://equals
        spendTotal += global.key[open_check];
        spendITotal += global.ikey[open_check];
    break;
    case 5://partial blast
        var mult = 0
        var imult = 0
        if argument5!=0 {
            mult = global.key[open_check] / argument5;
        }
        if argument6!=0 {
            imult = global.ikey[open_check] / argument6;
        }
        spendTotal += open_needR * mult - open_needI * imult;
        spendITotal += open_needR * imult - open_needI * mult;
    break;
    case 6://partial all
        var mult = (global.key[open_check]*argument5+global.ikey[open_check]*argument6)/(argument5*argument5+argument6*argument6);
        var imult = (global.ikey[open_check]*argument5-global.key[open_check]*argument6)/(argument5*argument5+argument6*argument6);
        spendTotal += open_needR * mult - open_needI * imult;
        spendITotal += open_needR * imult - open_needI * mult;
    break;
}
return false;

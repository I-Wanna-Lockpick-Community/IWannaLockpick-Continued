///scrAddSpendAmt(color,open_needR,open_needI,type,power_of_i,denom,idenom);
var open_check = argument0;
if open_check == color_GLITCH{
    open_check = glitchMimic;
}
switch argument4{
    case 0://i^0 = Multiply by 1
        var open_needR = argument1;
        var open_needI = argument2;
        var denom = argument5;
        var idenom = argument6;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -argument2;
        var open_needI = argument1;
        var denom = -argument5;
        var idenom = argument6;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -argument1;
        var open_needI = -argument2;
        var denom = -argument5;
        var idenom = -argument6;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = argument2;
        var open_needI = -argument1;
        var denom = argument6;
        var idenom = -argument5;
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
        if denom != 0 || idenom != 0 {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            if rquotient*open_needR % 1 == 0 && rquotient*open_needI % 1 == 0 {
                spendTotal += rquotient*open_needR;
                spendITotal += rquotient*open_needI;
            } else {
                // decimals dont exist yet; 0 cost if its decimal
            }
        } else {
            if open_needR != 0 {
                spendTotal += global.key[open_check];
            }
            if open_needI != 0 {
                spendITotal += global.ikey[open_check];
            }
        }
    break;
    case lock_ALL://equals
        if denom != 0 || idenom != 0 {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            var iquotient = scrComplexDivideI(global.key[open_check],global.ikey[open_check],denom,idenom);
            if (rquotient*open_needR-iquotient*open_needI) % 1 == 0 && (iquotient*open_needR+rquotient*open_needI) % 1 == 0 {
                spendTotal += rquotient*open_needR-iquotient*open_needI;
                spendITotal += iquotient*open_needR+rquotient*open_needI;
            } else {
                // decimals dont exist yet; 0 cost if its decimal
            }
        } else {
            spendTotal += global.key[open_check];
            spendITotal += global.ikey[open_check];
        }
    break;
}
return false;

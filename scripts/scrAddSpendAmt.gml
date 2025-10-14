///scrAddSpendAmt(color,open_needR,open_needI,type,power_of_i,denom,idenom,negated);
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
var rcost = 0;
var icost = 0;
var negated = argument7;
switch argument3 {
    case lock_NORMAL:
    case lock_EXACT:
        rcost = open_needR;
        icost = open_needI;
    break;
    case lock_BLANK:
        //Nothing really
    break;
    case lock_BLAST://blast (can accept real or imaginary, but not both)
        if denom != 0 || idenom != 0 {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            rcost = roundNormal(rquotient*open_needR);
            icost = roundNormal(rquotient*open_needI);
        } else {
            if open_needR != 0 {
                rcost = global.key[open_check];
            }
            if open_needI != 0 {
                icost = global.ikey[open_check];
            }
        }
    break;
    case lock_ALL://equals
        if denom != 0 || idenom != 0 {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            var iquotient = scrComplexDivideI(global.key[open_check],global.ikey[open_check],denom,idenom);
            rcost = roundNormal(rquotient*open_needR-iquotient*open_needI);
            icost = roundNormal(iquotient*open_needR+rquotient*open_needI);
        } else {
            rcost = global.key[open_check];
            icost = global.ikey[open_check];
        }
    break;
}
if negated {
    spendTotal -= rcost;
    spendITotal -= icost;
} else {
    spendTotal += rcost;
    spendITotal += icost;
}

return false;

///scrAddSpendAmt(color,count,icount,type,ipow,exactI/isPartial,denom,idenom,negated);
var open_check = argument0;
if open_check == color_GLITCH{
    open_check = glitchMimic;
}
var key = global.key[argument0];
var ikey = global.ikey[argument0];
var count = rotateR(argument1,argument2,argument4);
var icount = rotateI(argument1,argument2,argument4);
var denom = rotateR(argument6,argument7,argument4);
var idenom = rotateI(argument6,argument7,argument4);
var exactI = argument3 == lock_EXACT && argument5;
var isPartial = argument3 != lock_EXACT && argument5;
var rcost = 0;
var icost = 0;
switch argument3 {
    case lock_NORMAL:
    case lock_EXACT:
        rcost = count;
        icost = icount;
    break;
    case lock_BLANK:
        //Nothing really
    break;
    case lock_BLAST://blast (can accept real or imaginary, but not both)
        if isPartial {
            if denom != 0 || idenom != 0 {
                var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
                rcost = scrTruncate(rquotient*count);
                icost = scrTruncate(rquotient*icount);
            }
        } else {
            if count != 0 { rcost = global.key[open_check]; }
            if icount != 0 { icost = global.ikey[open_check]; }
        }
    break;
    case lock_ALL://equals
        if isPartial {
            if denom != 0 || idenom != 0 {
                var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
                var iquotient = scrComplexDivideI(global.key[open_check],global.ikey[open_check],denom,idenom);
                rcost = scrTruncate(rquotient*count-iquotient*icount);
                icost = scrTruncate(iquotient*count+rquotient*icount);
            }
        } else {
            rcost = global.key[open_check];
            icost = global.ikey[open_check];
        }
    break;
}
if argument8 {
    spendTotal -= rcost;
    spendITotal -= icost;
} else {
    spendTotal += rcost;
    spendITotal += icost;
}

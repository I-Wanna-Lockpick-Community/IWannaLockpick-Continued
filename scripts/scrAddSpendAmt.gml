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
            var interRCost = 0;
            var interICost = 0;
            if denom != 0 {interRCost = key*count; interICost = key*icount}
            if idenom != 0 {interRCost -= ikey*icount; interICost += ikey*count}
            if denom != 0 || idenom != 0 {
                rcost = scrTruncate(scrComplexDivide(interRCost,interICost,denom,idenom));
                icost = scrTruncate(scrComplexDivideI(interRCost,interICost,denom,idenom));
            }
        } else {
            var interRCost = count * key - icount * ikey;
            var interICost = icount * key + count * ikey;
            var denomNIPow = 0;
            if (denom != 0) != (idenom != 0) {
                if idenom > 0 {denomNIPow = 3;}
                else if denom < 0 {denomNIPow = 2;}
                else if idenom < 0 {denomNIPow = 1;}
            }
            rcost = rotateR(interRCost,interICost,denomNIPow);
            icost = rotateI(interRCost,interICost,denomNIPow);
        }
    break;
    case lock_ALL://equals
        if isPartial {
            if denom != 0 || idenom != 0 {
                var rquotient = scrComplexDivide(key,ikey,denom,idenom);
                var iquotient = scrComplexDivideI(key,ikey,denom,idenom);
                rcost = scrTruncate(rquotient*count-iquotient*icount);
                icost = scrTruncate(iquotient*count+rquotient*icount);
            }
        } else {
            var interRCost = count * key - icount * ikey;
            var interICost = icount * key + count * ikey;
            var denomNIPow = 0;
            if (denom != 0) != (idenom != 0) {
                if idenom > 0 {denomNIPow = 3;}
                else if denom < 0 {denomNIPow = 2;}
                else if idenom < 0 {denomNIPow = 1;}
            }
            rcost = scrTruncate(rotateR(interRCost,interICost,denomNIPow));
            icost = scrTruncate(rotateI(interRCost,interICost,denomNIPow));
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

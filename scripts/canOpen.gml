///canOpen(color,count,icount,type,ipow,exactI/isPartial,denom,idenom,negated);
var key = global.key[argument0];
var ikey = global.ikey[argument0];
var count = scrToFraction(rotateR(argument1,argument2,argument4));
var icount = scrToFraction(rotateI(argument1,argument2,argument4));
var denom = scrToFraction(rotateR(argument6,argument7,argument4));
var idenom = scrToFraction(rotateI(argument6,argument7,argument4));
var exactI = argument3 == lock_EXACT && argument5;
var isPartial = argument3 != lock_EXACT && argument5;
var can = true;
if key[2] == 0 || ikey[2] == 0 { return argument8; }
switch argument3{
    case lock_NORMAL:
        can = false;
        if sign(key[2]) == sign(count[2]) && (key[0] > count[0] || (key[0] == count[0] && key[1]*count[2] >= count[1]*key[2])) || (count[0] == 0 && count[1] == 0) {
            if sign(ikey[2]) == sign(icount[2]) && (ikey[0] > icount[0] || (ikey[0] == icount[0] && ikey[1]*icount[2] >= icount[1]*ikey[2])) || (icount[0] == 0 && icount[1] == 0) {
                can = true;
            }
        }
    break;
    case lock_BLANK:
        can = key[0] == 0 && key[1] == 0 && ikey[0] == 0 && ikey[1] == 0;
    break;
    case lock_BLAST:
        if (denom[0] == 0 && denom[1] == 0) && (idenom[0] == 0 && idenom[1] == 0) {can = false;}
        else if (!(denom[0] == 0 && denom[1] == 0) && sign(denom[2]) != sign(key[2])) || (!(idenom[0] == 0 && idenom[1] == 0) && sign(idenom[2]) != sign(ikey[2])) {can = false;}
        else if isPartial {
            var keyAlong = scrToFraction(0);
            var keyIAlong = scrToFraction(0);
            if !(denom[0] == 0 && denom[1] == 0) {keyAlong = key;}
            if !(idenom[0] == 0 && idenom[1] == 0) {keyIAlong = ikey;}
            var rquotient = scrComplexDivide(keyAlong,keyIAlong,denom,idenom);
            var iquotient = scrComplexDivideI(keyAlong,keyIAlong,denom,idenom);
            if (scrModFraction(rquotient, 1) != scrToFraction(0)) || (rquotient[2] <= 0) || (iquotient) {can = false;}
        }
    break;
    case lock_ALL:
        if (key == 0 && ikey == 0) || (denom == 0 && idenom == 0) {can = false;}
        else if isPartial {
            var rquotient = scrComplexDivide(key,ikey,denom,idenom);
            var iquotient = scrComplexDivideI(key,ikey,denom,idenom);
            if (rquotient % 1 != 0) || (iquotient % 1 != 0) {can = false;}
        }
    break;
    case lock_EXACT:
        if count[0] == 0 && icount[0] == 0 && count[1] == 0 && icount[1] == 0 {
            if exactI { can = ikey[0] == 0 && ikey[1] == 0; }
            else { can = key[0] == 0 && key[1] == 0; }
        } else {
            if count != 0 && count != key { can = false; }
            else if icount != 0 && icount != ikey { can = false; }
        }
    break;
}
return can != argument8;

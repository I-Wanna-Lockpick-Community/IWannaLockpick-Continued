///canOpen(color,count,icount,type,ipow,exactI/isPartial,denom,idenom,negated);
var key = global.key[argument0];
var ikey = global.ikey[argument0];
var count = rotateR(argument1,argument2,argument4);
var icount = rotateI(argument1,argument2,argument4);
var denom = rotateR(argument6,argument7,argument4);
var idenom = rotateI(argument6,argument7,argument4);
var exactI = argument3 == lock_EXACT && argument5;
var isPartial = argument3 != lock_EXACT && argument5;
var can = true;
switch argument3{
    case lock_NORMAL:
        can = false;
        if sign(key) == sign(count) && abs(key) >= abs(count) || count == 0 {
            if sign(ikey) == sign(icount) && abs(ikey) >= abs(icount) || icount == 0 {
                can = true;
            }
        }
    break;
    case lock_BLANK:
        can = key == 0 && ikey == 0;
    break;
    case lock_BLAST:
        if (denom == 0) && (idenom == 0) {can = false;}
        else if ((denom != 0) && sign(denom) != sign(key)) || ((idenom != 0) && sign(idenom) != sign(ikey)) {can = false;}
        else if isPartial {
            var keyAlong = 0;
            var keyIAlong = 0;
            if denom != 0 {keyAlong = key;}
            if idenom != 0 {keyIAlong = ikey;}
            var rquotient = scrComplexDivide(keyAlong,keyIAlong,denom,idenom);
            var iquotient = scrComplexDivideI(keyAlong,keyIAlong,denom,idenom);
            if (rquotient % 1 != 0) || (rquotient <= 0) || (iquotient) {can = false;}
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
        if count == 0 && icount == 0 {
            if exactI { can = ikey == 0; }
            else { can = key == 0; }
        } else {
            if count != 0 && count != key { can = false; }
            else if icount != 0 && icount != ikey { can = false; }
        }
    break;
}
return can != argument8;

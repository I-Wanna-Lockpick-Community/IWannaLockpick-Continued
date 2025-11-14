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
        if !isPartial && denom == 0 && idenom == 0 {
            denom = count;
            idenom = icount;
        }
        if denom == 0 && idenom == 0 { can = false; }
        else if denom != 0 && key*denom <= 0 { can = false; }
        else if idenom != 0 && ikey*idenom <= 0 { can = false; }
        else if isPartial {
            if denom != 0 && key % denom != 0 { can = false; }
            if idenom != 0 && ikey % idenom != 0 { can = false; }
        }
    break;
    case lock_ALL:
        if !isPartial && denom == 0 && idenom == 0 {
            denom = count;
            idenom = icount;
        }
        if denom == 0 && idenom == 0 { can = false; }
        else if key == 0 && ikey == 0 { can = false; }
        else if isPartial {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            var iquotient = scrComplexDivideI(global.key[open_check],global.ikey[open_check],denom,idenom);
            if (rquotient % 1 != 0 || iquotient % 1 != 0) { can = false; }
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

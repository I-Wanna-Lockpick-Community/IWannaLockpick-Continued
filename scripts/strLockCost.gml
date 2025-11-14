//strLockCost(type,count,icount,exacti/isPartial,denom,idenom,negated);
// returns the "cost" of the lock, as a string, for mouseover
var str = "";
if argument6 { str += "Not "; }
switch argument0 {
    case lock_NORMAL:
        if argument1 == 0 && argument2 == 0 { str += "None"; }
        else { str += strComplex(argument1,argument2); }
    break;
    case lock_BLANK: str += "None"; break;
    case lock_BLAST:
    case lock_ALL:
        var complexDenom = argument4 && argument5;
        str += "[";
        var numerR = argument1;
        var numerI = argument2;
        var ipow = 0;
        if !complexDenom {
            // rotate numerator by the inverse of denominator's axis ("divide through")
            if argument4 < 0 {ipow = 2;}
            else if argument5 < 0 {ipow = 1;}
            else if argument5 > 0 {ipow = 3;}
            numerR = rotateR(argument1,argument2,ipow);
            numerI = rotateI(argument1,argument2,ipow);
        }
        if numerR != 1 || numerI != 0 { str += strComplex(numerR, numerI); }
        if argument0 == lock_BLAST { str += "All"; }
        else { str += "ALL"; }
        if argument0 == lock_BLAST && !complexDenom {
            if argument4 >= 0 || argument5 > 0 {str += "+";}
            else {str += "-";}
            if argument5 != 0 {str += "i";}
        }
        if argument3 {
            var denomR = rotateR(argument4,argument5,ipow);
            var denomI = rotateI(argument4,argument5,ipow);
            if complexDenom { str += " / " + strComplex(denomR,denomI); }
            else { str += "/" + strComplex(denomR,denomI); }
        }
        str += "]";
    break;
    case lock_EXACT:
        str += "Exactly " + strComplex(argument1,argument2);
        if argument1 == 0 && argument2 == 0 && argument3 { str += "i"; }
    break;
}
return str;

//strLockCost(type,count,icount);
// returns the "cost" of the lock, as a string, for mouseover
var str = "";
switch argument0 {
    case lock_NORMAL:
        str = strComplex(argument1,argument2);
        if str == "0" { str = "None"; }
    break;
    case lock_BLANK: str = "None"; break;
    case lock_BLAST:
        str = "[All ";
        if argument1 >= 0 || argument2 > 0 {str += "+";}
        else {str += "-";}
        if argument2 != 0 {str += "i";}
        str += "]";
    break;
    case lock_ALL: str = "[ALL]"; break;
}
return str;

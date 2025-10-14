///canOpen(color,lock_count,lock_icount,lock_type,power_of_i,exactI,lock_denom,lock_idenom,negated);
var open_check = argument0;
if open_check == color_GLITCH{
    open_check = glitchMimic;
}
switch argument4{
    case 0://i^0 = Multiply by 1
        var open_needR = argument1;
        var open_needI = argument2;
        var denom = argument6;
        var idenom = argument7;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -argument2;
        var open_needI = argument1;
        var denom = -argument6;
        var idenom = argument7;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -argument1;
        var open_needI = -argument2;
        var denom = -argument6;
        var idenom = -argument7;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = argument2;
        var open_needI = -argument1;
        var denom = argument7;
        var idenom = -argument6;
    break;
}
var negated = argument8;
switch argument3{
    case lock_NORMAL:
        if sign(global.key[open_check]) == sign(open_needR) && abs(global.key[open_check]) >= abs(open_needR) || open_needR == 0 {
            if sign(global.ikey[open_check]) == sign(open_needI) && abs(global.ikey[open_check]) >= abs(open_needI) || open_needI == 0 {
                return !negated;
            }
        }
    break;
    case lock_BLANK:
        if global.key[open_check] == 0 && global.ikey[open_check] == 0{
            return !negated;
        }
    break;
    case lock_BLAST:
        if denom != 0 || idenom != 0 {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            return rquotient > 0 && rquotient % 1 == 0;
        }
        if open_needR != 0 && sign(open_needR) == sign(global.key[open_check]){
            return !negated;
        }
        if open_needI != 0 && sign(open_needI) == sign(global.ikey[open_check]){
            return !negated;
        }
    break;
    case lock_ALL:
        if global.key[open_check] == 0 && global.ikey[open_check] == 0 {
            return negated;
        }
        if denom != 0 || idenom != 0 {
            var rquotient = scrComplexDivide(global.key[open_check],global.ikey[open_check],denom,idenom);
            var iquotient = scrComplexDivideI(global.key[open_check],global.ikey[open_check],denom,idenom);
            if (rquotient % 1 != 0 || iquotient % 1 != 0) {
                return negated
            }
        }
        return !negated;
    break;
    case lock_EXACT:
        if !((argument5 + argument4) % 2) && (open_needR == global.key[open_check]){
            return !negated;
        }
        if ((argument5 + argument4) % 2) && (open_needI == global.ikey[open_check]){
            return !negated;
        }
    break;
}
return negated;

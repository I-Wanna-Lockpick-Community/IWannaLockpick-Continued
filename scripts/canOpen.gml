///canOpen(color,lock_count,lock_icount,lock_type,power_of_i,exactI,lock_denom,lock_idenom);
var open_check = argument0;
if open_check == color_GLITCH{
    open_check = glitchMimic;
}
switch argument4{
    case 0://i^0 = Multiply by 1
        var open_needR = argument1;
        var open_needI = argument2;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -argument2;
        var open_needI = argument1;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -argument1;
        var open_needI = -argument2;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = argument2;
        var open_needI = -argument1;
    break;
}
switch argument3{
    case lock_NORMAL:
        if sign(global.key[open_check]) == sign(open_needR) && abs(global.key[open_check]) >= abs(open_needR) || open_needR == 0 {
            if sign(global.ikey[open_check]) == sign(open_needI) && abs(global.ikey[open_check]) >= abs(open_needI) || open_needI == 0 {
                return true;
            }
        }
    break;
    case lock_BLANK:
        if global.key[open_check] == 0 && global.ikey[open_check] == 0{
            return true;
        }
    break;
    case lock_BLAST:
        if global.key[open_check] != 0{
            if sign(open_needR) == sign(global.key[open_check]){
                return true;
            }
            if sign(open_needI) == sign(global.ikey[open_check]){
                return true;
            }
        }
    break;
    case lock_ALL:
        if global.key[open_check] != 0{
            return true;
        }
        if global.ikey[open_check] != 0{
            return true;
        }
    break;
    case lock_EXACT:
        if !((argument5 + argument4) % 2) && (open_needR == global.key[open_check]){
            return true;
        }
        if ((argument5 + argument4) % 2) && (open_needI == global.ikey[open_check]){
            return true;
        }
    break;
    case 5://partial blast
        if (argument6==0)||((global.key[open_check] / argument6) % 1 == 0 && (global.key[open_check] / argument6) > 0) {
            if (argument7==0)||((global.ikey[open_check] / argument7) % 1 == 0 && (global.ikey[open_check] / argument7) > 0) {
                if ((argument6==0)||(argument7==0))||((global.key[open_check] / argument6)==(global.ikey[open_check] / argument7)) {
                    return true;
                }
            }
        }
    break;
    case 6://partial all
        var mult = (global.key[open_check]*argument6+global.ikey[open_check]*argument7)/(argument6*argument6+argument7*argument7);
        var imult = (global.ikey[open_check]*argument6-global.key[open_check]*argument7)/(argument6*argument6+argument7*argument7);
        if mult != 0 || imult != 0 {
            if mult % 1 == 0 && imult % 1 == 0 {
                return true;
            }
        }
    break;
}
return false;

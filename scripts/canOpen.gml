///canOpen(color,lock_count,lock_icount,lock_type,power_of_i);
var open_check = argument0;
if open_check == color_GLITCH{
    open_check = glitchMimic;
}
switch argument2{
    case 0://i^0 = Multiply by 1
        var open_needR = argument_1;
        var open_needI = argument_2;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -argument_2;
        var open_needI = argument_1;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -argument_1;
        var open_needI = -argument_2;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = argument_2;
        var open_needI = -argument_1;
    break;
}
switch argument1{
    case lock_NORMAL:
        if sign(global.key[open_check]) == sign(open_needR) && abs(global.key[open_check]) >= abs(open_needR) && sign(global.ikey[open_check]) == sign(open_needI) && abs(global.ikey[open_check]) >= abs(open_needI){
            return true;
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
    case 4://exact
        if !((exactI + argument1) % 2) && (open_needR == global.key[open_check]){
            return true;
        }
        if ((exactI + argument1) % 2) && (open_needI == global.ikey[open_check]){
            return true;
        }
    break;
}
return false;

///canOpenExt(key_color,lock_type,power_of_i);
var open_check = argument0;
if open_check == key_GLITCH{
    open_check = colorGlitch;
}
switch argument2{
    case 0://i^0 = Multiply by 1
        var open_needR = count;
        var open_needI = icount;
    break;
    case 1://i^1 = Multiply by i
        var open_needR = -icount;
        var open_needI = count;
    break;
    case 2://i^2 = Multiply by -1
        var open_needR = -count;
        var open_needI = -icount;
    break;
    case 3://i^3 = Multiply by -i
        var open_needR = icount;
        var open_needI = -count;
    break;
}
switch argument1{
    case 0://normal (can accept complex numbers)
        if sign(global.key[open_check]) == sign(open_needR) && abs(global.key[open_check]) >= abs(open_needR) && sign(global.ikey[open_check]) == sign(open_needI) && abs(global.ikey[open_check]) >= abs(open_needI){
            return true;
        }
    break;
    case 1://blank
        if global.key[open_check] == 0 && global.ikey[open_check] == 0{
            return true;
        }
    break;
    case 2://blast (can accept real or imaginary, but not both)
        if global.key[open_check] != 0{
            if sign(open_needR) == sign(global.key[open_check]){
                return true;
            }
            if sign(open_needI) == sign(global.ikey[open_check]){
                return true;
            }
        }
    break;
    case 3://equals
        if global.key[open_check] != 0{
            return true;
        }
        if global.ikey[open_check] != 0{
            return true;
        }
    break;
}
return false;

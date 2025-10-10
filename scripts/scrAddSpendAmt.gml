///scrAddSpendAmt(color,count,icount,type,power_of_i);

var rCost = 0;
var iCost = 0;
var effectiveColor = argument0;
if effectiveColor == color_GLITCH {
    effectiveColor = glitchMimic;
}
var iPow = argument4;
var count = argument1;
var icount = argument2;
switch argument3 {
    case lock_NORMAL:
    case lock_EXACT:
        rCost = rotateR(count, icount, iPow);
        iCost = rotateI(count, icount, iPow);
    break;
    // Blank is always 0
    case lock_BLAST:
        if iPow == 0 || iPow == 2 {
            if sign(global.key[effectiveColor]) == sign(count) {
                rCost = global.key[effectiveColor]*abs(sign(count));
            }
            if sign(global.ikey[effectiveColor]) == sign(icount) {
                iCost = global.ikey[effectiveColor]*abs(sign(icount));
            }
        } else {
            if sign(global.key[effectiveColor]) == sign(icount) {
                rCost = global.key[effectiveColor]*abs(sign(icount));
            }
            if sign(global.ikey[effectiveColor]) == sign(count) {
                iCost = global.ikey[effectiveColor]*abs(sign(count));
            }
        }
    break;
    case lock_ALL:
        rCost = global.key[effectiveColor];
        iCost = global.ikey[effectiveColor];
    break;
}
spendTotal += rCost;
spendITotal += iCost;

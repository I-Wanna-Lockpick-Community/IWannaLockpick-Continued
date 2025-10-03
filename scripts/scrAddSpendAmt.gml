///scrAddSpendAmt(color,count,icount,type,power_of_i);

var rCost = 0;
var iCost = 0;
var effectiveColor = argument0;
var iPow = argument4;
var count = argument1;
var icount = argument2;
switch argument3 {
	case 0: // Normal
		rCost = rotateR(count, icount, iPow);
		iCost = rotateI(count, icount, iPow);
		break;
	// Empty is always 0
	case 2: // Blast
		if iPow == 0 || iPow == 2 {
			if sign(getCountGlitch(effectiveColor,glitchMimic)) != sign(count) {
				rCost = getCountGlitch(effectiveColor,glitchMimic)*abs(sign(count));
			}
			if sign(getICountGlitch(effectiveColor,glitchMimic)) != sign(icount) {
				iCost = getICountGlitch(effectiveColor,glitchMimic)*abs(sign(icount));
			}
		} else {
			if sign(getCountGlitch(effectiveColor,glitchMimic)) == sign(icount) {
				rCost = getCountGlitch(effectiveColor,glitchMimic)*abs(sign(icount));
			}
			if sign(getICountGlitch(effectiveColor,glitchMimic)) == sign(count) {
				iCost = getICountGlitch(effectiveColor,glitchMimic)*abs(sign(count));
			}
		}
		break;
	case 3: // All
		rCost = getCountGlitch(effectiveColor,glitchMimic);
		iCost = getICountGlitch(effectiveColor,glitchMimic);
	default:
	break;
}
spendTotal += rCost;
spendITotal += iCost;

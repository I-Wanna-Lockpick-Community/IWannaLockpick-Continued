///scrAddSpendAmt(color,count,icount,type,power_of_i);

var rCost = 0;
var iCost = 0;
var tempColor = argument0;
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
			if sign(getCountGlitch(tempColor,colorCopy)) != sign(count) {
				rCost = getCountGlitch(tempColor,colorCopy)*abs(sign(count));
			}
			if sign(getICountGlitch(tempColor,colorCopy)) != sign(icount) {
				iCost = getICountGlitch(tempColor,colorCopy)*abs(sign(icount));
			}
		} else {
			if sign(getCountGlitch(tempColor,colorCopy)) == sign(icount) {
				rCost = getCountGlitch(tempColor,colorCopy)*abs(sign(icount));
			}
			if sign(getICountGlitch(tempColor,colorCopy)) == sign(count) {
				iCost = getICountGlitch(tempColor,colorCopy)*abs(sign(count));
			}
		}
		break;
	case 3: // All
		rCost = getCountGlitch(tempColor,colorCopy);
		iCost = getICountGlitch(tempColor,colorCopy);
	default:
	break;
}
spendTotal += rCost;
spendITotal += iCost;

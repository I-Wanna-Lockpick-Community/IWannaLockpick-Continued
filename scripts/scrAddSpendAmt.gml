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
			if sign(getCountGlitch(tempColor,colorGlitch)) != sign(count) {
				rCost = getCountGlitch(tempColor,colorGlitch)*abs(sign(count));
			}
			if sign(getICountGlitch(tempColor,colorGlitch)) != sign(icount) {
				iCost = getICountGlitch(tempColor,colorGlitch)*abs(sign(icount));
			}
		} else {
			if sign(getCountGlitch(tempColor,colorGlitch)) == sign(icount) {
				rCost = getCountGlitch(tempColor,colorGlitch)*abs(sign(icount));
			}
			if sign(getICountGlitch(tempColor,colorGlitch)) == sign(count) {
				iCost = getICountGlitch(tempColor,colorGlitch)*abs(sign(count));
			}
		}
		break;
	case 3: // All
		rCost = getCountGlitch(tempColor,colorGlitch);
		iCost = getICountGlitch(tempColor,colorGlitch);
	default:
	break;
}
spendTotal += rCost;
spendITotal += iCost;

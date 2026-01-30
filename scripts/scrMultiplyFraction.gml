//scrMultiplyFraction(fraction1,fraction2,divide?)
var f1 = scrToFraction(argument0);
var f2 = scrToFraction(argument1);

if argument2 {
    f2 = scrMakeFraction(0,abs(f2[2]),(f2[0]*abs(f2[2])+f2[1])*sign(f2[2]))
}

f1[1] += f1[0] * abs(f1[2])
f1[0] = 0

f1[1] *= f2[1]
f1[2] *= f2[2]

return scrToFraction(f1)

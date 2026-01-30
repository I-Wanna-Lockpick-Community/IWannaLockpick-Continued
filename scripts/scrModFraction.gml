//scrModFraction(fraction1,fraction2)
var f1 = scrToFraction(argument0);
var f2 = scrToFraction(argument1);

var temp1 = f1;
var temp2 = f2;

f1[1] *= temp2[2];
f1[2] *= temp2[2];
f2[1] *= temp1[2];
f2[2] *= temp1[2];

f1[1] += f1[0] * f1[2]
f1[0] = 0
f2[1] += f2[0] * f2[2]
f2[0] = 0

f1[1] = f1[1] mod f2[1]

return scrToFraction(f1)

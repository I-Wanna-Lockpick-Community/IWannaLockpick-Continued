var f_one = scrToFraction(argument0)
var f_two = scrToFraction(argument1)

if f_one[2] == 0 || f_two[2] == 0 {
    return scrToFraction("NaN")
}
var temp = f_one[2];
var temp2 = f_two[2];

if f_one[2] != f_two[2] {
    f_one[1] *= abs(temp2)
    f_one[2] *= abs(temp2)
    f_two[1] *= abs(temp)
    f_two[2] *= abs(temp)
}
var nonfraction_one = (f_one[0] * abs(f_one[2]) + f_one[1]) * sign(temp)
var nonfraction_two = (f_two[0] * abs(f_two[2]) + f_two[1]) * sign(temp2)
var result = nonfraction_one + nonfraction_two
show_debug_message(temp)
show_debug_message(temp2)
show_debug_message(nonfraction_one)
show_debug_message(nonfraction_two)
show_debug_message(result)
return scrMakeFraction((abs(result) div abs(f_one[2])),(abs(result) mod abs(f_one[2])),abs(f_one[2])*sign(result))

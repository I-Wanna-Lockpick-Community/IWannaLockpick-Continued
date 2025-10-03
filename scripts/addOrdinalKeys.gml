///addOrdinalKeys(color,colorGlitch,addOmega,addNum);
/*For the time being, there are no higher-level ordinals than multiples of Omega.
As a brief reminder, if you have >= omega keys, then subtracting a Number does nothing.
And, if you subtract a higher ordinal from a smaller one, the output will equal negative
the result of subtracting the smaller from the larger one.*/

var _addCol = argument0;
var _ccheck = argument1;
if _addCol == key_GLITCH{
    _addCol = _ccheck;
}
var _omega0 = global.omega[_addCol];
var _num0 = global.key[_addCol];
var _omega1 = argument2;
var _num1 = argument3;

var _omegaSign = sign(_omega0);
var _omegaSign1 = sign(_omega1);
var _removeLower = (_omegaSign == 0)&&(_omegaSign1 != 0);
_removeLower = (_removeLower)||((_omegaSign != 0)&&(_omegaSign == _omegaSign1));
_removeLower = (_removeLower)||((_omegaSign != 0)&&(_omegaSign == -_omegaSign1)&&(abs(_omega1)>abs(_omega0)));
//This is a little hacky but it still works I suppose.
//Remove the integer part if adding omega in the same sign. (+ edge case at omega0)
//Remove if subtracting omega which is larger than current omega.
//Keep if no omega being added, or subtracting a small omega.

if _removeLower{
    global.key[_addCol] = 0;
    global.omega[_addCol] = _omega0 + _omega1;
}else{
    if _omega1 != 0{//This happens exclusively in smaller ordinal subtraction
        global.omega[_addCol] += _omega1;
    }else{//No omegas to add, just some nice integers.
        if (_omegaSign == 0) || (sign(_num1) == sign(_omega0)){//If the latter is false, subtraction is meaningless.
            global.key[_addCol] += _num1;
        }
    }
}

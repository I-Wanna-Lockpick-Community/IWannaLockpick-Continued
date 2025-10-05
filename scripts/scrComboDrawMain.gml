/* MAIN STRUCTURE
For the door itself, even though i might create Multicolor spending someday (or not),
there is a w, h, and the colorSpend variable, as well as a col 1-D array to store colors.
We have a 2D array of locks, in the form [Index,Attribute].
Pre-included is 3 (x), 4 (y), and 5 (sprite).

The main draw order is: [Fills] -> [Frame] -> [Locks -> Auras] -> [Invert FX -> Copy Text].
The brackets designate groups which can be switched on/off depending on certain variables.
Fills includes those of locks, since all locks should be contained in the frame.
*/

/*PARTS I HAVE COMPLETED SO FAR:
Main Fill + Lock Fills
Frame
Lock Sprites/Symbols
NEXT UP: Auras... can be skipped actually. I wanna visually change them to have shaders
ACTUAL NEXT UP: Invert FX + Copy Text oh it's done*/

//PRELIM
goldIndex = (goldIndex + goldSpd) mod 12;
scrComboCFunc();//Set door colors

//FILL
if copyDraw == 1{
    scrComboDrawFill();
}

var _drawFrames = true;
if global.complexMode == 0 && copies == 0{_drawFrames = false;}//Don't draw the frames if there are no real copies
if global.complexMode == 1 && icopies == 0{_drawFrames = false;}//Don't draw the frames if there are no imaginary copies

if _drawFrames == true{
    //FRAME
    scrComboDrawFrame();
    
    //LOCKS
    scrComboDrawLocks();
}else{
    //SPECIAL RAINBOW FUN
    scrComboDrawIm();
}

//AURAS TBD
scrComboDrawAura();

//INVERT + COPY TEXT
//scrComboDrawInvert();

draw_set_color(c_white);
draw_set_alpha(1);

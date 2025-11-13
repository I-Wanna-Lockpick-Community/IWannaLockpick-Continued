///These are a whole lot more complex than the Simple doors...
/*BASIC STRUCTURE:
There is an array of locks.
Each lock has 6 variables: Color, Count, Type, X/Y Offset, and Sprite.
Type overrides Count in some cases, but a distinction is still needed.
As for the door itself, there's Color Spend, w, h, Auras 0-2, cursed, and Copies.
ALSO Present is a Lock Counter, which is initially empty. This means you can open the door
no matter what, but this shouldn't really ever be the case. Ingame it'd look like a blank.
For Drawing, theres Gold Index/Spd, but also a 2D array of colors for each lock.
Locks will be added in Creation Code using a special script.
*/
salvageID = -1;//For mouseover purposes
active = 1;//Whether or not it can be opened. Inactive means it goes far out of bounds.
lockCount = 0;
lock[0,0] = 0;//Left = index, right = attribute
// attributes: color,count,icount,type,xRel,yRel,sprite,exacti/isPartial,denom,idenom,armament,(glitchMimic),(curseGlitchMimic)

invertBorder = 0;
colorSpend = 0;
glitchMimic = color_GLITCH;//For copy doors
curseGlitchMimic = color_GLITCH;
iPow = 0;

copies = 1;
icopies = 0;
aura[0] = 0;
aura[1] = 0;
aura[2] = 0;
cursed = -1;
brownNearPlayer = 0;

w = 1;
h = 1;

goldIndex = 0;
goldSpd = .1;
brownAngle = 0;

copyState = 0;
copyPitch = 1;
copyAlpha = 0;
copySound = 0;
copyTimer = 0;
copyDraw = 1;

image_speed = 0;
myLight = -1;

baseColor = 0; // for drawing
baseColorSpend = 0; // for drawing

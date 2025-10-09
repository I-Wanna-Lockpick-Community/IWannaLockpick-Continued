///scrSalvageWriteBlank(numID);
///Ehh nvm I don't need a function like this (yet)
//If loading a door for a file that doesn't exist, make a new file with template info
var file,sec,fname;
fname = "Data"+scrGetSaveNum()+"\door"+scrSalvageDoorString(argument0)+".ini";
file = ini_open(fname);//Opens the door file

sec = "MainData";//starts with the big stuff
ini_write_real(sec,"DoorExists",0);
ini_write_real(sec,"IsCombo",0);
ini_write_real(sec,"NumLocks",0);

sec = "SimpleData";//Moves onto simple door code (Effect/Copies variables not used)
ini_write_real(sec,"W",1);
ini_write_real(sec,"H",1);
ini_write_real(sec,"ColorSpend",0);
ini_write_real(sec,"ColorReq",0);
ini_write_real(sec,"Count",1);
ini_write_real(sec,"ICount",0);
ini_write_real(sec,"Type",0);

sec = "Lock0";//Moves onto individual lock data (Starts at 0, increments per-lock)
ini_write_real(sec,"Color",0);
ini_write_real(sec,"Count",1);
ini_write_real(sec,"ICount",0);
ini_write_real(sec,"Type",0);
ini_write_real(sec,"SpriteX",0);
ini_write_real(sec,"SpriteY",0);
ini_write_real(sec,"SpriteInd",sprLockAnyS);

ini_close();

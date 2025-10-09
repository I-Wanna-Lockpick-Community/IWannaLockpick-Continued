///scrLoadSalvage(numID);
if argument0 == -1{exit;}
var file,sec,fname;
fname = "Data"+scrGetSaveNum()+"\door"+scrSalvageDoorString(argument0)+".ini";
file = ini_open(fname);//Opens the door file

sec = "MainData";//starts with the big stuff
if ini_read_real(sec,"DoorExists",0) == 1{
    makeDoor = 1;
    if ini_read_real(sec,"IsCombo",0) == 0{//Simple Door
        isCombo = 0;
        lockCount = 0;
    }else{
        isCombo = 1;
        lockCount = ini_read_real(sec,"NumLocks",0);
    }
    
    sec = "SimpleData";
    w = ini_read_real(sec,"W",1);
    h = ini_read_real(sec,"H",1);
    colorSpend = ini_read_real(sec,"ColorSpend",0);
    color = ini_read_real(sec,"ColorReq",0);
    count = ini_read_real(sec,"Count",1);
    icount = ini_read_real(sec,"ICount",0);
    type = ini_read_real(sec,"Type",0);
    lock[0,0] = 0;//Initializes the lock variable even if there are none
    
    if isCombo{
        for(i=0;i<lockCount;i+=1){
            sec = "Lock"+string(i);//Moves onto individual lock data (Starts at 0, increments per-lock)
            lock[i,0] = ini_read_real(sec,"Color",0);
            lock[i,1] = ini_read_real(sec,"Count",1);
            lock[i,2] = ini_read_real(sec,"ICount",0);
            lock[i,3] = ini_read_real(sec,"Type",0);
            lock[i,4] = ini_read_real(sec,"SpriteX",0);
            lock[i,5] = ini_read_real(sec,"SpriteY",0);
            lock[i,6] = ini_read_real(sec,"SpriteInd",sprLockAnyS);
        }
    }
}

ini_close();

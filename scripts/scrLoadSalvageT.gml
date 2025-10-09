///scrLoadSalvageT(numID);
var file,sec,fname;
fname = "Data"+scrGetSaveNum()+"\door"+scrSalvageDoorString(argument0)+".ini";
file = ini_open(fname);//Opens the door file

sec = "MainData";//starts with the big stuff
if ini_read_real(sec,"DoorExists",0) == 1{
    salvageExists = 1;
    if ini_read_real(sec,"IsCombo",0) == 0{//Simple Door
        salvageIsCombo = 0;
        salvageLockCount = 0;
    }else{
        salvageIsCombo = 1;
        salvageLockCount = ini_read_real(sec,"NumLocks",0);
    }
    
    sec = "SimpleData";
    salW = ini_read_real(sec,"W",1);
    salH = ini_read_real(sec,"H",1);
    salCS = ini_read_real(sec,"ColorSpend",0);
    salC = ini_read_real(sec,"ColorReq",0);
    salCount = ini_read_real(sec,"Count",1);
    salICount = ini_read_real(sec,"ICount",0);
    salType = ini_read_real(sec,"Type",0);
    salLock[0,0] = 0;//Initializes the lock variable even if there are none
    
    if salvageIsCombo{
        for(i=0;i<salvageLockCount;i+=1){
            sec = "Lock"+string(i);//Moves onto individual lock data (Starts at 0, increments per-lock)
            salLock[i,0] = ini_read_real(sec,"Color",0);
            salLock[i,1] = ini_read_real(sec,"Count",1);
            salLock[i,2] = ini_read_real(sec,"ICount",0);
            salLock[i,3] = ini_read_real(sec,"Type",0);
            salLock[i,4] = ini_read_real(sec,"SpriteX",0);
            salLock[i,5] = ini_read_real(sec,"SpriteY",0);
            salLock[i,6] = ini_read_real(sec,"SpriteInd",sprLockAnyS);
        }
        lock = salLock;
    }
}else{
    salvageExists = 0;
}

ini_close();

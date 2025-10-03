///Part 2 globals

global.inload = 0;//Just tells the PlayerStart in Guest Room to change places.
global.newSavefile = 1;//Whether you're playing on a new savefile.
global.sawIntro = 0;//Whether you saw the intro.
global.didEscape = 0;//Whether you've seen the first ending.
global.clearRank = 0;//Highest tier of clear acquired on the savefile

for(var i = 0; i < 50; i += 1){//Useful for the warp rod
    global.areaReached[i] = 0;
}
global.curArea = 0;//Current area (for warp rod purposes)

for(var i = 250; i < 350; i+=1){//Juuuust in case
    global.roomClear[i] = 0;
}

for(var i = 0; i < 350; i += 1){//NEW
    global.roomSeen[i] = 0;
}

for(var i = 0; i < 16; i += 1){//Omega stuff. I used to have omega worlds planned but had to downscope
    global.omegaKey[i] = 0;
    global.omegaPuzzle[i] = 0;
}

for(var i = 0; i < 5; i+=1){//Omega perks (1 more just in case)
    global.omegaPerk[i] = 0;
}

for(var i = 0; i < 15; i+=1){//For full-clearing + solving the Omega puzzle
    global.areaSuperClear[i] = 0;
}

for(var i = 0; i < 20; i+=1){//In case I want one-time cutscenes
    global.didCutscene[i] = 0;
}

global.kinaHeart = 0;//Whether you've solved the Kinapuzzle

for(var i = 0; i < 100; i+=1){//Tracking conversations
    global.convoUnlocked[i] = 0;
    global.convoRead[i] = 0;
}

//Pencilmark
for(var i = 0; i < 256; i += 1){//Pencilmarks
    global.pmVis[i] = 0;
    global.pmX[i] = 0;
    global.pmY[i] = 0;
    global.pmType[i] = 0;//0 = Sym, 1 = Num, 2 = Txt
    global.pmSymbol[i] = 0;
    global.pmNum[i] = 0;
    global.pmStr[i] = 0;
    global.pmCol[i] = 0;
}
global.canMark = 0;//Pencilmarks disabled in some rooms
global.curPM = -1;//Moused over/selected pencilmark
global.pmState = 0;//0 = Normal, 1 = Edit, 2 = Text Field

global.musicTitle = "";

//fast animations
global.fAnimIsNormal = 1;//if not normal, begin the timer
global.fAnimTimer = 100;//if nothing happens in half a second, reset anim speed
global.fAnimSpd = 0;//0-1, 0 = normal speeds, 1 = fastest speeds

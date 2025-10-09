//drawTerminalSalvage();
//Draws the door whose salvage data is selected.

//PRELIM
//Set colorSpend from salvaged data
//goldIndex = (goldIndex + goldSpd) mod 12;
salDX = 400 - salW*16;
salDY = 304 - salH*32;

//Colors
oldC = color;
oldCS = colorSpend;
color = salC;
colorSpend = salCS;
scrColorDoor();
scrColorDoor2();

//BRANCH: Draw differently based on combo door vs normal door
//THIS SO QUICKLY TURNED INTO OMEGA SPAGHETTI CODE, BLEHHHHHHHHH
if salvageIsCombo{
    lock = salLock;
    drawPreviewFills();
    drawPreviewLock(1);
    drawPreviewLocks();//If lock is selected, draw preview alpha over it
}else{
    drawPreviewSpend();
    //Spend Lock + Preview
    drawPreviewLock(1);
    if (state == 5 || state == 6) && salvageLock = -1{
        draw_sprite_ext(sprBlockWhite,0,salDX,salDY,salW,salH,0,c_white,previewA);
    }
    //Require
    drawPreviewRequire();
    if global.simpleLock{
        drawPreviewNormalLockSimple();
    }else{
        drawPreviewNormalLock();
    }
    //Require Lock + Preview
    drawPreviewLock(0);
    if (state == 5 || state == 6) && salvageLock = 0{
        draw_sprite_ext(sprBlockWhite,0,salDX+8,salDY+8,salW-.5,salH-.5,0,c_white,previewA);
    }
}

//Reset color
color = oldC;
colorSpend = oldCS;

draw_set_color(c_white);
draw_set_alpha(1);
